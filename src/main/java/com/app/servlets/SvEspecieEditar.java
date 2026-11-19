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

    // GET: buscar la especie y mostrar el formulario.
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

    // POST: actualizar la especie.
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        int id = Integer.parseInt(request.getParameter("id"));

        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");

        Especie especie = control.buscarEspecie(id);

        if (especie == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND,
                    "No se encontró la especie.");
            return;
        }

        especie.setNombre(nombre);
        especie.setDescripcion(descripcion);

        try {
            control.editarEspecie(especie);
        } catch (Exception e) {
            throw new ServletException("No se pudo actualizar la especie.", e);
        }

        response.sendRedirect(request.getContextPath() + "/SvEspecieListar");
    }
}