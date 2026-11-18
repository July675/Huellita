
<%@ page import="java.util.List"%>
<%@ page import="com.app.logica.SolicitudAdopcion"%>
<%
List<SolicitudAdopcion> listaSolicitudes = (List<SolicitudAdopcion>) request.getAttribute("listaSolicitudes");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Solicitudes | Huellitas</title>
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
			<a href="${pageContext.request.contextPath}/index.jsp">Inicio</a> <a
				href="${pageContext.request.contextPath}/SvAnimalListar?vista=admin">Animales</a>
			<a href="${pageContext.request.contextPath}/SvRefugioListar">Refugios</a>
			<a href="${pageContext.request.contextPath}/SvEspecieListar">Especies</a>
			<a href="${pageContext.request.contextPath}/SvSolicitudListar">Solicitudes</a>
		</nav>
	</header>

	<main class="contenedor-admin">
		<section class="titulo-admin">
			<span>GESTIÓN DE HUELLITAS</span>
			<h1>💌 Solicitudes de adopción</h1>
			<p>Consultá y administrá las solicitudes enviadas por las
				personas interesadas.</p>
		</section>

		<section class="tarjeta-admin">
			<h2>Solicitudes recibidas</h2>

			<%
			if (listaSolicitudes != null && !listaSolicitudes.isEmpty()) {
			%>
			<div class="tabla-contenedor">
				<table>
					<thead>
						<tr>
							<th>ID</th>
							<th>Solicitante</th>
							<th>Correo</th>
							<th>Teléfono</th>
							<th>Animal</th>
							<th>Motivo</th>
							<th>Estado</th>
							<th>Fecha</th>
							<th>Acciones</th>
						</tr>
					</thead>
					<tbody>
						<%
						for (SolicitudAdopcion solicitud : listaSolicitudes) {
						%>
						<tr>
							<td><%=solicitud.getId_solicitud()%></td>
							<td><%=solicitud.getNombre_solicitante()%> <%=solicitud.getApellido_solicitante()%></td>
							<td><%=solicitud.getCorreo()%></td>
							<td><%=solicitud.getTelefono()%></td>
							<td><%=solicitud.getAnimal() != null ? solicitud.getAnimal().getNombre() : "Sin animal"%></td>
							<td><%=solicitud.getMotivo()%></td>
							<td><%=solicitud.getEstado() != null ? solicitud.getEstado() : "Pendiente"%></td>
							<td><%=solicitud.getFechaSolicitud() != null ? solicitud.getFechaSolicitud() : "Sin fecha"%></td>
							<td class="acciones"><a class="boton-editar"
								href="${pageContext.request.contextPath}/SvSolicitudEditar?id=<%= solicitud.getId_solicitud() %>">Editar</a>
								<a class="boton-eliminar"
								href="${pageContext.request.contextPath}/SvSolicitudEliminar?id=<%= solicitud.getId_solicitud() %>"
								onclick="return confirm('¿Seguro que querés eliminar esta solicitud?');">Eliminar</a>
							</td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
			<%
			} else {
			%>
			<p class="mensaje-vacio">Todavía no se recibieron solicitudes de
				adopción. 💗</p>
			<%
			}
			%>
		</section>
	</main>
</body>
</html>
