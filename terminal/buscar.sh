read -p "Archivo a buscar: " arch
read -p "Directorio: " dir
find $dir | grep "$arch"