<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%@ page import="com.CitasMedicas.entidad.Medico" %>

<%
	Medico m = (Medico) session.getAttribute("medicoSeleccionado");

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registrar Cita</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/RegistrarCita.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/js/RegistrarCita.js">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
<link href="https://cdn.datatables.net/1.13.8/css/dataTables.bootstrap5.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.datatables.net/1.13.8/css/dataTables.bootstrap5.min.css" rel="stylesheet">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Principal.css">
</head>

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

      </div>
	<a href="${pageContext.request.contextPath}/gestionregistrarcita?accion=VerLista" class="btn btn-outline-primary ms-3" data-bs-toggle="modal">Volver a Lista</a>

    </nav>
<%
	String micontenido = (String) request.getAttribute("contenido");
%>
<main>


	<div class="wizard-container">
	  <h1>Programar Cita</h1>
	  <div class="wizard-steps" >
	    <div class="step <%= micontenido == null ? "active" : "" %>">
	      <div class="circle">1</div>
	      <span>Especialidad</span>
	    </div>
	    <div class="step <%= micontenido != null && micontenido.contains("RCMedico") ? "active" : "" %>">
	      <div class="circle">2</div>
	      <span>Médico</span>
	    </div>
	    <div class="step <%= micontenido != null && micontenido.contains("RCFecha") ? "active" : "" %>">
	      <div class="circle">3</div>
	      <span>Fecha y Hora</span>
	    </div>
	    <div class="step <%= micontenido != null && micontenido.contains("DetalleCita") ? "active" : "" %>">
	      <div class="circle">4</div>
	      <span>Detalle</span>
	    </div>
	  </div>
	</div>
<div style=" background-color:#e9eff5; width: 70%; margin-top:20px; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);">
<!-- si el medico existe aparece este div -->


<script>
	const vistaActual = "<%= micontenido != null ? micontenido : "" %>";
</script>
<form action="${pageContext.request.contextPath}/gestionregistrarcita" method="post"  >
	<% if (micontenido != null) { %>

		<jsp:include page="<%= micontenido %>" />
	<% } else { %>
    <div class="principal">
		<h2 class="text-center mb-4" style="color: #212529;">Especialidades</h2>
		<div class="card-container">
    	<input type="hidden" name="accion" value="MedicosxEspe" id="accionForm">
    	
		
			<label class="time-card">
		      <input type="radio" name="especialidad" value="1">
		      <div class="card-content">
			  	<h2>Oftalmología</h2>
		 		<span class="material-symbols-outlined"style="font-size: 30px;">symptoms</span>
		      </div>
		    </label>
		    <label class="time-card">
		      <input type="radio" name="especialidad" value="2">
		      <div class="card-content">
			  	<h2>Dermatología</h2>
		 		<span class="material-symbols-outlined"style="font-size: 30px;">healing</span>
		      </div>
		    </label>
		    <label class="time-card">
		      <input type="radio" name="especialidad" value="3">
		      <div class="card-content">
			  	<h2>Nefrología</h2>
		 		<span class="material-symbols-outlined"style="font-size: 30px;">nephrology</span>
		      </div>
		    </label>
		    <label class="time-card">
		      <input type="radio" name="especialidad" value="4" >
		      <div class="card-content">
			  	<h2>Pediatria</h2>
		 		<span class="material-symbols-outlined"style="font-size: 30px;">child_care</span>
		      </div>
		    </label>
		    <label class="time-card">
		      <input type="radio" name="especialidad" value="5" >
		      <div class="card-content">
			  	<h2>Psicología</h2>
		 		<span class="material-symbols-outlined"style="font-size: 30px;">psychology</span>
		      </div>
		    </label>
		    <label class="time-card">
		      <input type="radio" name="especialidad" value="6" >
		      <div class="card-content">
			  	<h2>Neumologia</h2>
		 		<span class="material-symbols-outlined"style="font-size: 30px;">pulmonology</span>
		      </div>
		    </label>
	
		</div>
		<div class="invalid-feedback">More example invalid feedback text</div>
	</div>
    <%
    	}
    %>
	
 <%
    if (request.getAttribute("mensaje") != null) {
   %>
   	<div class="error-box">
		<div class="icon">⚠️</div>
        <div>${mensaje}</div>
      </div>
    <%
       }
   %>
    
	<div class="botones">
	  <%
	      String contenidoActual = (String) request.getAttribute("contenido");
	      boolean mostrarAtras = (contenidoActual != null);
	  %>
	
	  <a href="${pageContext.request.contextPath}/gestionregistrarcita?accion=Regresar"
	     class="btn btn-secondary"
	     id="btnAtras"
	     style="<%= mostrarAtras ? "" : "visibility:hidden;" %>">Atrás</a>
	

	<%
		if(contenidoActual == "DetalleCita.jsp"){
	%>
	  <button type="submit" id="btnSiguiente">Registrar</button>
	<%
		}else{
	%>
		<button type="submit" id="btnSiguiente">Continuar</button>
	<%
		}
	%>
	</div>

 </form> 
    </div> 
</main>

<footer>
   <div class="footer-content">
     <div class="footer-texto">
        <p>INSTITUTO NACIONAL DE SALUD DEL NIÑO</p>
        <p>Av. Brasil N°600 - Breña</p>
        <p>&copy; Derechos Reservados INSN - 2025</p>
     </div>
     <div class="footer-social">
        <a href="https://www.facebook.com/people/Instituto-Nacional-de-Salud-del-Ni%C3%B1o-Oficial/61569473611915/"><i class="fab fa-facebook"></i></a>
        <a href="https://x.com/INSN_oficial"><i class="fab fa-twitter"></i></a>
        <a href="http://www.youtube.com/INSNvideos"><i class="fab fa-youtube"></i></a>
     </div>
   </div>
  </footer>
</body>

</html>