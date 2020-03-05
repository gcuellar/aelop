<!DOCTYPE html>
<html>
<head>

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
        $this->fecha_devolucion = $fecha_devolucion;
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
        $recargo = 0;
        $fechaActual = date("d-m-Y");
        if ($this->alquilada == 'true') {
            if ($fechaActual > $this->fecha_devolucion) {
              $retraso = (integer)$fechaActual - (integer)$this->fecha_devolucion; 
              $recargo = $retraso * 1.2;
            }
        }
        return ($recargo);
    }
}

$obj = new pelicula('Campeones', 'Javier Fesser', 2018, 'true', 5, '04-03-2020');
$obj2 = new pelicula('Carmen y Lola', 'Arantxa Echevarría', 2018, 'false', 5, '');

$total = $obj->leerPrecio() + $obj->calcularRecargo();

echo 'Datos de la película "'.$obj->leerNombre().'":';
echo '<br>- Director: '.$obj->leerDirector();
echo '<br>- Año: '.$obj->leerAnyo();
echo '<br>Precio del alquiler: '.$obj->leerPrecio().'€ (Con un recargo de 1.2€ por cada día de retraso)<br/>';
if ($obj->leerAlquilada() == 'true') {
  echo '<br>Fecha de devolucion de la película: '.$obj->leerFechaDevolucion();
}
if ($obj->calcularRecargo()>0) {
  echo '<br>Debido al retraso en la devolución el recargo asciende a '.$obj->calcularRecargo().'€';
}
echo '<br>El precio total es de '.$total.'€<br/>';

?>
</body>
</html>
