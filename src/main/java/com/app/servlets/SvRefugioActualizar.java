
package com.app.servlets;

import java.io.IOException;

import com.app.logica.ControladoraLogica;
import com.app.logica.Refugio;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SvRefugioActualizar")
public class SvRefugioActualizar extends HttpServlet {
    private static final long serialVersionUID = 1L;

    ControladoraLogica control = new ControladoraLogica();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        String nombre = request.getParameter("nombre");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");
        String correo = request.getParameter("correo");

        Refugio refugio = control.buscarRefugio(id);

        if (refugio == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND,
                    "No se encontró el refugio.");
            return;
        }

        refugio.setNombre(nombre);
        refugio.setDireccion(direccion);
        refugio.setTelefono(telefono);
        refugio.setCorreo(correo);

        control.editarRefugio(refugio);

        response.sendRedirect(
            request.getContextPath() + "/SvRefugioListar"
        );
    }
}
