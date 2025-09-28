package com.CitasMedicas.dao;

import java.util.List;

import com.CitasMedicas.entidad.DiaTrabajo;
import com.CitasMedicas.entidad.Paciente;
import com.CitasMedicas.interfaces.InterfaceDiaTrabajo;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class DAODiaTrabajo implements InterfaceDiaTrabajo {

  private EntityManagerFactory emf = Persistence.createEntityManagerFactory("CitasMedicas");
  
  @Override
  public void insertar(DiaTrabajo objDT) {
    EntityManager em = emf.createEntityManager();
    try {
      em.getTransaction().begin();
      em.persist(objDT);
      em.getTransaction().commit();
      
    } finally {
      em.close();
    }
  }

  @Override
  public void actualizar(DiaTrabajo objDT) {
    EntityManager em = emf.createEntityManager();
    try {
      em.getTransaction().begin();
      em.merge(objDT);
      em.getTransaction().commit();
      
    } finally {
      em.close();
    }
  }

  @Override
  public DiaTrabajo buscarPorCodigo(int codi) {
    EntityManager em = emf.createEntityManager();
    try {
      return em.find(DiaTrabajo.class, codi);
    } finally  {
      em.close();
    }
  }

  @Override
  public List<DiaTrabajo> listadoDiasTrabajo() {
    EntityManager em = emf.createEntityManager();
    try {
      //se usa la clase DiaTrabajo
      return em.createQuery("Select d from DiaTrabajo d",DiaTrabajo.class).getResultList();
    } finally  {
      em.close();
    }
  }

  @Override
  public void eliminar(int codi) {
    EntityManager em = emf.createEntityManager();
    try {
      em.getTransaction().begin();
      DiaTrabajo objDT = em.find(DiaTrabajo.class, codi);
      if (objDT != null) {
        em.remove(objDT);
      }
      em.getTransaction().commit();
    } finally {
      em.close();
    }
  }

}
