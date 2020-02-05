<?php include 'conection.php'; ?>
<section class="misclientes" id="clientes">
  <div class="container text-center">
    <h2>Clientes</h2>
    <p>Selecciona el usuario a modificar (<i class="fa fa-pencil"></i>) y edita sus datos en el formulario inferior</p>
  </div>
  <?php
    if ($conn) { //Si hay conexión con la
      // OBTIENE DATOS DE CLIENTES
      $sql = "SELECT idcliente, nombre, apellidos, telefono, u.idusuario, u.user FROM clientes c RIGHT JOIN usuarios u ON c.usuario = u.idusuario WHERE isadmin = 0;";
      $result = mysqli_query($conn, $sql);
      if($result) {
        // Si hay registros
        if(mysqli_num_rows($result) !== 0) {
          $cadena = '<div class="tabla-clientes"><table>';
          $cadena .= '<thead><tr><th></th><th>Nombre</th><th>Teléfono</th><th>E-mail</th></tr></thead><tbody>';
          while($row=mysqli_fetch_array($result)) {
            $nombre = $row['nombre'];
            $apellidos = $row['apellidos'];
            $telefono = $row['telefono'];
            $email = $row['user'];
            $idcliente = $row['idcliente'];
            $usuario = $row['idusuario'];

            $cadena .= '<tr>';
              $cadena .= '<td><a class="editaCliente" onclick="cargarDatosCliente('.$usuario.');"><i class="fa fa-pencil"></i></a></td>';
              $cadena .= '<td><div class="nombre">'.$nombre.' '.$apellidos.'</div></td>';
              $cadena .= '<td><div class="telefono">'.$telefono.'</div></td>';
              $cadena .= '<td><div class="email">'.$email.'</div></td>';
            $cadena .= '</tr>';
          }
          $cadena .= "</tbody></table></div>";
          echo $cadena;
        } else {
          echo 'No se han encontrado registros';
        }
      }

      // MODIFICA DATOS DE CLIENTES

      // formulario para modificar usuarios/clientes
      ?>
      <div class="centrar-form">
        <h3 id="form-title">Edición de datos personales de clientes</h3>
        <form class="clientes">
          <input id="cli-idcliente" type="hidden" name="idcliente" value="">
          <input id="cli-idusuario" type="hidden" name="idusuario" value="">
          <label for="nombre">Nombre
          <input id="cli-nombre" type="text" name="nombre" value=""></label>
          <label for="apellidos">Apellidos
          <input id="cli-apellidos" type="text" name="apellidos" value=""></label>
          <label for="telefono">Teléfono
          <input id="cli-telefono" type="text" name="telefono" value=""></label>
          <label for="email">E-mail (username)
          <input readonly id="cli-email" type="email" name="email" value=""></label>
          <button type="button" onclick="editarDatosClientes();" name="guardar">Actualizar</button>
          <div id="cli-result" class="res"> </div>
        </form>
      </div>
      <?php mysqli_close($conn); //cierra la conxión
    }
    else {
      echo ('No pudo conectarse: '. mysqli_connect_error());
    }
  ?>
</section>
