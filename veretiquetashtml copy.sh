#!/bin/bash

# Preguntar al usuario por el nombre del archivo HTML que desea analizar
read -r -p "Introduce el nombre del archivo HTML que deseas analizar: " html_file

# Comprobar si el archivo HTML existe
if [ ! -f "$html_file" ]; then
    echo "El archivo HTML '$html_file' no existe."
    exit 1
fi

# Función para extraer y mostrar todas las etiquetas HTML
mostrar_todas_las_etiquetas() {
    local archivo="$1"
    local etiquetas
    etiquetas=$(grep -o "<[^>]*>" "$archivo")
    
    if [ -n "$etiquetas" ]; then
        echo "Todas las etiquetas HTML en '$archivo':"
        echo "$etiquetas"
    else
        echo "No se encontraron etiquetas HTML en '$archivo'."
    fi
}

# Mostrar todas las etiquetas HTML en el archivo
mostrar_todas_las_etiquetas "$html_file"
