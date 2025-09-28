package com.CitasMedicas.interfaces;

import java.util.List;

import com.CitasMedicas.entidad.Apoderado;

public interface InterfaceApoderado {
  public void insertar (Apoderado objA);
	public void actualizar (Apoderado objA);
	public Apoderado buscarPorCodigo(int codi);
	public List<Apoderado>listadoApoderados();
	public void eliminar (int codi) ;
}
