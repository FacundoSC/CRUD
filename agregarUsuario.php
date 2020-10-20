<?php
 include 'conexion.php';
 $apellido = $_POST['apellido'];
 $nombre = $_POST['nombre'];
 $email = $_POST['email'];
 $telefono = $_POST['telefono'];
 $edad = $_POST['Edad'];

 $sql = "call ssp_alta_usuario('".$apellido."','".$nombre."','".$email."','".$telefono."','".$edad."')";
   if($conexion->query($sql)){
      mysqli_close($conexion);
       header("location:index.php");
   }
   else{

      echo " no se agrego registro";
   }

?>