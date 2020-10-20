<?php
include 'conexion.php';
$id = $_GET['id'];
$sql = "call ssp_borra_usuario('".$id."')";

if($conexion->query($sql)){
    mysqli_close($conexion);

    header("location:index.php");
}
else{

   echo " no se agrego registro";
}



?>