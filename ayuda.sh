#/bin/bash!

helmi="¿Sobre que comando desea ayuda? "
echo "Para salir escriba 'salir'"
echo "		Lista de comandos"
echo "arbol"
echo "ayuda"
echo "buscar"
echo "creditos"
echo "infosis"
ciclin=0
while [ $ciclin -eq 0 ]; do
echo ""
read -p "$helmi" var
case $var in
	arbol)
	. $PWD/aarbol.sh
	;;
	ayuda)
	. $PWD/aayuda.sh
	;;
	buscar)
	. $PWD/abuscar.sh
	;;
	creditos)
	. $PWD/acreditos.sh
	;;
	infosis)
	. $PWD/ainfosis.sh
	;;
	salir)
	ciclin=1
	;;
	*)
	echo "Comando incorrecto, prueba otra vez"
esac
done
