
package com.app.servlets;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
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

@WebServlet("/SvAnimalCrear")
@MultipartConfig
public class SvAnimalCrear extends HttpServlet {
    private static final long serialVersionUID = 1L;

    ControladoraLogica control = new ControladoraLogica();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombre = request.getParameter("nombre");
        int edad = Integer.parseInt(request.getParameter("edad"));
        String sexo = request.getParameter("sexo");
        String estado = request.getParameter("estado");

        int idRefugio = Integer.parseInt(request.getParameter("idRefugio"));
        int idEspecie = Integer.parseInt(request.getParameter("idEspecie"));

        Refugio refugio = control.buscarRefugio(idRefugio);
        Especie especie = control.buscarEspecie(idEspecie);

        String rutaFoto = null;

        Part foto = request.getPart("foto");

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

        Animal animal = new Animal();

        animal.setNombre(nombre);
        animal.setEdad(edad);
        animal.setSexo(sexo);
        animal.setEstado(estado);
        animal.setRefugio(refugio);
        animal.setEspecie(especie);
        animal.setFoto(rutaFoto);

        try {
            control.crearAnimal(animal);

            response.sendRedirect(request.getContextPath() + "/SvAnimalListar?vista=admin");

        } catch (Exception e) {
            throw new ServletException("Error al registrar el animal.", e);
        }
    }
}
