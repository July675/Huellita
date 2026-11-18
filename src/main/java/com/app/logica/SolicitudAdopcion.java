package com.app.logica;

import jakarta.persistence.Basic;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "solicitudes_adopcion")
public class SolicitudAdopcion implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id_solicitud;

    @Basic
    private String nombre_solicitante;
    private String apellido_solicitante;
    private String correo;
    private String telefono;
    private String motivo;
    private String estado;
   
    @ManyToOne
    @JoinColumn(name = "id_animal")
    private Animal animal;
   
    @Temporal(TemporalType.DATE)
    private Date fecha_solicitud;
    

    public SolicitudAdopcion() { }

    public SolicitudAdopcion(int id_solicitud, String nombre_solicitante, String apellido_solicitante, String correo,
			String telefono, String estado, Animal animal, String motivo, Date fechaSolicitud) {
		super();
		this.id_solicitud = id_solicitud;
		this.nombre_solicitante = nombre_solicitante;
		this.apellido_solicitante = apellido_solicitante;
		this.correo = correo;
		this.telefono = telefono;
		this.estado = estado;
		this.animal = animal;
		this.motivo = motivo;
		this.fecha_solicitud = fechaSolicitud;
	}

	public int getId_solicitud() {
		return id_solicitud;
	}

	public void setId_solicitud(int id_solicitud) {
		this.id_solicitud = id_solicitud;
	}

	public String getNombre_solicitante() {
		return nombre_solicitante;
	}

	public void setNombre_solicitante(String nombre_solicitante) {
		this.nombre_solicitante = nombre_solicitante;
	}

	public String getApellido_solicitante() {
		return apellido_solicitante;
	}

	public void setApellido_solicitante(String apellido_solicitante) {
		this.apellido_solicitante = apellido_solicitante;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public Animal getAnimal() {
		return animal;
	}

	public void setAnimal(Animal animal) {
		this.animal = animal;
	}

	public String getMotivo () {
		return motivo;
	}

	public void setMotivo(String motivo) {
		this.motivo = motivo;
	}
	public Date getFechaSolicitud() {
		return fecha_solicitud;
	}

	public void setFechaSolicitud(Date fechaSolicitud) {
		this.fecha_solicitud = fechaSolicitud;
	}


}




