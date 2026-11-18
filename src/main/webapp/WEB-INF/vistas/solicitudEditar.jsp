
<%@ page import="java.util.List" %>
<%@ page import="com.app.logica.SolicitudAdopcion" %>

<%
SolicitudAdopcion solicitud = (SolicitudAdopcion) request.getAttribute("solicitud");

%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar solicitud | Huellitas</title>

    <link rel="stylesheet"
        href="${pageContext.request.contextPath}/css/estilos.css">

    <link rel="stylesheet"
        href="${pageContext.request.contextPath}/css/admin.css">
</head>

<body>

    <header class="encabezado">

        <a class="logo" href="${pageContext.request.contextPath}/index.jsp">
            🐾 Huellitas
        </a>

        <nav>
            <a href="${pageContext.request.contextPath}/SvSolicitudListar">
                Volver a solicitudes
            </a>

            <a href="${pageContext.request.contextPath}/SvAnimalListar">
                Animales
            </a>
        </nav>

    </header>

    <main class="contenedor-admin">

        <section class="titulo-admin">
            <span>GESTIÓN DE HUELLITAS</span>
            <h1>Editar solicitud</h1>
            <p>Actualizá los datos y el estado de la solicitud.</p>
        </section>

        <%
        if (solicitud != null) {
        %>

        <section class="tarjeta-admin formulario-contenedor">

            <form
                action="${pageContext.request.contextPath}/SvSolicitudActualizar"
                method="POST"
                class="formulario-admin">

                <input type="hidden" name="id"
                    value="<%=solicitud.getId_solicitud()%>">

                

                <label>Estado de la solicitud</label>
                <select name="estado" required>

                    <option value="Pendiente"
                        <%= "Pendiente".equals(solicitud.getEstado()) ? "selected" : "" %>>
                        Pendiente
                    </option>

                    <option value="En revisión"
                        <%= "En revisión".equals(solicitud.getEstado()) ? "selected" : "" %>>
                        En revisión
                    </option>

                    <option value="Aprobada"
                        <%= "Aprobada".equals(solicitud.getEstado()) ? "selected" : "" %>>
                        Aprobada
                    </option>

                    <option value="Rechazada"
                        <%= "Rechazada".equals(solicitud.getEstado()) ? "selected" : "" %>>
                        Rechazada
                    </option>

                </select>

                <button type="submit" class="boton-principal">
                    Guardar cambios
                </button>

                <a class="boton-secundario"
                    href="${pageContext.request.contextPath}/SvSolicitudListar">
                    Cancelar
                </a>

            </form>

        </section>

        <%
        } else {
        %>

        <p class="mensaje-vacio">
            No se encontró la solicitud solicitada.
        </p>

        <%
        }
        %>

    </main>

</body>
</html>
```