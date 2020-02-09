<?php include 'conection.php'; ?>
<section class="miscitas" id="citas">
  <div class="container text-center">
    <h2>Citas con clientes</h2>
  </div>
  <?php
    if ($conn) { //Si hay conexión con la
      // OBTIENE DATOS DE CITAS
      $sql = "SELECT ci.fecha, nombre, apellidos, telefono, u.user FROM clientes cl RIGHT JOIN citas ci ON ci.cliente = cl.idcliente JOIN usuarios u ON cl.usuario = u.idusuario;";
      $result = mysqli_query($conn, $sql);
      if($result) {
        // Si hay registros
        if(mysqli_num_rows($result) !== 0) {
          $cadena = '<div class="tabla-clientes"><table>';
          $cadena .= '<thead><tr><th>Fecha</th><th>Cliente</th><th>Teléfono</th><th>E-mail</th></tr></thead><tbody>';
          while($row=mysqli_fetch_array($result)) {
            $fecha = $row['fecha'];
            $nombre = $row['nombre'];
            $apellidos = $row['apellidos'];
            $telefono = $row['telefono'];
            $email = $row['user'];

            $fechaFormateada = date('d-m-Y \a \l\a\s H:i', strtotime($fecha));

            $cadena .= '<tr>';
              $cadena .= '<td><div class="fecha-cita">'.$fechaFormateada.'</div></td>';
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

       mysqli_close($conn); //cierra la conxión
    }
    else {
      echo ('No pudo conectarse: '. mysqli_connect_error());
    }
  ?>
</section>
