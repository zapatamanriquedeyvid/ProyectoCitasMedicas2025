
package com.CitasMedicas.controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import net.sf.jasperreports.engine.*;

import java.io.IOException;

import java.util.List;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.CitasMedicas.dao.DAOEspecialidad;
import com.CitasMedicas.dao.DAOMedico;
import com.CitasMedicas.dao.DAOPaciente;
import com.CitasMedicas.dao.DAOCitas;
import com.CitasMedicas.dao.DAODiaTrabajo;
import com.CitasMedicas.entidad.Medico;
import com.CitasMedicas.entidad.Paciente;
import com.CitasMedicas.entidad.Cita;
import com.CitasMedicas.entidad.DiaTrabajo;
import com.CitasMedicas.entidad.Especialidad;
import com.CitasMedicas.interfaces.InterfaceMedico;
import com.CitasMedicas.interfaces.InterfacePaciente;
import com.CitasMedicas.interfaces.InterfaceCita;
import com.CitasMedicas.interfaces.InterfaceDiaTrabajo;
import com.CitasMedicas.interfaces.InterfaceEspecialidad;
import net.sf.jasperreports.engine.util.JRLoader;
import org.eclipse.tags.shaded.org.apache.xpath.res.XPATHErrorResources;

import java.util.HashMap;
import java.util.Map;

import java.sql.Date;
import java.sql.Time;
import java.time.LocalDate;

import static net.sf.jasperreports.engine.util.JRLoader.loadObjectFromFile;

/**
 * Servlet implementation class ServletPasajero
 */ 
@WebServlet("/gestionregistrarcita")
public class ServletRegistrarCita extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private InterfaceMedico daoMedico = new DAOMedico();
	private InterfaceEspecialidad daoEspecialidad = new DAOEspecialidad();
	private InterfaceCita daocita=new  DAOCitas();


	private static final Logger logger=Logger.getLogger(ServletRegistrarCita.class.getName());
    /** 
     * @see HttpServlet#HttpServlet()
     */
    public ServletRegistrarCita() {
        super();
        
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//declarar una variable para recoger las acciones a realizar en el jsp
		String operacion = request.getParameter("accion");

		//validar la variable operacion
		if(operacion == null) {
			request.getRequestDispatcher("RegistrarCita.jsp").forward(request, response);//si operacion no tiene nada, se direcciona a login
		}
		switch (operacion) {
		case "MedicosxEspe":
			//listar las especialidades
			listarMedicosxEspe(request, response);
            break;
		case "horariosxmedico":
			//listar los horarios
			listarHorarios(request, response);
            break;
		case "DetalleCita":
			detalleCita(request, response);
            break;
		case "RegistrarCita":
			Registrar(request, response);
            break;
		case "Regresar":
			regresar(request, response);
            break;
        case "VerLista":
            VerLista(request, response);
            break;
        case "VerCompro":
            VerCompro(request, response);
        break;
		default:
			request.getRequestDispatcher("jsp/RegistrarCita.jsp").forward(request, response);
            break;
		}
	}

    private void VerLista(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        HttpSession sesion = request.getSession();
        Paciente paciente = (Paciente) sesion.getAttribute("pacientelogin");
        DAOCitas DAOCitas = new DAOCitas();
        List<Cita> citas = DAOCitas.obtenerCitasPorPaciente(paciente.getId_paciente());
        request.setAttribute("listaCitas", citas);
        request.getRequestDispatcher("/jsp/ListaCitas.jsp").forward(request, response);

    }
    private void VerCompro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int idCita = Integer.parseInt(request.getParameter("idCita"));

        try (ServletOutputStream out = response.getOutputStream()){
            Cita cita = daocita.buscarPorCodigo(idCita);

            System.out.println(getServletContext().getRealPath("reportes/ejemplo.jasper"));

            JasperReport reporte = (JasperReport) loadObjectFromFile(getServletContext().getRealPath("reportes/ComprobanteCitas.jasper"));

            Map<String, Object> parametros = new HashMap<>();

            // Aquí puedes agregar los parámetros que necesites para el reporte
            //Paciente

            String edad = String.valueOf(LocalDate.now().getYear() - cita.getPaciente().getFecha_nac().toLocalDate().getYear());
            parametros.put("PacNombres", cita.getPaciente().getNombre_paciente() + " " + cita.getPaciente().getApellido_paterno() + " " + cita.getPaciente().getApellido_materno());
            parametros.put("PacTipoDocu", cita.getPaciente().getTipo_documento());
            parametros.put("PacNumDocu", String.valueOf(cita.getPaciente().getNro_documento()));
            parametros.put("PacTipo",cita.getPaciente().getTipo_paciente());
			parametros.put("PacEdad",edad);
            String sexo = cita.getPaciente().getSexo();
            if(sexo.equals("F")){
                parametros.put("PacSexo", "Femenino");
            }else{
                parametros.put("PacSexo", "Masculino");
            }
            //Apoderado
            parametros.put("ApodNombres", cita.getPaciente().getApoderado().getNombre_apod());
            parametros.put("ApodTipoDocu", cita.getPaciente().getApoderado().getTipo_documento());
            parametros.put("ApodNumDocu", String.valueOf(cita.getPaciente().getApoderado().getNro_documento()));
            parametros.put("ApodTelefono", cita.getPaciente().getApoderado().getCelular_apod());

            //Medico
            Random rand = new Random();
            String NumRandom = String.valueOf(rand.nextInt(1000) + 1);
            String DniApoS = String.valueOf(cita.getPaciente().getApoderado().getNro_documento()).substring(0,4);
	        String NumCompro = NumRandom + DniApoS;

            String fechaS = new java.text.SimpleDateFormat("dd-MM-yyyy").format(cita.getFecha_cita());
            String Hora = cita.getHora_cita().toString();

            parametros.put("CitaMedico", cita.getMedico().getNombre_medico()+" "+cita.getMedico().getApellido_medico());
            parametros.put("CitaEspec", cita.getMedico().getEspecialidad().getNom_especialidad());
            parametros.put("CitaTipoAten", cita.getTipo_atencion());
            parametros.put("CitaFecha", fechaS);
            parametros.put("CitaHora", Hora);
            parametros.put("NumBoleta", NumCompro);


            response.setContentType("application/pdf");
            response.addHeader("Content-Disposition", "inline; filename=boleta_1.pdf");

            JasperPrint print = JasperFillManager.fillReport(reporte, parametros, new JREmptyDataSource());
            JasperExportManager.exportReportToPdfStream(print, out);
            out.flush();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void Registrar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Cita c = DatosCita(request);
			if (c != null) {
				daocita.insertar(c);
				int idPaciente = Integer.parseInt(request.getParameter("Id_paciente"));
				List<Cita> citas = daocita.obtenerCitasPorPaciente(idPaciente);
				request.setAttribute("listaCitas", citas);
				request.getRequestDispatcher("/jsp/ListaCitas.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
}

	private Cita DatosCita(HttpServletRequest request) {
		Cita c = new Cita();
		Medico m = new Medico();
		Paciente p = new Paciente();
		m.setId_medico(Integer.parseInt(request.getParameter("Id_medico")));
		p.setId_paciente(Integer.parseInt(request.getParameter("Id_paciente")));
		
		c.setFecha_cita(Date.valueOf(request.getParameter("Fecha_cita")));
		String horaForm = request.getParameter("Hora_cita"); // ej. "14:30"
		String horaSQL = horaForm + ":00";
		c.setHora_cita(Time.valueOf(horaSQL));
		Date fechaActual = Date.valueOf(LocalDate.now());
		c.setFecha_emision(fechaActual);
		c.setMedico(m);
		c.setPaciente(p);
		
		return c;
		
	}

	private void regresar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sesion = request.getSession(); // crea o recupera la sesión
		Medico medico = (Medico) sesion.getAttribute("medicoSeleccionado");
		String horaS = (String) sesion.getAttribute("horaSesion");

		
		if(medico != null && horaS != null) {
			sesion.removeAttribute("horaSesion");
			request.setAttribute("contenido", "RCFecha.jsp");
			request.getRequestDispatcher("jsp/RegistrarCita.jsp").forward(request, response);	
		}else if(medico != null ){
			int especialidad = medico.getEspecialidad().getId_especialidad();
			List<Medico> listaMedicoxEspe = daoMedico.listarMedicosPorEspecialidad(especialidad);
			request.setAttribute("listaMedicos", listaMedicoxEspe);
			request.setAttribute("contenido", "RCMedico.jsp");
			request.getRequestDispatcher("jsp/RegistrarCita.jsp").forward(request, response);	
		} else {
			request.getRequestDispatcher("jsp/RegistrarCita.jsp").forward(request, response);
		}

	}

    

	private void listarMedicosxEspe(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String espe = request.getParameter("especialidad");
		System.out.println("la especialidad es " + espe);
		if(espe != null ) {
			int especialidad = Integer.parseInt(espe);
			List<Medico> listaMedicoxEspe = daoMedico.listarMedicosPorEspecialidad(especialidad);
			Especialidad EspeSecialidad = daoEspecialidad.buscarPorCodigo(especialidad);
			request.getSession().setAttribute("especialidadSeleccionada", EspeSecialidad);
			request.setAttribute("listaMedicos", listaMedicoxEspe);
			request.setAttribute("contenido", "RCMedico.jsp");
			request.getRequestDispatcher("jsp/RegistrarCita.jsp").forward(request, response);	
		}else {
			request.setAttribute("mensaje", "Debe seleccionar una especialidad.");
			request.getRequestDispatcher("jsp/RegistrarCita.jsp").forward(request, response);	
		}
		
		
		
	}

	private void listarHorarios(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String medicoId = request.getParameter("doctor");
		if(medicoId != null) {
			int idmedicoInd = Integer.parseInt(medicoId);
			Medico m = daoMedico.buscarPorCodigo(idmedicoInd);
			request.getSession().setAttribute("medicoSeleccionado", m);
			//enviar la lista al jsp
			request.setAttribute("contenido", "RCFecha.jsp");
			request.getRequestDispatcher("jsp/RegistrarCita.jsp").forward(request, response);	
		}else {
			request.setAttribute("mensaje", "Debe seleccionar un médico.");
			listarMedicosxEspe(request, response);
		}
		
	
	}
	
	private void detalleCita(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Horario = request.getParameter("horario");
		if(Horario != null) {
			String fechaCitaStr = request.getParameter("fechaString");
			request.getSession().setAttribute("horaSesion", Horario);
			request.setAttribute("fechaCita", fechaCitaStr);
			request.setAttribute("horarioSeleccionado", Horario);
			request.setAttribute("contenido", "DetalleCitas.jsp");
			request.getRequestDispatcher("jsp/RegistrarCita.jsp").forward(request, response);

		}else {
			request.setAttribute("mensaje", "Debe seleccionar una hora.");
			request.setAttribute("contenido", "RCFecha.jsp");
			request.getRequestDispatcher("jsp/RegistrarCita.jsp").forward(request, response);
		}

	}
	
	
}
