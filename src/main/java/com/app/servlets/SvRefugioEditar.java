package com.app.servlets;

import java.io.IOException;

import com.app.logica.ControladoraLogica;
import com.app.logica.Refugio;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SvRefugioEditar")
public class SvRefugioEditar extends HttpServlet {

    private static final long serialVersionUID = 1L;

    ControladoraLogica control = new ControladoraLogica();

    // GET: buscar el refugio y mostrar el formulario.
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        Refugio refugio = control.buscarRefugio(id);

        if (refugio == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND,
                    "No se encontró el refugio.");
            return;
        }

        request.setAttribute("refugio", refugio);

        request.getRequestDispatcher("/WEB-INF/vistas/refugioEditar.jsp")
                .forward(request, response);
    }

    // POST: actualizar el refugio.
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

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

        try {
            control.editarRefugio(refugio);
        } catch (Exception e) {
            throw new ServletException("No se pudo actualizar el refugio.", e);
        }

        response.sendRedirect(request.getContextPath() + "/SvRefugioListar");
    }
}