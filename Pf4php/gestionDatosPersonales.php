<?php include 'conection.php'; ?>
<section class="mi-cuenta" id="mi-cuenta">
  <div class="container text-center">
    <h2>Datos de cliente</h2>
    <p>Edite sus datos en el formulario</p>
  </div>
  <?php
    $idusuario = $_SESSION['idusuario'];
    $idcliente = '';
    $nombre = '';
    $apellidos = '';
    $telefono = '';
    if ($conn) { //Si hay conexión con la
      // OBTIENE DATOS DEL USUARIO
      $sql = "SELECT * FROM clientes WHERE usuario='".$idusuario."'";
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
        }
      }
      $sql = "SELECT user FROM usuarios WHERE idusuario='".$idusuario."'";
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
          <input id="dp-idcliente" type="hidden" name="idcliente" value="<?php echo $idcliente ?>">
          <label for="email">Usuario
          <input readonly id="dp-email" type="text" name="email" value="<?php echo $email ?>"></label>
          <label for="nombre">Nombre
          <input id="dp-nombre" type="text" name="nombre" value="<?php echo $nombre ?>"></label>
          <label for="apellidos">Apellidos
          <input id="dp-apellidos" type="text" name="apellidos" value="<?php echo $apellidos ?>"></label>
          <label for="telefono">Teléfono
          <input id="dp-telefono" type="text" name="telefono" value="<?php echo $telefono ?>"></label>
          <br><button type="button" onclick="editarDatosPersonales(<?php echo $idusuario ?>);" name="guardar">Guardar datos</button>
        </form>
        <div id="dp-result" class="res"> </div>
      </div>
      <?php


      mysqli_close($conn); //cierra la conxión
    }
    else {
      echo ('No pudo conectarse: '. mysqli_connect_error());
    }
  ?>
</section>
