#SCRIPT PARA LA PREBEPLAYER CHIDORRI TEAM KARINA Y OCTAVIO
#Para ejecutar solo este script usar: bash prebeplayer.sh

#dpkg --get-selections regresa todos los programas instalados en el sistema
#La salida de dpkg lo mandamos a un archivo de texto llamado verificacion
dpkg --get-selections>verificacion
#Asignamos el archivo a una variable para poder usarlo en el while
archivo=./verificacion
#Verifica que se encuentre instalado mpg123 para usar la prebeplayer
#Mientras no este instalado, pasamos a lo sig para instalarlo
#Si es igual a 0 (-eq 0) significa que no está instalado
while [ $(egrep -c "mpg123" $archivo) -eq 0 ]; do
	#Le avisa al usuario que se debe instalar mpg123
	echo -e "\e[0;31m Para usar esta prebeplayer necesitas tener instalado  mpg123 \e[0m"
	#Se confirma la instalación del programa
	echo -ne "\e[0;32m ¿Deseas instalarlo? \e[0m"
	echo -e "\e[0;32m [Y/N] *Y=YES* *N=NO* \e[0m"
	echo -ne " $ "
	read opt
	case $opt in
		Y|y)
			#Si el usuario acepta se instala el programa
			sudo apt-get install mpg123
			echo -e "\e[1;35m Descargando paquetes...[0m"
			echo -e "\e[1;35m Instalando... [0m"
			#AGREGAR TEMPORIZADOR
			echo -e "\e[0;35m mpg123 instalado [0m"
		;;

		N|n)
			#Si el usuario no acepta el programa no se instala y el script no continua
			echo -e "\e[1;35m No podras usar la prebeplayer :( Tú te lo pierdes \e[0m"
			exit
		;;

		*)
			#Si el usario ingresa un carater distinto  a Y/N notifica un error y termina
			echo -e "\e[1;35m  UPS ocurrio un error \e[0m"
			clear
		;;

	esac
done

	#Variable para el control del flujo de la prebeplayer
	control=0
	#Ruta de la carpeta en donde se encuentra la musica
	echo -e  "\e[0;32mIngresa la ruta de la carpeta en donde almacenas tu musica:\e[0m "
	echo -e "\e[1;33mRuta\e[0m: "
	read ruta
	cd $ruta


	#Empieza el ciclo para mostrar el menu y hacer las operaciones de la prebeplayer
	while [ $control -ne 1 ];
	do
		#Menu de la prebeplayer
		echo -e "\n\t\e[1;33m***********\e[0m\e[1;31mPREBEPLAYER CHIDORRI TEAM KARINA Y OCTAVIO\e[0m\e[1;33m**************\e[0m"
		echo -e "\t\e[1;33m*************\e[0m         \e[1;33mMENU PRINCIPAL\e[0m                   \e[1;33m************\e[0m"
		echo -e "\t\e[1;33m*************\e[0m \e[1;34m1)Reproducir una cancion\e[0m                 \e[1;33m************\e[0m"
		echo -e "\t\e[1;33m*************\e[0m \e[1;34m2)Reproducir todas las canciones\e[0m         \e[1;33m************\e[0m"
		echo -e "\t\e[1;33m*************\e[0m \e[1;34m3)Reproducir todas las canciones en aleatorio\e[0m \e[1;33m*******\e[0m"
		echo -e "\t\e[1;33m*************\e[0m \e[1;34m4)Ver las canciones de la carpeta\e[0m        \e[1;33m************\e[0m"
		echo -e "\t\e[1;33m***********+*\e[0m \e[1;34m5)Salir\e[0m                                  \e[1;33m************\e[0m"
		echo -e "\t\e[1;33m*******************************************************************\e[0m"
		echo -e "\n\t\e[1;31m************\e[0m          \e[1;34mMENU DEL REPRODUCTOR\e[0m           \e[1;31m**************\e[0m"
                echo -e "\t\e[1;31m------------\e[0m \e[1;33m[s] --> Detener/Continuar reproduciendo\e[0m \e[1;31m--------------\e[0m"
                echo -e "\t\e[1;31m------------\e[0m \e[1;33m[d] --> Canción anterior\e[0m \e[1;31m-----------------------------\e[0m"
                echo -e "\t\e[1;31m------------\e[0m \e[1;33m[f] --> Canción siguiente\e[0m \e[1;31m----------------------------\e[0m"
                echo -e "\t\e[1;31m------------\e[0m \e[1;33m[b] --> Regresar la canción al principio\e[0m \e[1;31m-------------\e[0m"
                echo -e "\t\e[1;31m------------\e[0m \e[1;33m[+] --> Subir volumen\e[0m \e[1;31m--------------------------------\e[0m"
                echo -e "\t\e[1;31m------------\e[0m \e[1;33m[-] --> Bajar volumen\e[0m \e[1;31m--------------------------------\e[0m"
                echo -e "\t\e[1;31m------------\e[0m \e[1;33m[q] --> Salir del reproductor\e[0m \e[1;31m------------------------\e[0m"
                echo -e "\t\e[1;36mEstas opciones son solo validas si se eligen las opciones 1,2 o 3 del menu principal\e[0m"

		#Solicita la eleccion de una opcion del menu que se le va a mostar
		echo -e "\n\e[0;32mElige una opcion del menu principal: \e[0m"
		read opcion
		#Control de las acciones para cada opcion del menu
		case $opcion in
			1)
				#Le permite al usuario elegir la cancion que va a escuchar
				echo -e "\e[1;35m¿Qué canción quieres escuchar?: \e[0m"
				read cancion
				echo -e  "\e[0;32mAhora puedes elegir una opcion del menu del reproductor\e[0m"
				#Comando que se encarga de reproducir la canción que se le indica en formato mp3
				mpg123 -C /$ruta/"$cancion.mp3"
			;;

			2)
				#Reproduce todas las canciones dentro de la carpeta de musica que el  usuario indico
				echo -e "\e[1;35mVamos a armar un pachangon con tu playlist\e[0m"
				echo -e  "\e[0;32mAhora puedes elegir una opcion del menu del reproductor\e[0m"
				#Comando para reproducir todas las canciones
				mpg123 -C /$ruta/*
                        ;;


			3)
				#Reproduce todas las canciones dentro de la carpeta de musica que el usuario le indico
				echo -e "\e[1;35mVamos a armar un pachangon aleatorio con tu playlist\e[0m"
				echo -e  "\e[0;32mAhora puedes elegir una opcion del menu del reproductor\e[0m"
				#Comando para reproducir en modo aleatorio
				mpg123 -C -z /$ruta/*
                        ;;

			4)
				echo "\e[1;35mLas canciones son:\e[0m "
				ls
			;;


			5)
				control=1
			;;

			*)
				#Indica que hubo error si el usuario bobo no eligió algo del menu
				echo -e  "\e[1;35mOpción no válida, intentalo de nuevo plis\e[0m"
			;;


		esac
	done

