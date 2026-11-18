
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
}
