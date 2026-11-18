
package com.app.servlets;

import java.io.IOException;
import java.util.List;

import com.app.logica.Animal;
import com.app.logica.ControladoraLogica;
import com.app.logica.Especie;
import com.app.logica.Refugio;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SvAnimalListar")
public class SvAnimalListar extends HttpServlet {
    private static final long serialVersionUID = 1L;

    ControladoraLogica control = new ControladoraLogica();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Animal> listaAnimales = control.buscarTodosLosAnimales();

        request.setAttribute("listaAnimales", listaAnimales);
        
        List<Especie> listaEspecies = control.buscarTodasLasEspecies();

        request.setAttribute("listaEspecies", listaEspecies);
        
        List<Refugio> listaRefugios = control.buscarTodosLosRefugios();
        request.setAttribute("listaRefugios", listaRefugios);

        String vista = request.getParameter("vista");

        if ("admin".equals(vista)) {
            request.getRequestDispatcher("/WEB-INF/vistas/animalesAdmin.jsp")
                   .forward(request, response);
        } else {
            request.getRequestDispatcher("/WEB-INF/vistas/animales.jsp")
                   .forward(request, response);
        }
        
        
    }
}
