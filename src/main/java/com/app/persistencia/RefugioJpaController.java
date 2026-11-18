package com.app.persistencia;

import java.util.List;

import com.app.logica.Refugio;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class RefugioJpaController {

	// "Fábrica" de conexiones con la base de datos.
	// Nos permite crear EntityManager, que son los que realmente hacen el trabajo.
	private EntityManagerFactory emf = null;

	// En el constructor indicamos qué unidad de persistencia usar.
	// El nombre "ejemplojpa" debe coincidir con el que está en persistence.xml.
	public RefugioJpaController() {
		emf = Persistence.createEntityManagerFactory("mi-unidad-jpa");
	}

	// Método que devuelve un nuevo EntityManager (una conexión lista para
	// trabajar).
	// Podés pensarlo como: "dame un empleado que se conecte a la BD".
	public EntityManager getEntityManager() {
		return emf.createEntityManager();
	}

	// Método para crear (persistir) un Refugio en la base de datos.
	public void crear(Refugio refugio) {
		EntityManager em = null;

		try {
			// Abrimos la conexión (traemos al empleado).
			em = getEntityManager();

			// Iniciamos la transacción (arranca la promesa de que se hará todo o nada).
			em.getTransaction().begin();

			// Guardamos el objeto Cancion en la base (todavía no confirmado).
			em.persist(refugio);

			// Confirmamos la transacción: ahora sí, el dato queda guardado en la BD.
			em.getTransaction().commit();

		} finally {
			// Cerramos la conexión si estaba abierta (el empleado termina su turno).
			if (em != null) {
				em.close();

			}
		}
	}

	// BUSCAR UNO: busca una especie por su id.
	// No hace falta transacción porque no modifica nada en la base.
	public Refugio buscarRefugio(int id) {
		EntityManager em = getEntityManager();
		try {
			// find busca por clave primaria. Si no existe, devuelve null.
			return em.find(Refugio.class, id);
		} finally {
			em.close();
		}
	}

	// BUSCAR TODOS: devuelve una lista con todos los refugios.
	public List<Refugio> buscarTodosLosRefugios() {
		EntityManager em = getEntityManager();
		try {
			// Consulta JPQL: "traeme todos los objetos Refugios"
			return em.createQuery("SELECT r FROM Refugio r", Refugio.class).getResultList();
		} finally {
			em.close();
		}
	}

	// EDITAR REFUGIO
	public void editarRefugio(Refugio refugio) {

		EntityManager em = getEntityManager();

		try {
			em.getTransaction().begin();
			em.merge(refugio);
			em.getTransaction().commit();

		} finally {
			em.close();
		}
	}

	// ELIMINAR REFUGIO
	public void eliminarRefugio(int id) {

		EntityManager em = getEntityManager();

		try {
			em.getTransaction().begin();

			Refugio refugio = em.find(Refugio.class, id);

			if (refugio != null) {
				em.remove(refugio);
			}

			em.getTransaction().commit();

		} finally {
			em.close();
		}
	}
}
