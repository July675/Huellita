package com.app.logica;

import java.util.List;

import com.app.persistencia.ControladoraPersistencia;

public class ControladoraLogica {

	// La controladora de persistencia se encarga de hablar con la BD.
	// Desde aquí la usamos como "puente" para guardar datos.
	ControladoraPersistencia controlPersis = new ControladoraPersistencia();

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

	public Refugio buscarRefugio(int id) {
		return controlPersis.buscarRefugio(id);
	}

	public List<Refugio> buscarTodosLosRefugios() {
		return controlPersis.buscarTodosLosRefugios();
	}

	public void editarRefugio(Refugio refugio) throws Exception {

		if (refugio.getNombre() == null || refugio.getNombre().isEmpty()) {
			throw new Exception("El refugio debe tener un nombre.");
		}

		if (refugio.getDireccion() == null || refugio.getDireccion().isEmpty()) {
			throw new Exception("El refugio debe tener una dirección.");
		}

		if (refugio.getTelefono() == null || refugio.getTelefono().isEmpty()) {
			throw new Exception("El refugio debe tener un teléfono.");
		}

		if (refugio.getCorreo() == null || refugio.getCorreo().isEmpty()) {
			throw new Exception("El refugio debe tener un correo.");
		}

		controlPersis.editarRefugio(refugio);
	}

	public void eliminarRefugio(int id) throws Exception {

		Refugio refugio = controlPersis.buscarRefugio(id);

		if (refugio == null) {
			throw new Exception("El refugio no existe.");
		}

		List<Animal> animales = controlPersis.buscarTodosLosAnimales();

		for (Animal animal : animales) {

			if (animal.getRefugio() != null && animal.getRefugio().getId_Refugio() == id) {

				throw new Exception("No se puede eliminar el refugio porque tiene animales asociados.");
			}
		}

		controlPersis.eliminarRefugio(id);
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

	public Especie buscarEspecie(int id) {
		return controlPersis.buscarEspecie(id);
	}

	public List<Especie> buscarTodasLasEspecies() {
		return controlPersis.buscarTodasLasEspecies();
	}

	public void editarEspecie(Especie especie) throws Exception {

		if (especie.getNombre() == null || especie.getNombre().isEmpty()) {
			throw new Exception("La especie debe tener un nombre.");
		}

		if (especie.getDescripcion() == null || especie.getDescripcion().isEmpty()) {
			throw new Exception("La especie debe tener una descripción.");
		}

		controlPersis.editarEspecie(especie);
	}

	public void eliminarEspecie(int id) throws Exception {

		Especie especie = controlPersis.buscarEspecie(id);

		if (especie == null) {
			throw new Exception("La especie no existe.");
		}

		List<Animal> animales = controlPersis.buscarTodosLosAnimales();

		for (Animal animal : animales) {

			if (animal.getEspecie() != null && animal.getEspecie().getIdEspecie() == id) {

				throw new Exception("No se puede eliminar la especie porque tiene animales asociados.");
			}
		}

		controlPersis.eliminarEspecie(id);
	}

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

	public Animal buscarAnimal(int id_animal) {
		return controlPersis.buscarAnimal(id_animal);
	}

	public List<Animal> buscarTodosLosAnimales() {
		return controlPersis.buscarTodosLosAnimales();
	}

	public void editarAnimal(Animal animal) throws Exception {

		if (animal.getNombre() == null || animal.getNombre().isEmpty()) {
			throw new Exception("El animal debe tener un nombre.");
		}

		if (animal.getEdad() < 0) {
			throw new Exception("La edad del animal no puede ser negativa.");
		}

		if (animal.getSexo() == null || animal.getSexo().isEmpty()) {
			throw new Exception("Debe indicar el sexo del animal.");
		}

		if (animal.getEstado() == null || animal.getEstado().isEmpty()) {
			throw new Exception("Debe indicar el estado del animal.");
		}

		if (animal.getRefugio() == null) {
			throw new Exception("Debe seleccionar un refugio.");
		}

		if (animal.getEspecie() == null) {
			throw new Exception("Debe seleccionar una especie.");
		}

		controlPersis.editarAnimal(animal);
	}

	public void eliminarAnimal(int id_animal) throws Exception {

		Animal animal = controlPersis.buscarAnimal(id_animal);

		if (animal == null) {
			throw new Exception("El animal no existe.");
		}

		List<SolicitudAdopcion> solicitudes = controlPersis.buscarTodasLasSolicitudes();

		for (SolicitudAdopcion solicitud : solicitudes) {

			if (solicitud.getAnimal() != null && solicitud.getAnimal().getIdAnimal() == id_animal) {

				throw new Exception("No se puede eliminar el animal porque tiene solicitudes de adopción asociadas.");
			}
		}

		controlPersis.eliminarAnimal(id_animal);
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

	public SolicitudAdopcion buscarSolicitud(int id_solicitud) {
		return controlPersis.buscarSolicitud(id_solicitud);
	}

	public List<SolicitudAdopcion> buscarTodasLasSolicitudes() {
		return controlPersis.buscarTodasLasSolicitudes();
	}

	public void editarSolicitud(SolicitudAdopcion solicitud) throws Exception {

		if (solicitud.getNombre_solicitante() == null || solicitud.getNombre_solicitante().isEmpty()) {
			throw new Exception("Debe ingresar el nombre del solicitante.");
		}

		if (solicitud.getApellido_solicitante() == null || solicitud.getApellido_solicitante().isEmpty()) {
			throw new Exception("Debe ingresar el apellido del solicitante.");
		}

		if (solicitud.getCorreo() == null || solicitud.getCorreo().isEmpty()) {
			throw new Exception("Debe ingresar un correo electrónico.");
		}

		if (solicitud.getTelefono() == null || solicitud.getTelefono().isEmpty()) {
			throw new Exception("Debe ingresar un teléfono.");
		}

		if (solicitud.getMotivo() == null || solicitud.getMotivo().isEmpty()) {
			throw new Exception("Debe ingresar el motivo de la adopción.");
		}

		if (solicitud.getAnimal() == null) {
			throw new Exception("Debe seleccionar un animal.");
		}

		controlPersis.editarSolicitud(solicitud);
	}

	public void eliminarSolicitud(int id_solicitud) {
		controlPersis.eliminarSolicitud(id_solicitud);
	}

}
