
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Huellitas | Encontrá tu compañero</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/estilos.css">
</head>

<body>

	<header class="encabezado">
		<a href="${pageContext.request.contextPath}/index.jsp" class="logo">
			🐾 Huellitas </a>

		<nav>
			<a href="${pageContext.request.contextPath}/index.jsp">Inicio</a> <a
				href="${pageContext.request.contextPath}/SvAnimalListar">Animales</a>
			<a href="#adoptar">Cómo adoptar</a> <a href="#nosotros">Nosotros</a>
		</nav>

		<a href="${pageContext.request.contextPath}/admin.jsp"
			class="boton-admin"> Administradores </a>
	</header>

	<main>


		<%
if (Boolean.TRUE.equals(session.getAttribute("solicitudEnviada"))) {
    session.removeAttribute("solicitudEnviada");
%>

<div class="mensaje-exito">
    <strong>¡Solicitud enviada!</strong>
    <p>Gracias por querer darle un hogar a uno de nuestros animales.</p>
    <span>Pronto nos pondremos en contacto con vos. 💗</span>
</div>

<%
}
%>
		<!-- PORTADA -->
		<section class="portada">
			<div class="portada-contenido">
				<span class="etiqueta">💗 Adoptar es dar una segunda
					oportunidad</span>

				<h1>
					Un hogar lleno de amor comienza con una <span>huellita.</span>
				</h1>

				<p>Miles de animales esperan encontrar una familia. Quizás uno
					de ellos esté esperando conocerte a vos.</p>

				<div class="portada-botones">
					<a href="${pageContext.request.contextPath}/SvAnimalListar"
						class="boton-principal"> Conocer animales ♥ </a> <a
						href="#adoptar" class="boton-secundario"> ¿Cómo adoptar? </a>
				</div>

				<div class="datos-portada">
					<div>
						<strong>🐶</strong> <span>Amigos fieles</span>
					</div>
					<div>
						<strong>🏠</strong> <span>Nuevos hogares</span>
					</div>
					<div>
						<strong>❤️</strong> <span>Mucho amor</span>
					</div>
				</div>
			</div>

			<div class="portada-decoracion">
				<div class="circulo-grande">
					<span>🐕</span> <span class="corazon">♥</span> <span class="huella">🐾</span>
				</div>
				<div class="mensaje-flotante">
					<strong>¡Adoptá!</strong> <span>Tu mejor amigo te espera</span>
				</div>
			</div>
		</section>

		<!-- ANIMALES -->
		<section class="seccion animales" id="animales">
			<div class="titulo-seccion">
				<span>ENCONTRÁ A TU COMPAÑERO</span>
				<h2>Hay alguien esperando por vos 🐾</h2>
				<p>Conocé a los animales que buscan una familia donde recibir
					cariño.</p>
			</div>

			<div class="tarjetas-animales">

				<article class="tarjeta-animal perro">
					<div class="animal-icono">🐶</div>
					<span class="animal-etiqueta">Amigos incondicionales</span>
					<h3>Perros</h3>
					<p>Compañeros llenos de energía, cariño y lealtad. ¡Uno puede
						convertirse en tu mejor amigo!</p>
					<a href="${pageContext.request.contextPath}/SvAnimalListar">
						Conocer animales → </a>
				</article>

				<article class="tarjeta-animal gato">
					<div class="animal-icono">🐱</div>
					<span class="animal-etiqueta">Pequeños grandes compañeros</span>
					<h3>Gatos</h3>
					<p>Compañeros independientes, curiosos y cariñosos que también
						necesitan un hogar.</p>
					<a href="${pageContext.request.contextPath}/SvAnimalListar">
						Conocer animales → </a>
				</article>

				<article class="tarjeta-animal familia">
					<div class="animal-icono">🐾</div>
					<span class="animal-etiqueta">Una nueva oportunidad</span>
					<h3>Una familia para todos</h3>
					<p>Cada animal tiene una historia y merece la oportunidad de
						comenzar una nueva.</p>
					<a href="${pageContext.request.contextPath}/SvAnimalListar">
						Ver animales → </a>
				</article>

			</div>
		</section>

		<!-- POR QUÉ ADOPTAR -->
		<section class="seccion razones" id="nosotros">
			<div class="titulo-seccion">
				<span>CAMBIÁ UNA VIDA</span>
				<h2>¿Por qué elegir la adopción?</h2>
			</div>

			<div class="razones-contenedor">
				<article class="razon">
					<div>❤️</div>
					<h3>Das una segunda oportunidad</h3>
					<p>Ayudás a un animal a comenzar una nueva etapa llena de
						cariño.</p>
				</article>

				<article class="razon">
					<div>🏡</div>
					<h3>Sumás un integrante a tu familia</h3>
					<p>Encontrás un compañero que estará a tu lado en cada momento.</p>
				</article>

				<article class="razon">
					<div>🐾</div>
					<h3>Ayudás a otros animales</h3>
					<p>Al adoptar, también contribuís a que otros animales puedan
						recibir ayuda.</p>
				</article>
			</div>
		</section>

		<!-- PASOS PARA ADOPTAR -->
		<section class="seccion proceso" id="adoptar">
			<div class="titulo-seccion">
				<span>ES MÁS FÁCIL DE LO QUE PENSÁS</span>
				<h2>¿Cómo podés adoptar?</h2>
				<p>Seguí estos tres pasos para comenzar esta hermosa
					experiencia.</p>
			</div>

			<div class="pasos">
				<article class="paso">
					<span class="numero">01</span>
					<div class="paso-icono">🔎</div>
					<h3>Conocé</h3>
					<p>Explorá los animales disponibles y encontrá a tu compañero
						ideal.</p>
				</article>

				<article class="paso">
					<span class="numero">02</span>
					<div class="paso-icono">📝</div>
					<h3>Completá</h3>
					<p>Enviá una solicitud con tus datos y contanos por qué querés
						adoptar.</p>
				</article>

				<article class="paso">
					<span class="numero">03</span>
					<div class="paso-icono">💗</div>
					<h3>Comenzá</h3>
					<p>Esperá el contacto del refugio para continuar el proceso de
						adopción.</p>
				</article>
			</div>

			<a href="${pageContext.request.contextPath}/SvFormularioAdopcion"
				class="boton-principal boton-adoptar"> Quiero adoptar ♥ </a>
		</section>

		<!-- INVITACIÓN FINAL -->
		<section class="invitacion">
			<div>
				<span>UNA HUELLA PUEDE CAMBIARLO TODO</span>
				<h2>El próximo capítulo de su historia puede ser con vos.</h2>
				<p>Animate a darle un hogar y recibí a cambio amor
					incondicional.</p>
			</div>

			<div class="invitacion-icono">🐶 💕 🐱</div>
		</section>

	</main>

	<footer>
		<div class="footer-logo">🐾 Huellitas</div>
		<p>Trabajamos para que cada animal encuentre una familia.</p>
		<span>Huellitas © 2026 - Todos los animales merecen un hogar.
			💗</span>
	</footer>

</body>
</html>
