package com.CitasMedicas.entidad;

import java.sql.Date;

import jakarta.persistence.*;

@Entity
@Table (name = "PACIENTE")

public class Paciente {

  @Id
  @GeneratedValue (strategy =GenerationType.IDENTITY)
    private int id_paciente;
    private String tipo_documento;
    private int nro_documento;
    private String nombre_paciente;
    private String apellido_paterno;
    private String apellido_materno;
    private Date fecha_nac;
    private String sexo;
    private String lugar_naci;
    private String procedencia;
    private String tipo_paciente;
    
    //relacionando apoderado con paciente(muchos pacientes pueden pertenecer a una solo apoderado)
    @ManyToOne
	@JoinColumn (name = "id_apod", nullable = false) //campo foreing key
	//declarar un atributo de tipo apoderado para que se comunique con el paciente
	private Apoderado apoderado;

  @OneToMany(mappedBy = "paciente",cascade = CascadeType.ALL)
    
    //getters and setters
    public int getId_paciente() {
        return id_paciente;
    }
    public void setId_paciente(int id_paciente) {
        this.id_paciente = id_paciente;
    }
    public String getTipo_documento() {
        return tipo_documento;
    }
    public void setTipo_documento(String tipo_documento) {
        this.tipo_documento = tipo_documento;
    }
    public int getNro_documento() {
        return nro_documento;
    }
    public void setNro_documento(int nro_documento) {
        this.nro_documento = nro_documento;
    }
    public String getNombre_paciente() {
        return nombre_paciente;
    }
    public void setNombre_paciente(String nombre_paciente) {
        this.nombre_paciente = nombre_paciente;
    }
    public String getApellido_paterno() {
        return apellido_paterno;
    }
    public void setApellido_paterno(String apellido_paterno) {
        this.apellido_paterno = apellido_paterno;
    }
    public String getApellido_materno() {
        return apellido_materno;
    }
    public void setApellido_materno(String apellido_materno) {
        this.apellido_materno = apellido_materno;
    }
    public Date getFecha_nac() {
        return fecha_nac;
    }
    public void setFecha_nac(Date fecha_nac) {
        this.fecha_nac = fecha_nac;
    }
    public String getSexo() {
        return sexo;
    }
    public void setSexo(String sexo) {
        this.sexo = sexo;
    }
    public String getLugar_naci() {
        return lugar_naci;
    }
    public void setLugar_naci(String lugar_naci) {
        this.lugar_naci = lugar_naci;
    }
    public String getProcedencia() {
        return procedencia;
    }
    public void setProcedencia(String procedencia) {
        this.procedencia = procedencia;
    }
    public String getTipo_paciente() {
        return tipo_paciente;
    }
    public void setTipo_paciente(String tipo_paciente) {
        this.tipo_paciente = tipo_paciente;
    }
    public Apoderado getApoderado() {
        return apoderado;
    }
    public void setApoderado(Apoderado apoderado) {
        this.apoderado = apoderado;
    }
    
}
