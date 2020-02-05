<?php include 'conection.php'; ?>
<html lang="es">

<head id="head">
  <meta charset="utf-8">
</head>

<body class="index">
  <!-- Page Content
    ================================================== -->
  <!-- Hero -->

  <section class="hero">
    <div class="container text-center">
      <div class="row">
        <div class="col-md-12">
          <a class="hero-brand" href="index.php" title="Home"><img alt="Logo" src="img/LogoSample_TailorBrands.jpg"></a>
        </div>
      </div>
      <div class="col-md-12">
        <h1>Mis proyectos web</h1>
      </div>
    </div>

  </section>
  <!-- /Hero -->

  <!-- Header -->
  <header id="header">
    <div class="container">

      <nav id="nav-menu-container">
        <ul class="nav-menu">
          <li><a id="inicio" class="activo" onclick="cargarContenido('noticias.php'); activarItem('inicio');">Inicio</a></li>
          <?php if ($_SESSION['usuario'] != 'admin'): ?>
            <li><a id="portfolio" onclick="cargarContenido('portfolio.php');activarItem('portfolio');">Portfolio</a></li>
          <?php endif; ?>
          <li><a id="presupuesto" onclick="cargarContenido('budget.html');activarItem('presupuesto');">Solicita presupuesto</a></li>
          <li><a id="donde" onclick="cargarContenido('donde.html');activarItem('donde');">Dónde estamos</a></li>
          <li><a id="contacto" onclick="cargarContenido('contact.html');activarItem('contacto');">Contacto</a></li>
          <?php if ($_SESSION['usuario'] == ''){ ?>
            <li><a id="login-usrs" onclick="cargarContenido('controlUsuarios.php');activarItem('login-usrs');"><i class="fa fa-user"> </i> Login</a></li>
          <?php } else { ?>
            <?php if ($_SESSION['usuario'] == '1'){ ?>
              <li><a id="citas" onclick="cargarContenido('miCita.php');activarItem('citas');">Cita</a></li>
              <li><a id="admin-usrs" onclick="cargarContenido('gestionDatosPersonales.php');activarItem('admin-usrs');"><i class="fa fa-user"> </i> Mi cuenta</a></li>
            <?php }
            else if ($_SESSION['usuario'] == 'admin') {?>
              <li><a id="admin-prycts" onclick="cargarContenido('aproyectos.php');activarItem('admin-prycts');"><i class="fa fa-pencil"></i> Proyectos</a></li>
              <li><a id="citas" onclick="cargarContenido('aCitas.php');activarItem('citas');">Ver Citas</a></li>
              <li><a id="admin-usrs" onclick="cargarContenido('aUsuarios.php');activarItem('admin-usrs');"><i class="fa fa-users"> </i> Usuarios</a></li>
            <?php }?>
            <li><a onclick="cerrarSesion(); activarItem('inicio');"><i class="fa fa-power-off"></i></a></li>
          <?php }?>
        </ul>
      </nav>
      <!-- #nav-menu-container -->
      <nav class="nav social-nav pull-right d-none d-lg-inline">
        <a href="https://www.linkedin.com/in/anaelenalm/"><i class="fa fa-linkedin"></i></a> <a href="mailto:aelopez@gmail.com?subject=Web"><i class="fa fa-envelope"></i></a>
      </nav>
    </div>
  </header>
  <!-- #header -->

  <div class="cuerpo container">
    <div class="row">
      <!-- Contenido principal -->
      <div class="col-sm-12 col-xs-12">
        <div id="contenedor-principal" class="content">
        </div>
      </div>
      <!-- /Contenido principal -->
    </div>
  </div>

  <!-- @component: footer -->

  <footer class="site-footer">

  </footer>

  <!-- Required JavaScript Libraries -->
  <script src="libr/jquery/jquery.min.js"></script>
  <!-- <script src="libr/jquery/jquery-migrate.min.js"></script> -->
  <script src="libr/superfish/hoverIntent.js"></script>
  <script src="libr/superfish/superfish.min.js"></script>
  <script src="libr/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="libr/stickyjs/sticky.js"></script>

  <!-- Recursos para mapas de codgo abierto -->
  <script src="libr/leaflet/leaflet.js"></script>
  <script src="libr/leaflet/routing/leaflet-routing-machine.js"></script>
  <script src="libr/leaflet/routing/Control.Geocoder.js"></script>

  <!-- Template Specisifc Custom Javascript File -->
  <script src="js/custom.js"></script>

  <!-- Recursos para galería de imágenes -->
  <!-- <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script> -->
	<script src="libr/fancybox/jquery.fancybox.min.js"></script>

</body>
<script>
 $(document).ready(function () {
   $('#head').load('./head.html');
   $('footer').load('./footer.html');
 });
</script>
</html>
