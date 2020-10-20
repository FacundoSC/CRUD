<?php 

$conexion =  mysqli_connect("localhost", "root", "", "personas");

if ($conexion->connect_errno) {
    echo "Fallo al conectar a MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}


?>