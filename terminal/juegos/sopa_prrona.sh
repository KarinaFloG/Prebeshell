#Juego prron papu

#Inicializar las variables
clear
juego=0
int=0
cont=0
pal1=""
pal2=""
pal3=""
pal4=""
pal5=""

#Imprimir las pistas
echo -e "\e[1;33mEncuentra las 5 palabras\e[0m"
echo -e "\n\e[1;32mPistas:\e[0m"
echo -e "\n\e[0;34m1. Forma del becario para llamar a los nuevos :'v.\e[0m"
echo -e "\n\e[0;36m2. Lo que te vuelves cuando alcanzas la iluminación, te vuelves dios y pasas los cursos.\e[0m"
echo -e "\n\e[0;35m3. Nombre de la interfaz que conecta al sistema con el usuario a través de comandos.\e[0m"
echo -e "\n\e[0;33m4. Nombre del curso y kernel de los sistemas operativos GNU/*****.\e[0m"
echo -e "\n\e[1;32m5. Nuestra calificación ;).\e[0m"

#Imprimir el juego
echo -e "\n\e[1;33m s a t u o m b m s k n a k m i b k n g a\e[0m\n"
echo -e "\e[1;33m h a j f n p r e b e j m e n y o l i n u\e[0m\n"
echo -e "\e[1;33m g h x f s v t e w b y h j r f i d s f u\e[0m\n"
echo -e "\e[1;33m l r f i d h h y f d r w f b n r u b m o\e[0m\n"
echo -e "\e[1;33m ñ j n j m l e l a i t b b u s a n l g b\e[0m\n"
echo -e "\e[1;33m i u s e d t z l i y n a x v e c t o u u\e[0m\n"
echo -e "\e[1;33m l r f h d v h y l d r w f b h e u b m l\e[0m\n"
echo -e "\e[1;33m e o t r l u p o r e a j t r w b k b k j\e[0m\n"
echo -e "\e[1;33m i u b d d i e z l m g o i e a w n i i u\e[0m"

#Ciclo para controlar  la entrada y salida del juego
while [ $juego -eq 0 ]; do

	#Imprimir las palabras resueltas
	echo -e "\n\e[0;34mIntentos: $((5-$int))\e[0m"
	echo -e "\e[1;35mPalabra 1: $pal1\e[0m"
	echo -e "\e[1;35mPalabra 2: $pal2\e[0m"
	echo -e "\e[1;35mPalabra 3: $pal3\e[0m"
	echo -e "\e[1;35mPalabra 4: $pal4\e[0m"
	echo -e "\e[1;35mPalabra 5: $pal5\e[0m\n"
	#Leer las palabras para registrar los avances
	read -p "Introduce la palabra: " palabra
	case $palabra in
		prebe)
		pal1=prebe
		cont=$((cont+1))
		;;
		becario)
		pal2=becario
		cont=$((cont+1))
		;;
		shell)
		pal3=shell
		cont=$((cont+1))
		;;
		linux)
		pal4=linux
		cont=$((cont+1))
		;;
		diez)
		pal5=diez
		cont=$((cont+1))
		;;
		*)
		#Comparar el número de errores para acabar el juego
		if [ $int -lt 4 ]; then
			echo -e "Palabra incorrecta, intenta otra vez"
			int=$((int+1))

		elif [ $int -eq 4 ]; then
			echo -e "\n\e[0;31mRespuestas:\e[0m"
			echo -e "\n\e[1;33m s a t u o m b m s k n a k m i b k n g a\e[0m\n"
			echo -e "\e[1;33m h a j f n \e[31m\e[42mp r e b e\e[0m\e[49m \e[1;33mj m e n y\e[0m \e[31m\e[42mo\e[0m\e[49m \e[31m\e[42ml\e[0m\e[49m \e[1;33mi n u\e[0m\n"
			echo -e "\e[1;33m g h x f \e[31m\e[42ms\e[0m\e[49m \e[1;33mv t e w b y h j r f\e[0m \e[31m\e[42mi\e[0m\e[49m \e[1;33md s f u\e[0m\n"
			echo -e "\e[1;33m l r f i d \e[31m\e[42mh\e[0m\e[49m \e[1;33mh y f d r w f b\e[0m \e[31m\e[42mn\e[0m\e[49m \e[31m\e[42mr\e[0m\e[49m \e[1;33mu b m o\e[0m\n"
			echo -e "\e[1;33m ñ j n j m l\e[0m \e[31m\e[42me\e[0m\e[49m \e[1;33ml a i t b b\e[0m \e[31m\e[42mu\e[0m\e[49m \e[1;33ms\e[0m \e[31m\e[42ma\e[0m\e[49m \e[1;33mn l g b\e[0m\n"
			echo -e "\e[1;33m i u s e d t z\e[0m \e[31m\e[42ml\e[0m\e[49m \e[1;33mi y n a\e[0m \e[31m\e[42mx\e[0m\e[49m \e[1;33mv e\e[0m \e[31m\e[42mc\e[0m\e[49m \e[1;33mt o u u\e[0m\n"
			echo -e "\e[1;33m l r f h d v h y\e[0m \e[31m\e[42ml\e[0m\e[49m \e[1;33md r w f b h\e[0m \e[31m\e[42me\e[0m\e[49m \e[1;33mu b m l\e[0m\n"
			echo -e "\e[1;33m e o t r l u p o r e a j t r w e\e[0m \e[31m\e[42mb\e[0m\e[49m \e[1;33mk b k j\e[0m\n"
			echo -e "\e[1;33m i u b d\e[0m \e[31m\e[42md i e z\e[0m\e[49m \e[1;33ml m g o i e a w n i i u\e[0m\n"

			echo -e "\e[1;36mPerdiste, fierro pariente lo siento :(\e[0m"
			echo -e "\e[1;36mPonme 10 no seas malo\n\e[0m"
			juego=1
		fi
		;;
	esac

	#Mensaje de victoria
	if [ $cont -eq 5 ]; then

	echo -e "\n\e[0;34m s a t u o m b m s k n a k m i b k n g a\e[0m\n"
	echo -e "\e[0;34m h a j f n \e[31m\e[42mp r e b e\e[0m\e[49m \e[0;34mj m e n y\e[0m \e[31m\e[42mo\e[0m\e[49m \e[31m\e[42ml\e[0m\e[49m \e[0;34mi n u\e[0m\n"
	echo -e "\e[0;34m g h x f \e[31m\e[42ms\e[0m\e[49m \e[0;34mv t e w b y h j r f\e[0m \e[31m\e[42mi\e[0m\e[49m \e[0;34md s f u\e[0m\n"
	echo -e "\e[0;34m l r f i d \e[31m\e[42mh\e[0m\e[49m \e[0;34mh y f d r w f b\e[0m \e[31m\e[42mn\e[0m\e[49m \e[31m\e[42mr\e[0m\e[49m \e[0;34mu b m o\e[0m\n"
	echo -e "\e[0;34m ñ j n j m l \e[31m\e[42me\e[0m\e[49m \e[0;34ml a i t b b\e[0m \e[31m\e[42mu\e[0m\e[49m \e[0;34ms\e[0m \e[31m\e[42ma\e[0m\e[49m \e[0;34mn l g b\e[0m\n"
	echo -e "\e[0;34m i u s e d t z \e[31m\e[42ml\e[0m\e[49m \e[0;34mi y n a\e[0m \e[31m\e[42mx\e[0m\e[49m \e[0;34mv e\e[0m \e[31m\e[42m c\e[0m\e[49m \e[0;34mt o u u\e[0m\n"
	echo -e "\e[0;34m l r f h d v h y \e[31m\e[42ml\e[0m\e[49m \e[0;34md r w f b h\e[0m \e[31m\e[42me\e[0m\e[49m \e[0;34mu b m l\e[0m\n"
	echo -e "\e[0;34m e o t r l u p o r e a j t r w \e[31m\e[42mb\e[0m\e[49m \e[0;34mk b k j\e[0m\n"
	echo -e "\e[0;34m i u b d\e[0m \e[31m\e[42md i e z\e[0m\e[49m \e[0;34ml m g o i e a w n i i u\e[0m\n"

	echo -e "\e[1;36mGanaste, en verdad eres el papu de papus\e[0m"
	echo -e "\e[1;36mAhora ponme 10 :v\e[0m"
	juego=1

	fi

done

