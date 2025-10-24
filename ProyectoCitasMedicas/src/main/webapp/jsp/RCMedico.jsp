<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.CitasMedicas.entidad.Especialidad" %>


<%
	Especialidad espe = (Especialidad) session.getAttribute("especialidadSeleccionada");

%>
<%
if (session.getAttribute("medicoSeleccionado") != null) {
    session.removeAttribute("medicoSeleccionado");
}
%>
<div class="principal">
<input type="hidden" name="accion" value="horariosxmedico" id="accionForm">

 <h2 class="text-center mb-4" style="color: #212529;">Medicos</h2>

 <nav class="navbar navbar-light bg-light">
  <div class="container">
   <input class="form-control me-2" type="search" placeholder="Medicos" aria-label="Search" id="searchInput">
  </div>
 </nav>
 
 <div class="card-container">
  <c:forEach var="m" items="${listaMedicos}"> 
 
   <label class="time-card medico-card">
   <input type="hidden" name="especialidad" value="<%= espe.getId_especialidad() %>">
    <input type="radio" name="doctor" value="${m.id_medico}">

    <div class="medicoContent">
     <div>
      <img src="${m.url_perfil}" class="rounded-circle me-3" width="100" height="100">
     </div>
     <div>
      <h5 class="fw-bold mb-1 nombreMedico">${m.nombre_medico}  ${m.apellido_medico}</h5> 
      <p class="mb-1 text-muted"> ${m.especialidad.nom_especialidad}</p>
      <p class="mb-1 text-muted">Tiempo de servicio: ${m.anios_servicio}</p>
     </div>
    </div>
   </label>
   
  </c:forEach>
</div>
</div>

<script>
	document.getElementById('searchInput').addEventListener('keyup', function() {
	    const filtro = this.value.toLowerCase();
	    const medicos = document.querySelectorAll('.medico-card');

	    medicos.forEach(card => {
	        const nombre = card.querySelector('.nombreMedico').textContent.toLowerCase();
	        card.style.display = nombre.includes(filtro) ? 'block' : 'none';
	    });
	});
</script>
