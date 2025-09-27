package com.CitasMedicas.prueba;

import com.CitasMedicas.dao.DAOPaciente;

public class PruebaPaciente {

    public static void main(String[] args) {
    
        DAOPaciente objP = new DAOPaciente();

        objP.listadoPacientes().forEach(pa-> System.out.println(pa.getId_paciente()+" - "+pa.getNombre_paciente()+" - "+pa.getApoderado().getNombre_apod()));

    }

}
