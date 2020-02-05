<?php include 'conection.php';
header('Content-type: application/json');
if ($conn) { //Si hay conexión con la bbdd
  // OBTIENE DATOS DEL CLIENTE
  $sql = "SELECT * FROM clientes WHERE idcliente = ".$_GET["id"];
  $sql = "SELECT idcliente, nombre, apellidos, telefono, u.user FROM clientes c RIGHT JOIN usuarios u ON c.usuario = u.idusuario WHERE isadmin = 0 and idusuario = ".$_GET["id"];
  $result = mysqli_query($conn, $sql);
  if($result) { // Si existe
    $row=mysqli_fetch_array($result);
    echo json_encode($row);
  }
  mysqli_close($conn); //cierra la conxión
}
else {
  mysqli_connect_error();
} ?>
