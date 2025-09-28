package com.CitasMedicas.prueba;

import com.CitasMedicas.dao.DAOApoderado;

public class PruebaApoderado {

    public static void main(String[] args) {
      //prueba listado de apoderados
      DAOApoderado objA = new DAOApoderado();
      objA.listadoApoderados().forEach(ap-> System.out.println(ap.getId_apod()+" - "+ap.getNombre_apod()));

      //prueba buscar apoderado por codigo
      /*DAOApoderado objA = new DAOApoderado();
      System.out.println(objA.buscarPorCodigo(1).getNombre_apod());*/

      //prueba eliminar apoderado
      /*DAOApoderado objA = new DAOApoderado();
      objA.eliminar(3);*/

    }
}
