package com.CitasMedicas.entidad;

import java.sql.Date;
import java.sql.Time;

import jakarta.persistence.*;

@Entity
@Table (name = "CITA")

public class Cita {

@Id
@GeneratedValue (strategy =GenerationType.IDENTITY)
private int id_cita;
private Date fecha_cita;
private Time hora_cita;
private String tipo_atencion;
private Date fecha_emision;
private String estado;

 //relacionando paciente con cita(muchas citas pueden pertenecer a una solo paciente)
@ManyToOne
@JoinColumn (name = "id_paciente", nullable = false) //campo foreing key
//declarar un atributo de tipo paciente para que se comunique con la cita
private Paciente paciente;

//relacionando medico con cita(muchas citas pueden pertenecer a una solo medico)
@ManyToOne
@JoinColumn (name = "id_medico", nullable = false) //campo foreing key
//declarar un atributo de tipo medico para que se comunique con la cita
private Medico medico;
  
  public int getId_cita() {
  return id_cita;
  }
  public void setId_cita(int id_cita) {
    this.id_cita = id_cita;
  }
  public Date getFecha_cita() {
    return fecha_cita;
  }
  public void setFecha_cita(Date fecha_cita) {
    this.fecha_cita = fecha_cita;
  }
  public Time getHora_cita() {
    return hora_cita;
  }
  public void setHora_cita(Time hora_cita) {
    this.hora_cita = hora_cita;
  }
  public String getTipo_atencion() {
    return tipo_atencion;
  }
  public void setTipo_atencion(String tipo_atencion) {
    this.tipo_atencion = tipo_atencion;
  }
  public Date getFecha_emision() {
    return fecha_emision;
  }
  public void setFecha_emision(Date fecha_emision) {
    this.fecha_emision = fecha_emision;
  }
  public String getEstado() {
    return estado;
  }
  public void setEstado(String estado) {
    this.estado = estado;
  }
  public Paciente getPaciente() {
    return paciente;
  }
  public void setPaciente(Paciente paciente) {
    this.paciente = paciente;
  }
  public Medico getMedico() {
    return medico;
  }
  public void setMedico(Medico medico) {
    this.medico = medico;
  }

}