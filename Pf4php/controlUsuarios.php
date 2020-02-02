<?php include 'conection.php' ?>
<section class="area-login" id="control-usuarios">
  <div class="container text-center">
    <h2>Login y registro de usuarios</h2>
    <p>Introduzca sus datos y acceda o registre un nuevo usuario</p>
  </div>

  <div id="login">
    <form class="login" action="index.php" method="post">
      <label for="username">Email</label>
      <input id="u-username" type="email" name="username" value="">
      <label for="pass">Contraseña</label>
      <input id="u-pass" type="password" name="pass" value=""><br>
      <div class="botones">
        <button type="button" onclick="accesoUsuario();" name="guardar">Acceder</button>
        <button type="button" onclick="procesarRegistro();" name="guardar">Registrarse</button>
      </div>
    </form>
    <div id="u-result" class="res"> </div>
    <?php if ($_SESSION['usuario'] == 'admin'){ ?>
      <h2> Funciones de administrador </h2>
    <?php }
    elseif ($_SESSION['usuario']) { ?>
      <h2> Funciones de usuario </h2>
    <?php } ?>
  </div>

</section>
