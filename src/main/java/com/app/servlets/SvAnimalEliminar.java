package com.app.servlets;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import com.app.logica.ControladoraLogica;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SvAnimalEliminar")
public class SvAnimalEliminar extends HttpServlet {

    private static final long serialVersionUID = 1L;

    ControladoraLogica control = new ControladoraLogica();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        try {
            control.eliminarAnimal(id);

            response.sendRedirect(
                request.getContextPath() + "/SvAnimalListar?vista=admin"
            );

        } catch (Exception e) {

            String error = URLEncoder.encode(
                e.getMessage(),
                StandardCharsets.UTF_8
            );

            response.sendRedirect(
                request.getContextPath() + "/SvAnimalListar?vista=admin&error=" + error
            );
        }
    }
}