
package com.CitasMedicas.controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import java.util.logging.Level;
import java.util.logging.Logger;

import com.CitasMedicas.dao.DAOPaciente;
import com.CitasMedicas.dao.DAOApoderado; 
import com.CitasMedicas.entidad.Paciente;
import com.CitasMedicas.entidad.Apoderado;
import com.CitasMedicas.interfaces.InterfacePaciente;
import com.CitasMedicas.interfaces.InterfaceApoderado;

import java.util.HashMap;
import java.util.Map;

import java.sql.Date;

/**
 * Servlet implementation class ServletPasajero
 */
@WebServlet("/gestionpacienteregistrar")
public class ServletPacienteRegistrar extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	private InterfacePaciente dao=new DAOPaciente();
	private InterfaceApoderado apoderadoDAO = new DAOApoderado();
	private static final Logger logger=Logger.getLogger(ServletPacienteRegistrar.class.getName());

	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletPacienteRegistrar() {
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
			request.getRequestDispatcher("RegistroPaciente.jsp").forward(request, response);//si operacion no tiene nada, se direcciona a login
		}
		switch (operacion) {
		case "RegistrarPaciente":
			insertar(request,response);
			break;
		default:
			request.getRequestDispatcher("RegistroPaciente.jsp").forward(request, response);
			break;
		}
	}


	private void insertar(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		response.setContentType("application/json");
	   	response.setCharacterEncoding("UTF-8");

	    Map<String, String> resul = new HashMap<>();
	    try {
			
			Paciente paciente = obtenerPaciente(request);
			Paciente existe = dao.buscarPorDni(paciente.getNro_documento());
			 System.out.println("documento: " + existe);
			//SI EL PACIENTE YA EXISTE
			if (existe != null) {
				resul.put("status", "error"); 
				resul.put("mensaje", "El paciente con DNI " + paciente.getNro_documento() + " ya está registrado.");
				String json = new com.google.gson.Gson().toJson(resul);
			    response.getWriter().write(json);
			    HttpSession session = request.getSession();
			    session.setAttribute("resul", resul);
			    
			    request.getRequestDispatcher("/jsp/RegistroPaciente.jsp").forward(request, response);
			    return;
			//SI EL PACIENTE NO EXISTE, SE REGISTRA
			}else {
				dao.insertar(paciente);
			    HttpSession session = request.getSession();
			    session.setAttribute("pacienteRegistrado", paciente);
			    int dniInt = paciente.getNro_documento();
			    Paciente u = dao.buscarPorDni(dniInt);
			    HttpSession sesion = request.getSession();
				sesion.setAttribute("pacientelogin", u);
			    request.getRequestDispatcher("/jsp/ListaCitas.jsp").forward(request, response);
			}

	    } catch (Exception e) {
	    	logger.log(Level.SEVERE,"Error al registrar paciente");
	        resul.put("status", "error");
	        resul.put("mensaje", "Error al registrar paciente.");
            String json = new com.google.gson.Gson().toJson(resul);
            response.getWriter().write(json);
            HttpSession session = request.getSession();
            session.setAttribute("resul", resul);
            request.getRequestDispatcher("/jsp/RegistroPaciente.jsp").forward(request, response);
	    }

	}
	
	private Paciente obtenerPaciente(HttpServletRequest request) {
    	Apoderado a = obtenerApoderado(request);
		Paciente p = new Paciente();
		Apoderado obja = new Apoderado();
    	//validar si el apoderado ya existe en la base de datos
    	if (a.getNro_documento() != 0) {
			Apoderado existe = apoderadoDAO.buscarPorDni(a.getNro_documento());
			if (existe != null) {
				a = existe; //si existe, se usa el apoderado existente
				//mensaje de que el apoderado ya existe
				System.out.println("El apoderado con DNI " + a.getNro_documento() + " ya está registrado.");
				obja.setId_apod(a.getId_apod());
				
			}
			else {
				//si no existe, se inserta el nuevo apoderado
				int idApoderado = apoderadoDAO.insertar(a);
				obja.setId_apod(idApoderado);
				System.out.println("Apoderado registrado con ID: " + idApoderado);
			}
		}
    	System.out.println("Apoderado a usar con ID: " + a.getId_apod());
 
		
		p.setTipo_documento(request.getParameter("tipodocumento"));		
		p.setNro_documento(Integer.parseInt(request.getParameter("nrodocumento")));
        p.setNombre_paciente(request.getParameter("nombres"));
        p.setApellido_paterno(request.getParameter("apematerno"));
        p.setApellido_materno(request.getParameter("apepaterno"));
        p.setFecha_nac(Date.valueOf(request.getParameter("fechanaci")));
        p.setSexo(request.getParameter("sexo"));
        p.setLugar_naci(request.getParameter("lugarnaci"));
        p.setProcedencia(request.getParameter("procedencia"));
        p.setTipo_paciente(request.getParameter("tipopaci"));
        p.setApoderado(obja);
        return p;

	 }
	
	//APODERADO
	private Apoderado obtenerApoderado(HttpServletRequest request) {
		Apoderado a = new Apoderado();

		a.setTipo_documento(request.getParameter("tipodocumentoapo"));
		a.setNro_documento(Integer.parseInt(request.getParameter("nrodocumentoapo")));
		a.setNombre_apod(request.getParameter("nombresapo"));
		a.setApellido_apod(request.getParameter("apellidosapo"));
		a.setParentesco(request.getParameter("parentesco"));
		a.setCelular_apod(request.getParameter("celular"));
		a.setCorreo_apod(request.getParameter("correo"));
		
		return a;
	 }



}
