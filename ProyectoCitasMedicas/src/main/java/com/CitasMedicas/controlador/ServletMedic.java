
package com.CitasMedicas.controlador;

import com.CitasMedicas.dao.DAOCitas;
import com.CitasMedicas.dao.DAOPaciente;
import com.CitasMedicas.entidad.Cita;
import com.CitasMedicas.entidad.Medico;
import com.CitasMedicas.entidad.Paciente;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Servlet implementation class ServletPasajero
 */ 
@WebServlet("/gestionmedic")
public class ServletMedic extends HttpServlet {
	private static final long serialVersionUID = 1L;

    private DAOCitas daoCita = new DAOCitas();
    private DAOPaciente daoPaciente = new DAOPaciente();
    private static final Logger logger = Logger.getLogger(ServletMedic.class.getName());
    private static final Gson gson = new GsonBuilder().create();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletMedic() {
        super();
        
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String operacion = request.getParameter("accion");

        if (operacion == null || operacion.equals("listarPendientes")) {
            listarP(request, response);
        } else if ("listarAtendidas".equals(operacion)) {
            listarA(request, response);
        } else if ("actualizarCita".equals(operacion)) {
            actualizar(request, response);
        } else {
            listarP(request, response);
        }
	}
    private void actualizar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Map<String, String> resul = new HashMap<>();
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        try {
            int idCita = Integer.parseInt(request.getParameter("idCita"));

            daoCita.actualizarEstadoCita(idCita);

            resul.put("status", "ok");
            resul.put("mensaje", "Cita actualizada correctamente a 'ATENDIDA'.");

        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error al actualizar cita", e);
            resul.put("status", "error");
            resul.put("mensaje", "Error al actualizar el estado de la cita.");
        }

        out.print(new Gson().toJson(resul));
        out.flush();

    }

    private void listarP(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        Medico medico = (Medico) sesion.getAttribute("medico");

        List<Cita> citas = daoCita.listadoPorMedicoYEstado(medico.getId_medico(), "PENDIENTE");
        List<Paciente> pacientes = daoPaciente.listadoPacientes();

        request.setAttribute("listacitas", citas);
        request.setAttribute("listapacientes", pacientes);
        request.setAttribute("vista", "pendientes");
        request.setAttribute("contenido", "MantCitas.jsp");
        request.getRequestDispatcher("jsp/Medico.jsp").forward(request, response);
    }

    private void listarA(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        Medico medico = (Medico) sesion.getAttribute("medico");

        List<Cita> citas = daoCita.listadoPorMedicoYEstado(medico.getId_medico(), "ATENDIDA");
        List<Paciente> pacientes = daoPaciente.listadoPacientes();

        request.setAttribute("listacitas", citas);
        request.setAttribute("listapacientes", pacientes);
        request.setAttribute("contenido", "MantCitas.jsp");
        request.getRequestDispatcher("jsp/Medico.jsp").forward(request, response);
    }
}
