<?php include 'conection.php' ?>
<section>
  <div class="contenido-inicial text-center">
    <h2> Sobre mí </h2>
    <p>Ingeniera técnica en informática de gestión y en proceso de graduarme en la especialidad de ingeniería del software.</p>
    <h3>Conocimientos:</h3>
    <div class="row stats-row">
      <div class="stats-col text-center col-md-3 col-xs-12">
        <div class="circle"><span class="stats-no">10</span>HTML</div>
      </div>
      <div class="stats-col text-center col-md-3 col-xs-12">
        <div class="circle"><span class="stats-no">10</span>CSS y SASS</div>
      </div>
      <div class="stats-col text-center col-md-3 col-xs-12">
        <div class="circle"><span class="stats-no">9</span>PHP</div>
      </div>
      <div class="stats-col text-center col-md-3 col-xs-12">
        <div class="circle"><span class="stats-no">8</span>JavaScript y AJAX</div>
      </div>
    </div>
  </div>
</section>
<section>
  <div class="contenido-inicial text-center">
    <h2> Noticias </h2>
    <div id="noticias">
      <?php //Si hay conexión con la bbdd
        // $conn = mysqli_connect($hostname, $username, $password, $dbname);
        if ($conn) {
          $sql = "SELECT * FROM noticias LIMIT 5";
      		$result = mysqli_query($conn, $sql);
      		if($result) {
      			// Si hay registros
            $cadena='';
            $single='"noticia.php?id="';
      			if(mysqli_num_rows($result) !== 0) {
      				while($row=mysqli_fetch_array($result)) {
                $single='"noticia.php?id='.$row['idnoticia'].'"';
                $titular = $row['titular'];
      					// echo $row['titular'].' - '.$row['encabezado'].' '.$row['imagen'].' '.$row['fecha'].'<br />';
                $cadena .= "<div class='noticia'><div class='foto-fecha'><div class='foto'>";
                $cadena .= "<img src='img/".$row['imagen']."' alt='".$row['titular']."'></div>";
                $cadena .= "<div class='fecha'>".$row['fecha']."</div></div>";
                $cadena .= "<a class='titular' onclick='cargarContenido(".$single.");' target='_blank'>";
                $cadena .= "<h4>".$titular."</h4></a>";
                $cadena .= "<div class='encabezado'>".$row['encabezado']."</div></div>";
      				}
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
    </div>
  </div>
</section>
