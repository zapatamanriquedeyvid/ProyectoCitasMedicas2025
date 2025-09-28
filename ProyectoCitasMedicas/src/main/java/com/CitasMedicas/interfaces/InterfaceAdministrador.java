package com.CitasMedicas.interfaces;

import java.util.List;

import com.CitasMedicas.entidad.Administrador;

public interface InterfaceAdministrador {
  public void insertar (Administrador objE);
	public void actualizar (Administrador objE);
	public Administrador buscarPorCodigo(int codi);
	public List<Administrador>listadoAdministradores();
	public void eliminar (int codi) ;
}
