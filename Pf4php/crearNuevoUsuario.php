<?php include 'conection.php';
if ($conn) { //Si hay conexión con la bbdd
  // GUARDA LOS DATOS DEL USUARIO
  $username = $_POST["username"];
  $pass = crypt($_POST["pass"],'$5$rounds=5000$pf4php$');

  $sql = "SELECT * FROM usuarios WHERE user='".$username."'";

  $result = mysqli_query($conn, $sql);

  if(mysqli_num_rows($result)>0) { // Si devolvió resultados
    echo 'El usuario '.$username.' ya existe';
  }
  else {
    $sql = "INSERT INTO usuarios (user, pass) VALUES ('".$username."', '".$pass."')";

    $result = mysqli_query($conn, $sql);

    if($result) { // Si se hizo la query
      echo 'Usuario guardado correctamente';
    }
    else {
      $error = mysqli_errno($conn);
      echo 'Ha ocurrido un error: '.$error;
    }
  }
  mysqli_close($conn); //cierra la conxión
}
else {
  mysqli_connect_error();
} ?>
