package com.CitasMedicas.dao;

import java.util.List;

import com.CitasMedicas.entidad.Especialidad;
import com.CitasMedicas.interfaces.InterfaceEspecialidad;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class DAOEspecialidad implements InterfaceEspecialidad {

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("citasMedicas");
    
    
    @Override
    public void insertar(Especialidad objE) {
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
    public void actualizar(Especialidad objE) {
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
    public Especialidad buscarPorCodigo(int codi) {
        EntityManager em = emf.createEntityManager();
        try {
            return em.find(Especialidad.class, codi);
        } finally {
            em.close();
        }
    }

    @Override
    public List<Especialidad> listadoEspecialidades() {
        EntityManager em = emf.createEntityManager();
        try {
            return em.createQuery("SELECT e FROM Especialidad e", Especialidad.class).getResultList(); 
        } finally {
            em.close();
        }
    }

    @Override
    public void eliminar(int codi) {
        EntityManager em = emf.createEntityManager();
        try {
            Especialidad c = em.find(Especialidad.class, codi);
            if (c != null) {
                em.getTransaction().begin();
                em.remove(c);
                em.getTransaction().commit();
            }
        } finally {
            em.close();
        }        
    }

}
  
