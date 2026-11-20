<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Huellitas | Guía para estudiar el sistema</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilos.css">
</head>
<body class="pagina-guia">
<header class="encabezado">
  <a href="${pageContext.request.contextPath}/index.jsp" class="logo">🐾 Huellitas</a>
  <nav>
    <a href="${pageContext.request.contextPath}/index.jsp">Inicio</a>
    <a href="${pageContext.request.contextPath}/SvAnimalListar">Animales</a>
    <a href="${pageContext.request.contextPath}/admin.jsp">Administración</a>
    <a href="#arquitectura">Arquitectura</a>
  </nav>
  <a href="${pageContext.request.contextPath}/admin.jsp" class="boton-admin">Volver al sistema</a>
</header>

<main class="guia">
  <section class="guia-portada">
    <span class="guia-etiqueta">MATERIAL DE ESTUDIO · JAVA WEB + JPA</span>
    <h1>Entendé cómo funciona <strong>Huellitas</strong></h1>
    <p>Una guía interactiva para seguir cada dato desde la página web hasta MySQL: qué archivo interviene, qué método se ejecuta y por qué.</p>
    <div class="guia-portada-acciones">
      <a class="guia-boton" href="#arquitectura">Empezar por la arquitectura ↓</a>
      <a class="guia-boton secundario" href="#operaciones">Explorar operaciones</a>
    </div>
    <div class="guia-resumen">
      <div><b>4</b><span>entidades principales</span></div>
      <div><b>4</b><span>capas de trabajo</span></div>
      <div><b>CRUD</b><span>crear, leer, editar y borrar</span></div>
    </div>
  </section>

  <aside class="guia-aviso"><b>Cómo usar esta guía:</b> elegí una sección del menú, avanzá por los pasos y relacioná cada explicación con el archivo real de tu repositorio. Los nombres de clases y rutas de los ejemplos corresponden al código de Huellitas.</aside>

  <div class="guia-layout">
    <aside class="guia-indice">
      <b>CONTENIDOS</b>
      <a href="#mapa">01 · Mapa del proyecto</a>
      <a href="#arquitectura">02 · Las capas</a>
      <a href="#entidades">03 · Entidades y relaciones</a>
      <a href="#operaciones">04 · Operaciones CRUD</a>
      <a href="#animal">05 · Ejemplo completo: Animal</a>
      <a href="#jpa">06 · JPA e Hibernate</a>
      <a href="#web">07 · HTTP, GET y POST</a>
      <a href="#errores">08 · Errores frecuentes</a>
      <a href="#glosario">09 · Glosario</a>
      <a href="#repaso">10 · Preguntas para practicar</a>
    </aside>

    <div class="guia-contenido">
      <section id="mapa" class="guia-seccion">
        <span class="guia-numero">01 / ESTRUCTURA</span><h2>Mapa del proyecto</h2>
        <p>Huellitas es una aplicación web Java empaquetada como <code>WAR</code>. Está organizada en paquetes Java y páginas JSP.</p>
        <div class="guia-arbol">
          <div>📁 <b>src/main/java/com/app/</b></div>
          <div class="nivel">📁 <b>logica</b> — Animal, Especie, Refugio, SolicitudAdopcion, ControladoraLogica</div>
          <div class="nivel">📁 <b>persistencia</b> — ControladoraPersistencia y los cuatro *JpaController</div>
          <div class="nivel">📁 <b>servlets</b> — SvAnimal..., SvEspecie..., SvRefugio..., SvSolicitud...</div>
          <div>📁 <b>src/main/resources/META-INF/</b></div>
          <div class="nivel">📄 persistence.xml — configuración de la unidad mi-unidad-jpa</div>
          <div>📁 <b>src/main/webapp/</b></div>
          <div class="nivel">📄 index.jsp, admin.jsp — páginas principales</div>
          <div class="nivel">📁 WEB-INF/vistas — JSP de listados y formularios</div>
          <div class="nivel">📁 css — estilos.css</div>
          <div class="nivel">📁 imagenes — fotografías de animales</div>
          <div>📄 <b>pom.xml</b> — dependencias Maven y configuración de compilación</div>
        </div>
        <div class="guia-nota"><b>Importante:</b> las JSP dentro de <code>WEB-INF/vistas</code> no se abren escribiendo su ruta directamente en el navegador. Se llega a ellas mediante un Servlet que hace <code>forward()</code>.</div>
      </section>

      <section id="arquitectura" class="guia-seccion">
        <span class="guia-numero">02 / ARQUITECTURA</span><h2>Las capas: quién hace cada trabajo</h2>
        <p>La aplicación separa responsabilidades. Cada capa se comunica con la que tiene debajo; así, una JSP no ejecuta consultas SQL ni un Servlet administra directamente el EntityManager.</p>
        <div class="guia-flujo-vertical">
          <article><span>1</span><div><b>Vista — JSP + navegador</b><p>Muestra formularios, botones, tablas y datos. Envía solicitudes HTTP al Servlet.</p><small>Ejemplos: animalesAdmin.jsp, animalEditar.jsp, formularioAdopcion.jsp</small></div></article>
          <article><span>2</span><div><b>Presentación — Servlets</b><p>Recibe GET o POST, lee parámetros, crea/recupera objetos, llama a la lógica y decide si hace forward o redirect.</p><small>Ejemplos: SvAnimalCrear, SvAnimalEditar, SvAnimalListar</small></div></article>
          <article><span>3</span><div><b>Lógica — ControladoraLogica</b><p>Aplica reglas y validaciones antes de permitir una operación. No ejecuta directamente JPA.</p><small>Archivo: com.app.logica.ControladoraLogica</small></div></article>
          <article><span>4</span><div><b>Persistencia — ControladoraPersistencia + JpaController</b><p>La controladora delega en el controlador de cada entidad. El JpaController utiliza EntityManager para consultar o modificar.</p><small>Ejemplos: AnimalJpaController, EspecieJpaController</small></div></article>
          <article><span>5</span><div><b>Base de datos — MySQL</b><p>Guarda los registros en las tablas animales, especies, refugios y solicitudes_adopcion.</p><small>Configuración en persistence.xml · unidad mi-unidad-jpa</small></div></article>
        </div>
        <div class="guia-codigo"><b>Regla para memorizar</b><code>JSP → Servlet → ControladoraLogica → ControladoraPersistencia → JpaController → MySQL</code><p>La respuesta vuelve desde el servidor hacia el navegador para mostrar el resultado.</p></div>
      </section>

      <section id="entidades" class="guia-seccion">
        <span class="guia-numero">03 / MODELO DE DATOS</span><h2>Entidades y relaciones</h2>
        <p>Una entidad es una clase Java que JPA mapea a una tabla. En Huellitas las clases tienen <code>@Entity</code>, una clave primaria con <code>@Id</code> y generación automática con <code>@GeneratedValue</code>.</p>
        <div class="guia-tarjetas">
          <article><h3>🐶 Animal</h3><p>Tabla <code>animales</code>. Guarda nombre, edad, sexo, descripción, estado y foto.</p><p>Se relaciona con un refugio y una especie mediante <code>@ManyToOne</code>.</p></article>
          <article><h3>🐾 Especie</h3><p>Tabla <code>especies</code>. Guarda nombre y descripción.</p><p>Una especie puede estar asociada a muchos animales.</p></article>
          <article><h3>🏠 Refugio</h3><p>Tabla <code>refugios</code>. Guarda nombre, dirección, teléfono y correo.</p><p>Un refugio puede tener muchos animales.</p></article>
          <article><h3>📝 SolicitudAdopcion</h3><p>Tabla <code>solicitudes_adopcion</code>. Guarda datos del solicitante, motivo, estado y fecha.</p><p>Se relaciona con un animal mediante <code>@ManyToOne</code>.</p></article>
        </div>
        <div class="guia-nota"><b>¿Qué significa ManyToOne?</b> Muchas filas de una entidad pueden apuntar a una misma fila de la otra. Por ejemplo, varios animales pueden pertenecer al mismo refugio. <code>@JoinColumn(name="id_refugio")</code> indica la columna que guarda esa clave foránea.</div>
        <div class="guia-codigo"><b>Ejemplo real de Animal.java</b><pre>@Entity
@Table(name = "animales")
public class Animal implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_animal;

    @ManyToOne
    @JoinColumn(name = "id_refugio")
    private Refugio refugio;

    @ManyToOne
    @JoinColumn(name = "id_especie")
    private Especie especie;
}</pre></div>
      </section>

      <section id="operaciones" class="guia-seccion">
        <span class="guia-numero">04 / CRUD</span><h2>Las cuatro operaciones principales</h2>
        <p>CRUD son las siglas de Create, Read, Update y Delete. Seleccioná una operación para ver cómo se aplica en Huellitas.</p>
        <div class="guia-tabs" role="tablist">
          <button class="activo" data-tab="crear">Crear</button><button data-tab="leer">Leer</button><button data-tab="editar">Editar</button><button data-tab="eliminar">Eliminar</button>
        </div>
        <div class="guia-tab-panel activo" id="tab-crear">
          <h3>CREATE · Dar de alta</h3><p>Ejemplo: registrar un nuevo animal.</p>
          <ol><li>El formulario envía un <code>POST</code> a <code>/SvAnimalCrear</code>.</li><li><code>SvAnimalCrear.doPost()</code> lee nombre, edad, sexo, estado, idRefugio e idEspecie.</li><li>Busca el refugio y la especie seleccionados y arma un objeto <code>Animal</code>.</li><li>Si se adjunta foto, valida que sea imagen y la guarda en <code>/imagenes</code>.</li><li>Llama a <code>control.crearAnimal(animal)</code>.</li><li>La lógica valida los datos; persistencia delega en <code>animalJpa.crear()</code>.</li><li>JPA ejecuta <code>persist()</code> dentro de una transacción y luego se redirige al listado.</li></ol>
          <div class="guia-codigo"><b>Método JPA:</b><code>em.getTransaction().begin();<br>em.persist(animal);<br>em.getTransaction().commit();</code></div>
        </div>
        <div class="guia-tab-panel" id="tab-leer">
          <h3>READ · Consultar o listar</h3><p>Ejemplo: mostrar todos los animales.</p>
          <ol><li>El navegador solicita <code>GET /SvAnimalListar</code>.</li><li><code>SvAnimalListar.doGet()</code> llama a <code>buscarTodosLosAnimales()</code>.</li><li>La controladora lógica delega en persistencia y <code>AnimalJpaController</code>.</li><li>El JpaController ejecuta JPQL: <code>SELECT a FROM Animal a</code>.</li><li>El Servlet guarda la lista en <code>request.setAttribute("listaAnimales", listaAnimales)</code>.</li><li>Hace <code>forward()</code> a <code>animales.jsp</code> o <code>animalesAdmin.jsp</code> según el parámetro <code>vista=admin</code>.</li></ol>
          <div class="guia-codigo"><b>Consulta real:</b><code>em.createQuery("SELECT a FROM Animal a", Animal.class).getResultList();</code><p>JPQL consulta entidades y atributos Java, no nombres de tablas y columnas SQL directamente.</p></div>
        </div>
        <div class="guia-tab-panel" id="tab-editar">
          <h3>UPDATE · Editar un registro</h3><p>La edición tiene dos momentos: mostrar el formulario y guardar los cambios.</p>
          <ol><li>El enlace envía <code>GET /SvAnimalEditar?id=...</code>.</li><li><code>doGet()</code> obtiene el id, llama a <code>buscarAnimal(id)</code> y busca refugios y especies para los select.</li><li>Guarda los objetos como atributos del request y hace <code>forward()</code> a <code>animalEditar.jsp</code>.</li><li>El formulario envía un <code>POST</code> al mismo Servlet con el id y los campos editados.</li><li><code>doPost()</code> vuelve a buscar el animal, actualiza sus atributos y conserva la foto anterior si no se sube otra.</li><li>Llama a <code>control.editarAnimal(animal)</code>; la lógica valida y persistencia delega.</li><li><code>AnimalJpaController.editarAnimal()</code> usa <code>merge()</code> y confirma la transacción.</li><li>El Servlet redirige al listado de administración.</li></ol>
          <div class="guia-codigo"><b>Método JPA:</b><code>em.getTransaction().begin();<br>em.merge(animal);<br>em.getTransaction().commit();</code><p><code>merge()</code> sincroniza el estado del objeto con la base de datos.</p></div>
        </div>
        <div class="guia-tab-panel" id="tab-eliminar">
          <h3>DELETE · Eliminar un registro</h3><p>Ejemplo: eliminar un animal.</p>
          <ol><li>El formulario de la tabla envía <code>POST /SvAnimalEliminar</code> con el id.</li><li>El Servlet llama a <code>control.eliminarAnimal(id)</code>.</li><li>La lógica comprueba que el animal exista y revisa si tiene solicitudes de adopción asociadas.</li><li>Si hay solicitudes, lanza una excepción y no permite borrar el animal.</li><li>Si no hay relaciones que lo impidan, persistencia llama a <code>AnimalJpaController.eliminarAnimal()</code>.</li><li>El JpaController busca con <code>find()</code>, elimina con <code>remove()</code> y confirma con <code>commit()</code>.</li><li>El Servlet redirige al listado; si ocurre una excepción, codifica el mensaje en la URL.</li></ol>
          <div class="guia-codigo"><b>Métodos JPA:</b><code>Animal animal = em.find(Animal.class, id);<br>if (animal != null) em.remove(animal);</code><p>La lógica también protege las relaciones: no se elimina un refugio con animales asociados ni una especie que esté siendo utilizada.</p></div>
        </div>
      </section>

      <section id="animal" class="guia-seccion">
        <span class="guia-numero">05 / CASO COMPLETO</span><h2>Seguí un animal de principio a fin</h2>
        <p>Este es el recorrido de una consulta de animales en el código real.</p>
        <div class="guia-recorrido">
          <div><b>1. Navegador</b><code>GET /SvAnimalListar</code><p>El usuario entra a la sección Animales.</p></div>
          <div><b>2. Servlet</b><code>SvAnimalListar.doGet()</code><p>Recibe la solicitud HTTP y llama a la controladora.</p></div>
          <div><b>3. Lógica</b><code>buscarTodosLosAnimales()</code><p>Coordina la consulta y delega la tarea.</p></div>
          <div><b>4. Persistencia</b><code>animalJpa.buscarTodosLosAnimales()</code><p>Abre EntityManager y ejecuta la consulta JPQL.</p></div>
          <div><b>5. MySQL</b><code>SELECT ... FROM animales</code><p>Devuelve los registros a Hibernate/JPA.</p></div>
          <div><b>6. JSP</b><code>animales.jsp</code><p>La lista llega en request y se muestra al usuario.</p></div>
        </div>
        <p class="guia-pista">Para probarlo en tu código, abrí estos archivos en orden: <code>SvAnimalListar.java</code> → <code>ControladoraLogica.java</code> → <code>ControladoraPersistencia.java</code> → <code>AnimalJpaController.java</code> → <code>animales.jsp</code>.</p>
      </section>

      <section id="jpa" class="guia-seccion">
        <span class="guia-numero">06 / PERSISTENCIA</span><h2>JPA, Hibernate y EntityManager</h2>
        <p><b>JPA</b> es la especificación/API que define cómo persistir objetos Java. <b>Hibernate</b> es la implementación que usa este proyecto. Traduce operaciones sobre objetos y JPQL a SQL para MySQL.</p>
        <div class="guia-tarjetas dos">
          <article><h3>EntityManagerFactory</h3><p>Fábrica que crea EntityManager. Se inicializa con la unidad de persistencia.</p><code>Persistence.createEntityManagerFactory("mi-unidad-jpa")</code></article>
          <article><h3>EntityManager</h3><p>Administra las entidades y ejecuta operaciones como find, persist, merge y remove.</p><code>em.close()</code> al terminar.</article>
          <article><h3>Transacción</h3><p>Agrupa cambios. begin inicia, commit confirma y rollback revierte si corresponde.</p><code>begin() → operación → commit()</code></article>
          <article><h3>JPQL</h3><p>Lenguaje de consultas orientado a entidades Java.</p><code>SELECT e FROM Especie e</code></article>
        </div>
        <h3 class="guia-subtitulo">Anotaciones que aparecen en las entidades</h3>
        <ul class="guia-lista"><li><code>@Entity</code>: marca la clase como entidad persistente.</li><li><code>@Table(name="...")</code>: indica el nombre de la tabla.</li><li><code>@Id</code>: identifica la clave primaria.</li><li><code>@GeneratedValue(strategy=IDENTITY)</code>: delega la generación del id a la base.</li><li><code>@ManyToOne</code>: representa una relación de muchos a uno.</li><li><code>@JoinColumn</code>: especifica la columna que almacena la clave foránea.</li><li><code>@Temporal(DATE)</code>: define cómo persistir un atributo Date como fecha.</li></ul>
        <div class="guia-nota"><b>Configuración de Huellitas:</b> <code>persistence.xml</code> define la unidad <code>mi-unidad-jpa</code>, el driver MySQL, la URL local <code>jdbc:mysql://localhost:3306/huellitas</code> y <code>hibernate.hbm2ddl.auto=update</code>.</div>
      </section>

      <section id="web" class="guia-seccion">
        <span class="guia-numero">07 / WEB</span><h2>HTTP: GET, POST, forward y redirect</h2>
        <div class="guia-tarjetas dos">
          <article><h3>GET</h3><p>Solicita información. Se usa para listar o mostrar un formulario de edición.</p><code>doGet()</code></article>
          <article><h3>POST</h3><p>Envía datos para crear, actualizar o eliminar. No conviene enviar cambios mediante GET.</p><code>doPost()</code></article>
          <article><h3>forward()</h3><p>El servidor deriva internamente a una JSP. Conserva los atributos del request.</p><code>request.getRequestDispatcher(...).forward(...)</code></article>
          <article><h3>sendRedirect()</h3><p>Le pide al navegador que haga otra solicitud a una URL. Se usa, por ejemplo, después de guardar.</p><code>response.sendRedirect(...)</code></article>
        </div>
        <h3 class="guia-subtitulo">Códigos HTTP que tenés que reconocer</h3>
        <div class="guia-http"><div><b>200</b><span>OK · La solicitud se atendió correctamente.</span></div><div><b>302</b><span>Found · Redirección a otra URL.</span></div><div><b>404</b><span>Not Found · No se encontró el recurso o registro.</span></div><div><b>500</b><span>Internal Server Error · Falló el procesamiento en el servidor.</span></div></div>
      </section>

      <section id="errores" class="guia-seccion">
        <span class="guia-numero">08 / DEPURACIÓN</span><h2>Errores frecuentes y cómo pensarlos</h2>
        <div class="guia-acordeon">
          <details><summary>HTTP 500 al ejecutar un Servlet</summary><p>El servidor encontró una excepción. Leé la primera causa concreta del stack trace y la línea de tu código que aparece en él. Puede ser un parámetro nulo, un error de JPA o una excepción de base de datos.</p></details>
          <details><summary>NumberFormatException: Cannot parse null string</summary><p>Un <code>Integer.parseInt(request.getParameter("id"))</code> recibió null. Revisá que el formulario tenga un campo con <code>name="id"</code> y que el método esté recibiendo el formulario correcto.</p></details>
          <details><summary>EntityNotFound o registro inexistente</summary><p><code>find(Entidad.class, id)</code> devuelve null cuando no encuentra esa clave primaria. Comprobá el id recibido antes de modificar o borrar.</p></details>
          <details><summary>Too many connections</summary><p>La base rechazó nuevas conexiones. Revisá cuántas EntityManagerFactory se crean y que cada EntityManager se cierre. En este repositorio, los controladores JPA crean su propia fábrica en el constructor: es un punto importante para estudiar y revisar.</p></details>
          <details><summary>404 al abrir una JSP dentro de WEB-INF</summary><p>Las vistas protegidas dentro de WEB-INF se deben alcanzar mediante el Servlet usando RequestDispatcher.forward(). No se accede a ellas directamente desde la barra del navegador.</p></details>
          <details><summary>El formulario no manda un parámetro</summary><p>En Servlet se lee el atributo <code>name</code> del input, no el <code>id</code> HTML. Compará exactamente <code>request.getParameter("...")</code> con <code>name="..."</code>.</p></details>
        </div>
      </section>

      <section id="glosario" class="guia-seccion">
        <span class="guia-numero">09 / VOCABULARIO</span><h2>Glosario rápido</h2>
        <dl class="guia-glosario">
          <dt>Servlet</dt><dd>Clase Java que recibe y responde solicitudes HTTP.</dd>
          <dt>JSP</dt><dd>Página del servidor que genera HTML y muestra datos.</dd>
          <dt>Entidad</dt><dd>Objeto Java que JPA persiste en una tabla.</dd>
          <dt>CRUD</dt><dd>Crear, leer, actualizar y eliminar.</dd>
          <dt>DAO / JpaController</dt><dd>Componente que concentra el acceso a los datos.</dd>
          <dt>ORM</dt><dd>Mapeo objeto-relacional: relaciona clases/objetos con tablas/filas.</dd>
          <dt>JPQL</dt><dd>Lenguaje de consultas que trabaja con entidades y sus atributos.</dd>
          <dt>Clave primaria</dt><dd>Identificador único de cada fila.</dd>
          <dt>Clave foránea</dt><dd>Columna que referencia la clave primaria de otra tabla.</dd>
          <dt>Request</dt><dd>Objeto que contiene datos de una solicitud y atributos temporales.</dd>
          <dt>Session</dt><dd>Permite conservar datos entre varias solicitudes del mismo usuario.</dd>
          <dt>WAR</dt><dd>Paquete desplegable de una aplicación web Java.</dd>
        </dl>
      </section>

      <section id="repaso" class="guia-seccion guia-repaso">
        <span class="guia-numero">10 / AUTOEVALUACIÓN</span><h2>Comprobá si entendiste</h2>
        <p>Respondé y después desplegá la explicación para comprobar tu razonamiento.</p>
        <div class="guia-acordeon">
          <details><summary>1. ¿Qué clase valida que un animal tenga nombre y edad válida?</summary><p><b>ControladoraLogica.</b> El Servlet recibe los datos; la lógica aplica las reglas del negocio antes de delegar el guardado.</p></details>
          <details><summary>2. ¿Qué diferencia hay entre persist() y merge()?</summary><p><b>persist()</b> registra una entidad nueva. <b>merge()</b> sincroniza los cambios de una entidad existente con la persistencia.</p></details>
          <details><summary>3. ¿Por qué el listado usa forward y el alta usa redirect?</summary><p>El listado necesita enviar atributos a una JSP dentro de la misma solicitud (forward). Después de guardar, redirect hace que el navegador solicite nuevamente el listado.</p></details>
          <details><summary>4. ¿Dónde se comprueba si un animal tiene solicitudes antes de eliminarlo?</summary><p>En <b>ControladoraLogica.eliminarAnimal()</b>. Allí se recorren las solicitudes y se impide el borrado si alguna referencia al animal.</p></details>
          <details><summary>5. ¿Qué archivo indica cómo conectarse a MySQL?</summary><p><b>src/main/resources/META-INF/persistence.xml</b>, dentro de la unidad de persistencia <code>mi-unidad-jpa</code>.</p></details>
          <details><summary>6. ¿Qué pasa si request.getParameter("id") no encuentra el campo?</summary><p>Devuelve <code>null</code>. Si se pasa directamente a <code>Integer.parseInt()</code>, se produce una NumberFormatException.</p></details>
        </div>
        <a class="guia-boton" href="#mapa">Volver al comienzo ↑</a>
      </section>
    </div>
  </div>
</main>
<footer><div class="footer-logo">🐾 Huellitas</div><p>Guía de estudio del funcionamiento interno del proyecto.</p><span>Material educativo · Proyecto Huellitas</span></footer>
<script>
document.querySelectorAll('.guia-tabs button').forEach(function(btn) {
  btn.addEventListener('click', function() {
    document.querySelectorAll('.guia-tabs button').forEach(function(b) { b.classList.remove('activo'); });
    document.querySelectorAll('.guia-tab-panel').forEach(function(p) { p.classList.remove('activo'); });
    btn.classList.add('activo');
    document.getElementById('tab-' + btn.dataset.tab).classList.add('activo');
  });
});
</script>
</body>
</html>