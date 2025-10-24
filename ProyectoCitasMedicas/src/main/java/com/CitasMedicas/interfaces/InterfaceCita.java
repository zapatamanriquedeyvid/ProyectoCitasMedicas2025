package com.CitasMedicas.interfaces;

import java.util.Date;
import java.util.List;

import com.CitasMedicas.entidad.Cita;

public interface InterfaceCita {
	public void insertar (Cita objC);
	public void actualizar (Cita objC);
	public void actualizarEstadoCita(int idCita);
	public Cita buscarPorCodigo(int codi);
	public List<Cita>listadoCitas();
	public void eliminar (int codi) ;
	public List<Cita>obtenerCitasPorPaciente(int idPaciente);
	public List<Cita>listadoPorMedicoYEstado(int idMedico, String estado);
	public List<Cita> listarPorMedicoYFecha(int idMedico, Date fecha);
}