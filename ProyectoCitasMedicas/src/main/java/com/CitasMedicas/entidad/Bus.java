package com.CitasMedicas.entidad;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table (name = "tb_bus")

public class Bus {

	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	private int id_bus;
	private String placa;
	private String modelo;
	private int nro_asientos;
	
	//relacionando marca con bus(muchos buses pueden pertenecer a una sola marca)
	@ManyToOne
	@JoinColumn (name = "id_marca", nullable = false) //campo foreing key
	//declarar un atributo de tipo marca para que se comunique con el bus
	private Marca marca;

	public int getId_bus() {
		return id_bus;
	}

	public void setId_bus(int id_bus) {
		this.id_bus = id_bus;
	}

	public String getPlaca() {
		return placa;
	}

	public void setPlaca(String placa) {
		this.placa = placa;
	}

	public String getModelo() {
		return modelo;
	}

	public void setModelo(String modelo) {
		this.modelo = modelo;
	}

	public int getNro_asientos() {
		return nro_asientos;
	}

	public void setNro_asientos(int nro_asientos) {
		this.nro_asientos = nro_asientos;
	}

	public Marca getMarca() {
		return marca;
	}

	public void setMarca(Marca marca) {
		this.marca = marca;
	}
	
	
}