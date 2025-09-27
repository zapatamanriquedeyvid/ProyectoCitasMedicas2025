package com.CitasMedicas.dao;

import java.util.List;

import com.CitasMedicas.entidad.Bus;
import com.CitasMedicas.entidad.Pasajero;
import com.CitasMedicas.interfaces.InterfaceBus;

import jakarta.persistence.EntityManager; 
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class DAOBus implements InterfaceBus {

	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("viajeseguroPU");
	
	@Override
	public void insertar(Bus objB) {
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
	public void actualizar(Bus objB) {
		// declarar un objeto de tipo em
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
	public Bus buscarPorCodigo(int codi) {
		EntityManager em = emf.createEntityManager();
		try {
			return em.find(Bus.class, codi);
		} finally  {
			em.close();
		}
	}

	@Override
	public List<Bus> listadoBus() {
		EntityManager em = emf.createEntityManager();
		try {
			//el select se trabaja con el objeto "Bus" y ya no con el nombre de la tabla tb_bus
			return em.createQuery("Select b from Bus b",Bus.class).getResultList();
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
