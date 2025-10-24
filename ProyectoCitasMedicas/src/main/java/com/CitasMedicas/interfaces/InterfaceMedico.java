package com.CitasMedicas.interfaces;

import java.util.List;

import com.CitasMedicas.entidad.Medico;

public interface InterfaceMedico {
	public void insertar (Medico objM);
	public void actualizar (Medico objM);
	public Medico buscarPorCodigo(int codi);
	public List<Medico>listadoMedicos();
	public void eliminar (int codi) ;
	public List<Medico> listarMedicosPorEspecialidad(int especialidadId);
	public Medico obtenerPorIdUsuario(int idUsuario);
}