
<%@ page import="java.util.List"%>
<%@ page import="com.app.logica.Animal"%>
<%@ page import="com.app.logica.Refugio"%>
<%@ page import="com.app.logica.Especie"%>

<%
Animal animal = (Animal) request.getAttribute("animal");

List<Refugio> listaRefugios = (List<Refugio>) request.getAttribute("listaRefugios");

List<Especie> listaEspecies = (List<Especie>) request.getAttribute("listaEspecies");
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="es">

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Editar animal | Huellitas</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/estilos.css">

</head>

<body>

	<header class="encabezado">

		<a class="logo" href="${pageContext.request.contextPath}/index.jsp">🐾
			Huellitas</a>

		<nav>

			<a href="${pageContext.request.contextPath}/SvAnimalListar">Volver
				a animales</a> <a
				href="${pageContext.request.contextPath}/SvRefugioListar">Refugios</a>

			<a href="${pageContext.request.contextPath}/SvEspecieListar">Especies</a>

		</nav>

	</header>

	<main class="contenedor-admin">

		<section class="titulo-admin">

			<span>GESTIÓN DE HUELLITAS</span>

			<h1>Editar animal</h1>

			<p>Modificá los datos del animal seleccionado.</p>

		</section>

		<%

		if (animal != null) {

		%>

		<section class="tarjeta-admin">

			<h2>Editar animal</h2>

			<form action="${pageContext.request.contextPath}/SvAnimalActualizar"
				method="POST" class="formulario-admin">

				<input type="hidden" name="id" value="<%=animal.getIdAnimal()%>">

				<label>Nombre:</label>
				<input type="text" name="nombre"
					value="<%=animal.getNombre()%>" required>

				<label>Edad:</label>
				<input type="number" name="edad" min="0"
					value="<%=animal.getEdad()%>" required>

				<label>Sexo:</label>
				<select name="sexo" required>
					<option value="">Seleccioná el sexo</option>
					<option value="Macho"
						<%="Macho".equals(animal.getSexo()) ? "selected" : ""%>>
						Macho
					</option>
					<option value="Hembra"
						<%="Hembra".equals(animal.getSexo()) ? "selected" : ""%>>
						Hembra
					</option>
				</select>

				<label>Estado:</label>
				<select name="estado" required>
					<option value="">Seleccioná el estado</option>
					<option value="Disponible"
						<%="Disponible".equals(animal.getEstado()) ? "selected" : ""%>>
						Disponible
					</option>
					<option value="Adoptado"
						<%="Adoptado".equals(animal.getEstado()) ? "selected" : ""%>>
						Adoptado
					</option>
				</select>

				<label>Refugio:</label>
				<select name="idRefugio" required>
					<option value="">Seleccioná un refugio</option>
					<%
					if (listaRefugios != null) {
						for (Refugio refugio : listaRefugios) {
					%>
					<option value="<%=refugio.getId_Refugio()%>"
						<%=animal.getRefugio() != null
								&& animal.getRefugio().getId_Refugio() == refugio.getId_Refugio()
										? "selected"
										: ""%>>
						<%=refugio.getNombre()%>
					</option>
					<%
						}
					}
					%>
				</select>

				<label>Especie:</label>
				<select name="idEspecie" required>
					<option value="">Seleccioná una especie</option>
					<%
					if (listaEspecies != null) {
						for (Especie especie : listaEspecies) {
					%>
					<option value="<%=especie.getIdEspecie()%>"
						<%=animal.getEspecie() != null
								&& animal.getEspecie().getIdEspecie() == especie.getIdEspecie()
										? "selected"
										: ""%>>
						<%=especie.getNombre()%>
					</option>
					<%
						}
					}
					%>
				</select>

				<button type="submit" class="boton-principal">Guardar
					cambios</button>

				<a class="boton-secundario"
					href="${pageContext.request.contextPath}/SvAnimalListar?vista=admin">Cancelar</a>

			</form>

		</section>

		<%

		} else {

		%>

		<p class="mensaje-vacio">No se encontró el animal solicitado.</p>

		<%

		}

		%>

	</main>

</body>

</html>
