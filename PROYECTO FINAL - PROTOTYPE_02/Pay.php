<?php
include 'Global/Configuration.php';
include 'Global/Connection.php';
include 'Cart.php';
include 'Templates/Header_Second.php';
?>

<?php
if ($_POST) {
    $Total_Venta = 0;
    $ID_Usuario = 0;
    $Session_ID = session_id();
    $Direccion_Venta = $_POST['Direccion_Venta'];
    foreach ($_SESSION['Cart'] as $Index => $Producto) {
        $Total_Venta = $Total_Venta + ($Producto['Precio_Producto'] * $Producto['Cantidad']);
    }

    $Username_Usuario = $_POST['Username_Usuario'];

    $Connection = mysqli_connect('localhost', 'root', '', 'TPW_DIGITAL_TECH_WEB_APP') or die('Unable to Connect to the Data_Base');
    $Result = mysqli_query($Connection, "SELECT `ID_Usuario` FROM `tabla_usuario` WHERE `Username_Usuario` = '$Username_Usuario'");
    $Row = mysqli_fetch_array($Result);

    if (is_array($Row)) {
        $ID_Usuario = $Row['ID_Usuario'];
    }

    $Statement = $PDO->prepare("INSERT INTO `tabla_venta` (`ID_Venta`, `ID_Usuario`, `Clave_Transaccion_Venta`, `Paypal_Datos_Venta`, `Fecha_Venta`, `Direccion_Venta`, `Total_Venta`, `Estatus_Venta`) VALUES (NULL, :ID_Usuario, :Clave_Transaccion_Venta, '', NOW(), :Direccion_Venta, :Total_Venta, 'Pendiente');");
    $Statement->bindParam(":ID_Usuario", $ID_Usuario);
    $Statement->bindParam(":Clave_Transaccion_Venta", $Session_ID);
    $Statement->bindParam(":Direccion_Venta", $Direccion_Venta);
    $Statement->bindParam(":Total_Venta", $Total_Venta);
    $Statement->execute();
    $ID_Venta = $PDO->lastInsertId();

    foreach ($_SESSION['Cart'] as $Index => $Producto) {

        $Statement = $PDO->prepare("INSERT INTO `tabla_detalle_venta` (`ID_Detalle_Venta`, `ID_Venta`, `ID_Producto`, `Precio_Detalle_Venta`, `Cantidad_Detalle_Venta`) VALUES (NULL, :ID_Venta, :ID_Producto, :Precio_Detalle_Venta, :Cantidad_Detalle_Venta);");

        $Statement->bindParam(":ID_Venta", $ID_Venta);
        $Statement->bindParam(":ID_Producto", $Producto['ID_Producto']);
        $Statement->bindParam(":Precio_Detalle_Venta", $Producto['Precio_Producto']);
        $Statement->bindParam(":Cantidad_Detalle_Venta", $Producto['Cantidad']);
        $Statement->execute();
    }
    echo "<h3>" . $Total_Venta . "<h3>";
}
?>

<?php
include 'Templates/Footer_Second.php';
?>