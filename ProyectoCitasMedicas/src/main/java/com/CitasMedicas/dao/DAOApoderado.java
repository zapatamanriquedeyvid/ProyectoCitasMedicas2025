package com.CitasMedicas.dao;

import java.util.List;

import com.CitasMedicas.entidad.Apoderado;
import com.CitasMedicas.interfaces.InterfaceApoderado;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class DAOApoderado implements InterfaceApoderado{

  private EntityManagerFactory emf = Persistence.createEntityManagerFactory("citasmedicas");

  @Override
  public void insertar(Apoderado objA) {
    EntityManager em = emf.createEntityManager();
    try {
      em.getTransaction().begin();
      em.persist(objA);
      em.getTransaction().commit();
      
    } finally {
      em.close();
    }
  }

  @Override
  public void actualizar(Apoderado objA) {
    EntityManager em = emf.createEntityManager();
    try {
      em.getTransaction().begin();
      em.merge(objA);
      em.getTransaction().commit();

    } finally {
      em.close();
    }
  }

  @Override
  public Apoderado buscarPorCodigo(int codi) {
    EntityManager em = emf.createEntityManager();
    try {
      return em.find(Apoderado.class, codi);
    } finally {
      em.close();
    }
  }

  @Override
  public List<Apoderado> listadoApoderados() {
    EntityManager em = emf.createEntityManager();
    try {
      //se usa la clase Apoderado
      return em.createQuery("Select a from Apoderado a", Apoderado.class).getResultList(); 
    } finally {
      em.close();
    }
  }

  @Override
  public void eliminar(int codi) {
    EntityManager em = emf.createEntityManager();
    try {
      Apoderado a = em.find(Apoderado.class, codi);
      if (a != null) {
        em.getTransaction().begin();
        em.remove(a);
        em.getTransaction().commit();
      }
    } finally {
      em.close();
    }
  }
}
