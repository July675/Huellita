package com.app.persistencia;

import java.util.List;

import com.app.logica.Animal;
import com.app.logica.Especie;
import com.app.logica.Refugio;
import com.app.logica.SolicitudAdopcion;

public class ControladoraPersistencia {
	//Creamos instancias de los controladores que sabe cómo hablar con la
	// base de datos
	AnimalJpaController animalJpa = new AnimalJpaController();
	EspecieJpaController especieJpa = new EspecieJpaController();
	RefugioJpaController refugioJpa = new RefugioJpaController();
	SolicitudAdopcionJpaController solicitudAdopcionJpa = new SolicitudAdopcionJpaController();

	//ANIMAL
	// Este método es el que se usa desde otras capas para crear un ANIMAL
	public void crearAnimal(Animal animal) {
		// Delegamos la tarea al controlador especializado
		animalJpa.crear(animal);
	}
	
	public Animal buscarAnimal(int id_animal) {
	    return animalJpa.buscarAnimal(id_animal);
	}

	public List<Animal> buscarTodosLosAnimales() {
	    return animalJpa.buscarTodosLosAnimales();
	}

	public void editarAnimal(Animal animal) {
	    animalJpa.editarAnimal(animal);
	}

	public void eliminarAnimal(int id_animal) {
	    animalJpa.eliminarAnimal(id_animal);
	}

	
	//ESPECIE
	public void crearEspecie(Especie especie) {
		// Delegamos la tarea al controlador especializado
		especieJpa.crear(especie);
	}
	
	public Especie buscarEspecie(int id) {
	    return especieJpa.buscarEspecie(id);
	}

	public List<Especie> buscarTodasLasEspecies() {
	    return especieJpa.buscarTodasLasEspecies();
	}

	public void editarEspecie(Especie especie) {
	    especieJpa.editarEspecie(especie);
	}

	public void eliminarEspecie(int id) {
	    especieJpa.eliminarEspecie(id);
	}
	
	
	//REFUGIO
    public void crearRefugio(Refugio refugio) {
        refugioJpa.crear(refugio);
    }

    public Refugio buscarRefugio(int id) {
        return refugioJpa.buscarRefugio(id);
    }

    public List<Refugio> buscarTodosLosRefugios() {
        return refugioJpa.buscarTodosLosRefugios();
    }

    public void editarRefugio(Refugio refugio) {
        refugioJpa.editarRefugio(refugio);
    }

    public void eliminarRefugio(int id) {
        refugioJpa.eliminarRefugio(id);
    }
	
	
	//SOLICITUD DE ADOPCIÓN		
	public void crearSolicitudAdopcion(SolicitudAdopcion solicitudAdopcion) {
		// Delegamos la tarea al controlador especializado
		solicitudAdopcionJpa.crear(solicitudAdopcion);
	}
	
	public SolicitudAdopcion buscarSolicitud(int id_solicitud) {
	    return solicitudAdopcionJpa.buscarSolicitudAdopcion(id_solicitud);
	}

	public List<SolicitudAdopcion> buscarTodasLasSolicitudes() {
	    return solicitudAdopcionJpa.buscarTodasLasSolicitudes();
	}

	public void editarSolicitud(SolicitudAdopcion solicitud) {
	    solicitudAdopcionJpa.editarSolicitudAdopcion(solicitud);
	}

	public void eliminarSolicitud(int id_solicitud) {
	    solicitudAdopcionJpa.eliminarSolicitudAdopcion(id_solicitud);
	}
	

}
