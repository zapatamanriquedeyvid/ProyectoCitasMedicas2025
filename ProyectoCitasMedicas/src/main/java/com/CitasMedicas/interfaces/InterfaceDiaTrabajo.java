package com.CitasMedicas.interfaces;

import java.util.List;

import com.CitasMedicas.entidad.DiaTrabajo;

public interface InterfaceDiaTrabajo {
	public void insertar (DiaTrabajo objDT);
	public void actualizar (DiaTrabajo objDT);
	public DiaTrabajo buscarPorCodigo(int codi);
	public List<DiaTrabajo>listadoDiasTrabajo();
	public void eliminar (int codi) ;
}
