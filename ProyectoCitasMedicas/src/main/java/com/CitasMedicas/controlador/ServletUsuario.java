package com.CitasMedicas.controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet implementation class ServletUsuario
 */
@WebServlet("/gestionusuario")
public class ServletUsuario extends HttpServlet {
	// private static final long serialVersionUID = 1L;
       
  //   /**
  //    * @see HttpServlet#HttpServlet()
  //    */
  //   public ServletUsuario() {
  //       super();
  //       // TODO Auto-generated constructor stub
  //   }

	// /**
	//  * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	//  */
	// protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// 	//declarar una variable para recoger las acciones a realizar en el jsp
	// 	String operacion = request.getParameter("accion");
	// 	//validar la variable operacion
	// 	if(operacion == null) {
	// 		request.getRequestDispatcher("Login.jsp").forward(request, response);//si operacion no tiene nada, se direcciona a login
	// 	}
	// 	switch (operacion) {
	// 	case "login":
	// 		login(request,response);
	// 		break;
	// 	case "logout":
	// 		logout(request,response);

	// 	default:
	// 		request.getRequestDispatcher("Login.jsp").forward(request, response);
	// 		break;
	// 	}
	// }

	// private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
	// 	// declarar una variable de tipo sesion
	// 	HttpSession sesion = request.getSession();
	// 	//saliendo de la sesion
	// 	sesion.invalidate();
	// 	//direccionar a login
	// 	response.sendRedirect("Login.jsp");
		
	// }

	// private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// 	// declarar variables para obtener el usuario y el password de la pagina jsp
	// 	String user = request.getParameter("username");
	// 	String pass = request.getParameter("password");
	// 	//declara y crear un objeto que tipo modelUsuario
	// 	ModelUsuario mu = new ModelUsuario();
	// 	//declara un objeto de tipo usuario para recoger lo que tiene "mu"
	// 	Usuario objU = mu.validar(user, pass);
	// 	//validar el objU
	// 	if(objU != null) {
	// 		//declaramos una sesion
	// 		HttpSession sesion = request.getSession();
	// 		//creando un atributo para enviar lo que tiene objU
	// 		sesion.setAttribute("Usuario", objU);
	// 		//creando un atributo para llevar el mensaje
	// 		request.setAttribute("mensajito", "Bienvenido ...."+ objU.getUsername());
	// 		//crear un atributo para llevar un mensaje de exito
	// 		request.setAttribute("tipo", "success");
	// 		request.getRequestDispatcher("Menu.jsp").forward(request, response);
			
	// 	}else {
	// 		//creando un atributo para llevar el mensaje
	// 		request.setAttribute("mensajito", "Usuario o password son incorrectos");
	// 		//crear un atributo para llevar un mensaje de exito
	// 		request.setAttribute("tipo", "error");
	// 		request.getRequestDispatcher("Login.jsp").forward(request, response);
	// 	}
		
	// }

}
