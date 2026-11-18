<%@ page import="java.util.List"%>
<%@ page import="com.app.logica.Animal"%>

<%
List<Animal> listaAnimales = (List<Animal>) request.getAttribute("listaAnimales");
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Solicitar adopción | Huellitas</title>
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

	<main class="contenedor-admin">
		<section class="titulo-admin">
			<span>ENCONTRÁ A TU NUEVO COMPAÑERO</span>
			<h1>💗 Solicitud de adopción</h1>
			<p>Completá tus datos para comenzar el proceso de adopción.</p>
		</section>

		<section class="tarjeta-admin formulario-contenedor">
			<form action="${pageContext.request.contextPath}/SvSolicitudCrear"
				method="POST" class="formulario-admin">

				<label>Nombre</label> <input type="text" name="nombre_solicitante"
					required> <label>Apellido</label> <input type="text"
					name="apellido_solicitante" required> <label>Correo
					electrónico</label> <input type="email" name="correo" required> <label>Teléfono</label>
				<input type="text" name="telefono" required> <label>¿Por
					qué querés adoptar?</label>
				<textarea name="motivo" rows="5"
					placeholder="Contanos un poco sobre vos y por qué querés adoptar..."
					required></textarea>

				<label>Elegí el animal que querés adoptar</label>
<select name="idAnimal" required>
    <option value="">Seleccioná una mascota</option>

    <%
    if (listaAnimales != null) {
        for (Animal animal : listaAnimales) {
    %>
        <option value="<%=animal.getIdAnimal()%>">
            <%=animal.getNombre()%>
        </option>
    <%
        }
    }
    %>
</select>


				<button type="submit" class="boton-principal">Enviar
					solicitud 💗</button>

				<a class="boton-secundario"
					href="${pageContext.request.contextPath}/index.jsp">Volver al
					inicio</a>
			</form>
		</section>
	</main>

</body>
</html>
