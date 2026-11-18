
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.app.logica.Animal"%>

<%
List<Animal> listaAnimales = (List<Animal>) request.getAttribute("listaAnimales");
%>

<!DOCTYPE html>
<html lang="es">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Animales | Huellitas</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/estilos.css">
</head>

<body>

<header class="encabezado">

    <a href="${pageContext.request.contextPath}/index.jsp" class="logo">
        🐾 Huellitas
    </a>

    <nav>
        <a href="${pageContext.request.contextPath}/index.jsp">Inicio</a>
        <a href="${pageContext.request.contextPath}/SvAnimalListar">Animales</a>
        <a href="${pageContext.request.contextPath}/index.jsp#adoptar">Cómo adoptar</a>
        <a href="${pageContext.request.contextPath}/index.jsp#nosotros">Nosotros</a>
    </nav>

    <a href="${pageContext.request.contextPath}/admin.jsp"
       class="boton-admin">Administradores</a>

</header>

	<main>

		<section class="seccion animales">

			<div class="titulo-seccion">
				<span>CONOCÉ A NUESTROS ANIMALES</span>

				<h2>🐶 Buscan un hogar</h2>

				<p>Ellos esperan encontrar una familia que les dé amor, cuidado
					y una segunda oportunidad.</p>
			</div>

			<%
			if (listaAnimales != null && !listaAnimales.isEmpty()) {
			%>

			<div class="tarjetas-animales">

				<%
				for (Animal animal : listaAnimales) {
				%>

				<article class="tarjeta-animal">

					<div class="animal-icono">
						<%
						if (animal.getFoto() != null && !animal.getFoto().isEmpty()) {
						%>

						<img
							src="${pageContext.request.contextPath}/<%= animal.getFoto() %>"
							alt="Foto de <%= animal.getNombre() %>" class="foto-animal">

						<%
						} else {
						%>

						🐾

						<%
						}
						%>
					</div>

					<span class="animal-etiqueta"> <%=animal.getEstado()%>
					</span>

					<h3>
						<%=animal.getNombre()%>
					</h3>

					<p>
						**Edad:**
						<%=animal.getEdad()%>
						años <br> **Sexo:**
						<%=animal.getSexo()%>
						<br> **Especie:**
						<%=animal.getEspecie() != null ? animal.getEspecie().getNombre() : "Sin especie"%>
						<br> **Refugio:**
						<%=animal.getRefugio() != null ? animal.getRefugio().getNombre() : "Sin refugio"%>
					</p>

				</article>

				<%
				}
				%>

			</div>

			<%
			} else {
			%>

			<p class="mensaje-vacio">Todavía no hay animales registrados.
				¡Pronto habrá nuevos amigos esperando un hogar! 🐾</p>

			<%
			}
			%>

		</section>

	</main>

	<footer>
		<div class="footer-logo">🐾 Huellitas</div>
		<p>Juntos podemos cambiar muchas vidas.</p>
	</footer>

</body>
</html>
