
package com.app.servlets;

import java.io.IOException;

import com.app.logica.ControladoraLogica;
import com.app.logica.Especie;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SvEspecieEditar")
public class SvEspecieEditar extends HttpServlet {
    private static final long serialVersionUID = 1L;

    ControladoraLogica control = new ControladoraLogica();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        Especie especie = control.buscarEspecie(id);

        if (especie == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND,
                    "No se encontró la especie.");
            return;
        }

        request.setAttribute("especie", especie);

        request.getRequestDispatcher("/WEB-INF/vistas/especieEditar.jsp")
               .forward(request, response);
    }
}
