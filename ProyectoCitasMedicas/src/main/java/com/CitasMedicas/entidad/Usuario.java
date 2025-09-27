package com.CitasMedicas.entidad;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table (name = "USUARIO")
public class Usuario {
  @Id
  @GeneratedValue (strategy = GenerationType.IDENTITY)
  private int id_usuario;
  private String nom_usuario;
  private String contraseña;
  private String cargo;

  @OneToOne(mappedBy = "medico",cascade = CascadeType.ALL)

  //getters y setters
  public int getId_usuario() {
    return id_usuario;
  }
  public void setId_usuario(int id_usuario) {
    this.id_usuario = id_usuario;
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
