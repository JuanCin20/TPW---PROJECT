<?php
include 'Global/Configuration.php';
include 'Global/Connection.php';
include 'Cart.php';
include 'Templates/Header_First.php';
?>

<main>
    <div class="Config_Panel">
        <div class="Category_Selector">
            <ul>
                <dt>Tipo de Producto</dt>
                <li><button class="Category_Selector_Button" name="Option_01_Button" value="Option_01" type="submit" onclick="Function_01()">Placas Madre</button></li>
                <li><button class="Category_Selector_Button" name="Option_02_Button" value="Option_02" type="submit" onclick="Function_02()">Procesadores</button></li>
                <li><button class="Category_Selector_Button" name="Option_03_Button" value="Option_03" type="submit" onclick="Function_03()">Tarjetas de Video</button></li>
                <li><button class="Category_Selector_Button" name="Option_04_Button" value="Option_04" type="submit" onclick="Function_04()">Memorias RAM</button></li>
                <li><button class="Category_Selector_Button" name="Option_05_Button" value="Option_05" type="submit" onclick="Function_05()">Teclados</button></li>
                <li><button class="Category_Selector_Button" name="Option_06_Button" value="Option_06" type="submit" onclick="Function_06()">Mouses</button></li>
                <li><button class="Category_Selector_Button" name="Option_07_Button" value="Option_07" type="submit" onclick="Function_07()">Cases</button></li>
                <li><button class="Category_Selector_Button" name="Option_08_Button" value="Option_08" type="submit" onclick="Function_08()">Almacenamiento</button></li>
                <li><button class="Category_Selector_Button" name="Option_09_Button" value="Option_09" type="submit" onclick="Function_09()">Monitores</button></li>
                <li><button class="Category_Selector_Button" name="Option_10_Button" value="Option_10" type="submit" onclick="Function_10()">Fuentes de Poder</button></li>
        </div>

        <div class="Brand_Selector_01" hidden>
            <ul>
                <dt>Marca del Producto</dt>
                <form method="POST" action="Operation_First.php">
                    <li><button class="Brand_Selector_Button" name="Option_Button" value="Option_11" type="submit">Asus</button></li>
                </form>
                <form method="POST" action="Operation_First.php">
                    <li><button class="Brand_Selector_Button" name="Option_Button" value="Option_12" type="submit">Gigabyte</button></li>
                </form>
                <form method="POST" action="Operation_First.php">
                    <li><button class="Brand_Selector_Button" name="Option_Button" value="Option_13" type="submit">MSI</button></li>
                </form>
            </ul>
        </div>

        <div class="Brand_Selector_02">
            <ul>
                <dt>Marca del Producto</dt>
                <form method="POST" action="Operation_First.php">
                    <li><button class="Brand_Selector_Button" name="Option_Button" value="Option_14" type="submit" onclick="">AMD</button></li>
                </form>
                <form method="POST" action="Operation_First.php">
                    <li><button class="Brand_Selector_Button" name="Option_Button" value="Option_15" type="submit" onclick="">Intel</button></li>
                </form>
            </ul>
        </div>

        <div class="Brand_Selector_03" hidden>
            <ul>
                <dt>Marca del Producto</dt>
                <form method="POST" action="Operation_First.php">
                    <li><button class="Brand_Selector_Button" name="Option_Button" value="Option_16" type="submit" onclick="">Asus</button></li>
                </form>
                <form method="POST" action="Operation_First.php">
                    <li><button class="Brand_Selector_Button" name="Option_Button" value="Option_17" type="submit" onclick="">Gigabyte</button></li>
                </form>
                <form method="POST" action="Operation_First.php">
                    <li><button class="Brand_Selector_Button" name="Option_Button" value="Option_18" type="submit" onclick="">MSI</button></li>
                </form>
            </ul>
        </div>

        <div class="Brand_Selector_04" hidden>
            <ul>
                <dt>Marca del Producto</dt>
                <form method="POST" action="Operation_First.php">
                    <li><button class="Brand_Selector_Button" name="Option_Button" value="Option_19" type="submit" onclick="">Kingston</button></li>
                </form>
                <form method="POST" action="Operation_First.php">
                    <li><button class="Brand_Selector_Button" name="Option_Button" value="Option_20" type="submit" onclick="">TeamGroup</button></li>
                </form>
            </ul>
        </div>

        <div class="Brand_Selector_05" hidden>
            <ul>
                <dt>Marca del Producto</dt>
                <form method="POST" action="Operation_First.php">
                    <li><button class="Brand_Selector_Button" name="Option_Button" value="Option_21" type="submit" onclick="">Corsair</button></li>
                </form>
                <form method="POST" action="Operation_First.php">
                    <li><button class="Brand_Selector_Button" name="Option_Button" value="Option_22" type="submit" onclick="">Teros</button></li>
                </form>
            </ul>
        </div>

        <div class="Brand_Selector_06" hidden>
            <ul>
                <dt>Marca del Producto</dt>
                <form method="POST" action="Operation_First.php">
                    <li><button class="Brand_Selector_Button" name="Option_Button" value="Option_23" type="submit" onclick="">Corsair</button></li>
                </form>
                <form method="POST" action="Operation_First.php">
                    <li><button class="Brand_Selector_Button" name="Option_Button" value="Option_24" type="submit" onclick="">Teros</button></li>
                </form>
            </ul>
        </div>

        <div class="Brand_Selector_07" hidden>
            <ul>
                <dt>Marca del Producto</dt>
                <form method="POST" action="Operation_First.php">
                    <li><button class="Brand_Selector_Button" name="Option_Button" value="Option_25" type="submit" onclick="">Asus</button></li>
                </form>
                <form method="POST" action="Operation_First.php">
                    <li><button class="Brand_Selector_Button" name="Option_Button" value="Option_26" type="submit" onclick="">Corsair</button></li>
                </form>
                <form method="POST" action="Operation_First.php">
                    <li><button class="Brand_Selector_Button" name="Option_Button" value="Option_27" type="submit" onclick="">Gigabyte</button></li>
                </form>
                <form method="POST" action="Operation_First.php">
                    <li><button class="Brand_Selector_Button" name="Option_Button" value="Option_28" type="submit" onclick="">MSI</button></li>
                </form>
                <form method="POST" action="Operation_First.php">
                    <li><button class="Brand_Selector_Button" name="Option_Button" value="Option_29" type="submit" onclick="">Teros</button></li>
                </form>
            </ul>
        </div>

        <div class="Brand_Selector_08" hidden>
            <ul>
                <dt>Marca del Producto</dt>
                <form method="POST" action="Operation_First.php">
                    <li><button class="Brand_Selector_Button" name="Option_Button" value="Option_30" type="submit" onclick="">Kingston</button></li>
                </form>
                <form method="POST" action="Operation_First.php">
                    <li><button class="Brand_Selector_Button" name="Option_Button" value="Option_31" type="submit" onclick="">Western Digital</button></li>
                </form>
            </ul>
        </div>

        <div class="Brand_Selector_09" hidden>
            <ul>
                <dt>Marca del Producto</dt>
                <form method="POST" action="Operation_First.php">
                    <li><button class="Brand_Selector_Button" name="Option_Button" value="Option_32" type="submit" onclick="">LG</button></li>
                </form>
                <form method="POST" action="Operation_First.php">
                    <li><button class="Brand_Selector_Button" name="Option_Button" value="Option_33" type="submit" onclick="">Samsung</button></li>
                </form>
                <form method="POST" action="Operation_First.php">
                    <li><button class="Brand_Selector_Button" name="Option_Button" value="Option_34" type="submit" onclick="">Teros</button></li>
                </form>
            </ul>
        </div>

        <div class="Brand_Selector_10" hidden>
            <ul>
                <dt>Marca del Producto</dt>
                <form method="POST" action="Operation_First.php">
                    <li><button class="Brand_Selector_Button" name="Option_Button" value="Option_35" type="submit" onclick="">Cooler Master</button></li>
                </form>
                <form method="POST" action="Operation_First.php">
                    <li><button class="Brand_Selector_Button" name="Option_Button" value="Option_36" type="submit" onclick="">MSI</button></li>
                </form>
                <form method="POST" action="Operation_First.php">
                    <li><button class="Brand_Selector_Button" name="Option_Button" value="Option_37" type="submit" onclick="">Teros</button></li>
                </form>
            </ul>
        </div>
    </div>

    <div class="Vertical_Line"></div>

    <div class="Product_Panel">
        <div class="Joy_Division_01_Upper" hidden>
            <div class="Joy_Division_01">
                <?php
                $Statement = $PDO->prepare("SELECT * FROM `tabla_producto` WHERE `ID_Categoria` = 1");
                $Statement->execute();
                $Product_List = $Statement->fetchAll(PDO::FETCH_ASSOC);
                //print_r($Product_List);
                ?>
                <?php foreach ($Product_List as $Producto) { ?>
                    <article class="Product_01">
                        <img src="<?php echo $Producto['Imagen_Producto']; ?>" alt="<?php echo $Producto['Nombre_Producto']; ?>" title="<?php echo $Producto['Nombre_Producto']; ?>" class="card-img-top">

                        <div class="Product-Info">
                            <h3><?php echo $Producto['Marca_Producto']; ?></h3>
                            <h4><?php echo $Producto['Nombre_Producto']; ?></h4>
                            <p>S/. <?php echo $Producto['Precio_Producto']; ?></p>
                            <form method="POST" action="Frame_02_First.php">
                                <input type="hidden" name="ID_Producto" id="ID_Producto" value="<?php echo openssl_encrypt($Producto['ID_Producto'], Encryption_Method, Key); ?>">
                                <input type="hidden" name="ID_Categoria" id="ID_Categoria" value="<?php echo openssl_encrypt($Producto['ID_Categoria'], Encryption_Method, Key); ?>">
                                <input type="hidden" name="Marca_Producto" id="Marca_Producto" value="<?php echo openssl_encrypt($Producto['Marca_Producto'], Encryption_Method, Key); ?>">
                                <input type="hidden" name="Nombre_Producto" id="Nombre_Producto" value="<?php echo openssl_encrypt($Producto['Nombre_Producto'], Encryption_Method, Key); ?>">
                                <input type="hidden" name="Precio_Producto" id="Precio_Producto" value="<?php echo openssl_encrypt($Producto['Precio_Producto'], Encryption_Method, Key); ?>">
                                <button class="btn btn-primary" name="Action_Button" value="Details" type="submit">Ver más Detalles</button>
                            </form>
                        </div>
                    </article>
                <?php } ?>
            </div>
        </div>

        <div class="Joy_Division_02_Upper">
            <div class="Joy_Division_02">
                <?php
                $Statement = $PDO->prepare("SELECT * FROM `tabla_producto` WHERE `ID_Categoria` = 2");
                $Statement->execute();
                $Product_List = $Statement->fetchAll(PDO::FETCH_ASSOC);
                //print_r($Product_List);
                ?>
                <?php foreach ($Product_List as $Producto) { ?>
                    <article class="Product_02">
                        <img src="<?php echo $Producto['Imagen_Producto']; ?>" alt="<?php echo $Producto['Nombre_Producto']; ?>" title="<?php echo $Producto['Nombre_Producto']; ?>" class="card-img-top">

                        <div class="Product-Info">
                            <h3><?php echo $Producto['Marca_Producto']; ?></h3>
                            <h4><?php echo $Producto['Nombre_Producto']; ?></h4>
                            <p>S/. <?php echo $Producto['Precio_Producto']; ?></p>
                            <form method="POST" action="Frame_02_First.php">
                                <input type="hidden" name="ID_Producto" id="ID_Producto" value="<?php echo openssl_encrypt($Producto['ID_Producto'], Encryption_Method, Key); ?>">
                                <input type="hidden" name="ID_Categoria" id="ID_Categoria" value="<?php echo openssl_encrypt($Producto['ID_Categoria'], Encryption_Method, Key); ?>">
                                <input type="hidden" name="Marca_Producto" id="Marca_Producto" value="<?php echo openssl_encrypt($Producto['Marca_Producto'], Encryption_Method, Key); ?>">
                                <input type="hidden" name="Nombre_Producto" id="Nombre_Producto" value="<?php echo openssl_encrypt($Producto['Nombre_Producto'], Encryption_Method, Key); ?>">
                                <input type="hidden" name="Precio_Producto" id="Precio_Producto" value="<?php echo openssl_encrypt($Producto['Precio_Producto'], Encryption_Method, Key); ?>">
                                <button class="btn btn-primary" name="Action_Button" value="Details" type="submit">Ver más Detalles</button>
                            </form>
                        </div>
                    </article>
                <?php } ?>
            </div>
        </div>

        <div class="Joy_Division_03_Upper" hidden>
            <div class="Joy_Division_03">
                <?php
                $Statement = $PDO->prepare("SELECT * FROM `tabla_producto` WHERE `ID_Categoria` = 3");
                $Statement->execute();
                $Product_List = $Statement->fetchAll(PDO::FETCH_ASSOC);
                //print_r($Product_List);
                ?>
                <?php foreach ($Product_List as $Producto) { ?>
                    <article class="Product_03">
                        <img src="<?php echo $Producto['Imagen_Producto']; ?>" alt="<?php echo $Producto['Nombre_Producto']; ?>" title="<?php echo $Producto['Nombre_Producto']; ?>" class="card-img-top">

                        <div class="Product-Info">
                            <h3><?php echo $Producto['Marca_Producto']; ?></h3>
                            <h4><?php echo $Producto['Nombre_Producto']; ?></h4>
                            <p>S/. <?php echo $Producto['Precio_Producto']; ?></p>
                            <form method="POST" action="Frame_02_First.php">
                                <input type="hidden" name="ID_Producto" id="ID_Producto" value="<?php echo openssl_encrypt($Producto['ID_Producto'], Encryption_Method, Key); ?>">
                                <input type="hidden" name="ID_Categoria" id="ID_Categoria" value="<?php echo openssl_encrypt($Producto['ID_Categoria'], Encryption_Method, Key); ?>">
                                <input type="hidden" name="Marca_Producto" id="Marca_Producto" value="<?php echo openssl_encrypt($Producto['Marca_Producto'], Encryption_Method, Key); ?>">
                                <input type="hidden" name="Nombre_Producto" id="Nombre_Producto" value="<?php echo openssl_encrypt($Producto['Nombre_Producto'], Encryption_Method, Key); ?>">
                                <input type="hidden" name="Precio_Producto" id="Precio_Producto" value="<?php echo openssl_encrypt($Producto['Precio_Producto'], Encryption_Method, Key); ?>">
                                <button class="btn btn-primary" name="Action_Button" value="Details" type="submit">Ver más Detalles</button>
                            </form>
                        </div>
                    </article>
                <?php } ?>
            </div>
        </div>

        <div class="Joy_Division_04_Upper" hidden>
            <div class="Joy_Division_04">
                <?php
                $Statement = $PDO->prepare("SELECT * FROM `tabla_producto` WHERE `ID_Categoria` = 4");
                $Statement->execute();
                $Product_List = $Statement->fetchAll(PDO::FETCH_ASSOC);
                //print_r($Product_List);
                ?>
                <?php foreach ($Product_List as $Producto) { ?>
                    <article class="Product_04">
                        <img src="<?php echo $Producto['Imagen_Producto']; ?>" alt="<?php echo $Producto['Nombre_Producto']; ?>" title="<?php echo $Producto['Nombre_Producto']; ?>" class="card-img-top">

                        <div class="Product-Info">
                            <h3><?php echo $Producto['Marca_Producto']; ?></h3>
                            <h4><?php echo $Producto['Nombre_Producto']; ?></h4>
                            <p>S/. <?php echo $Producto['Precio_Producto']; ?></p>
                            <form method="POST" action="Frame_02_First.php">
                                <input type="hidden" name="ID_Producto" id="ID_Producto" value="<?php echo openssl_encrypt($Producto['ID_Producto'], Encryption_Method, Key); ?>">
                                <input type="hidden" name="ID_Categoria" id="ID_Categoria" value="<?php echo openssl_encrypt($Producto['ID_Categoria'], Encryption_Method, Key); ?>">
                                <input type="hidden" name="Marca_Producto" id="Marca_Producto" value="<?php echo openssl_encrypt($Producto['Marca_Producto'], Encryption_Method, Key); ?>">
                                <input type="hidden" name="Nombre_Producto" id="Nombre_Producto" value="<?php echo openssl_encrypt($Producto['Nombre_Producto'], Encryption_Method, Key); ?>">
                                <input type="hidden" name="Precio_Producto" id="Precio_Producto" value="<?php echo openssl_encrypt($Producto['Precio_Producto'], Encryption_Method, Key); ?>">
                                <button class="btn btn-primary" name="Action_Button" value="Details" type="submit">Ver más Detalles</button>
                            </form>
                        </div>
                    </article>
                <?php } ?>
            </div>
        </div>

        <div class="Joy_Division_05_Upper" hidden>
            <div class="Joy_Division_05">
                <?php
                $Statement = $PDO->prepare("SELECT * FROM `tabla_producto` WHERE `ID_Categoria` = 5");
                $Statement->execute();
                $Product_List = $Statement->fetchAll(PDO::FETCH_ASSOC);
                //print_r($Product_List);
                ?>
                <?php foreach ($Product_List as $Producto) { ?>
                    <article class="Product_05">
                        <img src="<?php echo $Producto['Imagen_Producto']; ?>" alt="<?php echo $Producto['Nombre_Producto']; ?>" title="<?php echo $Producto['Nombre_Producto']; ?>" class="card-img-top">

                        <div class="Product-Info">
                            <h3><?php echo $Producto['Marca_Producto']; ?></h3>
                            <h4><?php echo $Producto['Nombre_Producto']; ?></h4>
                            <p>S/. <?php echo $Producto['Precio_Producto']; ?></p>
                            <form method="POST" action="Frame_02_First.php">
                                <input type="hidden" name="ID_Producto" id="ID_Producto" value="<?php echo openssl_encrypt($Producto['ID_Producto'], Encryption_Method, Key); ?>">
                                <input type="hidden" name="ID_Categoria" id="ID_Categoria" value="<?php echo openssl_encrypt($Producto['ID_Categoria'], Encryption_Method, Key); ?>">
                                <input type="hidden" name="Marca_Producto" id="Marca_Producto" value="<?php echo openssl_encrypt($Producto['Marca_Producto'], Encryption_Method, Key); ?>">
                                <input type="hidden" name="Nombre_Producto" id="Nombre_Producto" value="<?php echo openssl_encrypt($Producto['Nombre_Producto'], Encryption_Method, Key); ?>">
                                <input type="hidden" name="Precio_Producto" id="Precio_Producto" value="<?php echo openssl_encrypt($Producto['Precio_Producto'], Encryption_Method, Key); ?>">
                                <button class="btn btn-primary" name="Action_Button" value="Details" type="submit">Ver más Detalles</button>
                            </form>
                        </div>
                    </article>
                <?php } ?>
            </div>
        </div>

        <div class="Joy_Division_06_Upper" hidden>
            <div class="Joy_Division_06">
                <?php
                $Statement = $PDO->prepare("SELECT * FROM `tabla_producto` WHERE `ID_Categoria` = 6");
                $Statement->execute();
                $Product_List = $Statement->fetchAll(PDO::FETCH_ASSOC);
                //print_r($Product_List);
                ?>
                <?php foreach ($Product_List as $Producto) { ?>
                    <article class="Product_06">
                        <img src="<?php echo $Producto['Imagen_Producto']; ?>" alt="<?php echo $Producto['Nombre_Producto']; ?>" title="<?php echo $Producto['Nombre_Producto']; ?>" class="card-img-top">

                        <div class="Product-Info">
                            <h3><?php echo $Producto['Marca_Producto']; ?></h3>
                            <h4><?php echo $Producto['Nombre_Producto']; ?></h4>
                            <p>S/. <?php echo $Producto['Precio_Producto']; ?></p>
                            <form method="POST" action="Frame_02_First.php">
                                <input type="hidden" name="ID_Producto" id="ID_Producto" value="<?php echo openssl_encrypt($Producto['ID_Producto'], Encryption_Method, Key); ?>">
                                <input type="hidden" name="ID_Categoria" id="ID_Categoria" value="<?php echo openssl_encrypt($Producto['ID_Categoria'], Encryption_Method, Key); ?>">
                                <input type="hidden" name="Marca_Producto" id="Marca_Producto" value="<?php echo openssl_encrypt($Producto['Marca_Producto'], Encryption_Method, Key); ?>">
                                <input type="hidden" name="Nombre_Producto" id="Nombre_Producto" value="<?php echo openssl_encrypt($Producto['Nombre_Producto'], Encryption_Method, Key); ?>">
                                <input type="hidden" name="Precio_Producto" id="Precio_Producto" value="<?php echo openssl_encrypt($Producto['Precio_Producto'], Encryption_Method, Key); ?>">
                                <button class="btn btn-primary" name="Action_Button" value="Details" type="submit">Ver más Detalles</button>
                            </form>
                        </div>
                    </article>
                <?php } ?>
            </div>
        </div>

        <div class="Joy_Division_07_Upper" hidden>
            <div class="Joy_Division_07">
                <?php
                $Statement = $PDO->prepare("SELECT * FROM `tabla_producto` WHERE `ID_Categoria` = 7");
                $Statement->execute();
                $Product_List = $Statement->fetchAll(PDO::FETCH_ASSOC);
                //print_r($Product_List);
                ?>
                <?php foreach ($Product_List as $Producto) { ?>
                    <article class="Product_07">
                        <img src="<?php echo $Producto['Imagen_Producto']; ?>" alt="<?php echo $Producto['Nombre_Producto']; ?>" title="<?php echo $Producto['Nombre_Producto']; ?>" class="card-img-top">

                        <div class="Product-Info">
                            <h3><?php echo $Producto['Marca_Producto']; ?></h3>
                            <h4><?php echo $Producto['Nombre_Producto']; ?></h4>
                            <p>S/. <?php echo $Producto['Precio_Producto']; ?></p>
                            <form method="POST" action="Frame_02_First.php">
                                <input type="hidden" name="ID_Producto" id="ID_Producto" value="<?php echo openssl_encrypt($Producto['ID_Producto'], Encryption_Method, Key); ?>">
                                <input type="hidden" name="ID_Categoria" id="ID_Categoria" value="<?php echo openssl_encrypt($Producto['ID_Categoria'], Encryption_Method, Key); ?>">
                                <input type="hidden" name="Marca_Producto" id="Marca_Producto" value="<?php echo openssl_encrypt($Producto['Marca_Producto'], Encryption_Method, Key); ?>">
                                <input type="hidden" name="Nombre_Producto" id="Nombre_Producto" value="<?php echo openssl_encrypt($Producto['Nombre_Producto'], Encryption_Method, Key); ?>">
                                <input type="hidden" name="Precio_Producto" id="Precio_Producto" value="<?php echo openssl_encrypt($Producto['Precio_Producto'], Encryption_Method, Key); ?>">
                                <button class="btn btn-primary" name="Action_Button" value="Details" type="submit">Ver más Detalles</button>
                            </form>
                        </div>
                    </article>
                <?php } ?>
            </div>
        </div>

        <div class="Joy_Division_08_Upper" hidden>
            <div class="Joy_Division_08">
                <?php
                $Statement = $PDO->prepare("SELECT * FROM `tabla_producto` WHERE `ID_Categoria` = 8");
                $Statement->execute();
                $Product_List = $Statement->fetchAll(PDO::FETCH_ASSOC);
                //print_r($Product_List);
                ?>
                <?php foreach ($Product_List as $Producto) { ?>
                    <article class="Product_08">
                        <img src="<?php echo $Producto['Imagen_Producto']; ?>" alt="<?php echo $Producto['Nombre_Producto']; ?>" title="<?php echo $Producto['Nombre_Producto']; ?>" class="card-img-top">

                        <div class="Product-Info">
                            <h3><?php echo $Producto['Marca_Producto']; ?></h3>
                            <h4><?php echo $Producto['Nombre_Producto']; ?></h4>
                            <p>S/. <?php echo $Producto['Precio_Producto']; ?></p>
                            <form method="POST" action="Frame_02_First.php">
                                <input type="hidden" name="ID_Producto" id="ID_Producto" value="<?php echo openssl_encrypt($Producto['ID_Producto'], Encryption_Method, Key); ?>">
                                <input type="hidden" name="ID_Categoria" id="ID_Categoria" value="<?php echo openssl_encrypt($Producto['ID_Categoria'], Encryption_Method, Key); ?>">
                                <input type="hidden" name="Marca_Producto" id="Marca_Producto" value="<?php echo openssl_encrypt($Producto['Marca_Producto'], Encryption_Method, Key); ?>">
                                <input type="hidden" name="Nombre_Producto" id="Nombre_Producto" value="<?php echo openssl_encrypt($Producto['Nombre_Producto'], Encryption_Method, Key); ?>">
                                <input type="hidden" name="Precio_Producto" id="Precio_Producto" value="<?php echo openssl_encrypt($Producto['Precio_Producto'], Encryption_Method, Key); ?>">
                                <button class="btn btn-primary" name="Action_Button" value="Details" type="submit">Ver más Detalles</button>
                            </form>
                        </div>
                    </article>
                <?php } ?>
            </div>
        </div>

        <div class="Joy_Division_09_Upper" hidden>
            <div class="Joy_Division_09">
                <?php
                $Statement = $PDO->prepare("SELECT * FROM `tabla_producto` WHERE `ID_Categoria` = 9");
                $Statement->execute();
                $Product_List = $Statement->fetchAll(PDO::FETCH_ASSOC);
                //print_r($Product_List);
                ?>
                <?php foreach ($Product_List as $Producto) { ?>
                    <article class="Product_09">
                        <img src="<?php echo $Producto['Imagen_Producto']; ?>" alt="<?php echo $Producto['Nombre_Producto']; ?>" title="<?php echo $Producto['Nombre_Producto']; ?>" class="card-img-top">

                        <div class="Product-Info">
                            <h3><?php echo $Producto['Marca_Producto']; ?></h3>
                            <h4><?php echo $Producto['Nombre_Producto']; ?></h4>
                            <p>S/. <?php echo $Producto['Precio_Producto']; ?></p>
                            <form method="POST" action="Frame_02_First.php">
                                <input type="hidden" name="ID_Producto" id="ID_Producto" value="<?php echo openssl_encrypt($Producto['ID_Producto'], Encryption_Method, Key); ?>">
                                <input type="hidden" name="ID_Categoria" id="ID_Categoria" value="<?php echo openssl_encrypt($Producto['ID_Categoria'], Encryption_Method, Key); ?>">
                                <input type="hidden" name="Marca_Producto" id="Marca_Producto" value="<?php echo openssl_encrypt($Producto['Marca_Producto'], Encryption_Method, Key); ?>">
                                <input type="hidden" name="Nombre_Producto" id="Nombre_Producto" value="<?php echo openssl_encrypt($Producto['Nombre_Producto'], Encryption_Method, Key); ?>">
                                <input type="hidden" name="Precio_Producto" id="Precio_Producto" value="<?php echo openssl_encrypt($Producto['Precio_Producto'], Encryption_Method, Key); ?>">
                                <button class="btn btn-primary" name="Action_Button" value="Details" type="submit">Ver más Detalles</button>
                            </form>
                        </div>
                    </article>
                <?php } ?>
            </div>
        </div>

        <div class="Joy_Division_10_Upper" hidden>
            <div class="Joy_Division_10">
                <?php
                $Statement = $PDO->prepare("SELECT * FROM `tabla_producto` WHERE `ID_Categoria` = 10");
                $Statement->execute();
                $Product_List = $Statement->fetchAll(PDO::FETCH_ASSOC);
                //print_r($Product_List);
                ?>
                <?php foreach ($Product_List as $Producto) { ?>
                    <article class="Product_10">
                        <img src="<?php echo $Producto['Imagen_Producto']; ?>" alt="<?php echo $Producto['Nombre_Producto']; ?>" title="<?php echo $Producto['Nombre_Producto']; ?>" class="card-img-top">

                        <div class="Product-Info">
                            <h3><?php echo $Producto['Marca_Producto']; ?></h3>
                            <h4><?php echo $Producto['Nombre_Producto']; ?></h4>
                            <p>S/. <?php echo $Producto['Precio_Producto']; ?></p>
                            <form method="POST" action="Frame_02_First.php">
                                <input type="hidden" name="ID_Producto" id="ID_Producto" value="<?php echo openssl_encrypt($Producto['ID_Producto'], Encryption_Method, Key); ?>">
                                <input type="hidden" name="ID_Categoria" id="ID_Categoria" value="<?php echo openssl_encrypt($Producto['ID_Categoria'], Encryption_Method, Key); ?>">
                                <input type="hidden" name="Marca_Producto" id="Marca_Producto" value="<?php echo openssl_encrypt($Producto['Marca_Producto'], Encryption_Method, Key); ?>">
                                <input type="hidden" name="Nombre_Producto" id="Nombre_Producto" value="<?php echo openssl_encrypt($Producto['Nombre_Producto'], Encryption_Method, Key); ?>">
                                <input type="hidden" name="Precio_Producto" id="Precio_Producto" value="<?php echo openssl_encrypt($Producto['Precio_Producto'], Encryption_Method, Key); ?>">
                                <button class="btn btn-primary" name="Action_Button" value="Details" type="submit">Ver más Detalles</button>
                            </form>
                        </div>
                    </article>
                <?php } ?>
            </div>
        </div>
    </div>
</main>
<?php
include 'Templates/Footer_First.php';
?>