
<%@ page import="com.app.logica.Refugio"%>
<%
Refugio refugio = (Refugio) request.getAttribute("refugio");
%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Editar refugio | Huellitas</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/estilos.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin.css">
</head>
<body>
	<header class="encabezado">
		<a class="logo" href="${pageContext.request.contextPath}/index.jsp">🐾
			Huellitas</a>
		<nav>
			<a href="${pageContext.request.contextPath}/SvRefugioListar">Volver
				a refugios</a> <a
				href="${pageContext.request.contextPath}/SvAnimalListar">Animales</a>
			<a href="${pageContext.request.contextPath}/SvEspecieListar">Especies</a>
		</nav>
	</header>

	<main class="contenedor-admin">
		<section class="titulo-admin">
			<span>GESTIÓN DE HUELLITAS</span>
			<h1>Editar refugio</h1>
			<p>Actualizá la información del refugio.</p>
		</section>

		<%
		if (refugio != null) {
		%>
		<section class="tarjeta-admin formulario-contenedor">
			<form action="${pageContext.request.contextPath}/SvAnimalEditar"
				method="POST" class="formulario-admin" enctype="multipart/form-data">

				<input type="hidden" name="id"
					value="<%=refugio.getId_Refugio()%>"> <label>Nombre</label>
				<input type="text" name="nombre" value="<%=refugio.getNombre()%>"
					required> <label>Dirección</label> <input type="text"
					name="direccion" value="<%=refugio.getDireccion()%>" required>

				<label>Teléfono</label> <input type="text" name="telefono"
					value="<%=refugio.getTelefono()%>" required> <label>Correo
					electrónico</label> <input type="email" name="correo"
					value="<%=refugio.getCorreo()%>" required>

				<button type="submit" class="boton-principal">Guardar
					cambios</button>
				<a class="boton-secundario"
					href="${pageContext.request.contextPath}/SvRefugioListar">Cancelar</a>
			</form>
		</section>
		<%
		} else {
		%>
		<p class="mensaje-vacio">No se encontró el refugio solicitado.</p>
		<%
		}
		%>
	</main>
</body>
</html>
