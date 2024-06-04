<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>
        Digital Tech Store
    </title>
    <link rel="stylesheet" href="CSS/Header_Second.css">
    <link rel="stylesheet" href="CSS/Frame_01_Second.css">
    <link rel="stylesheet" href="CSS/Frame_02_Second.css">
    <link rel="stylesheet" href="CSS/index_Second.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body>
    <header>
        <div class="Logo_Container">
            <img src="Extras/IMG_LOGO.png" alt="IMG_LOGO" />
        </div>

        <input type="checkbox" id="menu">
        <label for="menu">
            <i class="fa-solid fa-bars"></i>
        </label>

        <nav class="navbar">
            <div class="Home_Container">
                <i class="fa-solid fa-house"></i>
                <a href="index_Second.php">Home</a>
            </div>

            <div class="Product_Container">
                <i class="fa-solid fa-toolbox"></i>
                <a href="Frame_01_Second.php">Productos</a>
            </div>

            <div class="Trip_Container">
                <i class="fa-solid fa-truck"></i>
                <a href="My_Delivery.php">Mis Ordenes</a>
            </div>

            <div class="Log_In_Container">
                <i class="fa-solid fa-user"></i>
                <label><?php echo $_SESSION['Username_Usuario']; ?></label>
            </div>

            <div class="Log_Out_Container">
                <i class="fa-solid fa-right-from-bracket"></i>
                <a href="Log_Out.php">Log Out</a>
            </div>

            <div class="Market_Car_Container" style="position: relative;">
                <i class="fa-solid fa-cart-shopping" id="cart-icon"></i>
                <a href="#" id="cart-icon-link">(<?php echo (empty($_SESSION['Cart'])) ? 0 : count($_SESSION['Cart']); ?>)</a>

                <div class="cart-popup" id="cart-popup">
                    <?php if (!empty($_SESSION['Cart'])) { ?>
                        <ul>
                            <?php $Total_Venta = 0; ?>
                            <?php foreach ($_SESSION['Cart'] as $Producto) { ?>
                                <li>
                                    <div>
                                        <h4><?php echo $Producto['Cantidad']; ?> x <?php echo $Producto['Nombre_Producto']; ?></h4>
                                        <p>S/.<?php echo $Producto['Precio_Producto']; ?></p>
                                        <form method="post">
                                            <input type="hidden" name="ID_Producto" value="<?php echo openssl_encrypt($Producto['ID_Producto'], Encryption_Method, Key); ?>">
                                            <button class="btn-delete" type="submit" name="Action_Button" value="Delete">X</button>
                                        </form>
                                    </div>
                                </li>
                                <?php $Total_Venta += $Producto['Precio_Producto'] * $Producto['Cantidad']; ?>
                            <?php } ?>
                        </ul>
                        <div class="total">
                            Total: S/.<?php echo number_format($Total_Venta, 2); ?>
                        </div>
                        <div class="actions">
                            <a href="Show_Cart.php" class="btn btn-primary">Ir al carrito</a>
                        </div>
                    <?php } else { ?>
                        <div class="empty-message">Tu carrito está vacío.</div>
                    <?php } ?>
                </div>
            </div>
        </nav>
    </header>
    <hr />

    <script>
        $(document).ready(function() {
            $("#cart-icon-link").click(function(e) {
                e.preventDefault();
                $("#cart-popup").toggle(); // Muestra o esconde la ventana emergente
            });

            // Cierra la ventana emergente al hacer clic fuera de ella
            $(document).mouseup(function(e) {
                var container = $("#cart-popup");
                if (!container.is(e.target) && container.has(e.target).length === 0) {
                    container.hide();
                }
            });
        })
    </script>