<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page import="com.CitasMedicas.entidad.Paciente" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listado de Citas Médicas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/1.13.8/css/dataTables.bootstrap5.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Principal.css">
    <style>
      button {
	  background-color: #5A7FFF;
	  margin: 15px 0;
	  color: white;
	  font-weight: 600;
	  border: none;
	  padding: 10px 20px;
	  cursor: pointer;
	  font-size: 16px;
	  transition: background-color 0.3s ease;
	  border-radius: 10px;
  }
    </style>

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm" style="width: 100%;">
  <div class="container">
    <a class="navbar-brand fw-bold text-primary d-flex align-items-center" href="${pageContext.request.contextPath}/pacientelogin?accion=Logout">
      <img src="https://www.insn.gob.pe/sites/default/files/logo-INSN-2022.png" alt="Logo INSN" style="height:48px; margin-right:12px;">
      Hospital del Niño del Perú
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        
      
      <%
	    Paciente paciente = (Paciente) session.getAttribute("pacientelogin");
	    if (paciente != null) {
		%>
		    <li class="nav-item">Bienvenid@, <%= paciente.getNombre_paciente() %> <%=paciente.getApellido_paterno() %> <%=paciente.getApellido_materno() %></li>
		    
		<%
		    } else {
		%>
		    <li class="nav-item"> No se encontró información del paciente. </li>
		    
		<%
		    }
		%>
		</ul>
		<a href="${pageContext.request.contextPath}/pacientelogin" class="btn btn-outline-primary ms-3">Volver a la Consulta</a>
    </div>
  </div>
</nav>


<div class="container mt-4">
    <h2 class="text-center mb-4">Listado de Citas Médicas</h2>
<a href="${pageContext.request.contextPath}/jsp/RegistrarCita.jsp">
  <button>Nueva Cita</button>
</a>

    <table id="tablaCitas" class="table table-striped table-bordered mt-3">
        <thead class="table-dark"> 
        <tr>
            <th>Paciente</th>
            <th>Doctor</th>
            <th>Especialidad</th>
            <th>Fecha</th>
            <th>Hora</th>
            <th>Tipo Atención</th>
            <th>Estado</th>
            <th>accion</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="c" items="${listaCitas}">
            <tr id="fila-${c.id_cita}">
                <td>${c.paciente.nombre_paciente}</td>
                <td>${c.medico.nombre_medico}</td>
                <td>${c.medico.especialidad.nom_especialidad}</td>
                <td>${c.fecha_cita}</td>
                <td>${c.hora_cita}</td>
                <td>${c.tipo_atencion}</td>         
                <td>${c.estado}</td>
                <td>
                 <form method="POST" action="${pageContext.request.contextPath}/gestionregistrarcita">
                    <input type="hidden" name="accion" value="VerCompro" />
                    <input type="hidden" name="idCita" value="${c.id_cita}" />
                    <button style="padding:10px; margin:0;" type="submit">Ver Comprobante</button>
                 </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- Modal de Notificación -->
<div class="modal fade" id="modalMensaje" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content text-center">
      <div class="modal-body">
        <p id="mensajeTexto"></p>
      </div>
    </div>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.datatables.net/1.13.8/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.8/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tablaCitas').DataTable({
            "pageLength": 5,
            "lengthMenu": [5, 10, 20, 50],
            "language": {
                "url": "//cdn.datatables.net/plug-ins/1.13.8/i18n/es-ES.json"
            }
        });
    });
    function mostrarMensaje(texto) {
        $("#mensajeTexto").text(texto);
        let modal = new bootstrap.Modal(document.getElementById("modalMensaje"));
        modal.show();
        setTimeout(() => modal.hide(), 3000);
    }
</script>
</body>
</html>