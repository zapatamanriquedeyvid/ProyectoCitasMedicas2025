package com.CitasMedicas.dao;

import java.util.Date;
import java.util.List;

import com.CitasMedicas.entidad.Cita;
import com.CitasMedicas.interfaces.InterfaceCita;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class DAOCitas implements InterfaceCita{
    
    EntityManagerFactory emf = Persistence.createEntityManagerFactory("citasmedicas");

    @Override
    public void insertar(Cita objC) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(objC);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
        
    }

    @Override
    public void actualizar(Cita objC) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(objC);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    @Override
    public Cita buscarPorCodigo(int codi) {
        EntityManager em = emf.createEntityManager();
        try {
            return em.find(Cita.class, codi);
        } finally {
            em.close();
        }
    }

    @Override
    public List<Cita> listadoCitas() {
        EntityManager em = emf.createEntityManager();
        try {
            return em.createQuery("Select c from Cita c", Cita.class).getResultList(); 
        } finally {
            em.close();
        }
    }

    @Override
    public void eliminar(int codi) {
        EntityManager em = emf.createEntityManager();
        try {
            Cita c = em.find(Cita.class, codi);
            if (c != null) {
                em.getTransaction().begin();
                em.remove(c);
                em.getTransaction().commit();
            }
        } finally {
            em.close();
        }        
    }
    
    @Override
    public List<Cita> obtenerCitasPorPaciente(int idPaciente) {
		EntityManager em = emf.createEntityManager();
		try {
			return em.createQuery("SELECT c FROM Cita c WHERE c.paciente.id_paciente = :idPaciente", Cita.class)
					 .setParameter("idPaciente", idPaciente)
					 .getResultList();
		} finally {
			em.close(); 
		}
	}
    
    public List<Cita> listarPorMedicoYFecha(int idMedico, Date fecha){
		EntityManager em = emf.createEntityManager();
		try {
			return em.createQuery("SELECT c FROM Cita c WHERE c.medico.id_medico = :idMedico AND c.fecha_cita = :fecha", Cita.class)
					 .setParameter("idMedico", idMedico)
					 .setParameter("fecha", fecha)
					 .getResultList();
		} finally {
			em.close(); 
		}
	}
	@Override
	public List<Cita> listadoPorMedicoYEstado(int idMedico, String estado) {
		EntityManager em = emf.createEntityManager();
		try {
			return em.createQuery("SELECT c FROM Cita c WHERE c.medico.id_medico = :idMedico AND c.estado = :estado", Cita.class)
					 .setParameter("idMedico", idMedico)
					 .setParameter("estado", estado)
					 .getResultList();
		} finally {
			em.close(); 
		}
	}

	@Override
	public void actualizarEstadoCita(int idCita) {
		EntityManager em = emf.createEntityManager();
	    try {
	        em.getTransaction().begin();
	        
	        Cita c = em.find(Cita.class, idCita);	        
	        if (c != null && "PENDIENTE".equalsIgnoreCase(c.getEstado())) {
	            c.setEstado("ATENDIDA");
	            em.merge(c);
	        }
	        
	        em.getTransaction().commit();
	    } catch (Exception e) {
	        if (em.getTransaction().isActive()) {
	            em.getTransaction().rollback();
	        }
	        e.printStackTrace();
	    } finally {
	        em.close();
	    }
		
	}

}
