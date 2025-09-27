package com.CitasMedicas.entidad;

import jakarta.persistence.*;

@Entity
@Table (name = "tb_pasajero")

public class Pasajero {

@Id
@GeneratedValue (strategy =GenerationType.IDENTITY)
private int id_pasajero;
private String nombres;
private String apellidos;
private String dni;
private String telefono;
private String correo;
public int getId_pasajero() {
	return id_pasajero;
}
public void setId_pasajero(int id_pasajero) {
	this.id_pasajero = id_pasajero;
}
public String getNombres() {
	return nombres;
}
public void setNombres(String nombres) {
	this.nombres = nombres;
}
public String getApellidos() {
	return apellidos;
}
public void setApellidos(String apellidos) {
	this.apellidos = apellidos;
}
public String getDni() {
	return dni;
}
public void setDni(String dni) {
	this.dni = dni;
}
public String getTelefono() {
	return telefono;
}
public void setTelefono(String telefono) {
	this.telefono = telefono;
}
public String getCorreo() {
	return correo;
}
public void setCorreo(String correo) {
	this.correo = correo;
}





	
}
