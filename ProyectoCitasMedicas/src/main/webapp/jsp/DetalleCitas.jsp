<%@ page import="com.CitasMedicas.entidad.Medico" %>
<%@ page import="com.CitasMedicas.entidad.Paciente" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Paciente p = (Paciente) session.getAttribute("pacientelogin");
	Medico m = (Medico) session.getAttribute("medicoSeleccionado");
%>



<div class="resumen-cita">
  <h2>Resumen de tu Cita Médica</h2>
 <input type="hidden" name="accion" value="RegistrarCita" id="accionForm">

 <input type="hidden" name="Fecha_cita" value="${fechaCita}" id="accionForm">
 <input type="hidden" name="Hora_cita" value="${horarioSeleccionado}" id="accionForm">
 <input type="hidden" name="Id_medico" value="<%= m.getId_medico() %>" id="accionForm">
 <input type="hidden" name="Id_paciente" value="<%= p.getId_paciente() %>" id="accionForm">
 <input type="hidden" name="accion" value="RegistrarCita" id="accionForm">
 <input type="hidden" name="accion" value="RegistrarCita" id="accionForm">
 <input type="hidden" name="accion" value="RegistrarCita" id="accionForm">
 <input type="hidden" name="accion" value="RegistrarCita" id="accionForm">
 <input type="hidden" name="accion" value="RegistrarCita" id="accionForm">
  <div class="datos-paciente">
    <h3>Datos del Paciente</h3>
    <ul>
      <li><strong>Nombre completo:</strong> <%= p.getNombre_paciente() %> <%= p.getApellido_paterno() %> <%= p.getApellido_materno() %></li>
      <li><strong>Tipo de documento:</strong> <%= p.getTipo_documento() %></li>
      <li><strong>Número de Documento:</strong> <%= p.getNro_documento() %></li>
      <li><strong>Tipo de paciente:</strong> <%= p.getTipo_paciente() %></li>
      <li><strong>Nombre del Apoderado:</strong> <%= p.getApoderado().getNombre_apod()%> <%= p.getApoderado().getApellido_apod() %></li>
    </ul>
  </div>

  <div class="datos-medico">
    <h3>Médico Seleccionado</h3>
    <ul>
      <li><strong>Nombre:</strong> <%= m.getNombre_medico() %> <%= m.getApellido_medico()%> </li>
      <li><strong>Especialidad:</strong> <%= m.getEspecialidad().getNom_especialidad() %></li>
      <li><strong>Telefono:</strong> <%= m.getTelef_medico() %></li>
    </ul>
  </div>

  <div class="datos-cita">
    <h3>Detalles de la Cita</h3>
    <ul>
      <li><strong>Fecha:</strong> ${fechaCita}</li>
      <li><strong>Hora:</strong> ${horarioSeleccionado}</li>
      <li><strong>Tipo de Atención:</strong> CONSULTA MEDICA</li>
      <li><strong>Centro Médico:</strong> Hospital del Niño</li>
      <li><strong>Dirección:</strong> Av. Brasil 600, Breña 15083</li>
    </ul>
  </div>

  <div class="confirmacion">
    <p>Si toda la información es correcta, haz clic en <strong>Confirmar Cita</strong> para finalizar tu registro.</p>
  </div>
</div>