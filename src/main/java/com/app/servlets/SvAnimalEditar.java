
package com.app.servlets;

import java.io.IOException;
import java.util.List;

import com.app.logica.ControladoraLogica;
import com.app.logica.Animal;
import com.app.logica.Refugio;
import com.app.logica.Especie;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SvAnimalEditar")
public class SvAnimalEditar extends HttpServlet {

    private static final long serialVersionUID = 1L;

    ControladoraLogica control = new ControladoraLogica();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        Animal animal = control.buscarAnimal(id);

        if (animal == null) {

            response.sendError(HttpServletResponse.SC_NOT_FOUND,
                    "No se encontró el animal.");

            return;
        }

        List<Refugio> listaRefugios = control.buscarTodosLosRefugios();

        List<Especie> listaEspecies = control.buscarTodasLasEspecies();

        request.setAttribute("animal", animal);
        request.setAttribute("listaRefugios", listaRefugios);
        request.setAttribute("listaEspecies", listaEspecies);

        request.getRequestDispatcher("/WEB-INF/vistas/animalEditar.jsp")
                .forward(request, response);

    }

}
