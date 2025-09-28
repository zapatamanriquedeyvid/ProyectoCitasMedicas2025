package com.CitasMedicas.interfaces;

import java.util.List;

import com.CitasMedicas.entidad.Especialidad;

public interface InterfaceEspecialidad {
	public void insertar (Especialidad objE);
	public void actualizar (Especialidad objE);
	public Especialidad buscarPorCodigo(int codi);
	public List<Especialidad>listadoEspecialidades();
	public void eliminar (int codi) ;
}