<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
    <%@ page import="com.CitasMedicas.entidad.Medico" %>
    <%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registrar Cita</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/Principal.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
<link href="https://cdn.datatables.net/1.13.8/css/dataTables.bootstrap5.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.datatables.net/1.13.8/css/dataTables.bootstrap5.min.css" rel="stylesheet">
</head>
<style>
html, body {
  height: 100%;
  margin: 0;
  display: flex;
  flex-direction: column;
}

.container {
  flex: 1;
}
.medico-container {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  background-color: #f9f9f9;
  border: 1px solid #ccc;
  padding: 20px;
  border-radius: 10px;
  max-width: 800px;
  margin: 30px auto;
  box-shadow: 0 0 10px rgba(0,0,0,0.1);
  font-family: 'Segoe UI', sans-serif;
}

.medico-info {
  flex: 2;
}

.perfil-img {
  width: 120px;
  height: 120px;
  border-radius: 50%;
  object-fit: cover;
  margin-bottom: 10px;
}

.medico-info h2 {
  margin: 0 0 10px;
  color: #2c3e50;
}

.medico-info p {
  margin: 5px 0;
  font-size: 15px;
}

.medico-actions {
  flex: 1;
  display: flex;
  flex-direction: column;
  gap: 15px;
  margin-left: 30px;
}

.action-btn {
  text-decoration: none;
  background-color: #3498db;
  color: white;
  padding: 10px 15px;
  border-radius: 5px;
  text-align: center;
  font-weight: bold;
  transition: background-color 0.3s ease;
}

.action-btn:hover {
  background-color: #2980b9;
}


</style>
 <%
    Medico medico = (Medico) session.getAttribute("medico");
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
          </ul>
        </div>
      </div>
    </nav>

<div class="container mt-4">
    <%
        // Verifica si el servlet mandó el atributo 'contenido'
    String micontenido = (String) request.getAttribute("contenido");
    if (micontenido != null) {
    %>
     <jsp:include page="<%= micontenido %>" />
    <%
    } else {
    %>
        <div class="medico-container">
          <div class="medico-info">
            <img src="<%= medico.getUrl_perfil() %>" alt="Foto del médico" class="perfil-img" />
            <h2><%= medico.getNombre_medico() %> <%= medico.getApellido_medico() %></h2>
            <p><strong>DNI:</strong> <%= medico.getDni_medico() %></p>
            <p><strong>Teléfono:</strong> <%= medico.getTelef_medico() %></p>
            <p><strong>Correo:</strong> <%= medico.getCorreo_medico() %></p>
            <p><strong>Años de servicio:</strong> <%= medico.getAnios_servicio() %></p>
          </div>

          <div class="medico-actions">
            <a href="${pageContext.request.contextPath}/gestionmedic?accion=listarPendientes" class="action-btn">📋 Citas Pendientes</a>
            <a href="${pageContext.request.contextPath}/gestionmedic?accion=listarAtendidas" class="action-btn">✅ Citas Atendidas</a>
            <a href="${pageContext.request.contextPath}/pacientelogin?accion=Logout" class="action-btn">🚪 Cerrar Sesión</a>
          </div>
        </div>
    <%
    }
    %>
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

</body>
</html>