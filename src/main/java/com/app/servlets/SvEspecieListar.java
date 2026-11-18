
package com.app.servlets;

import java.io.IOException;
import java.util.List;

import com.app.logica.ControladoraLogica;
import com.app.logica.Especie;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SvEspecieListar")
public class SvEspecieListar extends HttpServlet {
    private static final long serialVersionUID = 1L;

    ControladoraLogica control = new ControladoraLogica();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Especie> listaEspecies = control.buscarTodasLasEspecies();

        request.setAttribute("listaEspecies", listaEspecies);

        request.getRequestDispatcher("/WEB-INF/vistas/especies.jsp")
               .forward(request, response);
    }
}
