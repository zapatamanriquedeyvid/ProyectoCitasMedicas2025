package com.CitasMedicas.entidad;

import java.time.LocalTime;

import jakarta.persistence.*;

@Entity
@Table (name = "DIA_TRABAJO")

public class DiaTrabajo {
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)

    private int id_diaTrabajo;
    private String dia_semana;
    private LocalTime hora_inicio;
    private LocalTime hora_fin;

    @ManyToOne
    @JoinColumn (name = "id_medico", nullable = false)
    private Medico medico;

    public int getId_diaTrabajo() {
        return id_diaTrabajo;
    }

    public void setId_diaTrabajo(int id_diaTrabajo) {
        this.id_diaTrabajo = id_diaTrabajo;
    }

    public String getDia_semana() {
        return dia_semana;
    }

    public void setDia_semana(String dia_semana) {
        this.dia_semana = dia_semana;
    }

    public LocalTime getHora_inicio() {
        return hora_inicio;
    }

    public void setHora_inicio(LocalTime hora_inicio) {
        this.hora_inicio = hora_inicio;
    }

    public LocalTime getHora_fin() {
        return hora_fin;
    }

    public void setHora_fin(LocalTime hora_fin) {
        this.hora_fin = hora_fin;
    }

    public Medico getMedico() {
        return medico;
    }

    public void setMedico(Medico medico) {
        this.medico = medico;
    }

}