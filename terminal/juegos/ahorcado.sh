#!/bin/bash

d1="_|====||"
d2="_|____||"
d3="_O____||"
d4="/|\___||"
d5="/ \___||"
d6="______||"

#Ciclo para la entrada y salida del juego
ciclo3=0
while [ $ciclo3 -eq 0 ]; do
#Selección de palabra
echo -e "\e[0;32mIntroduzca un numero del 1 al 5 para seleccionar su palabra:\e[0m "
read n
case $n in
	1)
	palabra="avion"
	ciclo3=1
	;;
	2)
	palabra="prebe"
	ciclo3=1
	;;
	3)
	palabra="becario"
	ciclo3=1
	;;
	4)
	palabra="persona"
	ciclo3=1
	;;
	5)
	palabra="proteco"
	ciclo3=1
	;;
	*)
	echo "\e[0;31mNumero equivocado, vuelve a intentarlo\e[0m"
	;;
esac
done

tam=${#palabra}
i=0
while [ $i -lt $tam ]; do
	p=$p"_|"
	i=` expr $i + 1 `
done
echo "$p"

#Para empezar el juego
clear
op=0
letra=""
pos=0
muerte=0
while [ $op -ne 1 ]; do

	#Hacer el ahorcado con los errores
	if [ $muerte -gt 0 ];then
		echo $d1
	else
		echo " "
	fi

	if [ $muerte -gt 1 ]; then
		echo $d2
	else
		echo " "
	fi

	if [ $muerte -gt 2 ]; then
		echo $d3
	else
		echo " "
	fi

	if [ $muerte -gt 3 ];then
		echo $d4
	else
		echo " "
	fi

	if [ $muerte -gt 4 ];then
		echo $d5
	else
		echo " "
	fi

	if [ $muerte -gt 5 ];then
		echo $d6
	else
		echo " "
	fi

	if [ $muerte -eq 6 ];then
		echo ""
		echo -e "\e[1;3m************************************\e[0m "
		echo -e "\e[1;3m********** Perdiste prro ***********\e[0m "
		echo -e "\e[1;3m**********  Eres malo :v ***********\e[0m "
		echo -e "\e[1;3m*********** Ponme 10 :( ************\e[0m "
		echo -e "\e[1;3m************************************\e[0m "
		echo -e ""
		break
	fi

k3=0
c3=0
gano=1
	while [ $k3 -lt $tam ]; do
		k3=` expr $k3 + 1 `
		c3=$(echo $p | cut -d"|" -f$k3)

		if [ $c3 = "_" ]; then
			gano=0
		fi
	done

if [ $gano -eq 1 ]; then
	echo ""
	echo -e "\e[1;3m************************************\e[0m"
	echo -e "\e[1;3m************ \e[1;36mGanaste\e[0m \e[1;3m***************\e[0m"
	echo -e "\e[1;3m***** \e[1;36mSeguramente eres becario\e[0m \e[1;3m*****\e[0m"
	echo -e "\e[1;3m************ \e[1;36mPonme 10 :(\e[0m \e[1;3m***********\e[0m"
	echo -e "\e[1;3m************************************\e[0m"
	echo""
	break
fi

#Lectura de las letras
echo -e "\e[1;32mIngrese la letra:\e[0m \e[0;32m "
read letra
clear
pos=0
cont=0
c1=$palabra
aux=` expr index $c1 $letra`

if [ $aux -eq 0 ]; then
muerte=` expr $muerte + 1 `
fi

k=0
gano=1

while [ $aux -ne 0 ]; do
k=` expr $k + 1 `
c1=$(echo $palabra | cut -d$letra -f$k)

aux=${#c1}

if [ $cont -lt $tam ]; then
aux=` expr $aux + 1 `
cont=` expr $cont + $aux `

k2=0
letra2="|"
c2=""
respaldo=""
while [ $k2 -lt $tam ]; do
k2=` expr $k2 + 1 `
c2=$(echo $p | cut -d$letra2 -f$k2)

if [ $k2 -eq $cont ]; then
respaldo=$respaldo$letra"|"
else
respaldo=$respaldo$c2"|"
fi

done
p=$respaldo
fi
done
echo -e "\e[1;33m--------> $respaldo <--------\e[0m"
done
