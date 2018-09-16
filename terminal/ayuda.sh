#/bin/bash!

clear
#Crear la variable ayuda e imprimir los comandos
helmiplis="¿Sobre que comando desea ayuda?"
echo -e "\e[1;32mPara salir escriba 'salir'\e[0m"
echo -e "\t\e[1;33mLista de comandos\e[0m"
echo -e "\t\e[0;34m****\e[0m\e[0;35m infosis \e[0m\e[0;34m********\e[0m"
echo -e "\t\e[0;34m****\e[0m\e[0;35m ayuda \e[0m\e[0;34m**********\e[0m"
echo -e "\t\e[0;34m****\e[0m\e[0;35m prebeplayer \e[0m\e[0;34m****\e[0m"
echo -e "\t\e[0;34m****\e[0m\e[0;35m sopa \e[0m\e[0;34m***********\e[0m"
echo -e "\t\e[0;34m****\e[0m\e[0;35m ahorcado \e[0m\e[0;34m*******\e[0m"
echo -e "\t\e[0;34m****\e[0m\e[0;35m creditos \e[0m\e[0;34m*******\e[0m"
echo -e "\t\e[0;34m****\e[0m\e[0;35m arbol \e[0m\e[0;34m**********\e[0m"
echo -e "\t\e[0;34m****\e[0m\e[0;35m ls \e[0m\e[0;34m*************\e[0m\n"
#Ciclo para controlar los comandos
ciclin=0
while [ $ciclin -eq 0 ]; do
echo ""
read -p "$helmiplis" var
case $var in
	arbol)
	. $PWD/scripts/aarbol.sh
	;;
	ayuda)
	. $PWD/scripts/aayuda.sh
	;;
	buscar)
	. $PWD/scripts/abuscar.sh
	;;
	creditos)
	. $PWD/scripts/acreditos.sh
	;;
	infosis)
	. $PWD/scripts/ainfosis.sh
	;;
	ahorcado)
	. $PWD/scripts/aahorcado.sh
	;;
	sopa)
	. $PWD/scripts/asopa.sh
	;;
	ls)
	. $PWD/scripts/als.sh
	;;
	prebeplayer)
	. $PWD/scripts/aprebeplayer.sh
	;;
	salir)
	ciclin=1
	;;
	*)
	echo -e "\e[1;35mComando incorrecto, prueba otra vez\e[0m"
esac
done
