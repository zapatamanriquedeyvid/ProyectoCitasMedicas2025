<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mantenimiento del Sistema</title>
    <!-- CSS general para todo el sitio -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <!-- CSS específico para la página principal -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Principal.css">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- DataTables CSS -->
    <link href="https://cdn.datatables.net/1.13.8/css/dataTables.bootstrap5.min.css" rel="stylesheet">
</head>
<body>
 <!-- Encabezado y menú de navegación -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm" style="width: 100%;">
      <div class="container">
        <a class="navbar-brand fw-bold text-primary d-flex align-items-center" href="#">
          <img src="https://www.insn.gob.pe/sites/default/files/logo-INSN-2022.png" alt="Logo INSN" style="height:48px; margin-right:12px;">
          Hospital del Niño del Perú
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
        </div>
      </div>
    </nav>
<div class="container mt-4">
    <h2 class="text-center mb-4">Mantenimiento de <c:out value="${tipo}"/></h2>

	<div class="d-flex justify-content-end mb-3">
	  <a href="${pageContext.request.contextPath}/jsp/Administrador.jsp" class="btn btn-secondary">
	    <i class="bi bi-arrow-left"></i> Volver
	  </a>
	</div>

    <table id="tablaPacientes" class="table table-striped table-bordered mt-3">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Nombres</th>
            <th>Apellido Paterno</th>
            <th>Apellido Materno</th>
            <th>Tipo de Documento</th>
            <th>Nro. de Documento</th>
            <th>Sexo</th>
            <th>Fecha de Nacimiento</th>
            <th>Lugar de Nacimiento</th>
            <th>Direccion</th>
            <th>Tipo de Seguro</th>
            <th>Acción</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="c" items="${listaPac}">
            <tr id="fila-${c.id_paciente}">
            	<td>${c.id_paciente}</td>
            	<td>${c.nombre_paciente}</td>
                <td>${c.apellido_paterno}</td>
                <td>${c.apellido_materno}</td>
                <td>${c.tipo_documento}</td>
                <td>${c.nro_documento}</td>
                <td>${c.sexo}</td>
                <td>${c.fecha_nac}</td>
                <td>${c.lugar_naci}</td>
                <td>${c.procedencia}</td>
                <td>${c.tipo_paciente}</td>
                <td>
                   <button class="btn btn-sm btn-warning" data-bs-toggle="modal" data-bs-target="#modalPaciente"
                            onclick="editarPaciente('${c.id_paciente}', 
                            '${c.nombre_paciente}', 
                            '${c.apellido_paterno}', 
                            '${c.apellido_materno}', 
                            '${c.tipo_documento}', 
                            '${c.nro_documento}', 
                            '${c.sexo}', 
                            '${c.fecha_nac}',  
                            '${c.lugar_naci}', 
                            '${c.procedencia}', 
                            '${c.tipo_paciente}', 
                            '${c.apoderado.id_apod}')">
                        Editar
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>

<!-- Modal para editar paciente -->
<div class="modal fade" id="modalPaciente" tabindex="-1" aria-labelledby="modalPacienteLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <form id="formPaciente">
        <div class="modal-header">
          <h5 class="modal-title" id="modalPacienteLabel">Editar Paciente</h5>
          <input type="hidden" name="id_paciente" id="id_paciente" />
          <input type="hidden" name="id_apod" id="id_apod" />
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
        </div>
        <div class="modal-body">
          <input type="hidden" name="accion" id="accionForm" value="editarPaciente" />
          <div class="row mb-3">
            <div class="col-md-6">
              <label for="nombres" class="form-label">Nombres</label>
              <input type="text" class="form-control" name="nombres" id="nombres" required />
            </div>
            <div class="col-md-6">
              <label for="apellidoPaterno" class="form-label">Apellido Paterno</label>
              <input type="text" class="form-control" name="apellidoPaterno" id="apellidoPaterno" required />
            </div>
          </div>
          <div class="row mb-3">
            <div class="col-md-6">
              <label for="apellidoMaterno" class="form-label">Apellido Materno</label>
              <input type="text" class="form-control" name="apellidoMaterno" id="apellidoMaterno" required />
            </div>
            <div class="col-md-6">
              <label for="tipoDoc" class="form-label">Tipo de Documento</label>
              <select class="form-select" name="tipoDoc" id="tipoDoc" required>
                <option value="" disabled selected>Seleccione</option>
         	    <option value="DNI">DNI</option>
          	    <option value="CARNET DE EXTRANJERIA">CARNET DE EXTRANJERIA</option>
          	    <option value="Pasaporte">Pasaporte</option>
              </select>
            </div>
          </div>
          <div class="row mb-3">
            <div class="col-md-6">
              <label for="nroDoc" class="form-label">Nro. de Documento</label>
              <input type="text" class="form-control" name="nroDoc" id="nroDoc" required />
            </div>
            <div class="col-md-6">
              <label for="sexo" class="form-label">Sexo</label>
              <select class="form-select" name="sexo" id="sexo" required>
                <option value="" disabled selected>Seleccione</option>
          		<option value="M">Masculino</option>
          		<option value="F">Femenino</option>
              </select>
            </div>
          </div>
          <div class="row mb-3">
            <div class="col-md-6">
              <label for="fechaNac" class="form-label">Fecha de Nacimiento</label>
              <input type="date" class="form-control" name="fechaNac" id="fechaNac" required />
            </div>
            <div class="col-md-6">
              <label for="lugarNaci" class="form-label">Lugar de Nacimiento</label>
              <select class="form-select" name="lugarNaci" id="lugarNaci" required>
                <option value="" disabled selected>Seleccione</option>
                <option value="Amazonas">Amazonas</option>
                <option value="Áncash">Áncash</option>
                <option value="Cajamarca">Cajamarca</option>
                <option value="Cusco">Cusco</option>
                <option value="Lambayeque">Lambayeque</option>
                <option value="Lima">Lima</option>
                <option value="Loreto">Loreto</option>
                <option value="Pasco">Pasco</option>
                <option value="Piura">Piura</option>
                <option value="Puno">Puno</option>
                <option value="Tumbes">Tumbes </option>
                <option value="Ucayali">Ucayali</option>
              </select>
            </div>
          </div>
          <div class="row mb-3">
            <div class="col-md-6">
              <label for="procedencia" class="form-label">Dirección</label>
              <input type="text" class="form-control" name="procedencia" id="procedencia" required />
            </div>
            <div class="col-md-6">
                <label for="tipoPac" class="form-label">Tipo de Seguro</label>
                <select class="form-select" name="tipoPac" id="tipoPac" required>
                <option value="" disabled selected>Seleccione</option>
                <option value="SIS">SIS</option>
                <option value="Gratuito">Gratuito</option>
                </select>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-primary">Guardar Cambios</button>
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
        </div>
      </form>
    </div>
  </div>
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

<!-- Bootstrap JS + Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<!-- DataTables JS -->
<script src="https://cdn.datatables.net/1.13.8/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.8/js/dataTables.bootstrap5.min.js"></script>

<script>
    $(document).ready(function () {
        $('#tablaPacientes').DataTable({
            "pageLength": 5,
            "lengthMenu": [5, 10, 20, 50],
            "language": {
                "url": "//cdn.datatables.net/plug-ins/1.13.8/i18n/es-ES.json"
            }
        });
    });

    // Editar
    function editarPaciente(id,nombres, apellidoPaterno, apellidoMaterno, tipoDoc, nroDoc, sexo, fechaNac, lugarNaci, procedencia, tipoPac, id_apod) {
        $("#accionForm").val("editarPaciente");
        $("#id_paciente").val(id);
        $("#nombres").val(nombres);
        $("#apellidoPaterno").val(apellidoPaterno);
        $("#apellidoMaterno").val(apellidoMaterno);
        $("#tipoDoc").val(tipoDoc);
        $("#nroDoc").val(nroDoc);
        $("#sexo").val(sexo);
        $("#fechaNac").val(fechaNac);
        $("#lugarNaci").val(lugarNaci);
        $("#procedencia").val(procedencia);
        $("#tipoPac").val(tipoPac);
        $("#id_apod").val(id_apod);
    }

    // Insertar/Editar pasajero con AJAX
    $("#formPaciente").on("submit", function (e) {
        e.preventDefault();
        $.ajax({
            url: "gestionadministrador",
            method: "POST",
            data: $(this).serialize(),
            dataType: "json",
            success: function (resp) {
                bootstrap.Modal.getInstance(document.getElementById('modalPaciente')).hide();
                mostrarMensaje(resp.mensaje);
                setTimeout(() => location.reload(), 1500);
            },
            error: function () {
                mostrarMensaje("Error al guardar el paciente.");
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












