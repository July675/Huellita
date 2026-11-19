
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.app.logica.Animal"%>
<%@ page import="com.app.logica.Refugio"%>
<%@ page import="com.app.logica.Especie"%>

<%
List<Animal> listaAnimales = (List<Animal>) request.getAttribute("listaAnimales");

List<Refugio> listaRefugios = (List<Refugio>) request.getAttribute("listaRefugios");

List<Especie> listaEspecies = (List<Especie>) request.getAttribute("listaEspecies");
%>

<!DOCTYPE html>
<html lang="es">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Administrar animales - Huellitas</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/estilos.css">
</head>

<body>

	<%
	String error = request.getParameter("error");
	%>

	<%
	if (error != null) {
	%>
	<div class="mensaje-error">
		<%=error%>
	</div>
	<%
	}
	%>
	<header class="encabezado">

		<a href="${pageContext.request.contextPath}/index.jsp" class="logo">
			🐾 Huellitas </a>

		<nav>
			<a href="${pageContext.request.contextPath}/index.jsp">Inicio</a> <a
				href="${pageContext.request.contextPath}/SvAnimalListar?vista=admin">Animales</a>

			<a href="${pageContext.request.contextPath}/SvRefugioListar">Refugios</a>

			<a
				href="${pageContext.request.contextPath}/SvEspecieListar?vista=admin">Especies</a>

			<a href="${pageContext.request.contextPath}/SvSolicitudListar">Solicitudes</a>
		</nav>

	</header>

	<main class="contenedor-admin">

		<h2 class="titulo-admin">GESTIÓN DE HUELLITAS</h2>

		<h1>🐶 Administrar animales</h1>

		<p>Registrá y administrá los animales que buscan un hogar.</p>

		<!-- FORMULARIO PARA REGISTRAR ANIMALES -->

		<section class="tarjeta-admin">

			<h2>Registrar un animal</h2>

			<form action="${pageContext.request.contextPath}/SvAnimalCrear"
				method="POST" class="formulario-admin" enctype="multipart/form-data">

				<label>Nombre:</label> <input type="text" name="nombre" required>

				<label>Edad:</label> <input type="number" name="edad" min="0"
					required> <label>Sexo:</label> <select name="sexo" required>
					<option value="">Seleccioná el sexo</option>
					<option value="Macho">Macho</option>
					<option value="Hembra">Hembra</option>
				</select> <label>Estado:</label> <select name="estado" required>
					<option value="">Seleccioná el estado</option>
					<option value="Disponible">Disponible</option>
					<option value="Adoptado">Adoptado</option>
				</select> <label>Refugio:</label> <select name="idRefugio" required>

					<option value="">Seleccioná un refugio</option>

					<%
					if (listaRefugios != null) {
						for (Refugio refugio : listaRefugios) {
					%>

					<option value="<%=refugio.getId_Refugio()%>">
						<%=refugio.getNombre()%>
					</option>

					<%
					}
					}
					%>

				</select> <label>Especie:</label> <select name="idEspecie" required>

					<option value="">Seleccioná una especie</option>

					<%
					if (listaEspecies != null) {
						for (Especie especie : listaEspecies) {
					%>

					<option value="<%=especie.getIdEspecie()%>">
						<%=especie.getNombre()%>
					</option>

					<%
					}
					}
					%>

				</select> <label>Foto del animal:</label> <input type="file" name="foto"
					accept="image/*">
				<button type="submit" class="boton-principal">Registrar
					animal</button>

			</form>

		</section>

		<!-- TABLA DE ANIMALES REGISTRADOS -->

		<section class="tarjeta-admin">

			<h2>Animales registrados</h2>

			<div class="tabla-contenedor">

				<table>

					<thead>
						<tr>
							<th>ID</th>
							<th>Nombre</th>
							<th>Edad</th>
							<th>Sexo</th>
							<th>Estado</th>
							<th>Refugio</th>
							<th>Especie</th>
							<th>Acciones</th>
						</tr>
					</thead>

					<tbody>

						<%
						if (listaAnimales != null && !listaAnimales.isEmpty()) {
							for (Animal animal : listaAnimales) {
						%>

						<tr>

							<td><%=animal.getIdAnimal()%></td>

							<td><%=animal.getNombre()%></td>

							<td><%=animal.getEdad()%></td>

							<td><%=animal.getSexo()%></td>

							<td><%=animal.getEstado()%></td>

							<td><%=animal.getRefugio() != null ? animal.getRefugio().getNombre() : "Sin refugio"%></td>

							<td><%=animal.getEspecie() != null ? animal.getEspecie().getNombre() : "Sin especie"%></td>

							<td class="acciones"><a class="boton-editar"
								href="${pageContext.request.contextPath}/SvAnimalEditar?id=<%= animal.getIdAnimal() %>">
									Editar </a>
								<form
									action="${pageContext.request.contextPath}/SvAnimalEliminar"
									method="POST" style="display: inline;">

									<input type="hidden" name="id"
										value="<%=animal.getIdAnimal()%>">

									<button type="submit" class="boton-eliminar"
										onclick="return confirm('¿Estás seguro de eliminar este animal?');">
										Eliminar</button>

								</form></td>

						</tr>

						<%
						}
						} else {
						%>

						<tr>
							<td colspan="8" class="mensaje-vacio">Todavía no hay
								animales registrados. 🐾</td>
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
