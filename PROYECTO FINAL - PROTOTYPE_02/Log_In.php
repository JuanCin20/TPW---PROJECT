<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="CSS/Log_In.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
	<title>SignIn/SignUp</title>
</head>

<body>
	<h2>SignIn/SignUp</h2>
	<div class="container" id="container">
		<div class="form-container sign-up-container">
			<form action="Valid_Access.php" method="POST">
				<h1>Sign Up</h1>
				<input type="text" placeholder="Username" id="Username_Usuario" name="Username_Usuario" />
				<input type="password" placeholder="Password" id="Password_Usuario_02" name="Password_Usuario_02" />
				<span id="PassRequirementRegis">Porfavor, ingresar más de 5 caracteres</span><br>
				<input type="email" placeholder="Email" id="E_Mail_Usuario" name="E_Mail_Usuario" />
				<button type="submit" name="Access" value="Sign_Up_Value">Sign Up</button>
			</form>
		</div>

		<div class="form-container sign-in-container">
			<form action="Valid_Access.php" method="POST">
				<h1>Sign In</h1>
				<input type="text" placeholder="Username" id="Username_Usuario" name="Username_Usuario" />
				<input type="password" placeholder="Password" id="Password_Usuario_01" name="Password_Usuario_01" />
				<a href="Password_Recovery.php" target="_blank" onclick="window.open(this.href, this.target, 'width=890px, height=560px, left=380px, top=100px'); return false;">¿Olvidaste tu contraseña?</a>
				<button type="submit" name="Access" value="Sign_In_Value">Sign In</button>
			</form>
		</div>

		<div class="overlay-container">
			<div class="overlay">
				<div class="overlay-panel overlay-left">
					<h1>Que hay de nuevo viejo!</h1>
					<p>Para mantenerse conectado con nosotros, inicie sesión con su información personal</p>
					<button class="ghost" id="signIn">Sign In</button>
				</div>
				<div class="overlay-panel overlay-right">
					<h1>Bienvenido!</h1>
					<p>Ingresa tus datos y empieza la aventura con nosotros</p>
					<button class="ghost" id="signUp">Sign Up</button>
				</div>
			</div>
		</div>
	</div>
	<script src="JS/Log_In.js"></script>
</body>

</html>