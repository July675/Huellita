package com.app.logica;

import jakarta.persistence.Basic;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import java.io.Serializable;

@Entity
@Table(name = "especies")
public class Especie implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id_especie;
	@Basic
	private String nombre;
	private String descripcion;

	public Especie() {
	}

	// metodo constructuro
	public Especie(int idEspecie, String nombre, String descripcion) {
		super();
		this.id_especie = idEspecie;
		this.nombre = nombre;
		this.descripcion = descripcion;
	}

	// getters/setters
	public int getIdEspecie() {
		return id_especie;
	}

	public void setIdEspecie(int idEspecie) {
		this.id_especie = idEspecie;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}


}
