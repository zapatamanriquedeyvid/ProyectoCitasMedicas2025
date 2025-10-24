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
            <th>Apellidos</th>
            <th>Tipo de Documento</th>
            <th>Nro. de Documento</th>
            <th>Parentesco</th>
            <th>Número Celular</th>
            <th>Correo</th>
            <th>accion</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="c" items="${listaApo}">
            <tr id="fila-${c.id_apod}">
            	<td>${c.id_apod}</td>
            	<td>${c.nombre_apod}</td>
                <td>${c.apellido_apod}</td>
                <td>${c.tipo_documento}</td>
                <td>${c.nro_documento}</td>
                <td>${c.parentesco}</td>
                <td>${c.celular_apod}</td>
                <td>${c.correo_apod}</td>
                <td>
                   <button class="btn btn-sm btn-warning" data-bs-toggle="modal" data-bs-target="#modalApoderado"
                            onclick="editarApoderado('${c.id_apod}',
                            '${c.nombre_apod}',
                            '${c.apellido_apod}',
                            '${c.tipo_documento}',
                            '${c.nro_documento}',
                            '${c.parentesco}',
                            '${c.celular_apod}',
                            '${c.correo_apod}')">
                        Editar
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>

<div class="modal fade" id="modalApoderado" tabindex="-1" aria-labelledby="modalApoderadoLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <form id="formApoderado">
        <div class="modal-header">
          <h5 class="modal-title" id="modalApoderadoLabel">Editar Apoderado</h5>
          <input type="hidden" name="id_apod" id="id_apod" />
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
        </div>
        <div class="modal-body">
          <input type="hidden" name="accion" id="accionForm" value="editarApoderado" />

          <div class="row mb-3">
            <div class="col-md-6">
              <label for="nombres" class="form-label">Nombres</label>
              <input type="text" class="form-control" name="nombres" id="nombres" required />
            </div>
            <div class="col-md-6">
              <label for="apellidos" class="form-label">Apellidos</label>
              <input type="text" class="form-control" name="apellidos" id="apellidos" required />
            </div>
          </div>


          <div class="row mb-3">
            <div class="col-md-6">
              <label for="tipoDoc" class="form-label">Tipo de Documento</label>
              <select class="form-select" name="tipoDoc" id="tipoDoc" required>
                <option value="" disabled selected>Seleccione</option>
         	    <option value="DNI">DNI</option>
          	    <option value="CARNET DE EXTRANJERIA">CARNET DE EXTRANJERIA</option>
              </select>
            </div>
            <div class="col-md-6">
              <label for="nroDoc" class="form-label">Nro. de Documento</label>
              <input type="number" class="form-control" name="nroDoc" id="nroDoc" required />
            </div>
          </div>

          <div class="row mb-3">
            <div class="col-md-6">
              <label for="parentesco" class="form-label">Parentesco</label>
              <select class="form-select" name="parentesco" id="parentesco" required>
                <option value="" disabled selected>Seleccione</option>
                <option value="PADRE">Padre</option>
                <option value="MADRE">Madre</option>
                <option value="APODERADO">Apoderado</option>
              </select>
            </div>
            <div class="col-md-6">
                <label for="celular" class="form-label">Número Celular</label>
                <input type="number" class="form-control" name="celular" id="celular" required />
            </div>
          </div>

          <div class="row mb-3">
            <div class="col-md-12">
              <label for="correo" class="form-label">Correo</label>
              <input type="email" class="form-control" name="correo" id="correo" required />
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
    function editarApoderado(id,nombres, apellido_apod, tipo_documento, nro_documento, parentesco, celular_apod, correo_apod) {
        $("#accionForm").val("editarApoderado");
        $("#id_apod").val(id);
        $("#nombres").val(nombres);
        $("#apellidos").val(apellido_apod);
        $("#tipoDoc").val(tipo_documento);
        $("#nroDoc").val(nro_documento);
        $("#parentesco").val(parentesco);
        $("#celular").val(celular_apod);
        $("#correo").val(correo_apod);
    }


    // Insertar/Editar pasajero con AJAX
    $("#formApoderado").on("submit", function (e) {
        e.preventDefault();
        $.ajax({
            url: "gestionadministrador",
            method: "POST",
            data: $(this).serialize(),
            dataType: "json",
            success: function (resp) {
                bootstrap.Modal.getInstance(document.getElementById('modalApoderado')).hide();
                mostrarMensaje(resp.mensajeApo);
                setTimeout(() => location.reload(), 1500);
            },
            error: function () {
                mostrarMensaje("Error al actualizar el apoderado.");
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












