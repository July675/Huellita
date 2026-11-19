package com.app.servlets;

import java.io.IOException;

import com.app.logica.ControladoraLogica;
import com.app.logica.SolicitudAdopcion;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SvSolicitudEditar")
public class SvSolicitudEditar extends HttpServlet {

    private static final long serialVersionUID = 1L;

    ControladoraLogica control = new ControladoraLogica();

    // GET: buscar la solicitud y mostrar el formulario.
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        SolicitudAdopcion solicitud = control.buscarSolicitud(id);

        if (solicitud == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND,
                    "No se encontró la solicitud.");
            return;
        }

        request.setAttribute("solicitud", solicitud);

        request.getRequestDispatcher("/WEB-INF/vistas/solicitudEditar.jsp")
                .forward(request, response);
    }

    // POST: actualizar el estado de la solicitud.
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        int id = Integer.parseInt(request.getParameter("id"));
        String estado = request.getParameter("estado");

        SolicitudAdopcion solicitud = control.buscarSolicitud(id);

        if (solicitud == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND,
                    "No se encontró la solicitud.");
            return;
        }

        solicitud.setEstado(estado);

        try {
            control.editarSolicitud(solicitud);
        } catch (Exception e) {
            throw new ServletException("No se pudo actualizar la solicitud.", e);
        }

        response.sendRedirect(request.getContextPath() + "/SvSolicitudListar");
    }
}