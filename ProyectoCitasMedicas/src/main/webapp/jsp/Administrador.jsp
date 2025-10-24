<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
    <%@ page import="com.CitasMedicas.entidad.Administrador" %>
    <%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mantenimiento del Sistema</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
<link href="https://cdn.datatables.net/1.13.8/css/dataTables.bootstrap5.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.datatables.net/1.13.8/css/dataTables.bootstrap5.min.css" rel="stylesheet">
</head>
<style>
.admin-container {
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

.admin-info {
  flex: 2;
}

.admin-info h2 {
  margin: 0 0 10px;
  color: #2c3e50;
}

.admin-info p {
  margin: 5px 0;
  font-size: 15px;
}

.admin-actions {
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
    Administrador administrador = (Administrador) session.getAttribute("administrador");
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
        <div class="admin-container">
          <div class="admin-info">
            <h2><%= administrador.getNombre_admin()%> <%= administrador.getApellido_admin() %></h2>
            <p><strong>DNI:</strong> <%= administrador.getDni_admin() %></p>
            <p><strong>Teléfono:</strong> <%= administrador.getTelef_admin() %></p>
            <p><strong>Correo:</strong> <%= administrador.getCorreo_admin() %></p>

          </div>

          <div class="admin-actions">
            <a href="${pageContext.request.contextPath}/gestionadministrador?accion=listarPacientes" class="action-btn">📋 Mant. Pacientes</a>
            <a href="${pageContext.request.contextPath}/gestionadministrador?accion=listarApoderados" class="action-btn">✅ Mant. Apoderados</a>
            <a href="${pageContext.request.contextPath}/gestionadministrador?accion=listarMedicos" class="action-btn">✅ Mant. Doctores</a>
            <a href="${pageContext.request.contextPath}/pacientelogin?accion=Logout" class="action-btn">🚪 Cerrar Sesión</a>
          </div>
        </div>
    <%
    }
    %>
</div>


</body>
</html>