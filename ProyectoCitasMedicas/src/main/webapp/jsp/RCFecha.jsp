<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="com.CitasMedicas.entidad.Medico" %>

<%
	Medico m = (Medico) session.getAttribute("medicoSeleccionado");

%>
<div class="principal">
    <input type="hidden" name="accion" value="DetalleCita" id="accionForm">
    <input type="hidden" name="especialidad" value="" >
	<div class="buscador">
    <h2 for="fechaCita" class="form-label">Elegir fecha de cita</h2>
	<div class="fecha" style="width: 100%;">
        <!-- id del medico -->
        <input type="hidden" name="idmedico" value="<%= m.getId_medico() %>">
        <input type="date" class="form-control col-2 me-2"
        id="fechaCita"
        value="${fechaString}"
        name="fechacita"
        max="2026-10-26" required>
        <button class="btn btn-primary" type="submit" formaction="gestionbuscarhorario">Buscar</button>
    </div>
	</div>
    <%
        if (request.getAttribute("mensajeSinFecha") != null) {
    %>
    <div class="ContenedorHorarios">
    <c:if test="${not empty listaHorarios}">
        <h4>Disponibilidad de horario</h4>
        <c:forEach var="h" items="${listaHorarios}">
        <label class="time-card">
            <input type="radio" name="horario" value="${h}">
            <div class="card-content">
            <input type="hidden" name="fechaString" value="${fechaString}">
            <h4>${fechaFormateada} </h4>
            <h1>${h}</h1>
            </div>
        </label>
        </c:forEach>
    </c:if>
    <c:if test="${empty listaHorarios}">
        <h5 style="color: grey; margin-top: 10px;">Medico no disponible. Seleccione otra fecha.</h5>
    </c:if>
    </div>
    <%
        }else{
    %>
    <h5 style="color: grey; margin-top: 10px;">Seleccione una fecha para ver los horarios disponibles</h5>
    <%
        }
    %>
</div>
<script>
  document.addEventListener('DOMContentLoaded', () => {
    const inputFecha = document.getElementById('fechaCita');
    const hoy = new Date().toISOString().split('T')[0]; // Formato YYYY-MM-DD
    inputFecha.min = hoy;

    // Opcional: si quieres que el valor por defecto también sea hoy
    if (!inputFecha.value) {
      inputFecha.value = hoy;
    }
  });
</script>
