package com.CitasMedicas.entidad;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity

@Table (name = "tb_marca")



public class Marca {
	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	private int id_marca;
	private String nombre;
	
	//relacion con BUS(una marca puede tener varios buses)
	@OneToMany(mappedBy = "marca",cascade = CascadeType.ALL)//lista todo lo que pertenece una marca especifica
	//declarar un objeto para listar los buses
	private List<Bus> listaBus;

	public int getId_marca() {
		return id_marca;
	}

	public void setId_marca(int id_marca) {
		this.id_marca = id_marca;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public List<Bus> getListaBus() {
		return listaBus;
	}

	public void setListaBus(List<Bus> listaBus) {
		this.listaBus = listaBus;
	}
	
	
}
