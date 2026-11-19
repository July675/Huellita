package com.app.servlets;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;
import java.util.UUID;

import com.app.logica.ControladoraLogica;
import com.app.logica.Animal;
import com.app.logica.Refugio;
import com.app.logica.Especie;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/SvAnimalEditar")
@MultipartConfig
public class SvAnimalEditar extends HttpServlet {

    private static final long serialVersionUID = 1L;

    ControladoraLogica control = new ControladoraLogica();

    // GET: buscar el animal y mostrar el formulario de edición.
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        Animal animal = control.buscarAnimal(id);

        if (animal == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND,
                    "No se encontró el animal.");
            return;
        }

        List<Refugio> listaRefugios = control.buscarTodosLosRefugios();
        List<Especie> listaEspecies = control.buscarTodasLasEspecies();

        request.setAttribute("animal", animal);
        request.setAttribute("listaRefugios", listaRefugios);
        request.setAttribute("listaEspecies", listaEspecies);

        request.getRequestDispatcher("/WEB-INF/vistas/animalEditar.jsp")
                .forward(request, response);
    }

    // POST: recibir los datos y actualizar el animal.
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        int edad = Integer.parseInt(request.getParameter("edad"));
        String sexo = request.getParameter("sexo");
        String estado = request.getParameter("estado");

        int idRefugio = Integer.parseInt(request.getParameter("idRefugio"));
        int idEspecie = Integer.parseInt(request.getParameter("idEspecie"));

        Animal animal = control.buscarAnimal(id);

        if (animal == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND,
                    "No se encontró el animal.");
            return;
        }

        Refugio refugio = control.buscarRefugio(idRefugio);
        Especie especie = control.buscarEspecie(idEspecie);

        // Conserva la foto que ya tenía el animal.
        String rutaFoto = animal.getFoto();

        Part foto = request.getPart("foto");

        // Si se seleccionó una foto nueva, la guarda.
        if (foto != null && foto.getSize() > 0) {

            if (foto.getContentType() == null ||
                    !foto.getContentType().startsWith("image/")) {
                throw new ServletException("El archivo seleccionado no es una imagen.");
            }

            String nombreOriginal = new File(foto.getSubmittedFileName()).getName();
            String extension = "";

            int punto = nombreOriginal.lastIndexOf(".");
            if (punto >= 0) {
                extension = nombreOriginal.substring(punto);
            }

            String nombreArchivo = UUID.randomUUID().toString() + extension;

            String carpetaImagenes = getServletContext().getRealPath("/imagenes");

            if (carpetaImagenes == null) {
                throw new ServletException("No se pudo encontrar la carpeta de imágenes.");
            }

            File carpeta = new File(carpetaImagenes);

            if (!carpeta.exists()) {
                carpeta.mkdirs();
            }

            File archivo = new File(carpeta, nombreArchivo);

            Files.copy(foto.getInputStream(), archivo.toPath());

            rutaFoto = "imagenes/" + nombreArchivo;
        }

        animal.setNombre(nombre);
        animal.setEdad(edad);
        animal.setSexo(sexo);
        animal.setEstado(estado);
        animal.setRefugio(refugio);
        animal.setEspecie(especie);
        animal.setFoto(rutaFoto);

        try {
            control.editarAnimal(animal);
        } catch (Exception e) {
            throw new ServletException("No se pudo actualizar el animal.", e);
        }

        response.sendRedirect(request.getContextPath() + "/SvAnimalListar?vista=admin");
    }
}