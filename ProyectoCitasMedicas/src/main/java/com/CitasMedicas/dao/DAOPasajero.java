package com.CitasMedicas.dao;

import java.util.List;

import com.CitasMedicas.entidad.Pasajero;
import com.CitasMedicas.interfaces.InterfacePasajero;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class DAOPasajero implements InterfacePasajero {

	//Declarando el objeto de persistencia
	//emf
	private EntityManagerFactory emf=Persistence.createEntityManagerFactory("viajeseguroPU");
	
	
	@Override
	public void insertar(Pasajero objP) {
		//declarar un objeto de tipo em
		EntityManager em=emf.createEntityManager();
		try {
			em.getTransaction().begin();
			em.persist(objP);
			em.getTransaction().commit();
		} finally {
			em.close();
		}
	}

	@Override
	public void actualizar(Pasajero objP) {
		//declarar un objeto de tipo em
				EntityManager em=emf.createEntityManager();
				try {
					em.getTransaction().begin();
					em.merge(objP);
					em.getTransaction().commit();
				} finally {
					em.close();
				}
		
	}

	@Override
	public Pasajero buscarPorCodigo(int codi) {
		
		EntityManager em=emf.createEntityManager();
		try {
			return em.find(Pasajero.class, codi);
		} finally {
			em.close();
		}
		
		
	}

	@Override
	public List<Pasajero> listadoPasajeros() {
		EntityManager em=emf.createEntityManager();
		try {
			return em.createQuery("select p from Pasajero p",Pasajero.class).getResultList();
			
		} finally {
			em.close();
		}

	}

	@Override
	public void eliminar(int codi) {
		
		EntityManager em=emf.createEntityManager();
		try {
			//declarar un objeto de tipo Pasajero
			Pasajero pa=em.find(Pasajero.class, codi);
			//validar pa
			if(pa!=null) {
				em.getTransaction().begin();
				em.remove(pa);
				em.getTransaction().commit();
			}
			
		} finally {
			em.close();
		}
		
		
	}

}
