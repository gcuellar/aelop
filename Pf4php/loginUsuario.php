<?php include 'conection.php';
if ($conn) { //Si hay conexión con la bbdd
  // COMPRUEBA LOS DATOS DEL USUARIO
  $username = $_POST["username"];
  $pass =  crypt($_POST["pass"],'$5$rounds=5000$pf4php$');
  // if ($idcliente) {
  //   $sql = "UPDATE cliente SET nombre = '".$nombre."', apellidos = '".$apellidos."' WHERE idcliente =".$idcliente;
  // }
  $sql = "SELECT idusuario, pass, isadmin FROM usuarios WHERE user ='".$username."'";
  $result = mysqli_query($conn, $sql);
  if($result) { // Si se hizo la query
    // Si hay registros
    $cadena = '<div class="res">cadena</div>';
    if(mysqli_num_rows($result) !== 0) {
      while($row=mysqli_fetch_array($result)) {
        $savepass = $row['pass'];
        $isadmin = $row['isadmin'];
        if ($pass == $savepass) {
          $_SESSION['idusuario'] = $row['idusuario'];
          $_SESSION['usuario'] = '1';
          if ($isadmin) {
            $_SESSION['usuario'] = 'admin';
          }
        }
        else {
          $_SESSION['usuario'] = '';
          http_response_code(401);
          echo 'Los datos introducidos no son correctos';
        }
      }
    } else {
      http_response_code(401);
      echo 'El usuario no existe';
    }
    // echo 'Usuario guardado correctamente';
  }
  else {
    $error = mysqli_errno($conn);
    echo $error;
  }
  mysqli_close($conn); //cierra la conxión
}
else {
  mysqli_connect_error();
} ?>
