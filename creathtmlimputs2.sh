#!/bin/bash

# Nombre del archivo HTML de salida
output_file="formulario.html"

# Comprobar si el archivo HTML ya existe y eliminarlo si es así
if [ -f "$output_file" ]; then
    rm "$output_file"
fi

# Definir variables para clases y atributos
clase_micaja="micaja"
id_miseccion="miseccion"
id_encabezado="encabezado"
clase_formulario="formulario"
id_nombre="nombre"
placeholder_nombre="Escribe tu nombre"
id_apellidos="apellidos"
placeholder_apellidos="Escribe tus apellidos"
id_mostrar_datos="mostrarDatos"
id_datos_mostrados="datosMostrados"

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

<div id='$id_micaja' class='$clase_micaja'>¡Hola soy una caja!</div>

<section id='$id_miseccion'>
    <h1 id='$id_encabezado'>Listado de textos de los divs</h1>
</section>

<form id='$id_formulario' class='$clase_formulario'>
    <label for='$id_nombre'>Nombre:</label>
    <input type='text' id='$id_nombre' placeholder='$placeholder_nombre' required>

    <label for='$id_apellidos'>Apellidos:</label>
    <input type='text' id='$id_apellidos' placeholder='$placeholder_apellidos' required>

    <button id='$id_mostrar_datos'>Mostrar Datos</button>
</form>

<div id='$id_datos_mostrados'></div>

<script>
    'use strict'

    // Obtener elementos del DOM
    var nombreInput = document.getElementById('$id_nombre');
    var apellidosInput = document.getElementById('$id_apellidos');
    var mostrarDatosBtn = document.getElementById('$id_mostrar_datos');
    var datosMostradosDiv = document.getElementById('$id_datos_mostrados');

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
