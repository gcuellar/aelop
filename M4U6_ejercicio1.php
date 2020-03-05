<!DOCTYPE html>
<html>
<head>
  <style>
    .error {color: #FF0000;}
  </style>
</head>
<body >
<?php
class pelicula {
    public $nombre;
    public $director;
    public $anyo;
    public $alquilada;
    public $precio;
    public $fecha_devolucion;

    public function pelicula($nombre, $director, $anyo, $alquilada, $precio, $fecha_devolucion){
        $this->nombre = $nombre;
        $this->director = $director;
        $this->anyo = $anyo;
        $this->alquilada = $alquilada;
        $this->precio = $precio;
        $this->fecha_devolucion = DateTime::createFromFormat('d-m-Y', $fecha_devolucion);
    }

    public function leerNombre(){
        return $this->nombre;
    }
    public function leerDirector(){
      return $this->director;
    }
    public function leerAnyo(){
        return $this->anyo;
    }
    public function leerAlquilada(){
        return $this->alquilada;
    }
    public function leerPrecio(){
        return $this->precio;
    }
    public function leerFechaDevolucion(){
        return $this->fecha_devolucion;
    }
    public function calcularRecargo(){
        $recargo = 0.0;
        $fechaActual = new DateTime("now");
        if ($this->alquilada == 'Sí') {
            if (!is_null($this->fecha_devolucion) && $fechaActual > $this->fecha_devolucion) {
              $retraso = $fechaActual->diff($this->fecha_devolucion);
              $recargo = $retraso->days * 1.2;
            }
        }
        return $recargo;
    }
}

$nombreErr = $nombre = $directorErr = $director = $alquiladaErr = $alquilada = $fecha_devolucion = $anyoErr = $precioErr = $fecha_devolucionErr = "";
$anyo = $precio = 0;

$datos_validados = true;
if ($_SERVER["REQUEST_METHOD"] == "POST") {
  if (empty($_POST["nombre"])) {
    $nombreErr = "El nombre is obligatorio";
    $datos_validados = false;
  } else {
    $nombre = test_input($_POST["nombre"]);
    // letras y números
    if (!preg_match("/^[a-zA-Z ]*$/",$nombre)) {
      $nombreErr = "Solo se permiten letras, números y espacios en blanco";
      $datos_validados = false;
    }
  }

  if (empty($_POST["director"])) {
    $directorErr = "El nombre del director es obligatorio";
    $datos_validados = false;
  } else {
    $director = test_input($_POST["director"]);
    // letras y números
    if (!preg_match("/^[a-zA-Z ]*$/",$director)) {
      $directorErr = "Solo se permiten letras, números y espacios en blanco";
      $datos_validados = false;
    }
  }

  if (empty($_POST["anyo"])) {
    $anyoErr = "El anyo es obligatorio";
    $datos_validados = false;
  } else {
    $anyo = test_input($_POST["anyo"]);
    // 4 numeros
    if (!preg_match("/^\d{4}$/",$anyo)) {
      $anyoErr = "El anyo debe contener cuatro números";
      $datos_validados = false;
    }
  }

  if (empty($_POST["precio"])) {
    $precioErr = "El precio es obligatorio";
    $datos_validados = false;
  } else {
    $precio = test_input($_POST["precio"]);
    // importe válido, separador decimal punto
    if (!preg_match("/^\d+(,\d{3})*(\.\d{1,2})?$/",$precio)) {
      $precioErr = "El precio no tiene un formato válido";
      $datos_validados = false;
    }
  }

  if($_POST["alquilada"] == "Sí"){
    if (empty($_POST["fecha_devolucion"]) || !validateDate($_POST["fecha_devolucion"])) {
      $fecha_devolucionErr = "Formato inválido. Ej: d-m-Y";
      $datos_validados = false;
    } else {
      $fecha_devolucion = $_POST["fecha_devolucion"];
    }
  }else{
    $fecha_devolucion = NULL;
  }

  $alquilada = $_POST["alquilada"];
}

function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}

function validateDate($date, $format = 'd-m-Y'){
    $d = DateTime::createFromFormat($format, $date);
    return $d && $d->format($format) === $date;
}
?>

<h2>Mi Videoclub</h2>
<p><span class="error">* campo requerido</span></p>
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
  Nombre: <input type="text" name="nombre" value="<?php echo $nombre;?>">
  <span class="error">* <?php echo $nombreErr;?></span>
  <br><br>

  Director: <input type="text" name="director" value="<?php echo $director;?>">
  <span class="error">* <?php echo $directorErr;?></span>
  <br><br>

  Anyo: <input type="text" name="anyo" value="<?php echo $anyo;?>">
  <span class="error">* <?php echo $anyoErr;?></span>
  <br><br>

  Precio: <input type="text" name="precio" value="<?php echo $precio;?>">
  <span class="error">* <?php echo $precioErr;?></span>
  <br><br>

  Alquilada:
  <input type="radio" name="alquilada" <?php if (isset($alquilada) && $alquilada=="Sí") echo "checked";?> value="Sí"> Sí
  <input type="radio" name="alquilada" <?php if (isset($alquilada) && $alquilada=="No") echo "checked";?> value="No"> No
  <br><br>

  Fecha Devolución: <input type="text" name="fecha_devolucion" value="<?php echo $fecha_devolucion;?>">
  <span class="error"> <?php echo $fecha_devolucionErr;?></span>
  <br><br>

  <input type="submit" name="submit" value="Submit">
</form>
  <br><br>
  <br><br>
<?php
  if($_SERVER["REQUEST_METHOD"] == "POST" && $datos_validados){
    $obj = new pelicula($nombre, $director, $anyo, $alquilada, $precio, $fecha_devolucion);

    echo 'Datos de la película "'.$obj->leerNombre().'":';
    echo '<br>- Director: '.$obj->leerDirector();
    echo '<br>- Año: '.$obj->leerAnyo();
    echo '<br>- Alquilada: '.$obj->leerAlquilada();
    echo '<br>';
    echo '<br>Precio del alquiler: '.$obj->leerPrecio().'€ (Con un recargo de 1.2€ por cada día de retraso)<br/>';
    if ($obj->leerAlquilada() == 'Sí' && !is_null($obj->leerFechaDevolucion())) {
      echo '<br>Fecha de devolucion de la película: '.$obj->leerFechaDevolucion()->format('d-m-Y');
    }

    $recargo = $obj->calcularRecargo();
    $total = $obj->leerPrecio()+$recargo;
    if ($recargo>0) {
      echo '<br>Debido al retraso en la devolución el recargo asciende a '.$recargo.'€';
    }
    echo '<br>El precio total es de '.$total.'€<br/>';
  }
?>

</body>
</html>
