<?php include 'conection.php';
if ($conn) { //Si hay conexión con la bbdd
  // GUARDA LOS DATOS PERSONALES LOS USUARIOS
  $idusuario = $_POST["idusuario"];
  $idcliente = $_POST["idcliente"];
  $nombre = $_POST["nombre"];
  $apellidos = $_POST["apellidos"];
  $telefono = str_replace(" ", "", $_POST["telefono"]);
  if ($idcliente) {
    $sql = "UPDATE clientes SET nombre = '".$nombre."', apellidos = '".$apellidos."', telefono = '".$telefono."' WHERE idcliente =".$idcliente;
    $result = mysqli_query($conn, $sql);
    if($result) { // Si se hizo la query
      echo 'Los datos personales se han actualizado correctamente';
    }
    else {
      echo 'Los datos no se han actualizado';
    }
  }
  else if ($idusuario) {
    $sql = "INSERT INTO clientes (nombre, apellidos, telefono, usuario) VALUES ('".$nombre."', '".$apellidos."', '".$telefono."', '".$idusuario."')";
    $result = mysqli_query($conn, $sql);
    if ($result) {
      echo 'Los datos personales se han guardado correctamente';
    }
    else {
      echo 'Los datos no se han guardado';
    }
  }
  else {
    echo 'Debe seleccionar un usuario de la tabla';
  }

  mysqli_close($conn); //cierra la conxión
}
else {
  mysqli_connect_error();
} ?>
