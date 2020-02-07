<?php include 'conection.php'; ?>
<section class="mi-cita" id="mi-cita">
  <div class="container text-center">
    <h2>Cita previa</h2>
  </div>
  <div id="cita">
    <div class="centrar-form">
      <?php $idusuario = $_SESSION['idusuario'];
      // $fechaActual = date('c', time());
      $fechaActual = date('yy-m-d H:m', time());
      $fechaActual =  str_replace(" ", "T",$fechaActual);
      if ($conn) { //Si hay conexión con la bbdd
        // COMPRUEBA SI EXISTE EL CLIENTE
        $sql = "SELECT * FROM clientes WHERE usuario='".$idusuario."'";
        $result = mysqli_query($conn, $sql);
        if($result) {
          // Si hay registros
          if(mysqli_num_rows($result) !== 0) {
            while($row=mysqli_fetch_array($result)) {
              $idcliente = $row['idcliente'];
            }
            // OBTIENE DATOS DE LA CITA
            $sql = "SELECT * FROM citas WHERE cliente='".$idcliente."'";
            $result = mysqli_query($conn, $sql);
            if($result) {
              // Si hay registros
              if(mysqli_num_rows($result) !== 0) {
                while($row=mysqli_fetch_array($result)) {
                  $idcliente = $row['cliente'];
                  $idcita = $row['idcita'];
                  $fecha = $row['fecha'];
                } //Si el cliente ya tiene una cita
                $fechaCita = date('j-m-Y \a \l\a\s H:i', strtotime($fecha));
                $cadena = '<div class="datos-cita">Su cita es el dia '.$fechaCita.'</div>';
                $cadena .= '<h3>¿Quiere modificar su cita?</h3>';
                $cadena .= '<form class="cita">';
                  $cadena .= '<input id="ci-idcliente" type="hidden" name="idcliente" value="'.$idcliente.'">';
                  $cadena .= '<input id="ci-idcita" type="hidden" name="idcita" value="'.$idcita.'">';
                  $cadena .= '<label for="fecha">Fecha y hora ';
                  $fecha = str_replace(" ", "T",$fecha);
                  $cadena .= '<input id="ci-fecha" type="datetime-local" name="fecha" value="'.$fecha.'"></label>';
                  $cadena .= '<br><button type="button" onclick="modificarCita(\''.$fecha.'\');" name="guardar">Modificar cita</button>';
                $cadena .= '</form>';
              } else { //Si no hay datos de niguna cita para el cliente
                $cadena = '<h3>Solicitar cita ahora</h3>';
                $cadena .= '<form class="cita">';
                  $cadena .= '<input id="ci-idcliente" type="hidden" name="idcliente" value="'.$idcliente.'">';
                  $cadena .= '<label for="fecha">Fecha y hora ';
                  $cadena .= '<input id="ci-fecha" type="datetime-local" name="fecha" value="'.$fechaActual.'"></label>';
                  $cadena .= '<br><button type="button" onclick="nuevaCita();" name="guardar">Enviar</button>';
                $cadena .= '</form>';
              }
              echo $cadena;
            }
            else {
              echo 'No se ha encontrado ninguna cita';
            }
          }
          else { //Si no hay datos del cliente amacenado
            $cadena = '<h3>Rellene sus datos personales para solicitar una cita</h3>';
            $cadena .= '<form class="cita">';
              $cadena .= '<input id="ci-idusuario" type="hidden" name="idusuario" value="'.$idusuario.'">';
              $cadena .= '<label for="nombre">Nombre ';
              $cadena .= '<input id="ci-nombre" type="text" name="nombre" value=""></label>';
              $cadena .= '<label for="apellidos">Apellidos ';
              $cadena .= '<input id="ci-apellidos" type="text" name="apellidos" value=""></label>';
              $cadena .= '<label for="telefono">Teléfono ';
              $cadena .= '<input id="ci-telefono" type="text" name="telefono" value=""></label>';
              $cadena .= '<label for="fecha">Fecha y hora ';
              $cadena .= '<input id="ci-fecha" type="datetime-local" name="fecha" value="'.$fechaActual.'"></label>';
              $cadena .= '<br><button type="button" onclick="nuevoClienteCita();" name="guardar">Enviar</button>';
            $cadena .= '</form>';
            echo $cadena;
          }
        }
        else {
          echo 'No existe el cliente';
        } ?>
        <?php
        mysqli_close($conn); //cierra la conxión
      }
      else {
        echo ('No pudo conectarse: '. mysqli_connect_error());
      } ?>
      <div id="ci-result" class="res"> </div>
    </div>
  </div>
</section>
