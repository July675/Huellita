
<%@page import="java.util.List"%>
<%@page import="com.app.logica.Refugio"%>

<%
List<Refugio> listaRefugios = (List<Refugio>) request.getAttribute("listaRefugios");
%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Administrar refugios - Huellitas</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/estilos.css">
</head>

<body>

	<header class="encabezado">

		<a href="${pageContext.request.contextPath}/index.jsp" class="logo">
			🐾 Huellitas </a>

		<nav>
			<a href="${pageContext.request.contextPath}/index.jsp">Inicio</a> <a
				href="${pageContext.request.contextPath}/SvAnimalListar?vista=admin">Animales</a>
			<a href="${pageContext.request.contextPath}/SvRefugioListar">Refugios</a>
			<a href="${pageContext.request.contextPath}/SvEspecieListar">Especies</a>
			<a href="${pageContext.request.contextPath}/SvSolicitudListar">Solicitudes</a>
		</nav>

	</header>

	<main class="contenedor-admin">

		<h2 class="titulo-admin">GESTIÓN DE HUELLITAS</h2>

		<h1>🏡 Administrar refugios</h1>

		<p>Gestioná los refugios asociados con Huellitas.</p>

		<!-- FORMULARIO PARA REGISTRAR REFUGIOS -->

		<section class="tarjeta-admin">

			<h2>Registrar un refugio</h2>

			<form action="${pageContext.request.contextPath}/SvRefugioCrear"
				method="POST" class="formulario-admin">

				<label>Nombre:</label> <input type="text" name="nombre" required>

				<label>Dirección:</label> <input type="text" name="direccion"
					required> <label>Teléfono:</label> <input type="text"
					name="telefono" required> <label>Correo:</label> <input
					type="email" name="correo" required>

				<button type="submit" class="boton-principal">Registrar
					refugio</button>

			</form>

		</section>

		<!-- TABLA DE REFUGIOS -->

		<section class="tarjeta-admin">

			<h2>Refugios registrados</h2>

			<div class="tabla-contenedor">

				<table>

					<thead>
						<tr>
							<th>ID</th>
							<th>Nombre</th>
							<th>Dirección</th>
							<th>Teléfono</th>
							<th>Correo</th>
							<th>Acciones</th>
						</tr>
					</thead>

					<tbody>

						<%
						if (listaRefugios != null && !listaRefugios.isEmpty()) {
						%>

						<%
						for (Refugio refugio : listaRefugios) {
						%>

						<tr>
							<td><%=refugio.getId_Refugio()%></td>
							<td><%=refugio.getNombre()%></td>
							<td><%=refugio.getDireccion()%></td>
							<td><%=refugio.getTelefono()%></td>
							<td><%=refugio.getCorreo()%></td>

							<td class="acciones"><a class="boton-editar"
								href="${pageContext.request.contextPath}/SvRefugioEditar?id=<%= refugio.getId_Refugio() %>">
									Editar </a> <a class="boton-eliminar"
								href="${pageContext.request.contextPath}/SvRefugioEliminar?id=<%= refugio.getId_Refugio() %>"
								onclick="return confirm('¿Estás seguro de eliminar este refugio?');">
									Eliminar </a></td>
						</tr>

						<%
						}
						%>

						<%
						} else {
						%>

						<tr>
							<td colspan="6" class="mensaje-vacio">Todavía no hay
								refugios registrados. 🐾</td>
						</tr>

						<%
						}
						%>

					</tbody>

				</table>

			</div>

		</section>

	</main>

</body>
</html>
