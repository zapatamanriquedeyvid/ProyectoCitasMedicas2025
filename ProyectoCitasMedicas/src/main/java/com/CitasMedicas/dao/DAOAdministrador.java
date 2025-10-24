package com.CitasMedicas.dao;

import java.util.List;

import com.CitasMedicas.entidad.Administrador;
import com.CitasMedicas.interfaces.InterfaceAdministrador;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class DAOAdministrador implements InterfaceAdministrador {

  private EntityManagerFactory emf = Persistence.createEntityManagerFactory("citasmedicas");
  
  @Override
  public void insertar(Administrador objE) {
    EntityManager em = emf.createEntityManager();
    try {
      em.getTransaction().begin();
      em.persist(objE);
      em.getTransaction().commit();
      
    } finally {
      em.close();
    }
  }

  @Override
  public void actualizar(Administrador objE) {
    EntityManager em = emf.createEntityManager();
    try {
      em.getTransaction().begin();
      em.merge(objE);
      em.getTransaction().commit();
      
    } finally {
      em.close();
    }
  }

  @Override
  public Administrador buscarPorCodigo(int codi) {
    EntityManager em = emf.createEntityManager();
    try {
      return em.find(Administrador.class, codi);
    } finally  {
      em.close();
    }
  }

  @Override
  public List<Administrador> listadoAdministradores() {
    EntityManager em = emf.createEntityManager();
    try {
      //se usa la clase Administrador
      return em.createQuery("Select d from Administrador d", Administrador.class).getResultList();
    } finally  {
      em.close();
    }
  }

  @Override
  public void eliminar(int codi) {
    EntityManager em = emf.createEntityManager();
    try {
      em.getTransaction().begin();
      Administrador objDT = em.find(Administrador.class, codi);
      if (objDT != null) {
        em.remove(objDT);
      }
      em.getTransaction().commit();
    } finally {
      em.close();
    }
  }

  @Override
  public Administrador obtenerPorIdUsuario(int idUsuario) {
	EntityManager em = emf.createEntityManager(); 
    try {
      return em.createQuery("SELECT a FROM Administrador a WHERE a.usuario.idUsuario = :id", Administrador.class)
      .setParameter("id", idUsuario)
      .getSingleResult();
    } catch (Exception e) {
        return null;
    } finally {
        em.close();
    }
  }
}
