package com.CitasMedicas.entidad;

import java.util.List;

import jakarta.persistence.*;

@Entity
@Table (name = "ADMINISTRADOR")

public class Administrador {

@Id
@GeneratedValue (strategy =GenerationType.IDENTITY)
private int id_administrador;
private int dni_admin;
private String nombre_admin;
private String apellido_admin;
private int telef_admin;
private String correo_admin;

//relacionando usuario con administrador(un usuario puede tener un administrador)
@OneToOne
@JoinColumn (name = "id_usuario", nullable = false) //campo foreing key
//declarar un atributo de tipo usuario para que se comunique con el administrador
private Usuario usuario;

//getters and setters
public int getId_administrador() {
    return id_administrador;
}
public void setId_administrador(int id_administrador) {
    this.id_administrador = id_administrador;
}
public int getDni_admin() {
    return dni_admin;
}
public void setDni_admin(int dni_admin) {
    this.dni_admin = dni_admin;
}
public String getNombre_admin() {
    return nombre_admin;
}
public void setNombre_admin(String nombre_admin) {
    this.nombre_admin = nombre_admin;
}
public String getApellido_admin() {
    return apellido_admin;
}
public void setApellido_admin(String apellido_admin) {
    this.apellido_admin = apellido_admin;
}
public int getTelef_admin() {
    return telef_admin;
}
public void setTelef_admin(int telef_admin) {
    this.telef_admin = telef_admin;
}
public String getCorreo_admin() {
    return correo_admin;
}
public void setCorreo_admin(String correo_admin) {
    this.correo_admin = correo_admin;
}
public Usuario getUsuario() {
    return usuario;
}
public void setUsuario(Usuario usuario) {
    this.usuario = usuario;
}
}