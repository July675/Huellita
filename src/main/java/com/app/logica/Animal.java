package com.app.logica;

import jakarta.persistence.Basic;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

import java.io.Serializable;

@Entity
@Table(name = "animales")
public class Animal implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id_animal;

	@Basic
	private String nombre;
	private int edad;
	private String sexo;
	private String descripcion;
	private String estado;
	private String foto;

	@ManyToOne
    @JoinColumn(name = "id_refugio")
	private Refugio refugio;

	@ManyToOne
    @JoinColumn(name = "id_especie")
	private Especie especie;

	public Animal() {
	}

	public Animal(int idAnimal, String nombre, int edad, String sexo, String descripcion, String estado, String foto,
			Refugio refugio, Especie especie) {
		super();
		this.id_animal = idAnimal;
		this.nombre = nombre;
		this.edad = edad;
		this.sexo = sexo;
		this.descripcion = descripcion;
		this.estado = estado;
		this.foto = foto;
		this.refugio = refugio;
		this.especie = especie;
	}

	public int getIdAnimal() {
		return id_animal;
	}

	public void setIdAnimal(int idAnimal) {
		this.id_animal = idAnimal;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public int getEdad() {
		return edad;
	}

	public void setEdad(int edad) {
		this.edad = edad;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getFoto() {
		return foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
	}

	public Refugio getRefugio() {
		return refugio;
	}

	public void setRefugio(Refugio refugio) {
		this.refugio = refugio;
	}

	public Especie getEspecie() {
		return especie;
	}

	public void setEspecie(Especie especie) {
		this.especie = especie;
	}

	
}
