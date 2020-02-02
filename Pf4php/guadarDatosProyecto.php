<?php include 'conection.php';
// Si se carga una imagen
if ($_FILES) {
  // Sube la imagen
  $tmpFile = $_FILES['fileimg']['tmp_name'];
  $newFile = 'img/'.$_FILES['fileimg']['name'];
  $result = move_uploaded_file($tmpFile, $newFile);
  echo $_FILES['fileimg']['name'];
  if ($result) {
    echo ' ha sido guardada<br />';
  } else {
    echo ' no se ha guardado<br />';
  }
}
if ($conn) { //Si hay conexión con la bbdd
  // GUARDA LOS DATOS DEL PROYECTO
  $idproyecto = $_POST["idproyecto"];
  $nombre = $_POST["nombre"];
  $imagen = $_POST["imagen"];
  $altimagen = $_POST["altimg"];
  $datos = $_POST["datos"];
  $tecnologia = $_POST["tecnologia"];
  $tiempo = $_POST["tiempo"];
  if ($idproyecto) {
    if ($imagen) {
      $sql = "UPDATE proyectos SET nombre = '".$nombre."', imagen = '".$imagen."', altimg = '".$altimagen."', datos = '".$datos."', tecnologia = '".$tecnologia."', tiempo = '".$tiempo."' WHERE idproyecto =".$idproyecto;
    }
    else {
      $sql = "UPDATE proyectos SET nombre = '".$nombre."', altimg = '".$altimagen."', datos = '".$datos."', tecnologia = '".$tecnologia."', tiempo = '".$tiempo."' WHERE idproyecto =".$idproyecto;
    }
  }
  else {
    if ($imagen) {
      $sql = "INSERT INTO proyectos (idproyecto, nombre, imagen, altimg, datos, tecnologia, tiempo) VALUES ('".$idproyecto."', '".$nombre."', '".$imagen."', '".$altimagen."', '".$datos."', '".$tecnologia."', '".$tiempo."')";
    }
    else {
      $sql = "INSERT INTO proyectos (idproyecto, nombre, altimg, datos, tecnologia, tiempo) VALUES ('".$idproyecto."', '".$nombre."', '".$altimagen."', '".$datos."', '".$tecnologia."', '".$tiempo."')";
    }
  }
  $result = mysqli_query($conn, $sql);
  if($result) { // Si se hizo la query
    echo 'Registro guardado correctamente';
  }
  mysqli_close($conn); //cierra la conxión
}
else {
  mysqli_connect_error();
} ?>
