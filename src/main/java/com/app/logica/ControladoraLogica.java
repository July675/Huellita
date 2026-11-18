package com.app.logica;

import java.util.List;

import com.app.persistencia.ControladoraPersistencia;

public class ControladoraLogica {

	// La controladora de persistencia se encarga de hablar con la BD.
	// Desde aquí la usamos como "puente" para guardar datos.
	ControladoraPersistencia controlPersis = new ControladoraPersistencia();

	// ----- ANIMAL -----
	// Método de la capa lógica para crear un artista.
	// Antes de guardarlo en la BD, se hacen validaciones.
	public void crearAnimal(Animal ani) throws Exception {

		if (ani.getNombre() == null || ani.getNombre().isEmpty()) {
			throw new Exception("El animal debe tener un nombre.");
		}

		if (ani.getEdad() < 0) {
			throw new Exception("La edad del animal no puede ser negativa.");
		}

		if (ani.getSexo() == null || ani.getSexo().isEmpty()) {
			throw new Exception("Debe indicar el sexo del animal.");
		}

		if (ani.getEstado() == null || ani.getEstado().isEmpty()) {
			throw new Exception("Debe indicar el estado del animal.");
		}

		if (ani.getRefugio() == null) {
			throw new Exception("Debe seleccionar un refugio.");
		}

		if (ani.getEspecie() == null) {
			throw new Exception("Debe seleccionar una especie.");
		}

		controlPersis.crearAnimal(ani);
	}

	// ----- ESPECIE -----
	public void crearEspecie(Especie esp) throws Exception {

		if (esp.getNombre() == null || esp.getNombre().isEmpty()) {
			throw new Exception("La especie debe tener un nombre.");
		}

		if (esp.getDescripcion() == null || esp.getDescripcion().isEmpty()) {
			throw new Exception("La especie debe tener una descripción.");
		}

		controlPersis.crearEspecie(esp);
	}

	// ----- REFUGIO -----

	public void crearRefugio(Refugio ref) throws Exception {

		if (ref.getNombre() == null || ref.getNombre().isEmpty()) {
			throw new Exception("El refugio debe tener un nombre.");
		}

		if (ref.getDireccion() == null || ref.getDireccion().isEmpty()) {
			throw new Exception("El refugio debe tener una dirección.");
		}

		if (ref.getTelefono() == null || ref.getTelefono().isEmpty()) {
			throw new Exception("El refugio debe tener un teléfono.");
		}

		if (ref.getCorreo() == null || ref.getCorreo().isEmpty()) {
			throw new Exception("El refugio debe tener un correo.");
		}

		controlPersis.crearRefugio(ref);
	}

	// ----- SOLICITUD DE ADOPCIÓN -----

	public void crearSolicitud(SolicitudAdopcion sol) throws Exception {

		if (sol.getNombre_solicitante() == null || sol.getNombre_solicitante().isEmpty()) {

			throw new Exception("Debe ingresar el nombre del solicitante.");
		}

		if (sol.getApellido_solicitante() == null || sol.getApellido_solicitante().isEmpty()) {

			throw new Exception("Debe ingresar el apellido del solicitante.");
		}

		if (sol.getCorreo() == null || sol.getCorreo().isEmpty()) {
			throw new Exception("Debe ingresar un correo electrónico.");
		}

		if (sol.getTelefono() == null || sol.getTelefono().isEmpty()) {
			throw new Exception("Debe ingresar un teléfono.");
		}

		if (sol.getMotivo() == null || sol.getMotivo().isEmpty()) {
			throw new Exception("Debe ingresar el motivo de la adopción.");
		}

		if (sol.getAnimal() == null) {
			throw new Exception("Debe seleccionar un animal.");
		}

		controlPersis.crearSolicitudAdopcion(sol);
	}
	

    // ----- REFUGIO -----
    public Refugio buscarRefugio(int id) {
        return controlPersis.buscarRefugio(id);
    }

    public List<Refugio> buscarTodosLosRefugios() {
        return controlPersis.buscarTodosLosRefugios();
    }

    public void editarRefugio(Refugio refugio) {
        controlPersis.editarRefugio(refugio);
    }

    public void eliminarRefugio(int id) {
        controlPersis.eliminarRefugio(id);
    }


    // ----- ESPECIE -----
    public Especie buscarEspecie(int id) {
        return controlPersis.buscarEspecie(id);
    }

    public List<Especie> buscarTodasLasEspecies() {
        return controlPersis.buscarTodasLasEspecies();
    }

    public void editarEspecie(Especie especie) {
        controlPersis.editarEspecie(especie);
    }

    public void eliminarEspecie(int id) {
        controlPersis.eliminarEspecie(id);
    }


    // ----- ANIMAL -----
    public Animal buscarAnimal(int id_animal) {
        return controlPersis.buscarAnimal(id_animal);
    }

    public List<Animal> buscarTodosLosAnimales() {
        return controlPersis.buscarTodosLosAnimales();
    }

    public void editarAnimal(Animal animal) {
        controlPersis.editarAnimal(animal);
    }

    public void eliminarAnimal(int id_animal) {
        controlPersis.eliminarAnimal(id_animal);
    }


    // ----- SOLICITUD DE ADOPCIÓN -----
    public SolicitudAdopcion buscarSolicitud(int id_solicitud) {
        return controlPersis.buscarSolicitud(id_solicitud);
    }

    public List<SolicitudAdopcion> buscarTodasLasSolicitudes() {
        return controlPersis.buscarTodasLasSolicitudes();
    }

    public void editarSolicitud(SolicitudAdopcion solicitud) {
        controlPersis.editarSolicitud(solicitud);
    }

    public void eliminarSolicitud(int id_solicitud) {
        controlPersis.eliminarSolicitud(id_solicitud);
    }

}
