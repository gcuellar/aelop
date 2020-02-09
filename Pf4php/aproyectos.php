<?php include 'conection.php'; ?>
<section class="misproyectos" id="proyectos">
  <div class="container text-center">
    <h2>Proyectos</h2>
    <p>Selecciona el proyecto a modificar (<i class="fa fa-pencil"></i>) y edita sus datos en el formulario o añade uno nuevo</p>
  </div>
  <?php
    if ($conn) { //Si hay conexión con la
      // OBTIENE DATOS DE PROYECTOS
      $sql = "SELECT * FROM proyectos";
      $result = mysqli_query($conn, $sql);
      if($result) {
        // Si hay registros
        $cadena = '<div class="lista-proyectos"><ul>';
        if(mysqli_num_rows($result) !== 0) {
          while($row=mysqli_fetch_array($result)) {
            $nombre = $row['nombre'];
            $imagen = $row['imagen'];
            $altimg = $row['altimg'];
            $idproyecto = $row['idproyecto'];

            $cadena .= '<li>';
              $cadena .= '<a class="editaProyecto" onclick="cargarDatosProyecto('.$idproyecto.');"><i class="fa fa-pencil"></i></a>';
              $cadena .= '<div class="miniatura">';
                $cadena .= '<img alt="'.$altimg.'" src="img/'.$imagen.'">';
              $cadena .= '</div>';
              $cadena .= '<div class="nombre">'.$nombre.'</div>';
            $cadena .= '</li>';
          }
          $cadena .= "</ul></div>";
          echo $cadena;
        } else {
          echo 'No se han encontrado registros';
        }
      }

      // MODIFICA DATOS DE PROYECTOS

      // formulario para proyectos
      ?>
      <div class="centrar-form">
        <h3 id="form-title">Añadir nuevo proyecto</h3>
        <form class="proyectos">
          <input id="p-idproyecto" type="hidden" name="idproyecto" value="">
          <label for="nombre">Nombre
          <input id="p-nombre" type="text" name="nombre" value=""></label>
          <label for="imagen">Imagen
          <input id="p-imagen" type="file" name="imagen" value=""></label>
          <label for="altimagen">Texto alternativo de la imagen
          <input id="p-altimagen" type="text" name="altimagen" value=""></label>
          <label for="datos">Descripción del proyecto
          <input id="p-datos" type="textarea" name="datos" value=""></label>
          <label for="tecnologia">Tecnología
          <input id="p-tecnologia" type="text" name="tecnologia" value=""></label>
          <label for="tiempo">Tiempo (horas)
          <input id="p-tiempo" type="number" name="tiempo" value=""></label>
          <button type="button" onclick="guardarProyecto();" name="guardar">Guardar</button>
          <div id="result" class="res"> </div>
        </form>
      </div>
      <?php mysqli_close($conn); //cierra la conxión
    }
    else {
      echo ('No pudo conectarse: '. mysqli_connect_error());
    }
  ?>
</section>
