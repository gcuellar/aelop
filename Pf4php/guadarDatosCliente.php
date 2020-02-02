<?php include 'conection.php';
if ($conn) { //Si hay conexión con la bbdd
  // GUARDA LOS DATOS PERSONALES DEL USUARIO
  $idcliente = $_POST["idcliente"];
  $nombre = $_POST["nombre"];
  $apellidos = $_POST["apellidos"];
  $telefono = $_POST["telefono"];
  if ($idcliente) {
    $sql = "UPDATE cliente SET nombre = '".$nombre."', apellidos = '".$apellidos."', telefono = '".$telefono."' WHERE idcliente =".$idcliente;
  }
  else {
    $sql = "INSERT INTO clientes (usuario) VALUES ('".$_SESSION['idusuario']."')";
    $result = mysqli_query($conn, $sql);
    if ($result) {
      echo 'registro creado';
    }
  }
  $result = mysqli_query($conn, $sql);
  if($result) { // Si se hizo la query
    echo 'Datos personales guardados correctamente';
  }
  else {
    echo 'Los datos no se han guardado';
  }
  mysqli_close($conn); //cierra la conxión
}
else {
  mysqli_connect_error();
} ?>
