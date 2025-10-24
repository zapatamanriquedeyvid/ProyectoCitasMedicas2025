<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mantenimiento de Citas</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- DataTables CSS -->
    <link href="https://cdn.datatables.net/1.13.8/css/dataTables.bootstrap5.min.css" rel="stylesheet">

</head>
<body>

<div class="container mt-4">
    <h2 class="text-center mb-4">Lista de Citas</h2>

	<div class="d-flex justify-content-end mb-3">
	  <a href="${pageContext.request.contextPath}/jsp/Medico.jsp" class="btn btn-secondary">
	    <i class="bi bi-arrow-left"></i> Volver
	  </a>
	</div>

    <!-- Tabla -->
    <table id="mitablita" class="table table-striped table-bordered mt-3">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Paciente</th>
            <th>Fecha</th>
            <th>Hora</th>
            <th>Tipo de Atención</th>
            <th>Fecha de Emisión</th>
            <th>Estado</th>
            <c:if test="${vista == 'pendientes'}">
        		<th>Actualizar</th>
    		</c:if>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="c" items="${listacitas}">
            <tr id="fila-${c.id_cita}">
            	<td>${c.id_cita}</td>
            	<td>${c.paciente.nombre_paciente}</td>
                <td>${c.fecha_cita}</td>
                <td>${c.hora_cita}</td>
                <td>${c.tipo_atencion}</td>
                <td>${c.fecha_emision}</td>
                <td>${c.estado}</td>
                <c:if test="${vista == 'pendientes'}">
                <td>                    
                    <button class="btn btn-sm btn-success"
                            data-bs-toggle="modal"
                            data-bs-target="#modalActualizar"
                            onclick="prepararActualizar('${c.id_cita}', '${c.paciente.nombre_paciente}', '${c.tipo_atencion}')">
                        Marcar como Atendido
                    </button>
                </td>
                </c:if>      
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>



<div class="modal fade" id="modalActualizar" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
        <form id="formActualizarCita">
            <div class="modal-header">
              <h5 class="modal-title">Confirmar Actualización</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
              <p>¿Desea marcar como <strong>Atendida</strong> la cita de <span id="nombreActualizar"></span>?</p>
              <input type="hidden" name="idCita" id="idActualizar">
              <input type="hidden" name="accion" value="actualizarCita">
            </div>
            <div class="modal-footer">
              <button type="submit" class="btn btn-success">Confirmar</button>
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
            </div>
        </form>
    </div>
  </div>
</div>

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
        $('#mitablita').DataTable({
            "pageLength": 5,
            "lengthMenu": [5, 10, 20, 50],
            "language": {
                "url": "//cdn.datatables.net/plug-ins/1.13.8/i18n/es-ES.json"
            }
        });
    });

    function prepararActualizar(id, paciente, tipo) {
        $("#idActualizar").val(id);
        $("#nombreActualizar").text(paciente + " de " + tipo);
    }

    $("#formActualizarCita").on("submit", function (e) {
        e.preventDefault();

        $.ajax({
            url: "gestionmedic",
            method: "POST",
            data: $(this).serialize(),
            dataType: "json",
            success: function (resp) {

                bootstrap.Modal.getInstance(document.getElementById('modalActualizar')).hide();
                mostrarMensaje(resp.mensaje);
                setTimeout(() => location.reload(), 1500);
            },
            error: function () {
                mostrarMensaje("Error al actualizar la cita.");
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