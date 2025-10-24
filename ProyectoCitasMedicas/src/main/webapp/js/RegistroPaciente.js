const nextBtn = document.getElementById("btn-siguiente");
const registerBtn = document.getElementById("btn-registrar");
const textPaciente= document.getElementById("textPaciente");
const textApoderado = document.getElementById("textApoderado");

nextBtn.addEventListener("click", () => {
  if (nextBtn.textContent === "Siguiente") {
    textPaciente.classList.remove("active");
    textApoderado.classList.add("active");
    nextBtn.textContent = "Regresar";
    registerBtn.style.display = "inline-block";
    document.getElementById("Paciente").style.display = "none";
    document.getElementById("Apoderado").style.display = "flex";

  } else {
    textPaciente.classList.add("active");
    textApoderado.classList.remove("active");
    nextBtn.textContent = "Siguiente";
    registerBtn.style.display = "none";
    document.getElementById("Paciente").style.display = "flex";
    document.getElementById("Apoderado").style.display = "none";
  }
});




// VALIDACIONES*********************************

document.getElementById("formularioRegistro").addEventListener("submit", function (e) {
  const form = e.target;

  // Verifica si el formulario es válido
  if (!form.checkValidity()) {
    e.preventDefault(); // Evita el envío
    mostrarModal(); // Muestra tu modal general
  }
});

  function mostrarModal() {
  const modal = document.getElementById("modalError");
  modal.style.display = "flex";

  setTimeout(() => {
    modal.style.display = "none";
  }, 3000); // 3000 milisegundos = 3 segundos
  }

  function cerrarModal() {
      const modal = document.getElementById("modalError");
    modal.style.display = "none";
  }
