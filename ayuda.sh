#/bin/bash!

helmiplis="¿Sobre que comando desea ayuda? "
echo "Para salir escriba 'salir'"
echo "		Lista de comandos"
echo "arbol"
echo "ayuda"
echo "buscar"
echo "creditos"
echo "infosis"
echo "ahorcado"
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
	salir)
	ciclin=1
	;;
	*)
	echo "Comando incorrecto, prueba otra vez"
esac
done
