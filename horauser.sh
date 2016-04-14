#!/bin/bash
rm datos.txt
banh=0
banm=0
mod=60
while [ $banh = 0 ];do
echo "Introduzca la hora de apagado automatico(0-23):"
read horauser
if [ $horauser -le 23 ] && [ $horauser -ge 0 ];then
banh=1
fi
done
while [ $banm = 0 ];do
echo "Introduzca el minuto de apagado(0-60):"
read minuser
if [ $minuser -le 60 ] && [ $minuser -ge 0 ];then
banm=1
fi
done
hora="$horauser:$minuser"
hms=$[($horauser*($mod*$mod))+($minuser*$mod)]
echo $hora >> /home/datos.txt
echo $hms >> /home/datos.txt
