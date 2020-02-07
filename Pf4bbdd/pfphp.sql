-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-02-2020 a las 21:55:56
-- Versión del servidor: 10.1.34-MariaDB
-- Versión de PHP: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pfphp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `idcita` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`idcita`, `fecha`, `cliente`) VALUES
(1, '2020-02-08 00:00:00', 1),
(2, '2020-02-10 22:02:00', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idcliente` int(11) NOT NULL,
  `nombre` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `apellidos` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idcliente`, `nombre`, `apellidos`, `telefono`, `usuario`) VALUES
(1, 'Ana Elena', 'López Mohedano', '699784014', 2),
(2, 'Admin', 'Admin', '', 1),
(3, 'Ana', 'L M', '600000000', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticias`
--

CREATE TABLE `noticias` (
  `idnoticia` int(11) NOT NULL,
  `titular` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `encabezado` text COLLATE utf8_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `imagen` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `cuerpo` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `noticias`
--

INSERT INTO `noticias` (`idnoticia`, `titular`, `encabezado`, `fecha`, `imagen`, `cuerpo`) VALUES
(1, '10 errores que se suelen cometer al crear una web', 'Seguro que muchos no los conocías y te pueden ser muy útiles a la hora de crear tu página web a medida.', '2019-10-29', 'errores-cometer-web.jpg', '<div class=\"block-text\"><p>Crear una web puede parecer sencillo, sin embargo, es muy importante tener en cuenta algunos errores que se suelen cometer al crear una web y que pueden <strong>poner en peligro su posicionamiento</strong>. Recordemos que esta debe ofrecer una buena experiencia al usuario y resultar atractiva. En caso contrario, será muy difícil que podamos conseguir los objetivos que nos propongamos.</p><p>Una agencia de diseño web como la nuestra suele tener muy en cuenta los errores que te vamos a comentar a continuación y que, puede, que ya hayas cometido cuando creaste tu página web. Una agencia de diseño web puede <strong>ayudarte a enmendar las equivocaciones</strong> que, sin darte cuenta, has podido hacer. Sin embargo, seguro que te interesa saber qué es lo que has podido hacer y que no deberías, ya que perjudica seriamente tu página web.</p><h2>1. Diseño web poco profesional</h2><p>Crear un <a href=\"https://galernaestudio.com/diseno-web-en-wordpress/\" target=\"_blank\" rel=\"noopener\" title=\"diseño web en WordPress\">diseño web en WordPress</a> puede ser relativamente sencillo, ya que cuentas con plantillas que te ayudarán a darle a tu página un <strong>toque profesional</strong>. Sin embargo, quizás no hayas elegido la más adecuada o no le hayas sabido sacar todo el partido que esa plantilla podría darte.</p><p>Recuerda que, a pesar de que las plantillas ya vienen con todos los elementos dispuestos, tú puedes darle tu propio toque personal añadiendo tu logotipo, cambiando la tipografía, los elementos que aparecen en la landing page, etcétera. <strong>Un buen diseño marcará la diferencia entre una web atractiva de una que no lo es</strong> y, además, será indispensable para mejorar la experiencia de los usuarios.</p><h2>2. Contenido de poco valor</h2><p>Otro de los errores que se suelen cometer al crear una web es <strong>llenarla de contenido de poco valor</strong>. Frases que reproducen otras empresas en sus páginas y que no transmiten nada, incluso errores que pueden echar por tierra en pocos segundos la credibilidad de la web para los usuarios.</p><p>Por esta razón, <strong>es conveniente pensar muy bien en el contenido que vamos a publicar en la página web</strong>. No es lo mismo decir en la Home Page de la web “Empresa de marketing y comunicación” que “Comunica mejor tu producto y llega al cliente que deseas”.</p><h2>3. No se ha trabajado el SEO</h2><p>Si la página web es de reciente creación, se puede entender que todo el <strong>trabajo que se esté realizando con respecto al SEO todavía no haya dado sus frutos</strong>. Sin embargo, existen algunos errores que se pueden cometer aun cuando estemos centrados en esta labor.</p><p>La web no estará optimizada para los buscadores si contiene <strong>metadescripciones y títulos duplicados, artículos con muy poco texto y de baja calidad, estrategias Black Hat SEO</strong>… Todo esto solo penalizará a la página web en lugar de arrojar beneficios.</p><h2>4. El dominio es confuso</h2><p><strong>El dominio de la página web debe ser claro</strong> y, por ello, no debe de ser demasiado extenso. Por esta razón, debemos tener en cuenta que sea fácil de pronunciar, simple (si hay que reducir palabras se reducen) y que sea significativo. Los usuarios deben saber ya, a través del dominio, con lo que se van a encontrar.</p><p>Con todo, <strong>hay que evitar utilizar guiones, palabras con “ñ” y los números</strong>. Recordemos que debe ser un dominio sencillo y sin demasiadas florituras. De esta manera, los clientes también lo recordarán mejor.</p><h2>5. Pop-ups inmediatos</h2><p>Si bien es cierto que los pop-ups son una excelente herramienta para guiar a los usuarios a que se suscriban o que vayan a la sección de rebajas en la que podrán encontrar productos a buen precio en nuestra web, pueden resultar desagradables si no dejan de salir durante la navegación y <strong>dificultan la lectura</strong>.</p><p>En muchas ocasiones, nada más entrar en una web aparece un pop-up para suscribirse. Pero, el usuario aún no ha tenido tiempo de ver la página y saber si, realmente, le puede interesar o no esa suscripción. Por lo tanto, <strong>es mejor reducir el número de pop-ups</strong> y evitar que estos aparezcan al segundo de haber entrado en la página.</p><h2>6. Funciones dañadas</h2><p>Otro de los errores que se suelen cometer al crear una web y que denotan una falta de actualización y de vigilar si todo está funcionando como debiera son las funciones que están dañadas. Por ejemplo, <strong>si la página de contacto da error o el botón de “enviar mensaje” no funciona</strong>.</p><p>A veces, también puede haber páginas en las que se solicite introducir los datos de usuarios para recibir un boletín o cualquier otro elemento en el correo del usuario, pero esto no aparece por ninguna parte. Estos son <strong>errores que hay que subsanar lo antes posible</strong>.</p><h2>7. La carga de la web es lenta</h2><p>Aunque pueda parecer un elemento difícil de resolver, en realidad, <strong>la velocidad de carga tiene una sencilla solución</strong>. Tan solo, se trata de hacer cambios importantes en la página web que ayudarán a mejorar la experiencia del usuario y a que la velocidad de carga no sea tan lenta.</p><p>Algunos cambios pueden ser <strong>evitar utilizar imágenes demasiado pesadas, reducir el tamaño de los vídeos (o limitarlos) y las animaciones</strong>. Todo esto, ya supondrá un gran cambio una vez se implementen estas acciones.</p><h2>8. La web no es responsive</h2><p>La característica responsive para una página web es fundamental, pues en la actualidad todos llevamos encima el móvil desde el cual solemos navegar por las páginas web. Sin embargo, <strong>¿cuántas veces nos hemos encontrado con alguna que no se adapta a las características del móvil y, por ello, el contenido no lo podemos ver cómodamente?</strong></p><p>Este es un gran error y es que uno de los primeros pasos que hay que realizar es hacer que <strong>el sitio web se adapte a otros dispositivos</strong> como los móviles, tablets, etc. De esta manera, la navegación será fluida y fácil para los usuarios.</p><h2>9. Estructura de contenido poco intuitiva</h2><p>Si los usuarios que entran en la página web <strong>se pierden o no saben dónde encontrar lo que buscan</strong>, es que esta no es intuitiva. Esto es un gran error que puede hacer que se reduzcan las posibilidades de que las personas entren en nuestra web.</p><p>Por esta razón, es conveniente antes de crear un web <strong>hacer un breve esquema de aquellos elementos que queremos que aparezcan y su posible distribución</strong>. Recordemos que esta debe ser sencilla y lógica. Por ejemplo, no debe aparecer un portfolio como primera página, sino que es mucho mejor una presentación de quiénes somos y qué hacemos.</p><h2>10. Enlaces rotos</h2><p>El último de los errores que se suelen cometer al crear una web son los <strong>enlaces rotos que no llevan a ninguna parte</strong>. Esto puede ser terrible para los usuarios que desearían poder acceder a la información que se brinda en ese link. Por esa razón, hay que elegir bien los enlaces y revisar, con frecuencia, si siguen funcionando.</p><p>Con todo, estos son algunos de los errores más frecuentes que se suelen cometer al crear una web que podemos tener en cuenta para resolverlos y no volver a caer en ellos. Todos ellos pueden <strong>hacer peligrar el interés que los usuarios puedan tener en nuestros servicios o lo que vendemos</strong>. Por lo tanto, es muy importante prestarles atención y evitar cometerlos. &nbsp;</p></div>'),
(2, 'Principales diferencias entre diseño y desarrollo web', 'Ambas disciplinas son necesarias en la creación de una página web, pero ¿Son el Diseño web y el Desarrollo web lo mismo?', '2019-05-20', 'diferencia-diseno-web-desarrollo-web.jpg', '<div class=\"block-text\"><p>El sector de la<strong> creación de páginas <a href=\"https://lanubedealgodon.com/una-marca-de-coches-sustituye-los-vehiculos-por-perros-en-su-web-y-consigue-50-adopciones-en-un-dia/\" title=\"web\">web</a> y el marketing digital</strong> ha evolucionado de forma exponencial en los últimos años. Y lo sigue haciendo a buen ritmo, incluyendo todas las disciplinas que abarca: diseño, desarrollo, maquetación, usabilidad, SEO, SEM y un largo etcétera.</p><p>Dado que se trata de un<strong> campo relativamente nuevo</strong> y que, como comentábamos arriba, evoluciona a una velocidad de vértigo, surgen con frecuencia <strong>nuevos términos</strong>. Y algunos provocan confusión. En este sentido, vamos a analizar <strong>dos de los principales</strong> conceptos vinculados a la creación de webs, <strong><a href=\"https://www.latevaweb.com/\" title=\"Diseño web\">diseño web</a> y desarrollo web</strong>, y qué diferencias existen entre ellos.</p><h2>¿Qué es el Diseño web?</h2><p>El Diseño web es la disciplina que se encarga de <strong>definir el apartado visual de un sitio web</strong>. Junto con otros campos relacionados, como la usabilidad o la experiencia de usuario, el Diseño web prepara la parte visible de una web utilizando herramientas de diseño, sin entrar en desarrollar el sitio web utilizando lenguajes de programación.</p><h2>¿Qué es el Desarrollo web?</h2><p>El Desarrollo web es el campo que<strong> implementa las distintas funcionalidades de un sitio web a través de lenguajes de programación</strong>. Se encarga de aspectos como la creación o instalación de un gestor para la web, o la conexión con bases de datos u otras fuentes de información.</p><p>En el área del Desarrollo web se suele diferenciar entre la <strong>programación Front-end y Back-end</strong>. La primera alude al traslado de un diseño web a los lenguajes de programación utilizados por los navegadores web (HTML, CSS y Javascript, complementados con librerías y frameworks); mientras que la segunda está vinculada al desarrollo de las funcionalidades en el servidor que aloja y ejecuta una web.</p><h2>¿Qué diferencias hay entre Diseño web y Desarrollo web?</h2><p>Como hemos visto a través de las definiciones de ambos términos, las <strong>diferencias entre Diseño web y Desarrollo web son bastante explícitas</strong>. El Diseño web se encarga de definir el apartado visual de una web; mientras que el Desarrollo web traslada esta propuesta de diseño a los lenguajes de programación web, tanto a nivel de Front-end como de Back-end.</p><p><strong>¿Dónde radica, entonces, la confusión entre los dos términos?</strong> Principalmente en el <strong>uso genérico que se la da a Diseño web</strong>. Habitualmente cuando hablamos de Diseño web <strong>vinculamos el término a todo el proceso de creación de una web</strong>, incluyendo el apartado visual y la programación.</p><p>En ocasiones también se emplea <strong>Desarrollo web para aludir a la generación de una web</strong>, <strong>obviando que</strong> para realizar su desarrollo, <strong>necesitaremos partir de un diseño web</strong>.</p><h2>¿Qué es más importante, Diseño web o Desarrollo web?</h2><p><strong>Depende</strong>. Dado que cada proyecto web cuenta con sus especificaciones propias, los requisitos de Diseño web y Desarrollo web variarán en consecuencia. Es posible que para una web corporativa, orientada únicamente a la presentación de servicios, no requiramos de un alto nivel de desarrollo web y centremos gran parte de los esfuerzos en su diseño. Por el contrario, en una tienda on-line multinacional coordinada con un complejo sistema de stock, el desarrollo web será clave para incorporar todas las funcionalidades necesarias para su correcto funcionamiento.</p><p>En <strong>La Teva Web</strong> realizamos <strong>webs a medida</strong>, creando diseños únicos para cada proyecto y programando todas las funcionalidades específicas que requieren. Si necesitas un presupuesto para tu web o tienes alguna duda, no dudes en contactar con nosotros.</p></div>'),
(3, 'Consejos para lograr un buen diseño de formularios web', 'Los formularios son una de las interacciones más importantes que tendrán los usuarios en tu web. ¡Descubre aquí las reglas a seguir para lograr los mejores diseños de formularios!', '2019-05-13', 'diseno-formularios-web.jpg', '<div class=\"block-text\"><p>Los formularios web son una de las interacciones más importantes que tendrán los usuarios en tu sitio web. Se utilizan para todo tipo de situaciones decisivas: Registros, suscripciones a newsletter, formularios de contacto para conseguir información adicional, compras…etc.</p><p>Estos formularios web siempre formarán parte de los objetivos principales de toda empresa y conformaran uno de los pasos finales del usuario a la hora de conseguir las conversiones que anhelamos. Por ese motivo, es de vital importancia poner un mimo especial a la hora de diseñar y desarrollar estos apartados en nuestra web.</p><p>Desde <a href=\"https://www.latevaweb.com/favicon.ico\" title=\"Favicon La Teva Web\">La Teva Web</a>, tu agencia de <span style=\"text-decoration: underline;\"><strong><a href=\"https://www.latevaweb.com/\" target=\"_blank\" rel=\"noopener\" title=\"diseño web Barcelona\">diseño web en Barcelona</a></strong></span>, hemos preparado en este artículo una serie de consejos y reglas a seguir para lograr los diseños de formulario web más brillantes y exitosos.</p><p>¡Vamos al grano!</p><h2>7 Reglas de oro para el diseño web de formularios</h2><ul><li><strong>Pedir solo los datos esenciales</strong></li></ul><p>Reducir los campos solicitados en los formularios puede ser dificultoso, pero muy rentable. Eliminando campos innecesarios conseguiremos ahorrar a los usuarios un tiempo muy valioso e incrementaremos la tasa de éxito de finalización de la tarea o de la conversión.</p><p>Un formulario que pide mucha información puede espantar a los usuarios más perezosos. Un consejo: en el caso de formularios de contacto, unifica el “Asunto” y el “Mensaje” en un solo campo.</p><ul><li><strong>Ahorrar tiempo de escritura al usuario</strong></li></ul><p>Al pedir solo los datos esenciales conseguiremos que nuestros formularios de contacto sean menos cargados, pero con minimizar el número de campos de ingreso a veces no basta. Hay que prestar especial atención al esfuerzo que realiza el usuario a la hora de introducir los datos en nuestros formularios.</p><p>Escribir datos consume tiempo (más aún en móviles) y es más propenso al error humano, sin contar que muchos usuarios perderán el interés en rellenar un formulario si de repente ven que tienen que escribir un párrafo entero. Minimizar la escritura, reducir el número de opciones, utilizar respuestas predefinidas o botones desplegables pueden ser buenas opciones para que el usuario rellene un formulario rápidamente y sin problemas.</p><ul><li><strong>Apostar por las llamadas a la acción (Call to Action)</strong></li></ul><p>Anima al usuario a rellenar los campos, dale información adicional, explícale los requisitos de cada campo (como las contraseñas), ayúdale a completarlo y sobre todo, mantén con él una conversación amena en la cual se den respuesta a una serie de preguntas concisas.</p><p>Ayudando en todo lo posible al usuario, conseguiremos que termine el formulario de forma más rápida y sencilla, y al mismo tiempo disminuiremos los posibles errores que puedan surgirle en el proceso.</p><ul><li><strong>Diferenciar los campos obligatorios de los que no</strong></li></ul><p>Es importante que el usuario sepa que campos son opcionales, por lo que de este modo podrá saltárselos si lo desea. Como ya hemos comentado, si no son necesarios, quizás no hará falta que los solicites en el formulario (Siempre podrás solicitarlos más adelante)</p><ul><li><strong>Evitar el botón de restaurar campos</strong></li></ul><p>El botón de restaurar campos era muy utilizado antiguamente, pero es prácticamente inútil. El riesgo de borrar todos los campos introducidos por accidente sobrepasa enormemente a la poca probable necesidad de volver a rellenar los campos. Nuestra recomendación: ¡No los uses!</p><ul><li><strong>Liberarse de los captchas imposibles</strong></li></ul><p>¿Cuántas veces has intentado rellenar un formulario en alguna web y has fallado en los típicos captchas de letras y números casi invisibles? ¿Y cuántas veces has jurado introducir bien estos campos imposibles pero os ha fallado igual? Muchas, seguro. Esto puede ser bastante frustrante, lo sabemos.</p><p>Por ese motivo, en el caso de requerir un captcha para tu formulario web (algo muy útil para evitar el spam masivo en formularios de contacto) es prioritario instalar un reCaptcha de última versión para evitar posibles irritaciones de los usuarios.</p><ul><li><strong>Proporcionar un mensaje de error claro</strong></li></ul><p>Es muy importante mostrar de forma visual y clara si el usuario ha cometido uno o más errores a la hora de cumplimentar el formulario.</p><p>Más importante es aún indicarle cómo resolver dicho error y el motivo por el cual se ha producido. De esta forma, el usuario podrá arreglar con facilidad el error cometido y conseguir un formulario exitoso en el siguiente intento.<br><br></p><p>Estas son nuestras 7 reglas de oro para un buen diseño de formularios web. En nuestra agencia de diseño web, contamos con un gran equipo de profesionales que ponen especial atención a la hora de crear todos los elementos que formarán tu web. ¡Confía en nosotros para la creación de tu web a medida!</p></div>'),
(4, 'La relación entre el Diseño web y la Arquitectura web', 'La relación entre diseño web y arquitectura web puede aportar muchos beneficios al proceso de creación de un portal. Te contamos cómo en nuestro artículo.', '2019-05-10', 'diseno-web-arquitectura-web.jpg', '<div class=\"block-text\"><p>En el <strong>sector del desarrollo de páginas web</strong> conviven multitud de <strong>términos a menudo poco claros o con definiciones ambiguas</strong>. UIX, accesibilidad, link juice, indexación, wireframe… son algunos ejemplos del torrente de siglas y conceptos con los que nos toparemos si queremos crear una web para nuestro negocio.</p><p>Una de las parejas de conceptos más utilizadas es el <strong><a href=\"https://www.latevaweb.com/\" title=\"Diseño web\">diseño web</a> y la arquitectura web</strong>. En algunos casos, se emplean como sinónimos, en otros como complementos, y en otros escenarios como parte el uno del otro. En este artículo vamos a arrojar un poco de luz sobre <strong>qué son</strong> el diseño web y la arquitectura web, <strong>y qué relación existe entre ellos</strong>.</p><h2>¿Qué es el Diseño web?</h2><p>La definición del diseño web por sí misma no es complicada. El problema reside en que <strong>el concepto se ha ido moldeando a lo largo del tiempo</strong>. Hemos pasado de definir una disciplina que forma parte de la creación de páginas web, a agrupar todo el proceso de desarrollo de portales web.</p><p>En el primero caso, el concepto de diseño web alude a la <strong>definición del apartado visual de una web</strong>. Puede complementarse con otras disciplinas, como la usabilidad, accesibilidad e incluso la arquitectura web. Pero en síntesis, se ocupa de crear la parte visual de una web.</p><p>En el segundo caso, el término diseño web define<strong> todo el proceso de planificación, programación, diseño, maquetación y un largo etcétera de acciones y disciplinas que intervienen en la creación de una web</strong>. Incluyendo la arquitectura web.</p><p>Para el objetivo de este artículo, utilizaremos la primera definición y cómo ésta se vincula a la arquitectura web.</p><h2>¿Qué es la Arquitectura web?</h2><p>La arquitectura web es la disciplina que engloba la <strong>organización de los contenidos e información de una web, incluyendo la jerarquía entre sus elementos y las relaciones entre los mismos</strong>. Se trata de una especialización de la arquitectura de la información tradicional, que afecta a todo tipo de interfaces digitales.</p><p>Dado que la arquitectura web se encarga de la priorización de contenidos de una web y de las relaciones entre ellos, o lo que es lo mismo, del enlazado interno, <strong>se suele asociar al posicionamiento orgánico</strong>. Procesos de optimización de SEO técnico como la distribución del link juice o una auditoría de rastreo tienen una relación directa con la organización de los contenidos derivada de la arquitectura web.</p><h2>La relación entre Arquitectura web y Diseño web</h2><p>Como mencionábamos arriba, tomaremos la definición de diseño web que hace referencia a la creación del apartado visual de un portal. En este sentido,<strong> la arquitectura web tendrá una influencia directa sobre el diseño web</strong>. ¿Por qué? La arquitectura web <strong>marcará la presencia de determinados contenidos en una web y de la relación entre los mismos</strong>. Esto influirá en el diseño de una web en puntos como:</p><ul><li><strong>Tipos de páginas</strong>. La arquitectura web delimitará qué tipologías de páginas se incluirán en una web. Por ejemplo, fichas de producto o listados de servicios. Para cada una de estas clases de páginas se requerirá un diseño web específico.</li><li><strong>Presencia de elementos</strong>. En el proceso de definición de la arquitectura de la información de una web se especificarán una serie de contenidos que deberán estar presentes en determinadas páginas, además de su ubicación y priorización. El diseño web deberá trasladar estos requisitos al apartado visual de la web.</li><li><strong>Necesidades de enlazado</strong>. Como extensión del punto anterior, uno de los aspectos que marcará la arquitectura web es el enlazado entre diferentes contenidos. Para incorporar estas relaciones, el diseño web deberá emplear recursos como llamadas a la acción, menús de navegación o breadcrumbs.</li></ul><p>Como veis,<strong> la definición de la arquitectura web de un portal tiene una influencia directa en su diseño</strong>. La coordinación entre estas disciplinas será clave para crear una web acorde a los requisitos de nuestro público objetivo. Pero no sólo de estos dos campos: SEO, accesibilidad o programación, entre muchos otros, también influirán en el resultado final de un nuevo portal. Y en La Teva Web podemos ayudaros a crear una web a medida para vuestro negocio.</p></div>'),
(5, 'Tendencias SEO: claves para posicionar tu web este 2020', '¿Está tu web preparada para las nuevas tendencias SEO de este año? Te presentamos un resumen de las nuevas tendencias SEO que marcarán este 2020 para que puedas prepararte y estar al día de todas las novedades que nos vienen este año.', '2020-01-09', 'tendencias-seo-2020.jpg', '<div class=\"block-text\"><p><span>Es bien sabido por todos, que los algoritmos de Google no descansan ni en vacaciones. Y es por ello que para mantener una buena estrategia SEO, necesitamos estar siempre a la vanguardia de los cambios de nuestro buscador preferido. </span></p><p><span>Aprovechando el inicio del año, desde La Teva Web, tu <strong><a href=\"https://www.latevaweb.com/posicionamiento-web-seo-barcelona\">agencia SEO en Barcelona</a></strong>, hemos preparado una lista de las nuevas tendencias SEO más importantes que veremos en 2020. </span></p><p><span>¡Empecemos!<br><br></span></p><h2><a href=\"https://www.latevaweb.com/que-sabemos-busqueda-por-voz-como-funciona-caracteristicas\">Búsqueda por voz</a></h2><p><span>Cada vez son más los usuarios que utilizan la función de búsqueda por voz para poder buscar la información que necesitan de manera fácil y rápida. Podemos ver este crecimiento tanto en búsquedas por voz desde el móvil, tanto en dispositivos como <strong>Google Home, Alexa o Cortana</strong>. Los datos para este 2020 muestran que más del <strong>50% de las búsquedas se realizarán por voz</strong>. </span></p><p><span>¿Qué significará eso para nosotros? La manera en cómo se realiza una búsqueda tradicional y una búsqueda por voz no es la misma. Cuando realicemos nuestra estrategia SEO ya no solo nos tenemos que fijar en las palabras clave, sino también en averiguar qué tipo de dudas tendrán los usuarios, y cómo van a realizarlas. <strong>Las palabras clave se convierten en frases largas y complicadas.</strong> Es por ello, que debemos trabajar bien en nuestros contenidos, incorporando frases completas y bien estructuradas que sean bien entendibles para Google. Incluir sinónimos o frases de explicación a lo largo del texto pueden ayudarnos a posicionarnos mejor en las búsquedas de voz.<br><br></span></p><h2>Rich Snippets y Featured Snippet</h2><p><span>Como ya sabemos, los <strong><a href=\"https://www.latevaweb.com/rich-snippets-que-son-como-utilizarlos\">Google featured snippet</a></strong> o resultados enriquecidos son un tipo de formato que aparece en las SERPs para dar una respuesta (corta, rápida y concisa) a las dudas de los usuarios. </span></p><p><span>Durante este 2019, estos snippets han ido ganando mucha importancia para Google, ya que&nbsp; con ellos google consigue que los usuarios reciban la información que necesitan en el mínimo tiempo posible, sin ni siquiera tener que entrar en una web. Para conseguir una buena estrategia SEO, no solo tendremos que conquistar el featured snippet (es decir, estar en la posición cero), sino que también tendremos que ofrecer una respuesta que capte la atención del usuario de manera que éste se decida a hacer clic sobre él. Por lo tanto, tendremos que trabajar en las consultas de usuarios que estén buscando información detallada o explicaciones extensas que no puedan ser resueltas en un solo parágrafo.<br><br></span></p><h2>Fórmula EAT: Contenido real y veraz</h2><p><span>Aunque esta parte no es nueva, la <strong>fórmula EAT</strong> (Expertise, Authority y Trust) se vuelve un punto clave para nuestra estrategia SEO este 2020. </span></p><p><em><span>Expertise</span></em><span> se refiere a la parte de creación de contenido. Cuando se publica contenido en nuestra web, éste tiene que ser de calidad demostrada y contrastada, es decir, la información tiene que ser creada por agentes profesionales en el tema. Por otro lado, para conseguir <em>Authority</em> en nuestra web, deberemos trabajar para que nuestro contenido sea enlazado por sitios web con mucha autoridad. Finalmente, conseguiremos <em>Trust</em> con una óptima velocidad de carga y siguiendo las políticas de seguridad de Google sobre la información de los usuarios.<br><br></span></p><h2>Nuevo algoritmo BERT</h2><p><span>En Marzo de este año saldrá a la luz también un nuevo algoritmo de <strong>Google llamado BERT “Bidirectional Encoder Representations”. </strong></span></p><p><span>El objetivo principal de Google es descubrir que buscan los usuarios y mostrarles información útil, independientemente de la manera en cómo se realice la consulta. Gracias al <strong>algoritmo BERT</strong>, Google es capaz de entender las palabras de la oración en contexto, no de manera aislada. De esta manera, las respuestas encontradas son mucho más precisas.<br><br></span></p><h2>Buscadores verticales: marketplaces y Youtube</h2><p><span>Aunque el buscador de Google es una parte muy importante de nuestra estrategia SEO, este año tendremos que tener muy en cuenta a los denominados: <strong>buscadores verticales</strong>. Dentro de los buscadores verticales más relevantes, queremos destacar dos: los <strong>marketplaces como Amazon</strong> y las <strong>plataformas de vídeo como Youtub</strong>e. </span></p><p><span><strong>Youtube</strong> se vuelve muy importante ya que funciona como fuente de inspiración para muchos consumidores que están pensando en comprar un nuevo producto. Es por ello que el SEO en Youtube va a convertirse en una tendencia importante en este 2020. </span></p><p><span>El <strong>SEO en Amazon</strong> es un punto clave también para los retailers en 2020. El posicionamiento en buscadores verticales es similar a otros buscadores, aun así tiene características propias que se deben estudiar y analizar para poder triunfar en estos buscadores. En el caso de Amazon, el número de ventas, las valoraciones y los precios son tres factores importantes para el posicionamiento de tus productos.&nbsp; </span></p><p><span>&nbsp;</span></p><p><span>Y hasta aquí las tendencias SEO más importantes de este 2020. Esperamos que este artículo haya podido ser útil para ayudar a definir tu estrategia SEO de este año. Aun así, para <strong>triunfar con tu estrategia SEO</strong> es importante estar siempre al día de las nuevas actualizaciones y cambios que puedan surgir. Para seguir informado de lo último en SEO y Marketing Online, ¡no dudes en apuntarte a nuestra<strong><a href=\"https://latevaweb.us20.list-manage.com/subscribe?u=fed1cd215eae1eedc2bb71865&amp;id=337194a0a2\"> Newsletter</a></strong>!</span></p></div>'),
(6, 'Ventajas y diferencias entre diseño web a medida y Wordpress', '¿Necesitas una web para tu negocio o proyecto? Existen dos opciones para la creación de un proyecto web: realizar un diseño web a medida o utilizar un CMS como Wordpress. Para poder tomar una decisión sobre cuál de éstas opciones es la mejor en nuestro caso, vamos a analizar qué pueden aportar estos dos tipos de diseños a nuestro proyecto web.', '2020-01-24', 'diseno-web-medida-1.jpg', '<div class=\"block-text\"><p><span>¿Necesitas una web para tu negocio o proyecto? Existen dos opciones para la creación de un proyecto web: realizar un <a href=\"https://www.latevaweb.com/desarrollo-web-medida\"><strong>diseño web a medida</strong></a> o utilizar un <strong>CMS como Wordpress</strong>. Para poder tomar una decisión sobre cuál de éstas opciones es la mejor en nuestro caso, vamos a analizar qué pueden aportar estos dos tipos de diseños a nuestro proyecto web. &nbsp;</span></p><p><span>¡Allá vamos! </span></p><p><span>&nbsp;</span></p><h2><strong><span>Ventajas y limitaciones de Wordpress</span></strong></h2><p><span>Las ventajas de Wordpress se pueden resumir en: bajo coste y tiempo de implementación, así como fácil implementación de la web (no necesitas entender de programación para realizar y mantener tu web). </span></p><p><span>Aun así, Wordpress presenta también grandes desventajas claras que pueden llegar a convertir la creación y manutención de un proyecto web en nuestra peor pesadilla. Vamos a repasar las principales:</span></p><p><span>La <strong>desventaja</strong> más importante de la herramienta es el <strong>diseño y la personalización del proyecto</strong>. Para emprendedores creativos con ganas de ofrecer una versión nueva y sorprender a sus usuarios, Wordpress no es suficiente. Aunque hay muchas plantillas disponibles, al final, uno siempre se queda atrapado por las limitaciones de la plantilla escogida.&nbsp; </span></p><p><span>Por otra parte, la herramienta (debido principalmente a su bajo coste) presenta un <strong>soporte técnico inexistente</strong>.&nbsp; Este soporte está basado principalmente en una plataforma de foros con preguntas de los usuarios y respuestas contestadas por la comunidad. <br><br></span><span>Aunque algunas plantillas de pago sí ofrecen un soporte técnico para sus usuarios, este suele ser muy básico y lento. También debemos tener en cuenta que cuando creamos una página web a través de Wordpress, el <strong>coste del mantenimiento no está incluido</strong>, y que para resolver cualquier problema por pequeño que sea, tendremos que contratar un servicio técnico de pago, lo que puede llegar a <strong>encarecer mucho el coste total del proyecto a largo plazo</strong>. </span></p><p><span>&nbsp;</span></p><h2><strong><span>Ventajas del diseño web a medida</span></strong></h2><p><strong><span>Personalización total del proyecto</span></strong><span>. La gran desventaja de los diseños CMS, es de hecho, la principal razón por la que muchos deciden pasarse al diseño a medida. Y es que cuando realizamos una web desde cero, podemos hacer volar nuestra imaginación y ofrecer a nuestro usuario una experiencia única sin tener que recortar la idea inicial. ¡No tendrás que poner límites a tu imaginación!</span></p><p><span>Y aunque muchos piensan que un desarrollo web a medida es sinónimo de una página estática, cuando la página web está bien realizada debe de permitir al cliente la auto-gestión de contenidos (productos, categorías o noticias). </span></p><p><strong><span>Mayor seguridad.</span></strong><span> Las webs hechas a medida son menos vulnerables a ataques ajenos de hackers ya que el código es privado. Además, el acceso al panel de control de la web es diferente para cada cliente, a diferencia de las web hechas con Wordpress donde todas utilizan la fórmula: <a href=\"http://www.tupágina.com/wp-admin\">www.tupágina.com/wp-admin</a> para acceder al backoffice de la web. </span></p><p><strong><span>Soporte técnico al cliente.</span></strong><span> Uno de los puntos fuertes de la programación a medida es el servicio técnico y el mantenimiento de la web. Al realizar una web a medida, tendrás una guía de uso personalizada y un equipo de profesionales a tu disposición para ayudarte en el caso de cualquier incidencia. </span></p><p><strong><span>SEO</span></strong><span>. Cuando realizamos un proyecto web a medida, éste se puede orientar 100% al SEO. Desde personalizar los encabezados de tus páginas, hasta corregir problemas SEO en masa, una programación a medida da un giro total a tu estrategia SEO para ofrecerte unos buenos resultados orgánicos des del primer momento.&nbsp; </span></p><p><strong><span>Diseño <em>Responsive</em></span></strong><span>. A día de hoy, y desde que salió la actualización Mobile First Index, es imprescindible que tu web tenga un buen diseño responsive. Las webs a medida se encargan de cumplir a la perfección todos los requisitos de Google en este aspecto. &nbsp;&nbsp;</span></p><p><span><br>Las principales desventajas de los diseños web a medida, en comparación con otros CMS, son el tiempo y el dinero que deben ser invertidos. Sin embargo, si tenemos en cuenta el <strong>elevado coste del mantenimiento web de Wordpress</strong>, podemos afirmar que crear una <strong>web a medida sale mucho más rentable</strong> a largo plazo, económicamente hablando, que una web realizada con CMS.<br><br></span></p><p><span>¿Estás decidido ya a realizar tu web a medida? Si es así, ¡no dudes en consultarnos! </span></p></div>');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos`
--

CREATE TABLE `proyectos` (
  `idproyecto` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `imagen` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `altimg` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `datos` text COLLATE utf8_unicode_ci,
  `tecnologia` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tiempo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `proyectos`
--

INSERT INTO `proyectos` (`idproyecto`, `nombre`, `imagen`, `altimg`, `datos`, `tecnologia`, `tiempo`) VALUES
(1, 'ReComiendo', 'porf-1.jpg', 'Home de la web de ReComiendo', 'Web corporativa<br>Web del restaurante ReComiendo', 'Php, Html, Css, Javascript', 75),
(2, 'Aquasierra', 'porf-2.jpg', 'Captura de la web de Aquasierra', 'Web corporativa<br>Parque acuático Aquasierra en Villafanca de Córdoba.', 'Php, Html, Css, Javascript', 90),
(3, 'Lavadog', 'porf-3.jpg', 'Home de la web de Lavadog', 'Web corporativa <br>One page<br>Peluquería canina y autolavado de perros de Málaga.', 'Php, Html, Css, Javascript', 78),
(4, 'Ramirez Santos', 'porf-4.jpg', 'Boceto de la web de Ramirez Santos', 'Web corporativa<br>Mayoristas de alimentación y menaje, Ramirez Santos', 'Php, Html, Css, Javascript', 70),
(5, 'Psicoclinic', 'porf-5.jpg', 'Home de la web de Psicoclinic', 'Web corporativa<br>Servicio de atenci&oacute;n psicol&oacute;gica y psicoterap&eacute;utica', 'Php, Html, Css, Javascript', 65),
(6, 'SOS Empresa', 'porf-6.jpg', 'Home de la web de SOS Empresa', 'Web corporativa<br>Servicio de asesoramiento gratuito para PYMES y aut&oacute;nomos', 'Php, Html, Css, Javascript', 73),
(7, 'Origen Certificado', 'porf-7.jpg', 'Home de la web origencertificado.es', 'Web corporativa<br>Empresa acreditadora de la procedencia de los productos etc.', 'Php, Html, Css, Javascript', 105),
(8, 'Notaría de José Antonio Caballos', 'porf-8.jpg', 'Home de la web www.notariajoseantoniocaballos.es', 'Web corporativa<br>Servicio de notar&iacute;a en C&oacute;rdoba.', 'Php, Html, Css, Javascript', 85),
(9, 'Alcalde abogados', 'porf-9.JPG', '', '', '', 0),
(10, 'Solycarpa', 'porf-10.JPG', 'Home de la web de Solycarpa', 'E-comerce<br> Tienda on line de Solycarpa', 'Php, Html, Css, Javascript, Smarty', 200),
(11, 'Autos Pyr', 'porf-11.JPG', 'Home de la web de AutosPyr', 'Web corporativa<br>Buscador de coches de Autos Pyr ', 'Php, Html, Css, Javascript', 120);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idusuario` int(11) NOT NULL,
  `user` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `pass` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `isadmin` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idusuario`, `user`, `pass`, `isadmin`) VALUES
(1, 'aelopez@gmail.com', '$5$rounds=5000$pf4php$Evb1tQluQvcw3yl9HTjYzS3uyCnmaFUd3qOjmjAoaNB', 1),
(2, 'alopez@dobuss.es', '$5$rounds=5000$pf4php$JqCkD9pDaBkOGGFiNOSty.XYcDTnZMAaz5guX1h04z0', 0),
(3, 'alopez@gmail.com', '$5$rounds=5000$pf4php$rH71H9MJuRmxOABojgI4T9Yt2zN1ucXJgFzS2ELvuu3', 0),
(4, 'alopezpr@gmail.com', '$5$rounds=5000$pf4php$Evb1tQluQvcw3yl9HTjYzS3uyCnmaFUd3qOjmjAoaNB', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`idcita`),
  ADD UNIQUE KEY `idcliente` (`cliente`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idcliente`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- Indices de la tabla `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`idnoticia`);

--
-- Indices de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD PRIMARY KEY (`idproyecto`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idusuario`),
  ADD UNIQUE KEY `user` (`user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `idcita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `noticias`
--
ALTER TABLE `noticias`
  MODIFY `idnoticia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  MODIFY `idproyecto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `cliente_fk` FOREIGN KEY (`cliente`) REFERENCES `clientes` (`idcliente`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `usuario_fk` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`idusuario`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
