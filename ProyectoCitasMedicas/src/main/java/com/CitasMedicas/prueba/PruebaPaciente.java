package com.CitasMedicas.prueba;

import com.CitasMedicas.dao.DAOPaciente;

public class PruebaPaciente {

    public static void main(String[] args) {
    
      //prueba listado de pacientes con su apoderado
      DAOPaciente objP = new DAOPaciente();
      objP.listadoPacientes().forEach(pa-> System.out.println(pa.getId_paciente()+" - "+pa.getNombre_paciente()+" - "+pa.getApoderado().getNombre_apod()));

      //prueba buscar paciente por codigo
      /*DAOPaciente objP = new DAOPaciente();
      System.out.println(objP.buscarPorCodigo(1).getNombre_paciente());*/

      //prueba eliminar paciente
      /*DAOPaciente objP = new DAOPaciente();
      objP.eliminar(3);*/
    }

}
