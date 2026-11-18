
package com.app.servlets;

import java.io.IOException;

import com.app.logica.ControladoraLogica;
import com.app.logica.Animal;
import com.app.logica.Refugio;
import com.app.logica.Especie;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SvAnimalCrear")
public class SvAnimalCrear extends HttpServlet {
    private static final long serialVersionUID = 1L;

    ControladoraLogica control = new ControladoraLogica();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombre = request.getParameter("nombre");
        int edad = Integer.parseInt(request.getParameter("edad"));
        String sexo = request.getParameter("sexo");
        String estado = request.getParameter("estado");

        int idRefugio = Integer.parseInt(request.getParameter("idRefugio"));
        int idEspecie = Integer.parseInt(request.getParameter("idEspecie"));

        Refugio refugio = control.buscarRefugio(idRefugio);
        Especie especie = control.buscarEspecie(idEspecie);

        Animal animal = new Animal();

        animal.setNombre(nombre);
        animal.setEdad(edad);
        animal.setSexo(sexo);
        animal.setEstado(estado);
        animal.setRefugio(refugio);
        animal.setEspecie(especie);

        try {
            control.crearAnimal(animal);
            response.sendRedirect(request.getContextPath() + "/SvAnimalListar");

        } catch (Exception e) {
            throw new ServletException("Error al registrar el animal.", e);
        }
    }
}
