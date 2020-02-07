<?php include 'conection.php';
if ($conn) { //Si hay conexión con la bbdd
  // ACTUALIZA LA FECHA DE LA CITA
  $idcliente = $_POST["idcliente"];
  $idcita = $_POST["idcita"];
  $fecha = $_POST["fecha"];
  if ($idcita) {
    $sql = "UPDATE citas SET fecha = '".$fecha."' WHERE idcita =".$idcita;
    $result = mysqli_query($conn, $sql);
    if($result) { // Si se hizo la query
      echo 'La fecha de la cita se ha actualizado';
    }
    else {
      echo 'No se ha actualizado la fecha de la cita';
    }
  }
  mysqli_close($conn); //cierra la conxión
}
else {
  mysqli_connect_error();
} ?>
