package com.CitasMedicas.controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;



/**
 * Servlet implementation class ServletPasajero
 */
@WebServlet("/gestionpasajero")
public class ServletPasajero extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	//declarando y creando un objeto de tipo interface pasajero
	//InterfacePasajero midao = new DAOPasajero();
	//declarar una variable para controlar los errores a detalle
	private static final Logger lg = Logger.getLogger(ServletPasajero.class.getName());
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletPasajero() {
        super();
        // 
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//declarar una variable para las operaciones a realiazar
		// String operacion = request.getParameter("accion");
		// if (operacion == null || operacion.equals("listar")) {
		// 	listar(request,response);
		// }else if ("insertar".equals(operacion)) {
		// 	insertar(request,response);
		// }else if ("editar".equals(operacion)) {
		// 	editar(request,response);
		// }else if ("eliminar".equals(operacion)) {
		// 	eliminar(request,response);
		// }else {
		// 	listar(request,response);
		// }
	}

	private void eliminar(HttpServletRequest request, HttpServletResponse response) {
		
		
	}

	private void editar(HttpServletRequest request, HttpServletResponse response) {
		
	}

	// private void insertar(HttpServletRequest request, HttpServletResponse response) throws IOException {
	// 	response.setContentType("application/json");
	// 	response.setCharacterEncoding("UTF-8");
	// 	Map<String, String> resul = new HashMap<>();
	// 	try {
	// 		Pasajero p = obtenerPasajero(request);
	// 		midao.insertar(p);
	// 		//enviar al map la clave y el valor
	// 		resul.put("status", "ok");
	// 		resul.put("mensaje", "pasajero Registrado Correctamente");
	// 	} catch (Exception e) {
	// 		lg.log(Level.SEVERE,"Error al registrar pasajeros");
	// 		resul.put("status", "error");
	// 		resul.put("mensaje", "Error al registrar pasajeros M");
	// 	}
	// 	//declarar una variable para el uso de json
	// 	String json = new com.google.gson.Gson().toJson(resul);
	// 	//escribir el valor del json
	// 	response.getWriter().write(json);
	// }

	// private void listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// 	//declarar un objeto de tipo lista
	// 	List<Pasajero> lista =midao.listadoPasajeros();
	// 	//crear un atributo para llevar los datos a jsp
	// 	request.setAttribute("listapasajeros", lista);
	// 	//direcionar a la pagina mantenimiento pasajeros.jsp
	// 	request.getRequestDispatcher("jsp.MantPasajeros.jsp").forward(request, response);
		
	// }
	
	// //creando un metodo para capturar los datos del jsp
	
	// private Pasajero obtenerPasajero(HttpServletRequest request) {
	// 	//declarar un objeto de tipo pasajero
	// 	Pasajero p = new Pasajero();
	// 	String strid = request.getParameter("id_pasajero");
	// 	if (strid != null && !strid.isEmpty()) {
	// 		//setear el codigo del pasajero
	// 		p.setId_pasajero(Integer.parseInt(strid));
	// 	}
	// 	p.setNombres(request.getParameter("nombres"));
	// 	p.setApellidos(request.getParameter("apellidos"));
	// 	p.setDni(request.getParameter("dni"));
	// 	p.setTelefono(request.getParameter("telefono"));
	// 	p.setCorreo(request.getParameter("correo"));
	// 	return p;
	// }
	

}
