<?php
include 'Global/Configuration.php';
include 'Global/Connection.php';
include 'Cart.php';
include 'Templates/Header_Second.php';
?>

<main>
    <?php
    if (isset($_POST['Action_Button'])) {
        switch ($_POST['Action_Button']) {
            case 'Details':
                if (isset($_POST['Action_Button'])) {
                    $Nombre = openssl_decrypt($_POST['Nombre_Producto'], Encryption_Method, Key);

                    $Statement = $PDO->prepare("SELECT * FROM `tabla_imagen_calidad` WHERE `Nombre_Imagen_Calidad` = '$Nombre'");
                    $Statement->execute();
                    $Product_IMGs = $Statement->fetchAll(PDO::FETCH_ASSOC);

                    $Statement = $PDO->prepare("SELECT * FROM `tabla_producto` WHERE `Nombre_Producto` = '$Nombre'");
                    $Statement->execute();
                    $Product_List = $Statement->fetchAll(PDO::FETCH_ASSOC);
                    //print_r($Product_List);

                    foreach ($Product_IMGs as $Product_IMG) {
                        foreach ($Product_List as $Producto) {
                        }
    ?>

                        <div class="Product_IMG">
                            <img id="Alter_IMG" src="<?php echo $Product_IMG['Img_Imagen_Calidad']; ?>" alt="<?php echo $Product_IMG['Nombre_Imagen_Calidad']; ?>">
                        </div>

                        <div class="Product_Alternative">
                            <div class="Product_Title">
                                <h3><?php echo $Producto['Nombre_Producto']; ?></h3>
                            </div>

                            <div class="Product_Price">
                                <h3>S/. <?php echo $Producto['Precio_Producto']; ?></h3>
                            </div>
                            <form method="POST" action="Show_Cart.php">
                                <div class="Add_Cart_Container">
                                    <div class="Number_Product_Container">
                                        <input type="number" name="Number_Product" placeholder="1" value="1" min="1" class="Number_Product_Container_Input" />
                                        <div class="Number_Product_Container_Buttons">
                                            <i class="fa-solid fa-chevron-up" id="Plus"></i>
                                            <i class="fa-solid fa-chevron-down" id="Less"></i>
                                        </div>
                                    </div>

                                    <input type="hidden" name="ID_Producto" id="ID_Producto" value="<?php echo openssl_encrypt($Producto['ID_Producto'], Encryption_Method, Key); ?>">
                                    <input type="hidden" name="Marca_Producto" id="Marca_Producto" value="<?php echo openssl_encrypt($Producto['Marca_Producto'], Encryption_Method, Key); ?>">
                                    <input type="hidden" name="Nombre_Producto" id="Nombre_Producto" value="<?php echo openssl_encrypt($Producto['Nombre_Producto'], Encryption_Method, Key); ?>">
                                    <input type="hidden" name="Precio_Producto" id="Precio_Producto" value="<?php echo openssl_encrypt($Producto['Precio_Producto'], Encryption_Method, Key); ?>">

                                    <button class="Add_Cart_Button" name="Action_Button" value="Add" type="submit">
                                        <i class="fa-solid fa-plus"></i>
                                        <span>Añadir al Carrito</span>
                                    </button>
                                </div>
                            </form>
                            <div class="Product_Description">
                                <div class="Title_Product_Description_Container">
                                    <h3>Descripción del Producto:</h3>
                                    <i class="fa-solid fa-chevron-down"></i>
                                </div>
                                <div class="Text_Product_Description_Container">
                                    <p><?php echo $Producto['Descripcion_Producto']; ?></p>
                                </div>
                            </div>
        <?php                     }
                }
                break;
        }
    } ?>

        <div class="Aditional_Product_Description">
            <div class="Title_Aditional_Product_Description_Container">
                <h3>Información Adicional del Producto:</h3>
                <i class="fa-solid fa-chevron-down"></i>
            </div>
            <div class="Text_Aditional_Product_Description_Container Hidden">
                <p>Garantía: 36 meses</p>

                <dl>
                    <dt>Plazo de Entrega:</dt>
                    <dd>- Lima: 24 a 48 hrs </dd>
                    <dd>- Provincia: Según destino 2 a 5 días</dd>
                    <dd>- Se consideran dias laborables</dd>
                </dl>

                <p>Stock disponible</p>
            </div>
        </div>
                        </div>
</main>
<?php
include 'Templates/Footer_Second.php';
?>