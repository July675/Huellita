
package com.app.servlets;

import java.io.IOException;

import com.app.logica.ControladoraLogica;
import com.app.logica.Especie;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SvEspecieActualizar")
public class SvEspecieActualizar extends HttpServlet {
    private static final long serialVersionUID = 1L;

    ControladoraLogica control = new ControladoraLogica();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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

        control.editarEspecie(especie);

        response.sendRedirect(request.getContextPath() + "/SvEspecieListar");
    }
}
