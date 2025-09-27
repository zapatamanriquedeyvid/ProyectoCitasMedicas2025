package com.CitasMedicas.dao;

import java.util.List;

import com.CitasMedicas.entidad.Bus;
import com.CitasMedicas.entidad.Paciente;
import com.CitasMedicas.entidad.Pasajero;
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
			
		} finally {
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
    public List<Paciente> listadoPacientes() {
        EntityManager em = emf.createEntityManager();
		try {
			//el select se trabaja con el objeto "Bus" y ya no con el nombre de la tabla tb_bus
			return em.createQuery("Select p from Paciente p",Paciente.class).getResultList();
		} finally  {
			em.close();
		}
    }

    @Override
    public void eliminar(int codi) {
        EntityManager em = emf.createEntityManager();
		try {
			//declarar un objeto de tipo Pasajero
			Pasajero pa = em.find(Pasajero.class, codi);
			//validar pa
			if (pa!= null) {
				em.getTransaction().begin();
				em.remove(pa);
				em.getTransaction().commit();
			}
		} finally {
			em.close();
		}
    }

}
