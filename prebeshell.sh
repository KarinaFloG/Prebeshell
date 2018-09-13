#!/bin/bash
clear
PS1="$(tput setaf 1)[$(tput sgr0)$(tput setaf 4)$USER@$(tput sgr0)$(tput setaf 2)$PWD$(tput sgr0)$(tput setaf 1)]$(tput sgr0)Carita-feliz :D "
trap "" SIGINT SIGTSTP

echo "Bienvenido a la prebeshell :D"
echo "Para salir escriba 'salir'"
ciclo=0
while [ $ciclo -eq 0 ]; do
read -p "$PS1" cmd
case $cmd in
	arbol)
	. $PWD/arbol.sh
	;;
	ayuda)
	. $PWD/ayuda.sh
	;;
	buscar)
	. $PWD/buscar.sh
	;;
	creditos)
	. $PWD/creditos.sh
	;;
	infosis)
	. $PWD/infosis.sh
	;;
	salir)
	echo "Saliste de la prebeshell :("
	ciclo=1
	;;
	*)
	echo "Comando incorrecto, prueba con 'ayuda' "
esac
done
