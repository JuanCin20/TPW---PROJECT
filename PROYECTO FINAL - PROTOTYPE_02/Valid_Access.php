<?php

session_start();

$Connection = mysqli_connect('localhost', 'root', '', 'TPW_DIGITAL_TECH_WEB_APP') or die('Unable to Connect to the Data_Base');

function Search_Repeat_Username($User, $Con)
{
    $Consult = "SELECT * FROM `tabla_usuario` WHERE `Username_Usuario` = '$User'";

    $Answer = mysqli_query($Con, $Consult);

    if (mysqli_num_rows($Answer) > 0) {
        return 1;
    } else {
        return 0;
    }
}

if (isset($_POST['Access'])) {
    switch ($_POST['Access']) {
        case 'Sign_In_Value':
            $Username_Usuario = $_POST['Username_Usuario'];
            $Password_Usuario_01 = $_POST['Password_Usuario_01'];

            $Result = mysqli_query($Connection, "SELECT * FROM `tabla_usuario` WHERE `Username_Usuario` = '$Username_Usuario' AND `Password_Usuario` = '$Password_Usuario_01'");
            $Row = mysqli_fetch_array($Result);

            if (is_array($Row)) {
                $_SESSION['Username_Usuario'] = $Row['Username_Usuario'];
                $_SESSION['Password_Usuario_01'] = $Row['Password_Usuario'];

                if (isset($_SESSION['Username_Usuario']) && $Row['ID_Cargo'] == 2) { // Cliente
                    header("location: index_Second.php");
                } else {
                    if (isset($_SESSION['Username_Usuario']) && $Row['ID_Cargo'] == 1) { // Administrador
                        header("location: Admin_Panel.php");
                    }
                }
            } else {
                include("Log_In.php");
?>
                <h3 class="Message_01">Verifique sus Credenciales</h3>
            <?php
            }
            break;

        case 'Sign_Up_Value':
            if (empty($_POST["Username_Usuario"]) or empty($_POST["Password_Usuario_02"]) or empty($_POST["E_Mail_Usuario"])) {
                include("Log_In.php");
            ?>
                <h3 class="Message_02">Ingrese sus Credenciales</h3>
                <?php
            } else {
                $Username_Usuario = $_POST['Username_Usuario'];
                if (Search_Repeat_Username($Username_Usuario, $Connection) == 1) {
                    include("Log_In.php");
                ?>
                    <h3 class="Message_03">El Usuario ya se Encuentra Registrado en la Base de Datos</h3>
                    <?php
                } else {
                    $Username_Usuario = $_POST['Username_Usuario'];
                    $Password_Usuario_02 = $_POST['Password_Usuario_02'];
                    $E_Mail_Usuario = $_POST['E_Mail_Usuario'];
                    $Query = $Connection->query("INSERT INTO `tabla_usuario` (`ID_Cargo`, `Username_Usuario`, `Password_Usuario`, `E_Mail_Usuario`) VALUES (2, '$Username_Usuario', '$Password_Usuario_02', '$E_Mail_Usuario');");
                    if ($Query == 1) {
                        include("Log_In.php");
                    ?>
                        <h3 class="Message_04">Usuario Registrado</h3>
                    <?php
                    } else {
                        include("Log_In.php");
                    ?>
                        <h3 class="Message_05">ERROR</h3>
<?php
                    }
                }
            }
            break;
    }
}
