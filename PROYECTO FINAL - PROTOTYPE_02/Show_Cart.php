<?php
include 'Global/Configuration.php';
include 'Cart.php';
include 'Templates/Header_Second.php';
?>

<br>
<h3>Lista del Carrito</h3>
<?php if (!empty($_SESSION['Cart'])) { ?>
    <table class="Table_01">
        <tbody>
            <tr>
                <th width=15% style="text-align: center;">Marca</th>
                <th width=40% style="text-align: center;">Nombre</th>
                <th width=15% style="text-align: center;">Precio</th>
                <th width=20% style="text-align: center;">Cantidad</th>
                <th width=20% style="text-align: center;">Total</th>
                <th width=5%></th>
            </tr>
            <?php $Total_Venta = 0; ?>
            <?php foreach ($_SESSION['Cart'] as $Index => $Product) { ?>
                <tr>
                    <td width=15% style="text-align: center;"><?php echo $Product['Marca_Producto'] ?></td>
                    <td width=40% style="text-align: center;"><?php echo $Product['Nombre_Producto'] ?></td>
                    <td width=15% style="text-align: center;">S/.<?php echo $Product['Precio_Producto'] ?></td>
                    <td width=20% style="text-align: center;"><?php echo $Product['Cantidad'] ?></td>
                    <td width=20% style="text-align: center;">S/.<?php echo number_format($Product['Precio_Producto'] * $Product['Cantidad'], 2); ?></td>
                    <td width=5%>
                        <form method="POST">
                            <input type="hidden" name="ID_Producto" id="ID_Producto" value="<?php echo openssl_encrypt($Product['ID_Producto'], Encryption_Method, Key); ?>">
                            <button class="btn btn-danger" type="submit" name="Action_Button" value="Delete">Eliminar</button>
                        </form>
                    </td>
                </tr>
                <?php $Total_Venta = $Total_Venta + ($Product['Precio_Producto'] * $Product['Cantidad']); ?>
                <?php //print_r($_SESSION["Cart"]); 
                ?>
            <?php } ?>
            <tr>
                <td></td>
                <td colspan="3" style="text-align: right;">
                    <h3>Total</h3>
                </td>
                <td style="text-align: center;">
                    <h3>S/.<?php echo number_format($Total_Venta, 2); ?></h3>
                </td>
            </tr>
        </tbody>
    </table>

    <br>

    <form action="Pay.php" method="POST">
        <div class="alert alert-success">
            <input type="hidden" name="Username_Usuario" id="Username_Usuario" value="<?php echo $_SESSION['Username_Usuario']; ?>">
            <div class="form-group">
                <label for="my-input">Dirección de Envío:</label>
                <br>
                <br>
                <input style="width: 350px" id="Direccion_Venta" name="Direccion_Venta" class="form-control" placeholder="Porfavor Escriba la Dirección Exacta de su Domicilio" required>
            </div>
            <br>
            <small id="Direccion_Venta_Help" class="form-text text-muted">Los Productos se Enviarán a la Dirección Proporcionada por el Usuario.</small>
        </div>
        <br>
        <button class="btn btn-primary btn-lg btn-block" type="submit" name="Action_Button" value="Process">Proceder a Pagar>></button>
    </form>
<?php } else { ?>
    <div class="alert alert-success">
        No hay Productos en el Carrito
    </div>
<?php } ?>

<?php
include 'Templates/Footer_Second.php';
?>