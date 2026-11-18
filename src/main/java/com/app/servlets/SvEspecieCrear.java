
package com.app.servlets;

import java.io.IOException;

import com.app.logica.ControladoraLogica;
import com.app.logica.Especie;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SvEspecieCrear")
public class SvEspecieCrear extends HttpServlet {
    private static final long serialVersionUID = 1L;

    ControladoraLogica control = new ControladoraLogica();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");

        Especie especie = new Especie();

        especie.setNombre(nombre);
        especie.setDescripcion(descripcion);

        try {
            control.crearEspecie(especie);

            response.sendRedirect(request.getContextPath() + "/SvEspecieListar");

        } catch (Exception e) {
            throw new ServletException("Error al registrar la especie.", e);
        }
    }
}
