<?php include 'conection.php';
if ($conn) { //Si hay conexión con la bbdd
  // GUARDA DATOS PERSONALES DE USUARIO
  $idcliente = $_POST["idcliente"];
  $nombre = $_POST["nombre"];
  $apellidos = $_POST["apellidos"];
  $telefono = str_replace(" ", "", $_POST["telefono"]);
  if ($idcliente) {
    $sql = "UPDATE clientes SET nombre = '".$nombre."', apellidos = '".$apellidos."', telefono = '".$telefono."' WHERE idcliente =".$idcliente;
    $result = mysqli_query($conn, $sql);
    if($result) { // Si se hizo la query
      echo 'Sus datos personales se han actualizado correctamente';
    }
    else {
      echo 'Sus datos no se han actualizado';
    }
  }
  else {
    $sql = "INSERT INTO clientes (nombre, apellidos, telefono, usuario) VALUES ('".$nombre."', '".$apellidos."', '".$telefono."', '".$_SESSION['idusuario']."')";
    $result = mysqli_query($conn, $sql);
    if ($result) {
      echo 'Sus datos personales se han guardado correctamente';
    }
    else {
      echo 'Sus datos no se han guardado';
    }
  }

  mysqli_close($conn); //cierra la conxión
}
else {
  mysqli_connect_error();
} ?>
