package com.CitasMedicas.interfaces;

import java.util.List;

import com.CitasMedicas.entidad.Bus;

public interface InterfaceBus {
	public void insertar (Bus objB);
	public void actualizar (Bus objB);
	public Bus buscarPorCodigo(int codi);
	public List<Bus>listadoBus();
	public void eliminar (int codi) ;
}
