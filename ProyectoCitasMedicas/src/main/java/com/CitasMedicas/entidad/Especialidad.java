package com.CitasMedicas.entidad;

import java.util.List;

import jakarta.persistence.*;

@Entity
@Table (name = "ESPECIALIDAD")

public class Especialidad {

    @Id
    @GeneratedValue (strategy =GenerationType.IDENTITY)
    private int id_especialidad;
    private String nom_especialidad;

    @OneToMany(mappedBy = "especialidad",cascade = CascadeType.ALL)
    private List<Medico> listaMedicos;

    public int getId_especialidad() {
        return id_especialidad;
    }

    public void setId_especialidad(int id_especialidad) {
        this.id_especialidad = id_especialidad;
    }

    public String getNom_especialidad() {
        return nom_especialidad;
    }

    public void setNom_especialidad(String nom_especialidad) {
        this.nom_especialidad = nom_especialidad;
    }
}