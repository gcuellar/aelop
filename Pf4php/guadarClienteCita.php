<?php include 'conection.php';
if ($conn) { //Si hay conexión con la bbdd
  // GUARDA EL CLIENTE Y LUEGO LA FECHA DE SU CITA
  $idusuario = $_POST["idusuario"];
  $nombre = $_POST["nombre"];
  $apellidos = $_POST["apellidos"];
  $telefono = $_POST["telefono"];
  $fecha = $_POST["fecha"];
  if ($idusuario) {
    $sql = "INSERT INTO clientes (nombre, apellidos, telefono, usuario) VALUES ('".$nombre."', '".$apellidos."', '".$telefono."', '".$_SESSION['idusuario']."')";
    $result = mysqli_query($conn, $sql);
    if ($result) {
      $idcliente = mysqli_insert_id($conn); //ultimo id registrado
      // Una vez guarado el cliente, se gurada la cita
      $sql = "INSERT INTO citas (fecha, cliente) VALUES ('".$fecha."', '".$idcliente."')";
      $result = mysqli_query($conn, $sql);
      if($result) { // Si se hizo la query
        echo 'La cita se ha guardado';
      }
      else {
        echo 'No se ha guardado la cita';
      }
    }
    else {
      echo 'No se han guardado los datos personales';
    }
  }
  mysqli_close($conn); //cierra la conxión
}
else {
  mysqli_connect_error();
} ?>
