#!/bin/bash

# Nombre del archivo HTML de salida
output_file="mi_pagina.html"

# Definir variables con valores predeterminados
id1header="header"
claseheader="border-grey"
namecabecera="cabecera"
navclass="border-grey"
idmain="main"
idsection="section"
ejemplojs="ejemplo.js"
href1="#"
href2="#"
href3="#"

# Preguntar al usuario si desea utilizar valores predeterminados o personalizar
read -r -p "¿Deseas utilizar los valores predeterminados (S/n)? " use_default

# Si el usuario no desea utilizar los valores predeterminados, solicitar entradas personalizadas
if [[ ! "$use_default" =~ ^[Ss] ]]; then
    read -r -p "Introduce el nombre del id de header (por ejemplo, header): " id1header
    read -r -p "Introduce el nombre del id de main (por ejemplo, main): " idmain
    read -r -p "Introduce el nombre del id de section (por ejemplo, section): " idsection
    read -r -p "Cambiar en header el nombre de la clase (por ejemplo, border-grey): " claseheader
    read -r -p "Cambiar en header el nombre del atributo name (por ejemplo, cabecera): " namecabecera
    read -r -p "Cambiar en nav el nombre de la clase del nav (por ejemplo, border-grey): " navclass
    read -r -p "Cambiar en nombre el nombre del archivo javascript (por ejemplo, ejemplo.js): " ejemplojs
    read -r -p "Cambiar en nav in ul in li la ruta1(Esta:# puedes poner link url): " href1
    read -r -p "Cambiar en nav in ul in li la ruta2(por ejemplo, #): " href2
    read -r -p "Cambiar en nav in ul in li la ruta3(por ejemplo, #): " href3
fi

# Contenido del archivo HTML
html_content='<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">

    <!-- <script defer src="ejemplo.js"></script> -->
    <!-- <script src="ejemplo.js" async></script> -->
    <script defer src="'$ejemplojs'"></script>
    
    <title>Dom</title>
</head>
<body>
    <header id="'"$id1header"'" class="'"$claseheader"'" name="'"$namecabecera"'">
        <h1>Mi web/blog para trastear con el DOM</h1>
    </header>
    <nav class="'"$navclass"'">
        <ul>
            <li><a href="'$href1'">LINK 1</a></li>
            <li><a href="'$href2'">LINK 2</a></li>
            <li><a href="'$href3'">LINK 3</a></li>
        </ul>
    </nav>
    
    <main id="'"$idmain"'">
        <!-- beforebegin -->
        <section id="'"$idsection"'" class="border-grey" nombre="meloinvento">
            <!-- afeterbegin -->
            <h2>Titulo de la seccion</h2>
            <article class="border-grey">
                <h3>Titulo del articulo h3</h3>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolor assumenda expedita tenetur omnis maiores reiciendis nulla quia, ad obcaecati, ea delectus eum aliquam vero aperiam nisi, sapiente itaque corporis exercitationem.</p>
            </article>
            <!-- beforeend -->
        </section>
        <!-- afterend -->
    </main>
    <footer class="border-grey">
        <p>2022 Desarrollo útil</p>
    </footer>
</body>
</html>'

# Guardar el contenido HTML en el archivo de salida
echo "$html_content" > "$output_file"

echo "Archivo HTML '$output_file' creado con éxito."
