package com.CitasMedicas.dao;


import java.util.List;


import com.CitasMedicas.entidad.Paciente;
import com.CitasMedicas.interfaces.InterfacePaciente;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class DAOPaciente implements InterfacePaciente{

  private EntityManagerFactory emf = Persistence.createEntityManagerFactory("citasmedicas");

  @Override
  public void insertar(Paciente objB) {
    EntityManager em = emf.createEntityManager();
    try {
      em.getTransaction().begin();
      em.persist(objB);
      em.getTransaction().commit();

    } finally {
      em.close();
    }
  }

  @Override
  public void actualizar(Paciente objB) {
    EntityManager em = emf.createEntityManager();
    try {
      em.getTransaction().begin();
      em.merge(objB);
      em.getTransaction().commit();

    }finally {
      em.close();
    }
  }

  @Override
  public Paciente buscarPorCodigo(int codi) {
    EntityManager em = emf.createEntityManager();
    try {
      return em.find(Paciente.class, codi);
    } finally  {
      em.close();
    }
  }

    @Override
    public Paciente buscarPorDni(int dni) {
        EntityManager em = emf.createEntityManager();
        try {
            // Se usa la clase Paciente
            return em.createQuery("SELECT p FROM Paciente p WHERE p.nro_documento = :dni", Paciente.class)
                    .setParameter("dni", dni)
                    .getSingleResult();
        }catch(Exception e){
            return null;
        }
        finally {
            em.close();
        }
    }


    @Override
  public List<Paciente> listadoPacientes() {
    EntityManager em = emf.createEntityManager();
    try {
      //se usa la clase Paciente
      return em.createQuery("Select p from Paciente p",Paciente.class).getResultList();
    } finally  {
      em.close();
    }
  }



  @Override
  public void eliminar(int codi) {
    EntityManager em = emf.createEntityManager();
    try {
      Paciente p = em.find(Paciente.class, codi);
      //validar pa
      if (p!= null) {
        em.getTransaction().begin();
        em.remove(p);
        em.getTransaction().commit();
      }
    }catch (Exception e) {
      e.printStackTrace();
      em.getTransaction().rollback();
      System.out.println("Error al eliminar paciente");
    }finally {
      em.close();
    }
  }


}
