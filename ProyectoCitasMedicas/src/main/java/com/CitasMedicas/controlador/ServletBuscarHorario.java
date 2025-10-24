
package com.CitasMedicas.controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import java.util.List;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.CitasMedicas.dao.DAOEspecialidad;
import com.CitasMedicas.dao.DAOMedico;
import com.CitasMedicas.dao.DAOApoderado;
import com.CitasMedicas.dao.DAOCitas;
import com.CitasMedicas.dao.DAODiaTrabajo;
import com.CitasMedicas.entidad.Medico;
import com.CitasMedicas.entidad.Cita;
import com.CitasMedicas.entidad.DiaTrabajo;
import com.CitasMedicas.interfaces.InterfaceMedico;
import com.CitasMedicas.interfaces.InterfaceCita;
import com.CitasMedicas.interfaces.InterfaceDiaTrabajo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Date;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;

/**
 * Servlet implementation class ServletPasajero
 */ 
@WebServlet("/gestionbuscarhorario")
public class ServletBuscarHorario extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private InterfaceMedico daoMedico = new DAOMedico();
	private InterfaceDiaTrabajo daoDiaTrabajo = new DAODiaTrabajo();
	private InterfaceCita daoCita = new DAOCitas();

	private static final Logger logger=Logger.getLogger(ServletBuscarHorario.class.getName());

	
	
    /** 
     * @see HttpServlet#HttpServlet()
     */
    public ServletBuscarHorario() {
        super();
        
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		int idmedicoInd = Integer.parseInt(request.getParameter("idmedico"));
		if(idmedicoInd == 0 ) {
			request.setAttribute("mensaje", "Debe seleccionar un médico.");
			request.setAttribute("contenido", "RCMedico.jsp");
			request.getRequestDispatcher("jsp/RegistrarCita.jsp").forward(request, response);
			return; // Salir del método si no se seleccionó un médico
		}
		//traer del jsp la fecha elegida
		String fechaString = request.getParameter("fechacita");
		
		SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat formatoDia = new SimpleDateFormat("dd");
		SimpleDateFormat formatoDiaSemana = new SimpleDateFormat("EEEE", new Locale("es", "ES"));
		SimpleDateFormat formatoMes = new SimpleDateFormat("MMMM", new Locale("es", "ES"));
		Date fechaElegida = null;
		try {
			fechaElegida = formato.parse(fechaString);
			String diaNumero = formatoDia.format(fechaElegida); // Ejemplo: "12"
			String nombreDia = formatoDiaSemana.format(fechaElegida); // Ejemplo: "domingo"
			String mesNombre = formatoMes.format(fechaElegida); // Ejemplo: "octubre"
			String fechaFormateada = nombreDia+ ", " + diaNumero + " de " + mesNombre;
			
			
			
			List<DiaTrabajo> listaHorarios = daoDiaTrabajo.listarPorMedico(idmedicoInd);
			//mensaje de consola	
			System.out.println("fecha elegida: " + fechaFormateada);
			System.out.println("Día de la semana: " + nombreDia);
			
			for (DiaTrabajo diaT : listaHorarios) {
			    System.out.println("Día de trabajo: " + diaT.getDia_semana());
			    System.out.println("fecha elegida el nombredia: " + nombreDia);
			    
			    if(nombreDia.equalsIgnoreCase(diaT.getDia_semana())) {
			    	System.out.println("El médico trabaja este día.");
			    	
			    	//trae hora de inicio y fin y usar un for para recorrer los dias de trabajo	    	
			    	LocalTime horaInicio = diaT.getHora_inicio(); // Ejemplo: 08:00
			        LocalTime horaFin = diaT.getHora_fin();  
			    	
			    	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");
			    	List<String> horarios = new ArrayList<>();
			    	for (LocalTime horaIncremento = horaInicio; horaIncremento.isBefore(horaFin); horaIncremento = horaIncremento.plusHours(1)) {
			    		
			    		List<Cita> citasExistentes = daoCita.listarPorMedicoYFecha(idmedicoInd, fechaElegida);
			    		boolean estaOcupado = false;
			    		
			    		for(Cita fechacita : citasExistentes) { //trae las citas existentes en esa fecha con ese medico
			    			System.out.println("Citas existentes: " + fechacita.getHora_cita());
			    			LocalTime horaCitaConvertida = fechacita.getHora_cita().toLocalTime();
			    			boolean horaOcupada = (horaCitaConvertida.isAfter(horaIncremento) 
			                        && horaCitaConvertida.isBefore(horaIncremento.plusHours(1))) 
			                        || horaCitaConvertida.equals(horaIncremento);
			    			if (horaOcupada) {
			    			 estaOcupado = true;
			    			 break; // Salir del bucle si la hora está ocupada
			    			}		    			
			    			
			    		}
			    		if (!estaOcupado) {
			    			System.out.println(" La hora " + horaIncremento + " está disponible.");
			    			System.out.println("--------------");
			    			horarios.add(horaIncremento.format(formatter));
			    			System.out.println("Horarios disponibles: " + horarios);
			    		}
			    		    	    
			    	}

			    	System.out.println("Horarios disponibles: " + horarios);
			    	System.out.println("Medico ID: " + idmedicoInd);
			    	System.out.println("*******************************************************");
			    	request.setAttribute("listaHorarios", horarios);
			    	request.setAttribute("fechaFormateada", fechaFormateada); 
			    	request.setAttribute("mensajeSinFecha", "Medico no disponible. Por favor, seleccione otra fecha.");
			    	break; // Salir del bucle si se encuentra el día
			    } else {
			    	request.setAttribute("mensajeSinFecha", "Medico no disponible. Por favor, seleccione otra fecha.");
			    }
			}
		} catch (ParseException e) {
		    e.printStackTrace(); // o manejar el error como prefieras
		}
		request.setAttribute("fechaString", fechaString);

		request.setAttribute("contenido", "RCFecha.jsp");
		request.getRequestDispatcher("jsp/RegistrarCita.jsp").forward(request, response);	
		
	}

}
