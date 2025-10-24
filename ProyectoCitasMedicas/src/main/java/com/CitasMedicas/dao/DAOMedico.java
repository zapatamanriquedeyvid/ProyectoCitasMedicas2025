package com.CitasMedicas.dao;

import java.util.List;

import com.CitasMedicas.entidad.Medico;
import com.CitasMedicas.interfaces.InterfaceMedico;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class DAOMedico implements InterfaceMedico{
    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("citasmedicas");

  @Override
  public void insertar(Medico objM) {
    EntityManager em = emf.createEntityManager();
    try {
      em.getTransaction().begin();
      em.persist(objM);
      em.getTransaction().commit();
      
    } finally {
      em.close();
    }
  }

  @Override
  public void actualizar(Medico objM) {
    EntityManager em = emf.createEntityManager();
    try {
      em.getTransaction().begin();
      em.merge(objM);
      em.getTransaction().commit();

    } finally {
      em.close();
    }
  }

  @Override
  public Medico buscarPorCodigo(int codi) {
    EntityManager em = emf.createEntityManager();
    try {
      return em.find(Medico.class, codi);
    } finally {
      em.close();
    }
  }

  @Override
  public List<Medico> listadoMedicos() {
    EntityManager em = emf.createEntityManager();
    try {
      //se usa la clase Apoderado
      return em.createQuery("Select a from Medico a", Medico.class).getResultList(); 
    } finally {
      em.close();
    }
  }

  @Override
  public void eliminar(int codi) {
    EntityManager em = emf.createEntityManager();
    try {
      Medico a = em.find(Medico.class, codi);
      if (a != null) {
        em.getTransaction().begin();
        em.remove(a);
        em.getTransaction().commit();
      }
    } finally {
      em.close();
    }
  }
  
  //llamar medicos por especialidad
  public List<Medico> listarMedicosPorEspecialidad(int especialidadId) {
	EntityManager em = emf.createEntityManager();
	try {
	  return em.createQuery("SELECT m FROM Medico m WHERE m.especialidad.id_especialidad = :especialidadId", Medico.class)
			   .setParameter("especialidadId", especialidadId)
			   .getResultList();
	} finally {
	  em.close();
	}
  }

  public Medico obtenerPorIdUsuario(int idUsuario){
    	EntityManager em = emf.createEntityManager();
    try {
      return em.createQuery("SELECT m FROM Medico m WHERE m.usuario.idUsuario = :id", Medico.class)
      .setParameter("id", idUsuario)
      .getSingleResult();
    } catch (Exception e) {
        return null;
    } finally {
        em.close();
    }
  }
}
