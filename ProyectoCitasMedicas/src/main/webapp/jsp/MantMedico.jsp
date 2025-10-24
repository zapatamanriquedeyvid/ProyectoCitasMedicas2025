<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mantenimiento del Sistema</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- DataTables CSS -->
    <link href="https://cdn.datatables.net/1.13.8/css/dataTables.bootstrap5.min.css" rel="stylesheet">
</head>

<div class="container-fluid mt-4" style="padding: 0 100px;">
    <h2 class="text-center ml-4">Mantenimiento de <c:out value="${tipo}"/></h2>

	<div class="d-flex justify-content-end mb-3">
	  <a href="${pageContext.request.contextPath}/jsp/Administrador.jsp" class="btn btn-secondary">
	    Volver
	  </a>
	</div>

    <table id="tablaPacientes" class="table table-striped table-bordered mt-3" >
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>DNI</th>
            <th>Nombres</th>
            <th>Apellidos</th>
            <th>Telefono</th>
            <th>Correo</th>
            <th>Perfil URL</th>
            <th>especialidad</th>
            <th>Acción</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="c" items="${listaMed}">
            <tr id="fila-${c.id_medico}">
                <td>${c.id_medico}</td>
            	<td>${c.dni_medico}</td>
            	<td>${c.nombre_medico}</td>
                <td>${c.apellido_medico}</td>
                <td>${c.telef_medico}</td>
                <td>${c.correo_medico}</td>
                <td>${c.url_perfil}</td>
                <td>${c.especialidad.nom_especialidad}</td>
                <td>
                   <button class="btn btn-sm btn-warning" data-bs-toggle="modal" data-bs-target="#modalPaciente"
                            onclick="editarMedico('${c.id_medico}',
                            '${c.dni_medico}',
                            '${c.nombre_medico}',
                            '${c.apellido_medico}',
                            '${c.telef_medico}',
                            '${c.correo_medico}',
                            '${c.url_perfil}',
                            '${c.especialidad.id_especialidad}',
                            '${c.anios_servicio}',
                            '${c.usuario.idUsuario}')">
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

          <h5 class="modal-title" id="modalPacienteLabel">Editar Medico</h5>
          <input type="hidden" name="id_medico" id="id_medico"/>
          <input type="hidden" name="id_usu" id="id_usu"/>
          <input type="hidden" name="anios_servicio" id="anios_servicio"/>

          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
        </div>
        <div class="modal-body">
          <input type="hidden" name="accion" id="accionForm" value="editarMedico" />

            <!-- nombres y apellidos -->
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

            <!-- telefono y dni -->
            <div class="row mb-3">
              <div class="col-md-6">
                <label for="telefono" class="form-label">Teléfono</label>
                <input type="number" class="form-control" name="telefono" id="telefono" required />
              </div>
              <div class="col-md-6">
                <label for="dni" class="form-label">DNI</label>
                <input type="number" class="form-control" name="dni" id="dni" required />
              </div>
            </div>

            <!-- especialidad y correo -->
            <div class="row mb-3">
              <div class="col-md-6">
                <label for="idEspec" class="form-label">especialidad</label>
                <select class="form-select" name="idEspec" id="idEspec" required>
                  <c:forEach var="c" items="${listaEspe}">
                    <option value="${c.id_especialidad}">${c.nom_especialidad}</option>
                  </c:forEach>
                </select>
              </div>
              <div class="col-md-6">
                <label for="correo" class="form-label">Correo</label>
                <input type="email" class="form-control" name="correo" id="correo" required />
              </div>
            </div>


            <!--url de perfil -->
            <div class="row mb-3">
              <div class="col-md-12">
                <label for="perfilUrl" class="form-label">URL de Perfil</label>
                <input type="text" class="form-control" name="perfilUrl" id="perfilUrl" required />
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

    // insertar datos en el modal
    function editarMedico(id, dni,nombres, apellido, telefono, correo, perfilUrl, idEspec, anios_servicio, id_usu) {
        $("#accionForm").val("editarMedico");
        $("#id_medico").val(id);
        $("#nombres").val(nombres);
        $("#apellidos").val(apellido);
        $("#telefono").val(telefono);
        $("#dni").val(dni);
        $("#correo").val(correo);
        $("#perfilUrl").val(perfilUrl);
        $("#idEspec").val(idEspec);
        $("#anios_servicio").val(anios_servicio);
        $("#id_usu").val(id_usu);
    }

    // Insertar/Editar con AJAX
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
                mostrarMensaje("Error al guardar el medico.");
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














