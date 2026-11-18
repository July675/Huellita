
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Huellitas | Administración</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/estilos.css">
</head>
<body>

	<header class="encabezado">
		<a href="${pageContext.request.contextPath}/index.jsp" class="logo">
			🐾 Huellitas </a>

		<nav>
			<a href="${pageContext.request.contextPath}/index.jsp">Volver al
				inicio</a>
		</nav>
	</header>

	<main class="seccion">
		<div class="titulo-seccion">
			<span>PANEL DE CONTROL</span>
			<h2>Administración de Huellitas 🐾</h2>
			<p>Seleccioná el apartado que querés administrar.</p>
		</div>

		<div class="tarjetas-animales">

			<article class="tarjeta-animal">
				<div class="animal-icono">🐶</div>
				<h3>Animales</h3>
				<p>Agregar, modificar, consultar y eliminar animales.</p>
				<a href="${pageContext.request.contextPath}/SvAnimalListar?vista=admin">
    Administrar →
</a>
			</article>

			<article class="tarjeta-animal">
				<div class="animal-icono">📝</div>
				<h3>Solicitudes</h3>
				<p>Consultar y gestionar las solicitudes de adopción.</p>
				<a href="${pageContext.request.contextPath}/SvSolicitudListar">
					Administrar → </a>
			</article>

			<article class="tarjeta-animal">
				<div class="animal-icono">🐾</div>
				<h3>Especies</h3>
				<p>Consultar y gestionar las especies registradas.</p>
				<a
					href="${pageContext.request.contextPath}/SvEspecieListar?vista=admin">
					Administrar → </a>
			</article>

			<article class="tarjeta-animal">
				<div class="animal-icono">🏠</div>
				<h3>Refugios</h3>
				<p>Consultar y gestionar los refugios.</p>
				<a
					href="${pageContext.request.contextPath}/SvRefugioListar">
					Administrar → </a>
			</article>

		</div>
	</main>

</body>
</html>
