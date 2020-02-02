<?php include 'conection.php'; ?>
<section class="mi-cuenta" id="mi-cuenta">
  <div class="container text-center">
    <h2>Datos de cliente</h2>
    <p>Edite sus datos en el formulario</p>
  </div>
  <?php
    $idcliente = '';
    $nombre = '';
    $apellidos = '';
    $telefono = '';
    if ($conn) { //Si hay conexión con la
      // OBTIENE DATOS DEL USUARIO
      $sql = "SELECT * FROM clientes WHERE usuario='".$_SESSION['idusuario']."'";
      $result = mysqli_query($conn, $sql);
      if($result) {
        // Si hay registros
        if(mysqli_num_rows($result) !== 0) {
          while($row=mysqli_fetch_array($result)) {
            $idcliente = $row['idcliente'];
            $nombre = $row['nombre'];
            $apellidos = $row['apellidos'];
            $telefono = $row['telefono'];
          }
          echo 'hay registro'; echo $_SESSION['idusuario'];
        } else {
          echo 'No se han encontrado registros';
        }
      }
      $sql = "SELECT user FROM usuarios WHERE idusuario='".$_SESSION['idusuario']."'";
      $result = mysqli_query($conn, $sql);
      if($result) {
        // Si hay registros
        if(mysqli_num_rows($result) !== 0) {
          while($row=mysqli_fetch_array($result)) {
            $email = $row['user'];
          }
        }
      }
      else {
        $email = '';echo 'No se ha encontrado email';
      }
      // MODIFICA DATOS DEL CLIENTE
      // formulario para datos de cliente
      ?>
      <div id="datos-personales">
        <form class="datos-personales">
          <input id="c-idcliente" type="hidden" name="idcliente" value="<?php echo $idcliente ?>">
          <label for="email">Usuario
          <input readonly id="c-email" type="text" name="email" value="<?php echo $email ?>"></label>
          <label for="nombre">Nombre
          <input id="c-nombre" type="text" name="nombre" value="<?php echo $nombre ?>"></label>
          <label for="apellidos">Apellidos
          <input id="c-apellidos" type="text" name="apellidos" value="<?php echo $apellidos ?>"></label>
          <label for="telefono">Teléfono
          <input id="c-telefono" type="text" name="telefono" value="<?php echo $telefono ?>"></label>
          <button type="button" onclick="editarDatosPersonales();" name="guardar">Guardar datos</button>
        </form>
        <div id="c-result" class="res"> </div>
      </div>
      <?php


      mysqli_close($conn); //cierra la conxión
    }
    else {
      echo ('No pudo conectarse: '. mysqli_connect_error());
    }
  ?>
</section>
