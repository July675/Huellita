
<%@ page import="com.app.logica.Especie"%>
<%
Especie especie = (Especie) request.getAttribute("especie");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Editar especie | Huellitas</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/estilos.css">
</head>
<body>
	<header class="encabezado">
		<a class="logo" href="${pageContext.request.contextPath}/index.jsp">🐾
			Huellitas</a>
		<nav>
			<a href="${pageContext.request.contextPath}/SvEspecieListar">Volver
				a especies</a> <a
				href="${pageContext.request.contextPath}/SvAnimalListar">Animales</a>
			<a href="${pageContext.request.contextPath}/SvRefugioListar">Refugios</a>
		</nav>
	</header>

	<main class="contenedor-admin">
		<section class="titulo-admin">
			<span>GESTIÓN DE HUELLITAS</span>
			<h1>Editar especie</h1>
			<p>Modificá la información de esta especie.</p>
		</section>

		<%
		if (especie != null) {
		%>
		<section class="tarjeta-admin formulario-contenedor">
			<form action="${pageContext.request.contextPath}/SvAnimalEditar"
				method="POST" class="formulario-admin" enctype="multipart/form-data">

				<input type="hidden" name="id" value="<%=especie.getIdEspecie()%>">

				<label>Nombre</label> <input type="text" name="nombre"
					value="<%=especie.getNombre()%>" required> <label>Descripción</label>
				<textarea name="descripcion" rows="4" required><%=especie.getDescripcion()%></textarea>

				<button type="submit" class="boton-principal">Guardar
					cambios</button>
				<a class="boton-secundario"
					href="${pageContext.request.contextPath}/SvEspecieListar">Cancelar</a>
			</form>
		</section>
		<%
		} else {
		%>
		<p class="mensaje-vacio">No se encontró la especie solicitada.</p>
		<%
		}
		%>
	</main>
</body>
</html>
