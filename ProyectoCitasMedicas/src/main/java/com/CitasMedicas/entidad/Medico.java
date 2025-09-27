package com.CitasMedicas.entidad;

import jakarta.persistence.*;

@Entity
@Table (name = "MEDICO")

public class Medico {
    @Id
    @GeneratedValue (strategy =GenerationType.IDENTITY)
    private int id_medico;
    private int dni_medico;
    private String nombre_medico;
    private String apellido_medico;
    private String telef_medico;
    private String correo_medico;

    @OneToOne
    @JoinColumn (name = "id_usuario", nullable = false)
    private Usuario usuario;

    @ManyToOne
    @JoinColumn (name = "id_especialidad", nullable = false)
    private Especialidad especialidad;

    @OneToMany(mappedBy = "medico",cascade = CascadeType.ALL)

    public int getId_medico() {
        return id_medico;
    }

    public void setId_medico(int id_medico) {
        this.id_medico = id_medico;
    }

    public int getDni_medico() {
        return dni_medico;
    }

    public void setDni_medico(int dni_medico) {
        this.dni_medico = dni_medico;
    }

    public String getNombre_medico() {
        return nombre_medico;
    }

    public void setNombre_medico(String nombre_medico) {
        this.nombre_medico = nombre_medico;
    }

    public String getApellido_medico() {
        return apellido_medico;
    }

    public void setApellido_medico(String apellido_medico) {
        this.apellido_medico = apellido_medico;
    }

    public String getTelef_medico() {
        return telef_medico;
    }

    public void setTelef_medico(String telef_medico) {
        this.telef_medico = telef_medico;
    }

    public String getCorreo_medico() {
        return correo_medico;
    }

    public void setCorreo_medico(String correo_medico) {
        this.correo_medico = correo_medico;
    }
    public Usuario getUsuario() {
        return usuario;
    }
    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    public Especialidad getEspecialidad() {
        return especialidad;
    }
    public void setEspecialidad(Especialidad especialidad) {
        this.especialidad = especialidad;
    }

}