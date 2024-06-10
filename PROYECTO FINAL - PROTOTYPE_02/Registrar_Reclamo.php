<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.8">
	<link rel="stylesheet" type="text/css" href="CSS/Registrar_Reclamo.css">
	<title>Registrar Reclamo</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>
	<header class="header">
		<h1 class="centered-title">Contáctanos</h1></br></br>
		<nav>
			<ul class="menu">
				<li><a href="Solicitud_Consulta.php">Solicitud de Consulta</a></li>
				<!-- <li><a href="Sucursal.php">Sucursales de Atención</a></li>-->
				<li><a href="Registrar_Reclamo.php">Registrar un Reclamo</a></li>
				<li><a href="Politica_Privacidad.php">Política de Privacidad</a></li>
			</ul>
		</nav>
	</header>
	<main>
		<aside>
			<article class="article">
				<fieldset>
					<p>
					<h2>Registre un Reclamo</h2>
					</p>

					<form action="" class="formulario" id="formulario">
						<!--PAQUETE 1: USUARIO-->
						<div class="formulario__grupo" id="grupo__usuario">
							<div class="formulario__grupo-imput">
								<input type="text" class="formulario__imput" name="usuario" id="usuario" placeholder="Usuario" maxlength="15" required>
								<i class="formulario__validacion-estado fa-solid fa-circle-xmark"></i>
							</div>
							<p class="formulario__imput_error">El usuario ingresado es incorrecto.</p>
						</div>

						<!--PAQUETE 2: NOMBRE-->
						<div class="formulario__grupo" id="grupo__nombre">
							<div class="formulario__grupo-imput">
								<input type="text" class="formulario__imput" name="nombre" id="nombre" placeholder="Nombres" maxlength="40" required>
								<i class="formulario__validacion-estado fa-solid fa-circle-xmark"></i>
							</div>
							<p class="formulario__imput_error"> El nombre ingresado es incorrecto.</p>

						</div>

						<!--PAQUETE 3: Apellidos-->
						<div class="formulario__grupo" id="grupo__apellidos">
							<div class="formulario__grupo-imput">
								<input type="text" class="formulario__imput" name="apellidos" id="apellidos" placeholder="Apellidos" maxlength="60" required>
								<i class="formulario__validacion-estado fa-solid fa-circle-xmark"></i>
							</div>
							<p class="formulario__imput_error"> Los apellidos ingresados son incorrectos.</p>
						</div>

						<!--PAQUETE 4: Edad -->
						<div class="formulario__grupo" id="grupo__edad">
							<div class="formulario__grupo-imput">
								<input type="text" class="formulario__imput" name="edad" id="edad" placeholder="Edad" maxlength="2" required>
								<i class="formulario__validacion-estado fa-solid fa-circle-xmark"></i>
							</div>
							<p class="formulario__imput_error"> La edad ingresada es incorrecta - Usted es menor de edad. </p>
						</div>

						<!--PAQUETE 5: TIPO DE DOCUMENTO-->
						<div class="formulario__tpogrupo" id="grupo__tpoDocumento">
							<div class="formulario__grupo-imput">
								<select id="select_tipo" name="select_tipo" class="formulario_imput">
									<option value="select_tipo">--TIPO DE DOCUMENTO--</option><br><br>
									<option value="select_tipo">DNI</option><br>
									<option value="select_tipo">CARNÉ DE EXTRANJERÍA</option><br>
									<option value="select_tipo">OTRO</option>
								</select>
								<i class="formulario__validacion-estado fa-solid fa-circle-xmark"></i>
							</div>
						</div>

						<!--PAQUETE 6: Documento -->
						<div class="formulario__grupo" id="grupo__documento">
							<div class="formulario__grupo-imput">
								<input type="text" class="formulario__imput" name="documento" id="documento" placeholder="Documento" maxlength="8" required>
								<i class="formulario__validacion-estado fa-solid fa-circle-xmark"></i>
							</div>
							<p class="formulario__imput_error"> El documento ingresado es incorrecto. Es de maximo 8 digitos.</p>
						</div>

						<!--PAQUETE 7: Teléfono -->
						<div class="formulario__grupo" id="grupo__telefono">
							<div class="formulario__grupo-imput">
								<input type="text" class="formulario__imput" name="telefono" id="telefono" placeholder="Teléfono" maxlength="9" required>
								<i class="formulario__validacion-estado fa-solid fa-circle-xmark"></i>
							</div>
							<p class="formulario__imput_error">El teléfono ingresado es incorrecto. No existe dicho número.</p>
						</div>

						<!--PAQUETE 5: TIPO DE Distrito-->
						<div class="formulario__tpogrupo" id="grupo__tpoDistrito">
							<div class="formulario__grupo-imput">
								<select id="select_tipo" name="select_tipo" class="formulario_imput">
									<option value="select_tipo">--SELECCIONE DISTRITO--</option><br><br>
									<option value="select_tipo">Ancón</option>
									<option value="select_tipo">Ate</option>
									<option value="select_tipo">Barranco</option>
									<option value="select_tipo">Breña</option>
									<option value="select_tipo">Carabayllo</option>
									<option value="select_tipo">Chaclacayo</option>
									<option value="select_tipo">Chorrillos</option>
									<option value="select_tipo">Cieneguilla</option>
									<option value="select_tipo">Comas</option>
									<option value="select_tipo">El Agustino</option>
									<option value="select_tipo">Independencia</option>
									<option value="select_tipo">Jesús María</option>
									<option value="select_tipo">La Molina</option>
									<option value="select_tipo">La Victoria</option>
									<option value="select_tipo">Lima</option>
									<option value="select_tipo">Lince</option>
									<option value="select_tipo">Los Olivos</option>
									<option value="select_tipo">Lurigancho-Chosica</option>
									<option value="select_tipo">Lurín</option>
									<option value="select_tipo">Magdalena del Mar</option>
									<option value="select_tipo">Miraflores</option>
									<option value="select_tipo">Pachacámac</option>
									<option value="select_tipo">Pucusana</option>
									<option value="select_tipo">Pueblo Libre</option>
									<option value="select_tipo">Puente Piedra</option>
									<option value="select_tipo">Punta Hermosa</option>
									<option value="select_tipo">Punta Negra</option>
									<option value="select_tipo">Rímac</option>
									<option value="select_tipo">San Bartolo</option>
									<option value="select_tipo">San Borja</option>
									<option value="select_tipo">San Isidro</option>
									<option value="select_tipo">San Juan de Lurigancho</option>
									<option value="select_tipo">San Juan de Miraflores</option>
									<option value="select_tipo">San Luis</option>
									<option value="select_tipo">San Martín de Porres</option>
									<option value="select_tipo">San Miguel</option>
									<option value="select_tipo">Santa Anita</option>
									<option value="select_tipo">Santa María del Mar</option>
									<option value="select_tipo">Santa Rosa</option>
									<option value="select_tipo">Santiago de Surco</option>
									<option value="select_tipo">Surquillo</option>
									<option value="select_tipo">Villa El Salvador</option>
									<option value="select_tipo">Villa María del Triunfo</option>
								</select>
								<i class="formulario__validacion-estado fa-solid fa-circle-xmark"></i>
							</div>
						</div>

						<!--PAQUETE 7: Direccion ------------------------------------------->
						<div class="formulario__grupo" id="grupo__direccion">
							<div class="formulario__grupo-imput">
								<input type="text" class="formulario__imput" name="direccion" id="direccion" placeholder="Dirreción" maxlength="50" required>
								<i class="formulario__validacion-estado fa-solid fa-circle-xmark"></i>
							</div>
							<p class="formulario__imput_error">El teléfono ingresado es incorrecto. No existe dicho número.</p>
						</div>

						<!--PAQUETE 8: Correo Electrónico -->
						<div class="formulario__grupo" id="grupo__email">
							<div class="formulario__grupo-imput">
								<input type="text" class="formulario__imput" name="email" id="Email" placeholder="Correo Eléctronico" maxlength="50" required>
								<i class="formulario__validacion-estado fa-solid fa-circle-xmark"></i>
							</div>
							<p class="formulario__imput_error">El correo electrónico ingresado es incorrecto. Debe incluir un @ y terminar en ".com"</p>
						</div>

						<!--PAQUETE 8: Codigo del producto -->
						<div class="formulario__grupo" id="grupo__codigoProducto">
							<div class="formulario__grupo-imput">
								<input type="text" class="formulario__imput" name="codigoProducto" id="codigoProducto" placeholder="Codigo del producto" maxlength="20" required>
								<i class="formulario__validacion-estado fa-solid fa-circle-xmark"></i>
							</div>
							<p class="formulario__imput_error">El código ingresado del producto es incorrecto.</p>
						</div>

						<!--PAQUETE 7:Boleta -->
						<div class="formulario__grupo" id="grupo__boleta">
							<div class="formulario__grupo-imput">
								<input type="text" class="formulario__imput" name="boleta" id="boleta" placeholder="Número de Boleta y/o Factura" maxlength="10" required>
								<i class="formulario__validacion-estado fa-solid fa-circle-xmark"></i>
							</div>
							<p class="formulario__imput_error">El número de boleta ingresado no existe.</p>
						</div>

						<!----PAQUETE 9: Mensaje-->
						<div class="formulario__mensajes" id="grupo__mensajes">
							<div class="formulario__grupo-imput">
								<textarea type="text" class="formulario__mensajes" placeholder="Ingrese su mensaje" type="text" id="mensajes" name="mensajes" rows="10" cols="20"></textarea>
								<i class="formulario__validacion-estado fa-solid fa-circle-xmark"></i>
							</div>
							<p class="formulario__imput_error">El mensaje excede los mas de 1000 caracteres"</p>
						</div>

						<!--PAQUETE 10: TERMINOS Y CONDICIONES-->
						<div class="formulario_grupo" id="grupo_terminos">
							<label class="formulario__label">
								<input class="formulario__checkbox" type="checkbox" name="terminos" id="terminos">
								Acepto los Terminos y Condiciones al compartir mis datos.
							</label>
						</div>

						<!--PAQUETE 11: MENSAJE ERROR-->
						<div class="formulario__mensaje" id="formulario__mensaje">
							<p><i class="fas fa-exclamation-triangle"></i> <b>Error:</b>Por favor rellena el formulario correctamente. </p>
						</div>

						<!--PAQUETE 12: BOTONES-->
						<div class="formulario__ grupo formulario__grupo-btn-enviar">
							<!--<div class="formulario__grupo-btn">-->
							<button type="submit" class="formulario__btn">ENVIAR</button>
							<!--<button type="reset" class="formulario__btn-borrar">BORRAR</button> -->
							<p class="formulario__mensaje-exito" id="formulario__mensaje-exito">¡SU RECLAMO HA SIDO REGISTRADO CORRECTAMENTE! </p>
						</div>
					</form>
				</fieldset>
			</article>
		</aside>
	</main>
	<script src="JS/Registrar_Reclamo.js"></script>
	<script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>
</body>

</html>