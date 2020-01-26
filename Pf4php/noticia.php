<?php include 'conection.php' ?>
<section>
  <div class="contenido-inicial single">
    <div id="noticia">
      <?php //Usa la conexión con la bbdd
        if ($conn) {
          $sql = "SELECT * FROM noticias";
      		$result = mysqli_query($conn, $sql);
      		if($result) {
      			// Si hay registros
            $cadena='';
            $single='"noticia.html"';
            $idsingle=$_GET["id"];
      			if(mysqli_num_rows($result) !== 0) {
      				while($row=mysqli_fetch_array($result)) {
                if ($row['idnoticia']==$idsingle) {
                  $cadena .= "<div class='noticia'><div class='foto-fecha'><div class='foto'>";
                  $cadena .= "<img src='img/".$row['imagen']."' alt='".$row['titular']."'></div>";
                  $cadena .= "<div class='fecha'>".$row['fecha']."</div></div>";
                  $cadena .= "<div class='titular'><h2>".$row['titular']."</h2></div>";
                  $cadena .= "<div class='texto'>".$row['cuerpo']."</div></div>";
                }
      				}
              echo $cadena;
              echo $row['titular'];
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
