package com.CitasMedicas.interfaces;

import java.util.List;

import com.CitasMedicas.entidad.Pasajero;

public interface InterfacePasajero {

public void insertar(Pasajero objP);
public void actualizar(Pasajero objP);
public Pasajero buscarPorCodigo(int codi);
public List<Pasajero>listadoPasajeros();
public void eliminar(int codi);	
	
}
