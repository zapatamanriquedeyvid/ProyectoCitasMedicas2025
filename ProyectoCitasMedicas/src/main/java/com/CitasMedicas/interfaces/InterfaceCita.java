package com.CitasMedicas.interfaces;

import java.util.List;

import com.CitasMedicas.entidad.Cita;

public interface InterfaceCita {
	public void insertar (Cita objC);
	public void actualizar (Cita objC);
	public Cita buscarPorCodigo(int codi);
	public List<Cita>listadoCitas();
	public void eliminar (int codi) ;
}