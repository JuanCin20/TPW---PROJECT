<?php
include 'Global/Configuration.php';
include 'Global/Connection.php';
include 'Cart.php';
include 'Templates/Header_Second.php';
?>

<?php
$Connection = mysqli_connect('localhost', 'root', '', 'TPW_DIGITAL_TECH_WEB_APP') or die('Unable to Connect to the Data_Base');
?>

<?php
$Username_Usuario = $_SESSION['Username_Usuario'];
$Result_01 = mysqli_query($Connection, "SELECT `ID_Usuario` FROM `tabla_usuario` WHERE `Username_Usuario` = '$Username_Usuario'");
$Row_01 = mysqli_fetch_array($Result_01);
if (is_array($Row_01)) {
    $ID_Usuario = $Row_01['ID_Usuario'];
}
?>

<br>
<h3>Historial de Compra</h3>
<table class="Table_02">
    <tbody>
        <tr>
            <th style="text-align: center;">Fecha de la Venta</th>
            <th style="text-align: center;">Direccion de Entrega</th>
            <th style="text-align: center;">Nombre del Producto</th>
            <th style="text-align: center;">Precio del Producto (p/u)</th>
            <th style="text-align: center;">Cantidad de Compra del Producto</th>
            <th style="text-align: center;">Entrega</th>
        </tr>
        <?php
        $Result_02 = mysqli_query($Connection, "SELECT ID_Usuario, Fecha_Venta, Direccion_Venta, TP.Nombre_Producto, TDV.Precio_Detalle_Venta, TDV.Cantidad_Detalle_Venta, Estatus_Venta
        FROM tabla_venta TV INNER JOIN tabla_detalle_venta TDV ON TV.ID_Venta = TDV.ID_Venta INNER JOIN tabla_producto TP ON TDV.ID_Producto = TP.ID_Producto WHERE ID_Usuario = '$ID_Usuario'");
        while ($Row_02 = mysqli_fetch_array($Result_02)) {
        ?>
            <tr>
                <td style="text-align: center;"><?php echo $Row_02['Fecha_Venta'] ?></td>
                <td style="text-align: center;"><?php echo $Row_02['Direccion_Venta'] ?></td>
                <td style="text-align: center;"><?php echo $Row_02['Nombre_Producto'] ?></td>
                <td style="text-align: center;">S/. <?php echo $Row_02['Precio_Detalle_Venta'] ?></td>
                <td style="text-align: center;"><?php echo $Row_02['Cantidad_Detalle_Venta'] ?></td>
                <td style="text-align: center;"><?php echo $Row_02['Estatus_Venta'] ?></td>
            </tr>
        <?php } ?>
    </tbody>
</table>

<?php
include 'Templates/Footer_Second.php';
?>