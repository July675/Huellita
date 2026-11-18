
package com.app.servlets;

import java.io.IOException;

import com.app.logica.ControladoraLogica;
import com.app.logica.Refugio;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SvRefugioCrear")
public class SvRefugioCrear extends HttpServlet {
    private static final long serialVersionUID = 1L;

    ControladoraLogica control = new ControladoraLogica();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombre = request.getParameter("nombre");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");
        String correo = request.getParameter("correo");

        Refugio refugio = new Refugio();

        refugio.setNombre(nombre);
        refugio.setDireccion(direccion);
        refugio.setTelefono(telefono);
        refugio.setCorreo(correo);

        try {
            control.crearRefugio(refugio);

            response.sendRedirect(
                request.getContextPath() + "/SvRefugioListar"
            );

        } catch (Exception e) {
            throw new ServletException("Error al registrar el refugio.", e);
        }
    }
}
