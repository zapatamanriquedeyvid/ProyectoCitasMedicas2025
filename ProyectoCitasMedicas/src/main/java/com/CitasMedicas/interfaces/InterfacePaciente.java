package com.CitasMedicas.interfaces;

import java.util.List;

import com.CitasMedicas.entidad.Paciente;

public interface InterfacePaciente {
	public void insertar (Paciente objB);
	public void actualizar (Paciente objB);
	public Paciente buscarPorCodigo(int codi);
	public List<Paciente>listadoPacientes();
	public void eliminar (int codi) ;
}
