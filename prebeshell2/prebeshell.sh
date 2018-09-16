#!/bin/bash
clear
PS1="$(tput setaf 1)[$(tput sgr0)$(tput setaf 4)$USER@$(tput sgr0)$(tput setaf 2)$PWD$(tput sgr0)$(tput setaf 1)]$(tput sgr0)Carita-feliz :D "
trap "" SIGINT SIGTSTP

echo "Bienvenido a la prebeshell :D"
echo "Para salir de la terminal escriba 'salir'"
ciclo=0
while [ $ciclo -eq 0 ]; do
read -p "$PS1" cmd 
case $cmd in
	arbol)
	. $PWD/terminal/arbol.sh
	;;
	ayuda)
	. $PWD/terminal/ayuda.sh
	;;
	buscar)
	. $PWD/terminal/buscar.sh
	;;
	creditos)
	. $PWD/terminal/creditos.sh
	;;
	infosis)
	. $PWD/terminal/infosis.sh
	;;
	ahorcado)
	. $PWD/terminal/juegos/ahorcado.sh
	;;
	salir)
	echo""
	echo "Saliste de la prebeshell :("
	echo""
	ciclo=1
	;;
	*)
	echo "Comando incorrecto, prueba con 'ayuda' "
esac
done
