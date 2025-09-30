package com.CitasMedicas.controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.HashMap;
import java.util.Map;



/**
 * Servlet implementation class ServletPasajero
 */
@WebServlet("/gestionpasajero")
public class ServletPasajero extends HttpServlet {
	// private static final long serialVersionUID = 1L;
      
	// private InterfacePasajero dao=new DAOPasajero();	
	// private static final Logger logger=Logger.getLogger(ServletPasajero.class.getName());

	
	
  //   /**
  //    * @see HttpServlet#HttpServlet()
  //    */
  //   public ServletPasajero() {
  //       super();
  //       // TODO Auto-generated constructor stub
  //   }

	// /**
	//  * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	//  */
	// protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	// 	String operacion = request.getParameter("accion");

  //       if (operacion == null || operacion.equals("listar")) {
  //           listar(request, response);
  //       } else if ("insertar".equals(operacion)) {
  //           insertar(request, response);
  //       } else if ("editar".equals(operacion)) {
  //           editar(request, response);
  //       } else if ("eliminar".equals(operacion)) {
  //           eliminar(request, response);
  //       } else {
  //           listar(request, response); // por defecto
  //       }

		
	// }

	// private void eliminar(HttpServletRequest request, HttpServletResponse response) throws IOException {
	
	// 	response.setContentType("application/json");
	//    	 response.setCharacterEncoding("UTF-8");
	//    	Map<String, String> resul = new HashMap<>();
	//    	try {
		
	//    		//eliminando en base al codigo del pasajero
	//    		//para ello debemos capturar dicho codigo de la pagina jsp
	//    		int micodigo=Integer.parseInt(request.getParameter("codi"));
	//    		dao.eliminar(micodigo);
	//    		resul.put("status", "ok");
	//         resul.put("mensaje", "Pasajero eliminado correctamente");
	   		
	// 	} catch (Exception e) {
	// 		logger.log(Level.SEVERE,"Error al eliminar pasajero");
	//         resul.put("status", "error");
	//         resul.put("mensaje", "Error al eliminar pasajero.");
	// 	}
		
	//     String json = new com.google.gson.Gson().toJson(resul);
	//     response.getWriter().write(json);
		
	// }

	// private void editar(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
	// 	response.setContentType("application/json");
	//    	 response.setCharacterEncoding("UTF-8");
	//    	Map<String, String> resul = new HashMap<>();
	//    	try {
	//    		Pasajero p = obtenerPasajero(request);
	//    		dao.actualizar(p);
	//    		resul.put("status", "ok");
	//         resul.put("mensaje", "Pasajero actualizado correctamente");

	// 	} catch (Exception e) {
	// 		logger.log(Level.SEVERE,"Error al actualizar pasajero");
	//         resul.put("status", "error");
	//         resul.put("mensaje", "Error al actualizar pasajero.");
	// 	}
		
	//     String json = new com.google.gson.Gson().toJson(resul);
	//     response.getWriter().write(json);
		
	// }

	// private void insertar(HttpServletRequest request, HttpServletResponse response) throws IOException {
	// 	response.setContentType("application/json");
	//    	 response.setCharacterEncoding("UTF-8");

	//     Map<String, String> resul = new HashMap<>();
	//     try {
	//         Pasajero p = obtenerPasajero(request);
	//         dao.insertar(p);

	//         resul.put("status", "ok");
	//         resul.put("mensaje", "Pasajero registrado correctamente");
	//     } catch (Exception e) {
	//     	logger.log(Level.SEVERE,"Error al registrar pasajero");
	//         resul.put("status", "error");
	//         resul.put("mensaje", "Error al registrar pasajero.");
	//     }

	//     String json = new com.google.gson.Gson().toJson(resul);
	//     response.getWriter().write(json);
		

		
	// }

	// private void listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	// 	List<Pasajero> lista = dao.listarPasajeros();
  //       request.setAttribute("listapasajeros", lista);
  //       request.getRequestDispatcher("jsp/MantPasajeros.jsp").forward(request, response);

		
	// }

	
	// private Pasajero obtenerPasajero(HttpServletRequest request) {
	       
	// 	Pasajero p = new Pasajero();

	// 	        String strId = request.getParameter("id_pasajero");
	// 	        if (strId != null && !strId.isEmpty()) {
	// 	            p.setId_pasajero(Integer.parseInt(strId));
	// 	        }

	// 	        p.setNombres(request.getParameter("nombres"));
	// 	        p.setApellidos(request.getParameter("apellidos"));
	// 	        p.setDni(request.getParameter("dni"));
	// 	        p.setTelefono(request.getParameter("telefono"));
	// 	        p.setCorreo(request.getParameter("correo"));

	// 	        return p;
	// 	    }	

	
	
	
}
