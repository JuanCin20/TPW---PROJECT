const formulario = document.getElementById('formulario');
const inputs = document.querySelectorAll('.formulario__imput');


const expresiones = {
	usuario: /^[a-zA-Z0-9\_\-]{4,16}$/,
	nombre: /^[a-zA-ZÀ-ÿ\s]{1,40}$/,
	apellidos: /^[a-zA-ZÀ-ÿ\s]{1,60}$/,
	edad: /^(1[8-9]|[2-9][0-9])$/,
	documento: /^\d{8}$/,
	telefono: /^9\d{8}$/,
	email: /^[\w.%+-]+@[\w.-]+\.[A-Za-z]{2,}$/,
	mensajes: /^[\s\S]{1,1000}$/
}

const campos = {
	usuario: false,
	nombre: false,
	apellidos: false,
	edad: false,
	documento: false,
	telefono: false,
	email: false,
	mensaje: false
}

const validarFormulario = (e) => {
	switch (e.target.name) {
		case "usuario":
			validarCampo(expresiones.usuario, e.target, 'usuario');
			break;

		case "nombre":
			validarCampo(expresiones.nombre, e.target, 'nombre');
			break;

		case "apellidos":
			validarCampo(expresiones.apellidos, e.target, 'apellidos');
			break;
		case "edad":
			validarCampo(expresiones.edad, e.target, 'edad');
			break;
		case "documento":
			validarCampo(expresiones.documento, e.target, 'documento');
			break;
		case "telefono":
			validarCampo(expresiones.telefono, e.target, 'telefono');
			break;
		case "email":
			validarCampo(expresiones.email, e.target, 'email');
			break;
		case "mensajes":
			validarCampo(expresiones.email, e.target, 'mensajes');
			break;
	}
}

const validarCampo = (expresion, input, campo) => {
	if (expresion.test(input.value)) {
		document.getElementById(`grupo__${campo}`).classList.remove('formulario__grupo-incorrecto');
		document.getElementById(`grupo__${campo}`).classList.add('formulario__grupo-correcto');
		document.querySelector(`#grupo__${campo} i`).classList.add('fa-check-circle');
		document.querySelector(`#grupo__${campo} i`).classList.remove('fa-circle-xmark');
		document.querySelector(`#grupo__${campo} .formulario__imput_error`).classList.remove('formulario__imput_error-activo');
		campos[campo] = true;
	} else {
		document.getElementById(`grupo__${campo}`).classList.add('formulario__grupo-incorrecto');
		document.getElementById(`grupo__${campo}`).classList.remove('formulario__grupo-correcto');
		document.querySelector(`#grupo__${campo} i`).classList.add('fa-circle-xmark');
		document.querySelector(`#grupo__${campo} i`).classList.remove('fa-check-circle');
		document.querySelector(`#grupo__${campo} .formulario__imput_error`).classList.add('formulario__imput_error-activo');
		campos[campo] = false;
	}
}

inputs.forEach((imput) => {
	imput.addEventListener('keyup', validarFormulario);
	imput.addEventListener('blur', validarFormulario);
});


formulario.addEventListener('submit', (e) => {
	e.preventDefault();

	const terminos = document.getElementById('terminos');
	if (campos.usuario && campos.nombre && campos.apellidos && campos.edad && campos.documento && campos.telefono && campos.email && terminos.checked) {
		formulario.reset();

		document.getElementById('formulario__mensaje-exito').classList.add('formulario__mensaje-exito-activo');
		setTimeout(() => {
			document.getElementById('formulario__mensaje-exito').classList.remove('formulario__mensaje-exito-activo');
		}, 5000);

		document.querySelectorAll('.formulario__grupo-correcto').forEach((icono) => {
			icono.classList.remove('formulario__grupo-correcto');
		});

	} else {
		document.getElementById('formulario__mensaje').classList.add('formulario__mensaje-activo');
	}
});