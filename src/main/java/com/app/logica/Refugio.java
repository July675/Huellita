package com.app.logica;

import jakarta.persistence.Basic;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import java.io.Serializable;

@Entity
@Table(name = "refugios")
public class Refugio implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)	private int id_refugio;

	@Basic
	private String nombre;
	private String direccion;
	private String telefono;
	private String correo;

	public Refugio() {
	}

	public Refugio(int id_Refugio, String nombre, String direccion, String telefono, String correo) {
		super();
		this.id_refugio = id_Refugio;
		this.nombre = nombre;
		this.direccion = direccion;
		this.telefono = telefono;
		this.correo = correo;
	}

	// getters/setters
	public int getId_Refugio() {
		return id_refugio;
	}

	public void setId_Refugio(int id_Refugio) {
		this.id_refugio = id_Refugio;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

}
