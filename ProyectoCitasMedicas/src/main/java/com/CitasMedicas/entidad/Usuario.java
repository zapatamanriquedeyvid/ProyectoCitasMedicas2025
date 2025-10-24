package com.CitasMedicas.entidad;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table (name = "USUARIO")
public class Usuario {
  @Id
  @GeneratedValue (strategy = GenerationType.IDENTITY)
  @Column(name = "id_usuario")
  private int idUsuario;
  private String nom_usuario;
  private String contraseña;
  private String cargo;

  //getters y setters
  public int getIdUsuario() {
    return idUsuario; 
  }
  public void setId_usuario(int idUsuario) {
    this.idUsuario = idUsuario;
  }
  public String getNom_usuario() {
    return nom_usuario;
  }
  public void setNom_usuario(String nom_usuario) {
    this.nom_usuario = nom_usuario;
  }
  public String getContraseña() {
    return contraseña;
  }
  public void setContraseña(String contraseña) {
    this.contraseña = contraseña;
  }
  public String getCargo() {
    return cargo;
  }
  public void setCargo(String cargo) {
    this.cargo = cargo;
  }
}
