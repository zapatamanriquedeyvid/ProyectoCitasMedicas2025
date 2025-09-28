package com.CitasMedicas.interfaces;

import java.util.List;

import com.CitasMedicas.entidad.Usuario;

public interface InterfaceUsuario {
  public void insertar (Usuario objD);
	public void actualizar (Usuario objD);
	public Usuario buscarPorCodigo(int codi);
	public List<Usuario>listadoUsuarios();
	public void eliminar (int codi) ;
}
