#!/bin/bash

# Nombre del archivo HTML de salida
output_file="formulario.html"

# Comprobar si el archivo HTML ya existe y eliminarlo si es así
if [ -f "$output_file" ]; then
    rm "$output_file"
fi

# Crear el contenido del archivo HTML
html_content="
<!DOCTYPE html>
<html lang='en'>
<head>
    <meta charset='UTF-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>Formulario</title>
</head>
<body>

<div id='micaja'>¡Hola soy una caja!</div>

<section id='miseccion'>
    <h1 id='encabezado'>Listado de textos de los divs</h1>
</section>

<form id='formulario'>
    <label for='nombre'>Nombre:</label>
    <input type='text' id='nombre' placeholder='Escribe tu nombre' required>

    <label for='apellidos'>Apellidos:</label>
    <input type='text' id='apellidos' placeholder='Escribe tus apellidos' required>

    <button id='mostrarDatos'>Mostrar Datos</button>
</form>

<div id='datosMostrados'></div>

<script>
    'use strict'

    // Obtener elementos del DOM
    var nombreInput = document.getElementById('nombre');
    var apellidosInput = document.getElementById('apellidos');
    var mostrarDatosBtn = document.getElementById('mostrarDatos');
    var datosMostradosDiv = document.getElementById('datosMostrados');

    mostrarDatosBtn.addEventListener('click', function (event) {
        event.preventDefault(); // Evitar la recarga de la página

        var nombre = nombreInput.value;
        var apellidos = apellidosInput.value;

        if (nombre && apellidos) { // Comprobar si se ingresaron datos
            var texto = '<h1>Hola que tal</h1>' +
              '<h3>Mi nombre es: ' + nombre + '</h3>' +
              '<h3>Mis apellidos son: ' + apellidos + '</h3>';

            // Mostrar datos debajo de los campos de entrada
            datosMostradosDiv.innerHTML = texto;

            // Limpiar los campos de entrada
            nombreInput.value = '';
            apellidosInput.value = '';
        } else {
            datosMostradosDiv.innerHTML = 'Por favor, introduce tanto el nombre como los apellidos obligatoriamente.';
        }
    });
</script>

</body>
</html>
"

# Guardar el contenido HTML en el archivo de salida
echo "$html_content" > "$output_file"

echo "Formulario HTML creado en $output_file"
