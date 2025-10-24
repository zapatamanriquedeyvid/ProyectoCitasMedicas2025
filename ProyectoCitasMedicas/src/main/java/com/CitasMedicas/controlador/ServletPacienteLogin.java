
package com.CitasMedicas.controlador;

import com.CitasMedicas.dao.DAOAdministrador;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import java.util.List;
import java.util.logging.Logger;

import com.CitasMedicas.dao.DAOCitas;
import com.CitasMedicas.dao.DAOPaciente;
import com.CitasMedicas.dao.DAOUsuario;
import com.CitasMedicas.dao.DAOMedico;
import com.CitasMedicas.entidad.Cita;
import com.CitasMedicas.entidad.Paciente;
import com.CitasMedicas.entidad.Usuario;
import com.CitasMedicas.entidad.Administrador;
import com.CitasMedicas.entidad.Medico;

@WebServlet("/pacientelogin")
public class ServletPacienteLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger=Logger.getLogger(ServletPacienteLogin.class.getName());

	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletPacienteLogin() {
        super();
        
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//declarar una variable para recoger las acciones a realizar en el jsp
		String operacion = request.getParameter("accion");
		System.out.println("Operacion: " + operacion);
		//validar la variable operacion
		if(operacion == null) {
			request.getRequestDispatcher("/jsp/Login.jsp").forward(request, response);//si operacion no tiene nada, se direcciona a login
			return;
		}
		switch (operacion) {
		case "PacienteLogin":
			loginPaciente(request,response);
			break;
		case "UsuarioLogin":
			loginUsuario(request,response);
			break;
        case "Logout":
            logout(request,response);
            break;
		default:
			request.getRequestDispatcher("/jsp/Login.jsp").forward(request, response);
			break;
		}
	}

	private void logout(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
		// declarar una variable de tipo sesion
		HttpSession sesion = request.getSession();
		//saliendo de la sesion
		sesion.invalidate();
		//direccionar a login
        request.getRequestDispatcher("/jsp/Principal.jsp").forward(request, response);
		
	}


	
	private void loginPaciente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String dni = request.getParameter("dni");
        int dniInt = Integer.parseInt(dni);
		DAOPaciente DAOP = new DAOPaciente();
		DAOCitas DAOCitas = new DAOCitas();
        try {
            Paciente u = DAOP.buscarPorDni(dniInt);
            if(u != null) {
                List<Cita> citas = DAOCitas.obtenerCitasPorPaciente(u.getId_paciente());
                HttpSession sesion = request.getSession();

                sesion.setAttribute("pacientelogin", u);
                request.setAttribute("listaCitas", citas);
                request.getRequestDispatcher("/jsp/ListaCitas.jsp").forward(request, response);
            }else {
                //creando un atributo para llevar el mensaje
                request.setAttribute("mensaje", "Número de documento no registrado.");
                //crear un atributo para llevar un mensaje de exito
                request.setAttribute("tipo", "error");
                request.getRequestDispatcher("/jsp/Login.jsp").forward(request, response);
            }

        }catch (Exception e){
            //creando un atributo para llevar el mensaje
            request.setAttribute("mensaje", "Número de documento no registrado.");
            request.getRequestDispatcher("/jsp/Login.jsp").forward(request, response);
        }

	}

  	private void loginUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
		String password = request.getParameter("password");
		String tipoUsuario = request.getParameter("rol");
		DAOUsuario DAOU = new DAOUsuario();
		Usuario u = DAOU.validar(username, password, tipoUsuario);
		System.out.println("usuario : " + u);
		if(u != null) {

			HttpSession sesion = request.getSession();
	        sesion.setAttribute("usuario", u);
	        sesion.setAttribute("rol", tipoUsuario);
	        switch (tipoUsuario) {
	            case "medico":
	                DAOMedico DAOM = new DAOMedico();
	            	Medico medico = DAOM.obtenerPorIdUsuario(u.getIdUsuario());
	            	sesion.setAttribute("medico", medico);
	                request.getRequestDispatcher("/jsp/Medico.jsp").forward(request, response);
	                break;
	            case "administrador":
	            	DAOAdministrador DAOA = new DAOAdministrador();
	            	Administrador admin = DAOA.obtenerPorIdUsuario(u.getIdUsuario());
	            	System.out.println("admin : " + admin);
	            	System.out.println("ID del usuario: " + u.getIdUsuario());
	            	sesion.setAttribute("administrador", admin);
	                request.getRequestDispatcher("/jsp/Administrador.jsp").forward(request, response);
	                break;
	            default:
	                request.setAttribute("mensaje", "Tipo de usuario no reconocido.");
	                request.setAttribute("tipo", "error");
	                request.getRequestDispatcher("/jsp/Principal.jsp").forward(request, response);

			}
		}else {
            request.setAttribute("mensaje", "Credenciales incorrectas.");
            request.setAttribute("tipo", "error");
            request.getRequestDispatcher("/jsp/Principal.jsp").forward(request, response);
		}

	}
	
	
	
}
