
package com.app.servlets;

import java.io.IOException;
import java.util.List;

import com.app.logica.Animal;
import com.app.logica.ControladoraLogica;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SvFormularioAdopcion")
public class SvFormularioAdopcion extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ControladoraLogica control = new ControladoraLogica();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Animal> listaAnimales = control.buscarTodosLosAnimales();

		request.setAttribute("listaAnimales", listaAnimales);

		request.getRequestDispatcher("/WEB-INF/vistas/formularioAdopcion.jsp").forward(request, response);
	}
}
