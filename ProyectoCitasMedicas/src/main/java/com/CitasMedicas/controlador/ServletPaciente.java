package com.CitasMedicas.controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.CitasMedicas.dao.DAOPaciente;
import com.CitasMedicas.entidad.Paciente;
import com.CitasMedicas.entidad.Usuario;
import com.CitasMedicas.interfaces.InterfacePaciente;

import java.util.HashMap;
import java.util.Map;


/**
 * Servlet implementation class ServletPasajero
 */
@WebServlet("/gestionpaciente")
public class ServletPaciente extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	private InterfacePaciente dao=new DAOPaciente();	
	private static final Logger logger=Logger.getLogger(ServletPaciente.class.getName());

	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletPaciente() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//declarar una variable para recoger las acciones a realizar en el jsp
		String operacion = request.getParameter("accion");
		//validar la variable operacion
		if(operacion == null) {
			request.getRequestDispatcher("Login.jsp").forward(request, response);//si operacion no tiene nada, se direcciona a login
		}
		switch (operacion) {
		case "login":
			loginPaciente(request,response);
			break;
		case "logout":
			logout(request,response);
      break;
    case "RegistrarPaciente":
      insertar(request, response);
      break;
		default:
			request.getRequestDispatcher("Login.jsp").forward(request, response);
			break;
		}
	}

	private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// declarar una variable de tipo sesion
		HttpSession sesion = request.getSession();
		//saliendo de la sesion
		sesion.invalidate();
		//direccionar a login
		response.sendRedirect("Login.jsp");
		
	}




	private void insertar(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("application/json");
	   	 response.setCharacterEncoding("UTF-8");

	    Map<String, String> resul = new HashMap<>();
	    try {
	        Paciente p = obtenerPaciente(request);
	        dao.insertar(p);

	        resul.put("status", "ok");
	        resul.put("mensaje", "Paciente registrado correctamente");
	    } catch (Exception e) {
	    	logger.log(Level.SEVERE,"Error al registrar paciente");
	        resul.put("status", "error");
	        resul.put("mensaje", "Error al registrar paciente.");
	    }

	    String json = new com.google.gson.Gson().toJson(resul);
	    response.getWriter().write(json);
		

		
	}


	
	private void loginPaciente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// declarar variables para obtener dni de la pagina jsp
		String dni = request.getParameter("dni");
        int dniInt = Integer.parseInt(dni);
		//declara y crear un objeto que tipo modelUsuario
		DAOPaciente DAOP = new DAOPaciente();
		//declara un objeto de tipo usuario para recoger lo que tiene "mu"
		Paciente u = DAOP.buscarPorDni(dniInt);
		//validar el objeto
		if(u != null) {
			//declaramos una sesion
			HttpSession sesion = request.getSession();
			//creando un atributo para enviar lo que tiene objeto
			sesion.setAttribute("paciente", u);
			//creando un atributo para llevar el mensaje
			request.setAttribute("mensaje", "Bienvenido ...."+ u.getNombre_paciente()+ " "+u.getApellido_paterno()+" "+ u.getApellido_materno());
			//crear un atributo para llevar un mensaje de exito
			request.setAttribute("tipo", "success");
			request.getRequestDispatcher("CitasPaciente.jsp").forward(request, response);
			
		}else {
			//creando un atributo para llevar el mensaje
			request.setAttribute("mensaje", "numero de documento incorrecto.");
			//crear un atributo para llevar un mensaje de exito
			request.setAttribute("tipo", "error");
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		}
		
	}

  	private Paciente obtenerPaciente(HttpServletRequest request) {
		Paciente p = new Paciente();

		        String strId = request.getParameter("id_paciente");
		        if (strId != null && !strId.isEmpty()) {
		            p.setId_paciente(Integer.parseInt(strId));
		        }


		        return p;
		    }	
	
	
	
}
