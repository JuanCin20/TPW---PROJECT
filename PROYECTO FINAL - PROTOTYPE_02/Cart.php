<?php
session_start();
$Message = "";
if (isset($_POST['Action_Button'])) {
    switch ($_POST['Action_Button']) {
        case 'Add':
            if (is_numeric(openssl_decrypt($_POST['ID_Producto'], Encryption_Method, Key))) {
                $ID_Producto = openssl_decrypt($_POST['ID_Producto'], Encryption_Method, Key);
                $Message = "ID_Producto - Correcto " . $ID_Producto . "<br/>";
            } else {
                $Message = "ID_Producto - Incorrecto" . "<br/>";
            }

            if (is_string(openssl_decrypt($_POST['Marca_Producto'], Encryption_Method, Key))) {
                $Marca_Producto = openssl_decrypt($_POST['Marca_Producto'], Encryption_Method, Key);
                $Message = "Marca_Producto - Correcto " . $Marca_Producto . "<br/>";
            } else {
                $Message = "Marca_Producto - Incorrecto" . "<br/>";
            }

            if (is_string(openssl_decrypt($_POST['Nombre_Producto'], Encryption_Method, Key))) {
                $Nombre_Producto = openssl_decrypt($_POST['Nombre_Producto'], Encryption_Method, Key);
                $Message = "Nombre_Producto - Correcto " . $Nombre_Producto . "<br/>";
            } else {
                $Message = "Nombre_Producto - Incorrecto" . "<br/>";
            }

            if (is_numeric(openssl_decrypt($_POST['Precio_Producto'], Encryption_Method, Key))) {
                $Precio_Producto = openssl_decrypt($_POST['Precio_Producto'], Encryption_Method, Key);
                $Message = "Precio_Producto - Correcto " . $Precio_Producto . "<br/>";
            } else {
                $Message = "Precio_Producto - Incorrecto" . "<br/>";
            }

            if (isset($_POST['Action_Button'])) {
                $Cantidad = $_POST['Number_Product'];
            }

            if (!isset($_SESSION['Cart'])) {
                $Product = array(
                    'ID_Producto' => $ID_Producto,
                    'Marca_Producto' => $Marca_Producto,
                    'Nombre_Producto' => $Nombre_Producto,
                    'Precio_Producto' => $Precio_Producto,
                    'Cantidad' => $Cantidad
                );
                $_SESSION['Cart'][0] = $Product;
                $Message = "Producto Agregado al Carrito";
            } else {
                $Verify_ID_Product = array_column($_SESSION['Cart'], "ID_Producto");
                if (in_array($ID_Producto, $Verify_ID_Product)) {
                    echo "<script>alert('El Producto ya se Encuentra Agregado al Carrito');</script>";
                } else {
                    $Number_Products = count($_SESSION['Cart']);
                    $Product = array(
                        'ID_Producto' => $ID_Producto,
                        'Marca_Producto' => $Marca_Producto,
                        'Nombre_Producto' => $Nombre_Producto,
                        'Precio_Producto' => $Precio_Producto,
                        'Cantidad' => $Cantidad
                    );
                    $_SESSION['Cart'][$Number_Products] = $Product;
                    $Message = "Producto Agregado al Carrito";
                }
            }
            //$Message = print_r($_SESSION, true);
            break;

        case "Delete":
            if (is_numeric(openssl_decrypt($_POST['ID_Producto'], Encryption_Method, Key))) {
                $ID_Producto = openssl_decrypt($_POST['ID_Producto'], Encryption_Method, Key);

                foreach ($_SESSION['Cart'] as $Index => $Product) {
                    if ($Product['ID_Producto'] == $ID_Producto) {
                        unset($_SESSION['Cart'][$Index]);
                        echo "<script>alert('Producto Eliminado del Carrito');</script>";
                    }
                }
            } else {
                $Message = "ID_Producto - Incorrecto" . "<br/>";
            }
            break;
    }
}
