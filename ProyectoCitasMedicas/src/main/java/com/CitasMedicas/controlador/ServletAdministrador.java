
package com.CitasMedicas.controlador;

import com.CitasMedicas.dao.DAOApoderado;
import com.CitasMedicas.dao.DAOEspecialidad;
import com.CitasMedicas.dao.DAOMedico;
import com.CitasMedicas.dao.DAOPaciente;
import com.CitasMedicas.entidad.Apoderado;
import com.CitasMedicas.entidad.Especialidad;
import com.CitasMedicas.entidad.Medico;
import com.CitasMedicas.entidad.Paciente;
import com.CitasMedicas.entidad.Usuario;
import com.CitasMedicas.interfaces.InterfaceApoderado;
import com.CitasMedicas.interfaces.InterfaceEspecialidad;
import com.CitasMedicas.interfaces.InterfaceMedico;
import com.CitasMedicas.interfaces.InterfacePaciente;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Servlet implementation class ServletPasajero
 */ 
@WebServlet("/gestionadministrador")
public class ServletAdministrador extends HttpServlet {
	private static final long serialVersionUID = 1L;

    private InterfacePaciente daoPaciente = new DAOPaciente();
    private InterfaceApoderado daoApoderado = new DAOApoderado();
    private InterfaceEspecialidad daoEspecialidad = new DAOEspecialidad();
    private InterfaceMedico daoMedico = new DAOMedico();
    private static final Logger logger = Logger.getLogger(ServletAdministrador.class.getName());
    private static final Gson gson = new GsonBuilder().create();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletAdministrador() {
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
					request.getRequestDispatcher("/jsp/Administrador.jsp").forward(request, response);//si operacion no tiene nada, se direcciona a login
					return;
				}
				switch (operacion) {
				case "listarPacientes":
					listarPaciente(request,response);
					break;
                case "editarPaciente":
                    editarPaciente(request,response);
                    break;
				case "listarApoderados":
					listarApoderado(request,response);
					break;
                case "editarApoderado":
                    editarApoderado(request,response);
                    break;
				case "listarMedicos":
					listarMedico(request,response);
					break;
                case "editarMedico":
                    editarMedico(request,response);
                    break;
		        case "Logout":
		            logout(request,response);
		            break;
				default:
					request.getRequestDispatcher("/jsp/Administrador.jsp").forward(request, response);
					break;
				}
			}

	private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// declarar una variable de tipo sesion
		HttpSession sesion = request.getSession();
		//saliendo de la sesion
		sesion.invalidate();
		//direccionar a login
        request.getRequestDispatcher("/jsp/Principal.jsp").forward(request, response);
		
	}

	private void listarMedico(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAOMedico daoMedico = new DAOMedico();
        List<Medico> medicos = daoMedico.listadoMedicos();
        List<Especialidad> especialidades = daoEspecialidad.listadoEspecialidades();
        request.setAttribute("tipo", "medico");
        request.setAttribute("listaMed", medicos);
        request.setAttribute("listaEspe", especialidades);
        request.getRequestDispatcher("/jsp/MantMedico.jsp").forward(request, response);
	}
    private void editarMedico(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        Map<String, String> resul = new HashMap<>();
        Medico m = obtenerMedico(request);
        System.out.println("Medico obtenido: " + m.getNombre_medico() + " " + m.getEspecialidad().getId_especialidad());
        try {
            daoMedico.actualizar(m);
            resul.put("status", "ok");
            resul.put("mensaje", "Medico actualizado correctamente");

        } catch (Exception e) {
            logger.log(Level.SEVERE,"Error al actualizar Medico");
            resul.put("status", "error");
            resul.put("mensaje", "Error al actualizar Medico.");
        }

        String json = new com.google.gson.Gson().toJson(resul);
        response.getWriter().write(json);

    }

    private Medico obtenerMedico(HttpServletRequest request) {
        Medico medico = new Medico();
        Especialidad especialidad = new Especialidad();
        Usuario usuario = new Usuario();
        String strId = request.getParameter("id_medico");
        if (strId != null && !strId.isEmpty()) {
            medico.setId_medico(Integer.parseInt(strId));
        }

        especialidad.setId_especialidad(Integer.parseInt(request.getParameter("idEspec")));
        usuario.setId_usuario(Integer.parseInt(request.getParameter("id_usu")));
        medico.setNombre_medico(request.getParameter("nombres"));
        medico.setApellido_medico(request.getParameter("apellidos"));
        medico.setTelef_medico(request.getParameter("telefono"));
        medico.setCorreo_medico(request.getParameter("correo"));
        medico.setDni_medico(Integer.parseInt(request.getParameter("dni")));
        medico.setUrl_perfilo(request.getParameter("perfilUrl"));
        medico.setEspecialidad(especialidad);
        medico.setUsuario(usuario);
        medico.setAnios_Servicio(request.getParameter("anios_servicio"));
        return medico;

    }

    private void listarApoderado(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          List<Apoderado> apoderados = daoApoderado.listadoApoderados();
          request.setAttribute("tipo", "apoderado");
          request.setAttribute("listaApo", apoderados);
          request.getRequestDispatcher("/jsp/MantApoderado.jsp").forward(request, response);
	}
    private void editarApoderado(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        Map<String, String> resul = new HashMap<>();
        Apoderado a = obtenerApoderado(request);
        try {
            daoApoderado.actualizar(a);
            resul.put("status", "ok");
            resul.put("mensajeApo", "Apoderado actualizado correctamente");
        } catch (Exception e) {
            logger.log(Level.SEVERE,"Error al actualizar Apoderado");
            resul.put("status", "error");
            resul.put("mensajeApo", "Error al actualizar Apoderado.");
        }
        String json = new com.google.gson.Gson().toJson(resul);
        response.getWriter().write(json);
    }

    private Apoderado obtenerApoderado(HttpServletRequest request) {
        Apoderado apoderado = new Apoderado();
        String strId = request.getParameter("id_apod");
        if (strId != null && !strId.isEmpty()) {
            apoderado.setId_apod(Integer.parseInt(strId));
        }
        apoderado.setNombre_apod(request.getParameter("nombres"));
        apoderado.setApellido_apod(request.getParameter("apellidos"));
        apoderado.setTipo_documento(request.getParameter("tipoDoc"));
        apoderado.setNro_documento(Integer.parseInt(request.getParameter("nroDoc")));
        apoderado.setCelular_apod(request.getParameter("celular"));
        apoderado.setCorreo_apod(request.getParameter("correo"));
        apoderado.setParentesco(request.getParameter("parentesco"));
        return apoderado;
    }

    private void listarPaciente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DAOPaciente daoPaciente = new DAOPaciente();
        List<Paciente> pacientes = daoPaciente.listadoPacientes();
        request.setAttribute("tipo", "paciente");
        request.setAttribute("listaPac", pacientes);
        request.getRequestDispatcher("/jsp/MantPacientes.jsp").forward(request, response);
	}
    private void editarPaciente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        Map<String, String> resul = new HashMap<>();
            Paciente p = obtenerPaciente(request);
        try {
            System.out.println("Paciente obtenido: " + p.getNombre_paciente() + " " + p.getLugar_naci());
            daoPaciente.actualizar(p);
            resul.put("status", "ok");
            resul.put("mensaje", "Paciente actualizado correctamente");
        } catch (Exception e) {
            logger.log(Level.SEVERE,"Error al actualizar Paciente");
            resul.put("status", "error");
            resul.put("mensaje", "Error al actualizar Paciente.");
        }
        String json = new com.google.gson.Gson().toJson(resul);
        response.getWriter().write(json);
    }

    private Paciente obtenerPaciente(HttpServletRequest request) {
        Paciente paciente = new Paciente();
        Apoderado apoderado = new Apoderado();
        String strId = request.getParameter("id_paciente");
        if (strId != null && !strId.isEmpty()) {
            paciente.setId_paciente(Integer.parseInt(strId));
        }

        int id_apod = (Integer.parseInt(request.getParameter("id_apod")));
        apoderado.setId_apod(id_apod);
        paciente.setNombre_paciente(request.getParameter("nombres"));
        paciente.setApellido_paterno(request.getParameter("apellidoPaterno"));
        paciente.setApellido_materno(request.getParameter("apellidoMaterno"));
        paciente.setTipo_documento(request.getParameter("tipoDoc"));
        paciente.setNro_documento(Integer.parseInt(request.getParameter("nroDoc")));
        paciente.setSexo(request.getParameter("sexo"));
        paciente.setLugar_naci(request.getParameter("lugarNaci"));
        // convertir la fechaNac de String a Date y asignarla
        paciente.setFecha_nac(java.sql.Date.valueOf(request.getParameter("fechaNac")));
        paciente.setProcedencia(request.getParameter("procedencia"));
        paciente.setTipo_paciente(request.getParameter("tipoPac"));
        paciente.setApoderado(apoderado);
        //mensaje para verificar
        return paciente;
    }

}
