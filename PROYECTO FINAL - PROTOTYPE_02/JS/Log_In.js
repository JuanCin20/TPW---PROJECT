const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');

signUpButton.addEventListener('click', () => {
	container.classList.add("right-panel-active");
});

signInButton.addEventListener('click', () => {
	container.classList.remove("right-panel-active");
});

//Register
const Password_Usuario_02 = document.getElementById('Password_Usuario_02');
const RequiPass = document.getElementById('PassRequirementRegis');

Password_Usuario_02.addEventListener('keyup', () => {
	var Password_Usuario_02 = document.getElementById('Password_Usuario_02').value;
	var letterCount = Password_Usuario_02.length;
	//console.log(letterCount);
	if (letterCount < 5) {
		RequiPass.style.display = 'block';
	}
	if (letterCount >= 5) {
		RequiPass.style.display = 'none';
	}
});