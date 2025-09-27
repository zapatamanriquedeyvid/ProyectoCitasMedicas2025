<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mantenimiento de Pasajeros</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- DataTables CSS -->
    <link href="https://cdn.datatables.net/1.13.8/css/dataTables.bootstrap5.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-4">
    <h2 class="text-center mb-4">Mantenimiento de Pasajeros</h2>

    <!-- Botón para modal (Registrar) -->
    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="XXXXXXXXXX"
        onclick="XXXXXXXXXX">
        <i class="bi bi-person-plus"></i> Nuevo Pasajero
    </button>

    <!-- Tabla -->
    <table id="XXXXXXXXXX" class="table table-striped table-bordered mt-3">
        <thead class="table-dark">
        <tr>
            <th>Codigo</th>
            <th>Nombres</th>
            <th>Apellidos</th>
            <th>DNI</th>
            <th>Teléfono</th>
            <th>Correo</th>
            <th>Acciones</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="XXXXXXXXXX" items="${XXXXXXXXXX}">
            <tr id="fila-${XXXXXXXXXX}">
                <td>${XXXXXXXXXX}</td>
                <td>${XXXXXXXXXX}</td>
                <td>${XXXXXXXXXX}</td>
                <td>${XXXXXXXXXX}</td>
                <td><c:out value="${XXXXXXXXXX}" default=""/></td>
                <td><c:out value="${XXXXXXXXXX}" default=""/></td>
                <td>
                    <button class="btn btn-sm btn-warning" data-bs-toggle="modal" data-bs-target="#modalPasajero"
                            onclick="XXXXXXXXXX('${XXXXXXXXXX}', '${XXXXXXXXXX}', '${XXXXXXXXXX}', '${XXXXXXXXXX}', '${XXXXXXXXXX}', '${XXXXXXXXXX}')">
                        Editar
                    </button>
                    
                    <button class="btn btn-sm btn-danger"
                            data-bs-toggle="modal"
                            data-bs-target="XXXXXXXXXX"
                            onclick="XXXXXXXXXX'${XXXXXXXXXX}', '${XXXXXXXXXX}', '${XXXXXXXXXX}')">
                        Eliminar
                    </button>
                    
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- Modal Pasajero (Registrar/Editar) -->

<div class="modal fade" id="XXXXXXXXXX" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <form id="XXXXXXXXXXXXX">
                <div class="modal-header">
                    <h5 class="modal-title">Registrar / Editar Pasajero</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="XXXXXXXXXX" value="XXXXXXXXXX" id="XXXXXXXXXX">
                    <input type="hidden" name="XXXXXXXXXX" id="XXXXXXXXXX">

                    <div class="row mb-3">
                        <div class="col">
                            <label class="form-label">Nombres</label>
                            <input type="text" class="form-control" name="nombres" id="nombres" required>
                        </div>
                        <div class="col">
                            <label class="form-label">Apellidos</label>
                            <input type="text" class="form-control" name="apellidos" id="apellidos" required>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col">
                            <label class="form-label">DNI</label>
                            <input type="text" class="form-control" name="dni" id="dni" maxlength="8" required>
                        </div>
                        <div class="col">
                            <label class="form-label">Teléfono</label>
                            <input type="text" class="form-control" name="telefono" id="telefono">
                        </div>
                        <div class="col">
                            <label class="form-label">Correo</label>
                            <input type="email" class="form-control" name="correo" id="correo">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success">Guardar</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal Eliminar -->
<div class="modal fade" id="XXXXXXXXXX" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Confirmar Eliminación</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
        </div>
        <div class="modal-body">
          <p>¿Está seguro de eliminar al pasajero <strong id="XXXXXXXXXX"></strong>?</p>
          <input type="hidden" id="XXXXXXXXXX">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" onclick="XXXXXXXXXX">Eliminar</button>
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
        </div>
    </div>
  </div>
</div>

<!-- Modal de Notificación -->
<div class="modal fade" id="XXXXXXXXXX" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content text-center">
      <div class="modal-body">
        <p id="XXXXXXXXXX"></p>
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
        $('#tablaPasajeros').DataTable({
            "pageLength": 5,
            "lengthMenu": [5, 10, 20, 50],
            "language": {
                "url": "//cdn.datatables.net/plug-ins/1.13.8/i18n/es-ES.json"
            }
        });
    });

    // Editar
    function editarPasajero(id, nombres, apellidos, dni, telefono, correo) {
        $("#XXXXXXXXXX").val("XXXXXXXXXX");
        $("#XXXXXXXXXX").val(id);
        $("#XXXXXXXXXX").val(nombres);
        $("#XXXXXXXXXX").val(apellidos);
        $("#XXXXXXXXXX").val(dni);
        $("#XXXXXXXXXX").val(telefono);
        $("#XXXXXXXXXX").val(correo);
    }

    // Nuevo pasajero
    function nuevoPasajero() {
        $("#XXXXXXXXXX").val("XXXXXXXXXX");
        $("#idPasajero, #nombres, #apellidos, #dni, #telefono, #correo").val("");
    }

    // Preparar modal de eliminar
    function prepararEliminar(id, nombres, apellidos) {
        $("#XXXXXXXXXX").val(id);
        $("#XXXXXXXXXX").text(nombres + " " + apellidos);
    }

    // Eliminar pasajero
    function eliminarPasajero() {
        let pasajeroId = $("#XXXXXXXXXX").val();
        $.ajax({
            url: "XXXXXXXXXX",
            method: "POST",
            data: { accion: "XXXXXXXXXX", codi: pasajeroId },
            dataType: "json",
            success: function (resp) {
                if (resp.status === "ok") {
                    $("#fila-" + pasajeroId).remove();
                    bootstrap.Modal.getInstance(document.getElementById('modalEliminar')).hide();
                }
                mostrarMensaje(resp.mensaje);
            },
            error: function () {
                mostrarMensaje("Error al eliminar el pasajero.");
            }
        });
    }

    // Insertar/Editar pasajero con AJAX
    $("#XXXXXXXXXXXX").on("submit", function (e) {
        e.preventDefault();
        $.ajax({
            url: "XXXXXXXXXXXX",
            method: "POST",
            data: $(this).serialize(),
            dataType: "json",
            success: function (resp) {
                bootstrap.Modal.getInstance(document.getElementById('XXXXXXXXXXXX')).hide();
                mostrarMensaje(resp.mensaje);
                setTimeout(() => location.reload(), 1500);
            },
            error: function () {
                mostrarMensaje("Error al guardar el pasajero.");
            }
        });
    });

    // Modal de notificación
    function mostrarMensaje(texto) {
        $("#XXXXXXXXX").text(texto);
        let modal = new bootstrap.Modal(document.getElementById("XXXXXXXXXXXXX"));
        modal.show();
        setTimeout(() => modal.hide(), 3000);
    }
</script>

</body>
</html>