package com.CitasMedicas.prueba;

import com.CitasMedicas.dao.DAOPasajero;
import com.CitasMedicas.entidad.Pasajero;

public class PruebaPasajero {

	public static void main(String[] args) {
		//Crear un objeto de tipo DAOPasajero
		DAOPasajero objDP=new DAOPasajero();
		//insertando registro
		//declarar y crear un objeto de tipo pasajero
		/* Pasajero p=new Pasajero();
		//ingresando datos fijos
		p.setNombres("Betsabe");
		p.setApellidos("Villanueva Herrera");
		p.setDni("40136815");
		p.setTelefono("990990245");
		p.setCorreo("betita123@gmail.com");
		objDP.insertar(p);
		System.out.println("Registrado correctamente");
    */
		
	//listado de pasajeros
	//   System.out.println("Listado de pasajeros");
	 //  objDP.listadoPasajeros().forEach(pa-> System.out.println(pa.getId_pasajero()+" - "+pa.getNombres()+" - "+pa.getApellidos()));
	
	//codigo para buscar un pasajero
		//Pasajero busca=objDP.buscarPorCodigo(3);
		//validar busca
	//	if(busca!=null) {
	//		System.out.println("Registro:\n"+busca.getId_pasajero()+" - "+busca.getNombres()+" - "+busca.getApellidos());
	//	}
		
	//actualizar el telefono y correo del pasajero con codigo 3
		
		//validar busca
	//	if(busca!=null) {
	//		busca.setTelefono("999999999");
	//		busca.setCorreo("carlitoselunico@gmail.com");
	//		objDP.actualizar(busca);
	//		System.out.println("Actualizado correctamente");
	//	}
		
		//eliminando un pasajero
		objDP.eliminar(6);
		System.out.println("Eliminado correctamente");
		
				
	}

}
