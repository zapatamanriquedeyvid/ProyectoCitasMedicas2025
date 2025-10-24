<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/Principal.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/RegistroPaciente.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<title>Registro de Paciente</title>  
</head>
<body>
<header>
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


        </div>
      </div>
    </nav>
</header>
<main>
	
    <h1>Registro de Paciente</h1>
    <p>Complete los siguientes campos para registrar un nuevo paciente y apoderado</p>
    <div style="margin: 20px 0;">
      <div id="textPaciente" class="step active">
        <div class="circle">1</div>
          <span>Datos del Paciente</span>
          </div>
        <div id="textApoderado" class="step">
          <div class="circle">2</div>
          <span>Datos del Apoderado</span>
      </div>
    </div>

    
    
    <form action="${pageContext.request.contextPath}/gestionpacienteregistrar" method="post" id="formularioRegistro" class="needs-validation" novalidate> 
    <!-- DATOS DEL PACIENTE -->
    <input type="hidden" name="accion" value="RegistrarPaciente" id="accionForm">
    <input type="hidden" name="id_paciente" id="idPaciente">
    <div class="paciente" id="Paciente">
      <h2>Datos del Paciente</h2>
  
      <div class="datos">

        <div style="width: 500px;"> 
          <label for="formGroupExampleInput" class="form-label">Tipo de Documento</label>
          <select class="form-select" name="tipodocumento" id="tipodocumento" aria-label="Default select example" required>
            <option value="" disabled selected>Seleccione</option>
            <option value="DNI">DNI</option>
            <option value="CE">CE</option>
            <option value="Pasaporte">Pasaporte</option> 
          </select>
          <div class="invalid-feedback">Seleccione un tipo de documento</div>
        </div>
        <div style="width: 500px;">
          <label for="formGroupExampleInput" class="form-label">Número de Documento</label>
          <input type="text" class="form-control" name="nrodocumento" id="nrodocumento" placeholder="Ingresar Número de Documento" required pattern="[0-9]{8,9}">
        <div class="invalid-feedback">El numero de documento debe tener entre 8 o 9 caracteres</div>
        </div>
      </div>


        <div class="datos">
          <div style="width: 300px;"> 
            <label for="formGroupExampleInput" class="form-label">Nombres</label>
            <input type="text" class="form-control" name="nombres" id="nombres" placeholder="Ingresar Nombres" required pattern="^[A-Za-zÁÉÍÓÚáéíóúÑñ ]{3,50}$">
            <div class="invalid-feedback">Nombre debe tener entre 3 y 50 caracteres</div>
          </div>
          <div style="width: 300px;">
            <label for="formGroupExampleInput" class="form-label">Apellido Materno</label>
            <input type="text" class="form-control" name="apematerno" id="apematerno" placeholder="Ingresar Apellido Materno" required pattern="^[A-Za-zÁÉÍÓÚáéíóúÑñ ]{3,50}$">
            <div class="invalid-feedback">Apellido debe tener entre 3 y 50 caracteres</div>
          </div>
          <div style="width: 300px;">
            <label for="formGroupExampleInput" class="form-label">Apellido Paterno</label>
            <input type="text" class="form-control" name="apepaterno" id="apepaterno" placeholder="Ingresar Apellido Paterno" required pattern="^[A-Za-zÁÉÍÓÚáéíóúÑñ ]{3,50}$">
            <div class="invalid-feedback">Apellido debe tener entre 3 y 50 caracteres</div>
        </div>
      </div>

    <div class="datos">
      <div style="width: 300px;">
        <label for="fechaNacimiento" class="form-label">Fecha de Nacimiento</label>
        <input type="date" class="form-control"
          id="fechaNacimiento"
          name="fechanaci"
          max="2026-10-26"
          min="2007-01-01" required>
          <div class="invalid-feedback">Seleccione su fecha de nacimiento</div>

      </div>
      <div style="width: 300px;"> 
        <label for="formGroupExampleInput" class="form-label">Sexo</label>
        <select class="form-select" name="sexo" id="sexo" aria-label="Default select example" required >
          <option value="" disabled selected>Seleccione</option>
          <option value="M">Masculino</option>
          <option value="F">Femenino</option>
        </select>
        <div class="invalid-feedback">Seleccione su sexo</div>       
      </div>
      <div style="width: 300px;"> 
        <label for="formGroupExampleInput" class="form-label">Lugar de Nacimiento</label>
        <select class="form-select" name="lugarnaci" id="nacimiento" aria-label="Default select example" required>
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
                <option value="Tumbes ">Tumbes </option>
                <option value="Ucayali">Ucayali</option>
        </select>
        <div class="invalid-feedback">Seleccione lugar de nacimiento</div>
      </div>
    </div>
    <div class="datos">
      <div style="width: 500px;"> 
        <label for="formGroupExampleInput" class="form-label">Dirección</label>
        <input type="text" class="form-control" name="procedencia" id="procedencia" placeholder="Dirección" required pattern="^[A-Za-zÁÉÍÓÚáéíóúÑñ0-9 ,.]{3,100}$">
      	<div class="invalid-feedback">Escriba su direccion</div>
      </div>
            <div style="width: 500px;"> 
        <label for="formGroupExampleInput" class="form-label">Tipo de Paciente</label>
        <select class="form-select" name="tipopaci" aria-label="Default select example" required>
          <option value="" disabled selected>Seleccione</option>
          <option value="SIS">SIS</option>
          <option value="Gratuito">Gratuito</option>
        </select>
        <div class="invalid-feedback">Seleccione su tipo de paciente</div>
      </div>
    </div>
  </div>
  
  <!-- DATOS DEL APODERADO -->
  <div class="paciente" id="Apoderado" style="display:none;">
    <h2>Datos del Apoderado</h2>

    <div class="datos">
      <div style="width: 500px;"> 
        <label for="formGroupExampleInput" class="form-label">Tipo de Documento</label>
        <select class="form-select" name="tipodocumentoapo" id="tipodocumentoapo" aria-label="Default select example" required>
          <option value="" disabled selected>Seleccione</option>
          <option value="DNI">DNI</option>
          <option value="CARNET DE EXTRANJERIA">CARNET DE EXTRANJERIA</option>
        </select>
        <div class="invalid-feedback">Seleccione un tipo de documento</div>
      </div>
      <div style="width: 500px;">
        <label for="formGroupExampleInput" class="form-label">Número de Documento</label>
        <input type="text" class="form-control" name="nrodocumentoapo" id="nrodocumentoapo" placeholder="Ingresar número de Documento" required pattern="[0-9]{8,10}" >
        <div class="invalid-feedback">El número de documento debe tener entre 8 y 10 caracteres</div>
      </div>
    </div>
    <div class="datos">
      <div style="width: 500px;"> 
        <label for="formGroupExampleInput" class="form-label">Nombres</label>
        <input type="text" class="form-control" name="nombresapo" id="nombresapo" placeholder="Ingresar Nombres" required pattern="^[A-Za-zÁÉÍÓÚáéíóúÑñ ]{3,50}$">
        <div class="invalid-feedback">Nombre debe tener entre 3 y 50 caracteres</div>
      </div>
      <div style="width: 500px;">
        <label for="formGroupExampleInput" class="form-label">Apellidos</label>
        <input type="text" class="form-control" name="apellidosapo" id="apellidosapo" placeholder="Ingresar Apellidos" required pattern="^[A-Za-zÁÉÍÓÚáéíóúÑñ ]{3,50}$">
        <div class="invalid-feedback">Apellido debe tener entre 3 y 50 caracteres</div>
      </div>
    </div>
    <div class="datos">
      <div style="width: 300px;"> 
        <label for="formGroupExampleInput" class="form-label">Parentesco</label>
        <select class="form-select" name="parentesco" id="parentesco" aria-label="Default select example" required>
          <option value="" disabled selected>Seleccione</option>
          <option value="PADRE">Padre</option>
          <option value="MADRE">Madre</option>
          <option value="Tutor Legal">Tutor Legal</option>
        </select>
        <div class="invalid-feedback">Seleccione el parentesco</div>
      </div>
      <div style="width: 300px;"> 
        <label for="formGroupExampleInput" class="form-label">Celular</label>
        <input type="text" class="form-control" name="celular" id="celular" placeholder="Ingresar Número" required pattern="9[0-9]{8}" maxlength="9">
        <div class="invalid-feedback">El número de celular debe tener 9 dígitos</div>
      </div>
  
      <div style="width: 300px;">
        <label for="formGroupExampleInput" class="form-label">Correo Electrónico</label>
        <input type="email" class="form-control" name="correo" id="correo" placeholder="Ingresar Correo" required pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" maxlength="50">
        <div class="invalid-feedback">Correo electrónico inválido</div>
      </div>
    </div> 
  </div>

  <div class="botones"> 
    <button type="button" id="btn-siguiente">Siguiente</button>
    <button type="submit" id="btn-registrar" style="display:none;">Registrar</button>
  </div>
  
  <input type="hidden" id="mensajeOculto" value="<c:out value='${resul.mensaje}'/>">

  </form> 
  
	<div id="modalError" class="modal">
	  <div class="modal-content">
	    <h4>⚠️ Datos faltantes o erróneos</h4>
	    <p>Por favor, completa todos los campos obligatorios antes de continuar.</p>
	    <button onclick="cerrarModal()">Cerrar</button>
	  </div>
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
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <a href="https://www.facebook.com/people/Instituto-Nacional-de-Salud-del-Ni%C3%B1o-Oficial/61569473611915/"><i class="fab fa-facebook"></i></a>
        <a href="https://x.com/INSN_oficial"><i class="fab fa-twitter"></i></a>
        <a href="http://www.youtube.com/INSNvideos"><i class="fab fa-youtube"></i></a>
      </div>
    </div>
  </footer>
  <div class="modal fade" id="modalMensaje" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header bg-${resul.status == 'ok' ? 'success' : 'danger'} text-white">
        <h5 class="modal-title">
          ${resul.status == 'ok' ? '✅ Éxito' : '⚠️ Error'}
        </h5>
      </div>
      <div class="modal-body">
        <p><c:out value="${resul.mensaje}" /></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>

<%
  Map<String, String> resul = (Map<String, String>) session.getAttribute("resul");
  if (resul != null) {
    session.removeAttribute("resul"); // Elimina para que no se repita al hacer F5
%>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        const modal = new bootstrap.Modal(document.getElementById("modalMensaje"));
        modal.show();
        setTimeout(() => {
            modal.hide();
          }, 3000);
      });
    </script>
<%
  }
%>


</body>

<script>
(() => {
	  'use strict'

	  // Fetch all the forms we want to apply custom Bootstrap validation styles to
	  const forms = document.querySelectorAll('.needs-validation')

	  // Loop over them and prevent submission
	  Array.from(forms).forEach(form => {
	    form.addEventListener('submit', event => {
	      if (!form.checkValidity()) {
	        event.preventDefault()
	        event.stopPropagation()
	      }

	      form.classList.add('was-validated')
	    }, false)
	  })
	})()



</script>

<script src="${pageContext.request.contextPath}/js/RegistroPaciente.js"></script>
</html>