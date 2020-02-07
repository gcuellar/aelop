<?php include 'conection.php';
if ($conn) { //Si hay conexión con la bbdd
  // GUARDAR LA FECHA DE LA CITA
  $idcliente = $_POST["idcliente"];
  $fecha = $_POST["fecha"];
  if ($idcliente) {
    $sql = "INSERT INTO citas (fecha, cliente) VALUES ('".$fecha."', '".$idcliente."')";
    $result = mysqli_query($conn, $sql);
    if($result) { // Si se hizo la query
      echo 'La cita se ha guardado';
    }
    else {
      echo 'No se ha guardado la cita';
    }
  }
  mysqli_close($conn); //cierra la conxión
}
else {
  mysqli_connect_error();
} ?>
