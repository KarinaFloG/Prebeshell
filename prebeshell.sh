#!/bin/bash
#Iniciar limpiando la pantalla, creando la variable del prompt y atrapando las señanles ctrl z y c
clear
PS1="$(tput setaf 1)[$(tput sgr0)$(tput setaf 4)$USER@$(tput sgr0)$(tput setaf 2)$PWD$(tput sgr0)$(tput setaf 1)]$(tput sgr0)Carita-feliz :D "
trap "" SIGINT SIGTSTP

#Empieza la prebeshell
echo -e "\e[0;31mBienvenido a la prebeshell :D\e[0m"
echo -e "\e[0;34mPara salir de la terminal escriba 'salir'\e[0m"
echo -e "\e[1;32mIngresa alguna de las opciones siguientes para usar la hermosa prebeshell\e[0m"
echo -e "\t\e[0;34m****\e[0m\e[0;35m infosis \e[0m\e[0;34m********\e[0m"
echo -e "\t\e[0;34m****\e[0m\e[0;35m ayuda \e[0m\e[0;34m**********\e[0m"
echo -e "\t\e[0;34m****\e[0m\e[0;35m prebeplayer \e[0m\e[0;34m****\e[0m"
echo -e "\t\e[0;34m****\e[0m\e[0;35m sopa \e[0m\e[0;34m***********\e[0m"
echo -e "\t\e[0;34m****\e[0m\e[0;35m ahorcado \e[0m\e[0;34m*******\e[0m"
echo -e "\t\e[0;34m****\e[0m\e[0;35m creditos \e[0m\e[0;34m*******\e[0m"
echo -e "\t\e[0;34m****\e[0m\e[0;35m arbol \e[0m\e[0;34m**********\e[0m"
echo -e "\t\e[0;34m****\e[0m\e[0;35m ls \e[0m\e[0;34m*************\e[0m\n"
#Ciclo de control para mantener la prebeshell
ciclo=0
while [ $ciclo -eq 0 ]; do
read -p "$PS1" cmd 
#Leer variable para ejecutar los scripts adecuados
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
	sopa)
	. $PWD/terminal/juegos/sopa_prrona.sh
	;;
	prebeplayer)
	. $PWD/terminal/prebeplayer.sh
	;;
	ls)
	. $PWD/terminal/ls.sh
	;;
	salir)
	echo""
	echo -e "\e[0;31mSaliste de la prebeshell :(\e[0m"
	echo""
	ciclo=1
	exit
	;;
	*)
	echo -e "\e[0;31mComando incorrecto, prueba con 'ayuda'\e[0m"
esac
done
