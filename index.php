<?php
$servername = "localhost";  // Cambia esto si tu servidor MySQL no está en localhost
$username = "root";
$password = "";
$dbname = "control_almacen";


try {
  $conexion = new PDO(
      "mysql:host=" . $servername . ";dbname=" . $dbname,
      $username,
      $password,
      array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8")
  );
  $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

} catch (PDOException $e) {
  echo 'aqui';
  $conexion = false;
}

// Lists
/*
 $busqueda = 4;
 $sql = "CALL CA_datosList($busqueda)";
 $statement = $conexion->prepare($sql);
 $statement->execute();
 //echo 'aqui';
 $datos = $statement->fetchAll(PDO::FETCH_OBJ);
 //var_dump($datos);

 foreach ($datos as $datos) {
   echo $datos->nombre;
 }
  
 //echo 'aqui2' ;*/


// Modificate
/*$SP = "CALL CA_datosModify('5', @state)";
$statement = $conexion->prepare($SP);
$statement->execute();
$statement->closeCursor(); // cuando hay mas de una sentencia
$mensajeOutput = $conexion->query("SELECT @state")->fetch(PDO::FETCH_OBJ);
echo $mensajeOutput->{'@state'};
$conexion = null;*/


// Modificate
/*
$SP = "CALL CA_datosInsert(9, @state)";
$statement = $conexion->prepare($SP);
$statement->execute();
$statement->closeCursor(); // cuando hay mas de una sentencia
$mensajeOutput = $conexion->query("SELECT @state")->fetch(PDO::FETCH_OBJ);
echo $mensajeOutput->{'@state'};
$conexion = null;*/


// Modificate
/**/
$SP = "CALL CA_datosDelete(9, @state)";
$statement = $conexion->prepare($SP);
$statement->execute();
$statement->closeCursor(); // cuando hay mas de una sentencia
$mensajeOutput = $conexion->query("SELECT @state")->fetch(PDO::FETCH_OBJ);
echo $mensajeOutput->{'@state'};
$conexion = null;


?>
