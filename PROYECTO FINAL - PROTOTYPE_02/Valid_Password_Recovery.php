<?php
session_start();
$Connection = mysqli_connect('localhost', 'root', '', 'TPW_DIGITAL_TECH_WEB_APP') or die('Unable to Connect to the Data_Base');

if (isset($_POST['Access'])) {
    switch ($_POST['Access']) {
        case 'Recovery_Value':
            $Username_Usuario = $_POST['Username_Usuario'];

            $Result = mysqli_query($Connection, "SELECT `Password_Usuario` FROM `tabla_usuario` WHERE `Username_Usuario` = '$Username_Usuario'");
            $Row = mysqli_fetch_array($Result);

            if (is_array($Row)) {
                $_SESSION['Password_Usuario'] = $Row['Password_Usuario'];
                if (isset($_SESSION['Password_Usuario'])) {
                    include("Password_Recovery.php");
?>
                    <h3 class="Message_06">Su Contraseña es: <?php echo $_SESSION['Password_Usuario']; ?></h3>
                <?php
                }
            } else {
                include("Password_Recovery.php");
                ?>
                <h3 class="Message_07">Usuario No Registrado en la Base de Datos</h3>
<?php
            }

            break;
    }
}
