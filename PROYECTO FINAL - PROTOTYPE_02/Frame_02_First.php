<?php
include 'Global/Configuration.php';
include 'Global/Connection.php';
include 'Cart.php';
include 'Templates/Header_First.php';
?>

<main>
    <?php
    if (isset($_POST['Action_Button'])) {
        switch ($_POST['Action_Button']) {
            case 'Details':
                $Nombre_Producto = openssl_decrypt($_POST['Nombre_Producto'], Encryption_Method, Key);

                $Statement = $PDO->prepare("SELECT * FROM `tabla_imagen_calidad` WHERE `Nombre_Imagen_Calidad` = '$Nombre_Producto'");
                $Statement->execute();
                $Product_List_01 = $Statement->fetchAll(PDO::FETCH_ASSOC);
                //print_r($Product_List_01);
                foreach ($Product_List_01 as $Product_HD_Img) {
    ?>
                    <div class="Product_IMG">
                        <img id="Alter_IMG" src="<?php echo $Product_HD_Img['Img_Imagen_Calidad']; ?>" alt="<?php echo $Product_HD_Img['Nombre_Imagen_Calidad']; ?>">
                    </div>
                <?php } ?>
                <?php
                $Statement = $PDO->prepare("SELECT * FROM `tabla_producto` WHERE `Nombre_Producto` = '$Nombre_Producto'");
                $Statement->execute();
                $Product_List_02 = $Statement->fetchAll(PDO::FETCH_ASSOC);
                //print_r($Product_List_02);
                foreach ($Product_List_02 as $Product) {
                ?>
                    <div class="Product_Alternative">
                        <div class="Product_Title">
                            <h3><?php echo $Product['Nombre_Producto']; ?></h3>
                        </div>

                        <div class="Product_Price">
                            <h3>S/. <?php echo $Product['Precio_Producto']; ?></h3>
                        </div>
                        <form method="POST" action="Log_In.php">
                            <div class="Add_Cart_Container">
                                <div class="Number_Product_Container">
                                    <input type="number" name="Number_Product" placeholder="1" value="1" min="1" class="Number_Product_Container_Input" />
                                    <div class="Number_Product_Container_Buttons">
                                        <i class="fa-solid fa-chevron-up" id="Plus"></i>
                                        <i class="fa-solid fa-chevron-down" id="Less"></i>
                                    </div>
                                </div>

                                <input type="hidden" name="ID_Producto" id="ID_Producto" value="<?php echo openssl_encrypt($Product['ID_Producto'], Encryption_Method, Key); ?>">
                                <input type="hidden" name="Marca_Producto" id="Marca_Producto" value="<?php echo openssl_encrypt($Product['Marca_Producto'], Encryption_Method, Key); ?>">
                                <input type="hidden" name="Nombre_Producto" id="Nombre_Producto" value="<?php echo openssl_encrypt($Product['Nombre_Producto'], Encryption_Method, Key); ?>">
                                <input type="hidden" name="Precio_Producto" id="Precio_Producto" value="<?php echo openssl_encrypt($Product['Precio_Producto'], Encryption_Method, Key); ?>">

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
                                <p><?php echo $Product['Descripcion_Producto']; ?></p>
                            </div>
                        </div>
                    <?php } ?>
                    <?php break; ?>
            <?php } ?>
        <?php } ?>

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
include 'Templates/Footer_First.php';
?>