
package com.app.servlets;

import java.io.IOException;
import java.util.List;

import com.app.logica.ControladoraLogica;
import com.app.logica.SolicitudAdopcion;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SvSolicitudListar")
public class SvSolicitudListar extends HttpServlet {
    private static final long serialVersionUID = 1L;

    ControladoraLogica control = new ControladoraLogica();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<SolicitudAdopcion> listaSolicitudes =
                control.buscarTodasLasSolicitudes();

        request.setAttribute("listaSolicitudes", listaSolicitudes);

        request.getRequestDispatcher("/WEB-INF/vistas/solicitudes.jsp")
               .forward(request, response);
    }
}
