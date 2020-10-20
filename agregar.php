<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <title>Agregar</title>
</head>
<body>
<form action="agregarUsuario.php" method="POST" class="form-horizontal ">
 <div class="form-group">
   <label for="apellido" class="col-md-2 control-label">Apellido:</label>
   <div class="col-md-10">
     <input type="text" name="apellido" class="form-control"  minlength="2" maxlength="60" pattern="[A-Za-z]+" title=" solo letras. Tamaño mínimo caracteres: 2. Tamaño máximo caracteres: 60" >
    </div><br>
     
     <label for="nombre" class="col-md-2 control-label">Nombre:</label>
     <div class="col-md-10">
     <input type="text" name="nombre" class="form-control"  minlength="2" maxlength="60" pattern="[A-Za-z]+" title=" solo letras. Tamaño mínimo caracteres : 2. Tamaño máximo caracteres: 60">
     </div><br>

     <label for="email" class="col-md-2 control-label">Email:</label>
     <div class="col-md-10">
     <input type="email" name="email" class="form-control"  minlength="6" maxlength="30" title=" solo email. Tamaño mínimo caracteres: 6. Tamaño máximo caracteres: 30">
     </div><br>

     <label for="telefono" class="col-md-2 control-label">Telefono:</label>
     <div class="col-md-10">
     <input type="text" name="telefono" class="form-control" minlength="7" maxlength="10"  pattern="[0-9]+" title=" solo números. Tamaño mínimo números: 7. Tamaño máximo números: 10">
     </div><br>
     <label for="Edad" class="col-md-2 control-label">Edad:</label>
      <div class="col-md-10"> 
     <input type="text" name="Edad" class="form-control" minlength="1" maxlength="3"  pattern="[0-9]+" title=" solo números. Tamaño mínimo números: 1. Tamaño máximo números: 3">
     </div><br>

      <button type="submit" class="btn btn-primary"> AGREGAR USUARIO</button>
       <a href="index.php" class="btn btn-danger ">REGRESAR</a>
  </div>  
 </form>


  
</body>
</html>


