<?php
$Server = "mysql:dbname=" . Data_Base . ";host=" . Server;
try {
    $PDO = new PDO($Server, Username, Password, array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
    //echo "<script>alert('Conexión a la Base de Datos: Exitosa')</script>";
} catch (PDOException $e) {
    //echo "<script>alert('Conexión a la Base de Datos: Fallida')</script>";
}
