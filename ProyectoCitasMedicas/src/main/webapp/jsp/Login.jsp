<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<%
  String mensaje = (String) request.getAttribute("mensaje");
%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Hospital del Niño del Perú</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Login.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Principal.css">
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
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/pacientelogin?accion=Logout">Inicio</a></li> <!-- PAGINA DE INICIO -->
            <li class="nav-item"><a class="nav-link" href="/jsp/Login.jsp">Consultar Cita</a></li> <!-- LOGIN PARA PACIENTE -->
          </ul>


        </div>
      </div>
    </nav>
    
   <main>
     <section class="container mt-5 mb-5 col-md-8">
      <div class="row justify-content-center">
        <div class="col-md-6">
          <div class="card shadow p-3 mb-5 bg-white rounded">
            <div class="card-body">
              <h2 class="text-center mb-4 subtitulo">Consulta tus citas</h2>
              
              <form action="${pageContext.request.contextPath}/pacientelogin" method="post">
                <div class="mb-3">
                  <label for="dni" class="form-label" style="font-size:20px">Ingresa tu dni</label>
                  <input type="text" class="form-control" id="dni" name="dni" required placeholder="Ejemplo: 987654321" >
                  <input type="hidden" name="accion" value="PacienteLogin" id="accionForm">
                </div>
                <div class="d-grid">
                  <button type="submit" class="btn btn-primary btn-lg">Ingresar</button>
                  <a href="${pageContext.request.contextPath}/jsp/RegistroPaciente.jsp">Registrar</a>
                </div>
              </form>
              
            </div>
          </div>
        </div>
      </div>
    </section>
    
   </main>

 

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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
