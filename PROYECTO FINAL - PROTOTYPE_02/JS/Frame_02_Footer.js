const Number_Product_Container_Input = document.querySelector('.Number_Product_Container_Input');
const Plus = document.querySelector('#Plus');
const Less = document.querySelector('#Less');

//Conversión "Number_Product_Container_Input" a Valor Entero
let valueByDefault = parseInt(Number_Product_Container_Input.value);

//Función Cantidad: Incrementar
Plus.addEventListener('click', () => {
    valueByDefault += 1;
    Number_Product_Container_Input.value = valueByDefault;
});

//Función Cantidad: Decrementar
Less.addEventListener('click', () => {
    if (valueByDefault === 1) {
        return;
    }

    valueByDefault -= 1;
    Number_Product_Container_Input.value = valueByDefault;
});

//Toggle
//Constantes Toggle Títulos
const Title_Product_Description_Container = document.querySelector('.Title_Product_Description_Container');
const Title_Aditional_Product_Description_Container = document.querySelector('.Title_Aditional_Product_Description_Container');

//Constantes Toggle Texto
const Text_Product_Description_Container = document.querySelector('.Text_Product_Description_Container');
const Text_Aditional_Product_Description_Container = document.querySelector('.Text_Aditional_Product_Description_Container');

//Funciones Toggle
Title_Product_Description_Container.addEventListener('click', () => {
    Text_Product_Description_Container.classList.toggle('Hidden');
});

let Count = 0;
const Product_IMG = document.querySelector('.Product_IMG');
const Alter_IMG = document.getElementById('Alter_IMG');

Title_Aditional_Product_Description_Container.addEventListener('click', () => {
    Count++;
    console.log("Number: " + Count);
    Result = Count / 2;
    console.log("Number: " + Result);

    if (Number.isInteger(Result)) {
        Text_Aditional_Product_Description_Container.classList.toggle('Hidden');
        Product_IMG.style.height = "500px";
        Alter_IMG.style.height = "500px";
    } else {
        if (!Number.isInteger(Result)) {
            Text_Aditional_Product_Description_Container.classList.toggle('Hidden');
            Product_IMG.style.height = "665px";
            Alter_IMG.style.height = "665px";
        }
    }
});