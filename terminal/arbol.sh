#/bin/bash!
	clear
	echo -e "\t\e[0;32mUsaste el comando arbol\e[0m\n"
	echo -e "\e[1;31mPara salir escribe 'salir'\e[0m\n"
	ciclo2=0
	while [ $ciclo2 -eq 0 ]; do
	read -p "¿Qué directorio deseas ver? " n
	case $n in
		"")
		echo ""
		find
		echo ""
		;;
		terminal)
		echo ""
		find terminal
		echo ""
		;;
		scripts)
		echo ""
		find scripts
		echo ""
		;;
		juegos)
		echo ""
		find terminal/juegos
		echo ""
		;;
		salir)
		ciclo2=1
		;;
		*)
		echo -e "\e[0;31mOpción incorrecta, intente otra vez.\e[0m"
	esac
	done

