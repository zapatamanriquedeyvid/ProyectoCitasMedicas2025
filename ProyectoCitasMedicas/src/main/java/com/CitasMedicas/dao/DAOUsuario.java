package com.CitasMedicas.dao;

import java.util.List;

import com.CitasMedicas.entidad.Usuario;
import com.CitasMedicas.interfaces.InterfaceUsuario;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class DAOUsuario implements InterfaceUsuario {

  private EntityManagerFactory emf = Persistence.createEntityManagerFactory("citasmedicas");

  @Override
  public void insertar(Usuario objD) {
    EntityManager em = emf.createEntityManager();
    try {
      em.getTransaction().begin();
      em.persist(objD);
      em.getTransaction().commit();
      
    } finally {
      em.close();
    }
  }

  @Override
  public void actualizar(Usuario objD) {
    EntityManager em = emf.createEntityManager();
    try {
      em.getTransaction().begin();
      em.merge(objD);
      em.getTransaction().commit();

    } finally {
      em.close();
    }
  }

  @Override
  public Usuario buscarPorCodigo(int codi) {
    EntityManager em = emf.createEntityManager();
    try {
      return em.find(Usuario.class, codi);
    } finally {
      em.close();
    }
  }

  @Override
  public List<Usuario> listadoUsuarios() {
    EntityManager em = emf.createEntityManager();
    try {
      //se usa la clase Usuario
      return em.createQuery("Select d from Usuario d", Usuario.class).getResultList(); 
    } finally {
      em.close();
    }
  }

  @Override
  public void eliminar(int codi) {
    EntityManager em = emf.createEntityManager();
    try {
      Usuario a = em.find(Usuario.class, codi);
      if (a != null) {
        em.getTransaction().begin();
        em.remove(a);
        em.getTransaction().commit();
      }
    } finally {
      em.close();
    }
  }
@Override
public Usuario validar(String username, String password, String tipoUsuario) {
	EntityManager em = emf.createEntityManager();
    try {
      return em.createQuery("SELECT u FROM Usuario u WHERE u.nom_usuario = :username AND u.contraseña = :password  AND u.cargo = :tipo", Usuario.class)
      .setParameter("username", username)
      .setParameter("password",password)
      .setParameter("tipo", tipoUsuario)
      .getSingleResult();
    } catch (Exception e) {
        return null;
    } finally {
        em.close();
    }
}
}