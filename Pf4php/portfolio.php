<?php include 'conection.php' ?>
<section class="miportfolio" id="portfolio">
  <div class="container text-center">
    <h2>Portfolio</h2>
    <p>Haz clic sobre la foto para ver los detalles de cada uno de mis proyectos</p>
  </div>

  <?php
    if ($conn) { //Si hay conexión con la bbdd
      // OBTIENE DATOS DE PROYECTOS
      $sql = "SELECT * FROM proyectos";
      $result = mysqli_query($conn, $sql);
      if($result) {
        // Si hay registros
        $cadena = '<div class="portfolio-grid">';
        if(mysqli_num_rows($result) !== 0) {
          while($row=mysqli_fetch_array($result)) {
            $nombre = $row['nombre'];
            $imagen = $row['imagen'];
            $altimg = $row['altimg'];
            $datos = $row['datos'];
            $tecnologia = $row['tecnologia'];
            $tiempo = $row['tiempo'];

            if ($tecnologia) {
              $datac = '<b>Tecnología:</b> '.$tecnologia;
            }
            if ($tiempo) {
              $datac .= '<br><b>Tiempo:</b> '.$tiempo.' horas';
            }
            if ($datos) {
              $datac .= '<br><b>Características:</b> '.$datos;
            }

            $cadena .= '<div class="col-lg-4 col-sm-6 col-xs-12">';
              $cadena .= '<div class="card card-block">';
                $cadena .= '<a href="img/'.$imagen.'" rel="nofollow" data-fancybox="portfolio-gallery" data-caption="'.$datac.'">';
                  $cadena .= '<img alt="'.$altimg.'" src="img/'.$imagen.'">';
                  $cadena .= '<div class="portfolio-over">';
                    $cadena .= '<h3 class="card-title">'.$nombre.'</h3>';
                  $cadena .= '</div>';
                $cadena .= '</a>';
              $cadena .= '</div>';
            $cadena .= '</div>';
          }
          $cadena .= "</div>";
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
