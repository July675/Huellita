
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

@WebServlet("/SvSolicitudCrear")
public class SvSolicitudCrear extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ControladoraLogica control = new ControladoraLogica();

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String nombre = request.getParameter("nombre_solicitante");
		String apellido = request.getParameter("apellido_solicitante");
		String correo = request.getParameter("correo");
		String telefono = request.getParameter("telefono");
		String motivo = request.getParameter("motivo");

		try {
			int idAnimal = Integer.parseInt(request.getParameter("idAnimal"));

			Animal animal = control.buscarAnimal(idAnimal);

			if (animal == null) {
				throw new ServletException("No se encontró el animal seleccionado.");
			}

			SolicitudAdopcion solicitud = new SolicitudAdopcion();

			solicitud.setNombre_solicitante(nombre);
			solicitud.setApellido_solicitante(apellido);
			solicitud.setCorreo(correo);
			solicitud.setTelefono(telefono);
			solicitud.setMotivo(motivo);
			solicitud.setAnimal(animal);

			control.crearSolicitud(solicitud);

			request.getSession().setAttribute("solicitudEnviada", true);
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		} catch (Exception e) {
			throw new ServletException("Error al registrar la solicitud.", e);
		}
	}
}
