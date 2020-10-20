<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <title>Document</title>
</head>
<body>
    <?php 
    include 'conexion.php';
    $sql="call ssp_listar_usuarios()";
    $resultado = $conexion->query($sql);
    ?>
    <div>
        <a href="agregar.php" class="btn btn-success">Nuevo</a> 
        <br><br>
        <table class="table" >
            <thead class="thead-dark">
            <tr>
                <th>ID</th>
                <th>Apellido</th>
                <th>Nombre</th>
                <th>Email</th>
                <th>Telefono</th>
                <th>Edad</th>
                <th>Acciones</th>


            </tr>
            </thead>
            <tbody>
                <?php while ($columna = mysqli_fetch_array( $resultado )){ ?>
              <tr>
               <td><?php echo $columna['idUsuario']; ?></td>
               <td><?php echo $columna['Apellido']; ?></td>
               <td><?php echo $columna['Nombre']; ?></td>
               <td><?php echo $columna['Email']; ?></td>
               <td><?php echo $columna['Telefono']; ?></td>
               <td><?php echo $columna['Edad']; ?></td> 
               <td>
               <a href="editar.php?id=<?php echo $columna['idUsuario'] ?>" class="btn btn-primary ">UPDATE</a>
               <a href="eliminar.php?id=<?php echo $columna['idUsuario'] ?>" class="btn btn-danger ">DELETE</a>
               </td>   
              </tr>
                <?php }?>
            </tbody>
        </table>
    </div>
 
</body>
</html>