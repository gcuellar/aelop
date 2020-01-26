<?php include 'conection.php';
header('Content-type: application/json');
if ($conn) { //Si hay conexión con la bbdd
  // OBTIENE DATOS DEL PROYECTO
  $sql = "SELECT * FROM proyectos WHERE idproyecto = ".$_GET["id"];
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
