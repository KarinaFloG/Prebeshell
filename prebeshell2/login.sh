#!/bin/bash

#NOTAAAAAA EJECUTAR EL SCRIPT COMO bash login.sh

#Variables para guardar la contrasenia y el password
usuario=""
contrasenia=""
#Variable para el control del programa
control=0
var=4
#Archivos en donde se encuentran los usuarios y contrasenias validos
usuarios=./usuarios.txt
contrasenias=./contrasenias.txt

#Para el control de las veces que se intenta acceder
while [ $control -lt 4 ]; do
	echo -e "\e[31m\e[43m Usuario: \e[0m\e[49m"
	read   usuario
	#Valida que la entrada del usuario no este vacia
	if [ -z $usuario ]; then
		echo -e "\e[30m\e[42m Este campo no puede estar vacio,intenta de nuevo \e[0m\e[49m"
		#Incrementa la variable de control para el ciclo while
		control=$((control+1))
		intentos=$((4 - control))
		echo -e  "\e[30m\e[46m Te quedan $intentos  intentos \e[0m\e[49m"
	else
		#El ciclo se encarga de revisar que el usuario que se ingreso exista en el sistema
		if [ $(sudo egrep -c  $usuario /etc/shadow | tail -n 1) -ne 0 ]; then
			#Si se encuentra en el sistema, se valida que este dentro de la lista de usuarios
			echo "LLEGA A 1"
			if [ $(egrep -c $usuario $usuarios) -ne 0 ]; then
				#Si se encuentra en ambas listas, solicita el password de acceso
				echo -e "\e[31m\e[42m Password: \e[0m\e[49m"
				read -s contrasenia
				echo "LLEGA A 2"
				#Verifica que el password ingresado no sea nulo, por seguridad
				if [ -z $contrasenia ]; then
					echo -e "\e[30m\e[42m Este campo no puede estar vacio, intenta de nuevo \e[0m\e[49m"
					#Incrementa la variable de control para el ciclo while
					control=$((control+1))
				else
					echo "LLEGA A 3"
					#Verifica que la contraseña ingresada se encuentre en el sistema
					if [ $(egrep -c $contrasenia $contrasenias) -ne 0 ]; then
						echo -e "\e[30m\e[43m ¡¡¡ BIEVENIDO AL SISTEMA!!! \e[0m\e[49m"
						control=4  #PROVISIONALMENTE EN LO QUE ESTA LA PREBESHELL COMPLETA
						#aqui va la prebeshell
						./prebeshell.sh
					else
						#Manda error si la contraseña es incorrecta
						echo -e "\e[30m\e[42m La contrasenia es incorrecta, intentalo de nuevo \e[0m\e[49m"
						#Incrementa la variable de control para el ciclo while
						control=$((control+1))
 						intentos=$((4 - control))
               					 echo -e  "\e[30m\e[46m Te quedan $intentos  intentos \e[0m\e[49m"
					fi
				fi
			else
				#Esta parte del codigo se encarga de meter a la lista de usuarios aquellos usuarios que ya fueron validados de que existen en el sistema
				#pero es la primera vez que entran y por lo tanto no existen en el archivo de usuarios 
				echo -e "\e[30m\e[43m  REPAMPANOS !! Parece que es la primera vez que usas esta belleza de prebeshell \e[0m\e[49m"
				echo -e "\e[30m\e[43m  Establece una contrasenia para tu sesion porfi \e[0m\e[49m"
				#Agrega al usuario al archivo que contiene a los usuarios del sistema (es un txt)
				(sudo egrep -o $usuario /etc/shadow | tail -n 1) >> $usuarios
				echo -e "\e[31m\e[42m Password: \e[0m\e[49m"
				read -s  contrasenia
				#Verifica que el password ingresado no sea nulo, por seguridad
				if [ -z $contrasenia ]; then
					echo -e "\e[30m\e[42m Este campo no puede ir vacio, intentalo de nuevo \e[0m\e[49m"
					#Incrementa la variable de control para el ciclo while
					control=$((control+1))
				else
					#Agrega la contraseña del usuario a la lista de contraseñas (es un txt)
					echo "$contrasenia" >> $contrasenias
					echo -e "\e[30m\e[43m ¡¡¡ BIEVENIDO AL SISTEMA!!! \e[0m\e[49m"
					control=4 #EN lo que esta la prebeshell 
					#AQUI VA LA PREBESHELL	
					./prebeshell.sh
				fi
			fi
		else #else 2
			echo -e "\e[30m\e[42m El usuario no se encuentra en el sistema, intentalo de nuevo con otro usuario \e[0m\e[49m"
			control=$((control+1))
		fi # fi 2
	fi #fi 1



done
