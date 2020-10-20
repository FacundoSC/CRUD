<?php

include 'conexion.php';
$id = $_POST['id'];
$apellido = $_POST['apellido'];
$nombre = $_POST['nombre'];
$email = $_POST['email'];
$telefono = $_POST['telefono'];
$edad = $_POST['Edad'];

$sql = "call ssp_modifica_usuario('".$id."','".$apellido."','".$nombre."','".$email."','".$telefono."','".$edad."')";

if($conexion->query($sql)){
    mysqli_close($conexion);
    header("location:index.php");
}
else{

   echo " no se agrego registro";
}



?>