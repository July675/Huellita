
package com.app.servlets;

import java.io.IOException;

import com.app.logica.ControladoraLogica;
import com.app.logica.SolicitudAdopcion;
import com.app.logica.Animal;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SvSolicitudActualizar")
public class SvSolicitudActualizar extends HttpServlet {
    private static final long serialVersionUID = 1L;

    ControladoraLogica control = new ControladoraLogica();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        String estado = request.getParameter("estado");


        SolicitudAdopcion solicitud = control.buscarSolicitud(id);

        if (solicitud == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND,
                    "No se encontró la solicitud.");
            return;
        }

        solicitud.setEstado(estado);

        control.editarSolicitud(solicitud);

        response.sendRedirect(
                request.getContextPath() + "/SvSolicitudListar");
    }
}
