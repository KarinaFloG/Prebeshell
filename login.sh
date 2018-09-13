#!/bin/bash

#Variables para guardar la contrasenia y el password
usuario=""
contrasenia=""
#Variable para el control del programa
control=0
#Archivos en donde se encuentran los usuarios y contrasenias validos
usuarios=~/usuarios.txt
contrasenias=~/contrasenias.txt

#Para el control de las veces que se intenta acceder
while [ $control -le 4 ]; do
	echo -e "\e[31m Usuario: \e[0m"
	read  usuario
	#Valida que la entrada del usuario no este vacia
	if [ -z $usuario ]; then
		echo "Este campo no puede estar vacio,intenta de nuevo"
		#Incrementa la variable de control para el ciclo while
		control=$((control+1))
		echo "Te queda $control intentos"
	else
		#El ciclo se encarga de revisar que el usuario que se ingreso exista en el sistema
		if [ $(grep -c $usuario /etc/shadow | tail -n 1) -ne 0 ]; then
			#Si se encuentra en el sistema, se valida que este dentro de la lista de usuarios
			if [ $(egrep -w $usuario $usuarios) -ne 0 ]; then
				#Si se encuentra en ambas listas, solicita el password de acceso
				echo -e "\e[31m Password: \e[0m"
				read -s contrasenia
				#Verifica que el password ingresado no sea nulo, por seguridad
				if [ -z $contrasenia ]; then
					echo "Este campo no puede estar vacio, intenta de nuevo"
					#Incrementa la variable de control para el ciclo while
					control=$((control+1))
				else
					#Verifica que la contraseña ingresada se encuentre en el sistema
					if [ $(egrep -w $contrasenia $contrasenias) -ne 0 ]; then
						echo "\e[31m BIEVENIDO AL SISTEMA!! \e[0m"
						#aqui va la prebeshell
					else
						#Manda error si la contraseña es incorrecta
						echo "\e[31m La contrasenia es incorrecta, intentalo de nuevo \e[0m"
						#Incrementa la variable de control para el ciclo while
						control=$((control+1))
					fi
				fi
			else
				#Esta parte del codigo se encarga de meter a la lista de usuarios aquellos usuarios que ya fueron validados de que existen en el sistema
				#pero es la primera vez que entran y por lo tanto no existen en el archivo de usuarios 
				echo "\e[31m REPAMPANOS !! Parece que es la primera vez que usas esta belleza de prebeshell \e[0m"
				echo "\e[31m Establece una contrasenia para tu sesion porfi \e[0m"
				#Agrega al usuario al archivo que contiene a los usuarios del sistema (es un txt)
				egrep -o $usuario /etc/shadow | tail -n 1 >> $usuarios
				read -s  contrasenia
				#Veridica que el password ingresado no sea nulo, por seguridad
				if [ -z $contrasenia ]; then
					echo "Este campo no puede ir vacio, intentalo de nuevo"
					#Incrementa la variable de control para el ciclo while
					control=$((control+1))
				else
					#Agrega la contraseña del usuario a la lista de contraseñas (es un txt)
					echo "$contrasenia" >> $contrasenias
					##AQUI VA LA PRECIOSA PREBESHELL
				fi
			fi
		else #else 2
			echo "El usuario no se encuentra en el sistema, intentalo de nuevo con otro usuario"
			control=$((control+1))
		fi # fi 2
	fi #fi 1



done
