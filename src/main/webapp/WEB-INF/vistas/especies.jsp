
<%@ page import="java.util.List" %>
<%@ page import="com.app.logica.Especie" %>
<%
    List<Especie> listaEspecies =
        (List<Especie>) request.getAttribute("listaEspecies");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Especies | Huellitas</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilos.css">
</head>
<body>
<header class="encabezado">
    <a class="logo" href="${pageContext.request.contextPath}/index.jsp">🐾 Huellitas</a>
    <nav>
        <a href="${pageContext.request.contextPath}/index.jsp">Inicio</a>
        <a href="${pageContext.request.contextPath}/SvAnimalListar?vista=admin">Animales</a>
        <a href="${pageContext.request.contextPath}/SvRefugioListar">Refugios</a>
        <a href="${pageContext.request.contextPath}/SvEspecieListar">Especies</a>
        <a href="${pageContext.request.contextPath}/SvSolicitudListar">Solicitudes</a>
    </nav>
</header>

<main class="contenedor-admin">
    <section class="titulo-admin">
        <span>GESTIÓN DE HUELLITAS</span>
        <h1>🐾 Especies</h1>
        <p>Administrá las especies de los animales registrados.</p>
    </section>

    <section class="tarjeta-admin">
        <h2>Registrar una especie</h2>
        <form action="${pageContext.request.contextPath}/SvEspecieCrear"
              method="POST" class="formulario-admin">

            <label>Nombre</label>
            <input type="text" name="nombre" required>

            <label>Descripción</label>
            <textarea name="descripcion" rows="4" required></textarea>

            <button type="submit" class="boton-principal">Registrar especie</button>
        </form>
    </section>

    <section class="tarjeta-admin">
        <h2>Especies registradas</h2>

        <% if (listaEspecies != null && !listaEspecies.isEmpty()) { %>
        <div class="tabla-contenedor">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Descripción</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                <% for (Especie especie : listaEspecies) { %>
                    <tr>
                        <td><%= especie.getIdEspecie() %></td>
                        <td><%= especie.getNombre() %></td>
                        <td><%= especie.getDescripcion() %></td>
                        <td class="acciones">
                            <a class="boton-editar"
                               href="${pageContext.request.contextPath}/SvEspecieEditar?id=<%= especie.getIdEspecie() %>">Editar</a>
                            <a class="boton-eliminar"
                               href="${pageContext.request.contextPath}/SvEspecieEliminar?id=<%= especie.getIdEspecie() %>"
                               onclick="return confirm('¿Seguro que querés eliminar esta especie?');">Eliminar</a>
                        </td>
                    </tr>
                <% } %>
                </tbody>
            </table>
        </div>
        <% } else { %>
            <p class="mensaje-vacio">Todavía no hay especies registradas. 🐾</p>
        <% } %>
    </section>
</main>
</body>
</html>
