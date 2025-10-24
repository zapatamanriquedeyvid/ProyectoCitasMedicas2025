<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hospital del Niño del Perú</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- CSS general para todo el sitio -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <!-- CSS específico para la página principal -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Principal.css">
</head>
<%
  String mensaje = (String) request.getAttribute("mensaje");
%>
<body>
    <!-- Encabezado y menú de navegación -->
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
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/pacientelogin?accion=Logout">Inicio</a></li> <!-- PAGINA DE INICIO -->
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/jsp/Login.jsp">Consultar Cita</a></li> <!-- LOGIN PARA PACIENTE -->
          </ul>
         <a href="#" class="btn btn-outline-primary ms-3" data-bs-toggle="modal" data-bs-target="#loginModal">Iniciar sesión</a> <!-- LOGIN PARA ADMIN/MEDIC -->


        </div>
      </div>
    </nav>

    
    
    <!-- Carrusel de imágenes -->
    <div id="hospitalCarousel" class="carousel slide mt-3" data-bs-ride="carousel">
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="https://www.insn.gob.pe/sites/default/files/2024-07/slider2-2024_1.jpg" class="d-block w-100" alt="Imagen 1">
        </div>
        <div class="carousel-item">
          <img src="https://www.insn.gob.pe/sites/default/files/2025-08/Atencion-ni%C3%B1o-2025.jpg" class="d-block w-100" alt="Imagen 2">
        </div>
        <div class="carousel-item">
          <img src="https://www.insn.gob.pe/sites/default/files/2024-07/slider5-2024_1.jpg" class="d-block w-100" alt="Imagen 3">
        </div>
        <div class="carousel-item">
          <img src="https://www.insn.gob.pe/sites/default/files/2025-08/Equipo%20INSN-2025.jpg" class="d-block w-100" alt="Imagen 4">
        </div>
        <div class="carousel-item">
          <img src="https://www.insn.gob.pe/sites/default/files/2024-07/slider1-2024_1.jpg" class="d-block w-100" alt="Imagen 5">
        </div>
        <div class="carousel-item">
          <img src="https://www.insn.gob.pe/sites/default/files/2024-07/slider4-2024_1.jpg" class="d-block w-100" alt="Imagen 6">
        </div>
      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#hospitalCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Anterior</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#hospitalCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Siguiente</span>
      </button>
    </div>

    <!-- Sección de bienvenida -->
    <section class="container mt-5">
      <div class="row">
        <div class="col-md-8 mx-auto text-center">
          <h1 class="titulo-principal">Bienvenidos al Hospital del Niño de Perú</h1>
          <p class="lead">Comprometidos con la salud y el bienestar de los niños y adolescentes. Nuestro hospital ofrece atención médica especializada, tecnología de punta y un equipo humano dedicado a cuidar de los más pequeños.</p>
        </div>
      </div>
    </section>

    <!-- Sección de servicios -->
    <section class="container mt-5 mb-5">
      <h2 class="text-center mb-4 subtitulo">Nuestros Servicios</h2>
      <div class="row justify-content-center">
        <div class="col-md-4 d-flex justify-content-center">
          <a href="${pageContext.request.contextPath}/jsp/Login.jsp" class="text-decoration-none w-100">
            <div class="card h-100 shadow-sm servicio-card">
              <div class="card-body">
                <h5 class="card-title">Reservar cita</h5>
                <p class="card-text">Solicita una cita médica para tu niño.</p>
              </div>
            </div>
          </a>
        </div>
        <div class="col-md-4 d-flex justify-content-center">
          <a href="${pageContext.request.contextPath}/jsp/Login.jsp" class="text-decoration-none w-100">
            <div class="card h-100 shadow-sm servicio-card">
              <div class="card-body">
                <h5 class="card-title">Consultar cita</h5>
                <p class="card-text">Consulta el estado y detalles de tu cita médica.</p>
              </div>
            </div>
          </a>
        </div>
      </div>
    </section>

     <!-- Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
       <img src="https://www.insn.gob.pe/sites/default/files/logo-INSN-2022.png" alt="Logo INSN" style="height:48px; margin-right:12px;">
        <h5 class="modal-title" id="loginModalLabel">Hospital del Niño - Iniciar sesión</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
      </div>
      <div class="modal-body">
        <form id="formLogin" action="${pageContext.request.contextPath}/pacientelogin" method="post" >
          <div class="mb-3">
          	<input type="hidden" name="accion" value="UsuarioLogin" id="accionForm" />
  			<label for="rol" class="form-label">Tipo de usuario</label>
  			<select class="form-select" id="rol" name="rol">
    			<option value="medico">Médico</option>
    			<option value="administrador">Administrativo</option>
  			</select>
		  </div>
          <div class="mb-3">
            <label for="username" class="form-label">Usuario</label>
            <input type="text" class="form-control" id="username" name="username" required>
          </div>
          <div class="mb-3">
            <label for="password" class="form-label">Contraseña</label>
            <input type="password" class="form-control" id="password" name="password" required>
          </div>
          <button type="submit" class="btn btn-primary">Entrar</button>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Modal de error -->
<div class="modal fade" id="modalMensaje" tabindex="-1" role="dialog" aria-labelledby="modalMensajeLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-body text-center">
        <%= mensaje %>
      </div>
    </div>
  </div>
</div>







    <footer>
    <div class="footer-content">
      <div class="footer-texto">
        <p>INSTITUTO NACIONAL DE SALUD DEL NIÑO</p>
        <p>Av. Brasil N°600 - Breña</p>
        <p>&copy; Derechos Reservados INSN - 2025</p>
      </div>
      <div class="footer-social">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <a href="https://www.facebook.com/people/Instituto-Nacional-de-Salud-del-Ni%C3%B1o-Oficial/61569473611915/"><i class="fab fa-facebook"></i></a>
        <a href="https://x.com/INSN_oficial"><i class="fab fa-twitter"></i></a>
        <a href="http://www.youtube.com/INSNvideos"><i class="fab fa-youtube"></i></a>
      </div>
    </div>
	</footer>

<!-- Bootstrap JS + Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<!-- DataTables JS -->
<script src="https://cdn.datatables.net/1.13.8/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.8/js/dataTables.bootstrap5.min.js"></script>
<%
  if (mensaje != null && !mensaje.trim().isEmpty()) {
%>
  <script>
    $(document).ready(function() {
      $('#modalMensaje').modal('show');
      setTimeout(function() {
        $('#modalMensaje').modal('hide');
      }, 2000);
    });
  </script>
<%
    // Opcional: limpiar el atributo para evitar que se muestre al recargar
    request.removeAttribute("mensaje");
  }else{
%>
    <script>
        $(document).ready(function() {
        $('#modalMensaje').modal('hide');
        });
    </script>
<%
    request.removeAttribute("mensaje");
}
%>
</body>
</html>