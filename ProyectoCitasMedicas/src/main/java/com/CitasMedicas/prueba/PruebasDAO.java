package com.CitasMedicas.prueba;

import com.CitasMedicas.dao.DAOPaciente;
import com.CitasMedicas.entidad.Apoderado;
import com.CitasMedicas.entidad.Paciente;

public class PruebasDAO {
  //metodo main
  public static void main(String[] args) {
    pruebaPaciente();
  }

  //metodo para hacer las pruebas de pacientes
  public static void pruebaPaciente(){


    //Crear un objeto de tipo DAOPaciente
    DAOPaciente objP = new DAOPaciente();
    //crear un objeto de tipo paciente
    // Paciente p = new Paciente();
    // Apoderado a = new Apoderado();
    // a.setId_apod(1);
    // p.setTipo_documento("DNI");
    // p.setNro_documento(40136815);
    // p.setNombre_paciente("pedro");
    // p.setApellido_paterno("perez");
    // p.setApellido_materno("lopez");
    // p.setFecha_nac(java.sql.Date.valueOf("2000-05-12"));
    // p.setSexo("M");
    // p.setLugar_naci("Lima");
    // p.setProcedencia("Lima");
    // p.setTipo_paciente("SIS");
    // p.setApoderado(a); 
    // objP.insertar(p);

    //select del paciente
    // for(Paciente pa : objP.listadoPacientes()){
    //   System.out.println("ID: "+pa.getId_paciente());
    //   System.out.println("Nombre: "+pa.getNombre_paciente());
    //   System.out.println("Apellido Paterno: "+pa.getApellido_paterno());
    //   System.out.println("Apellido Materno: "+pa.getApellido_materno());
    //   System.out.println("Tipo Documento: "+pa.getTipo_documento());
    //   System.out.println("Nro Documento: "+pa.getNro_documento());
    //   System.out.println("Fecha Nacimiento: "+pa.getFecha_nac());
    //   System.out.println("Sexo: "+pa.getSexo());
    //   System.out.println("Lugar Nacimiento: "+pa.getLugar_naci());
    //   System.out.println("Procedencia: "+pa.getProcedencia());
    //   System.out.println("Tipo Paciente: "+pa.getTipo_paciente());
    //   System.out.println("ID Apoderado: "+pa.getApoderado().getId_apod());
    //   System.out.println("-------------------------------");
    // }

  System.out.println("Listado de pacientes");
	objP.listadoPacientes().forEach(pa-> System.out.println(pa.getId_paciente()+ " - " +
    pa.getNombre_paciente()+ " - " +
    pa.getApellido_paterno()+ " - " +
    pa.getNro_documento()));

    //eliminar paciente
    //objP.eliminar(3);

    //codigo para buscar un paciente
		// Paciente busca=objP.buscarPorDni(87654321);
		// if(busca!=null) {
    //   //buscar paciente por codgio
    //   System.out.println("Registro:\n"+busca.getId_paciente()+" - "+busca.getNombre_paciente()+" - "+busca.getApellido_paterno()+" - "+busca.getNro_documento());
		// }

    //actualizar el telefono y correo del pasajero con codigo 3
    // if(busca!=null) {
    //   busca.setNombre_paciente("juan1");
    //   busca.setApellido_paterno("perez1");
    //   objP.actualizar(busca);
    //   System.out.println("Registro actualizado");
    // }
  }

}
