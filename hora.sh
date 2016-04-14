#!/bin/bash

clear
mod=60
i=0
while read line;do
lec[$i]="$line"
let $[i+=1]
done< /home/datos.txt
hap=${lec[0]}
hmsap=${lec[1]}
hora=$(date +%k)
min=$(date +%M)
min=$[min+0]
seg=$(date +%S)
seg=$[seg+0]
echo $hora $min $seg >> co.txt
hms=$[($hora*($mod*$mod))+($min*$mod)+($seg)]
hmsres=$[$hmsap-$hms]
hres=$[$hmsres/($mod*$mod)]
mres=$[($hmsres-($hres*($mod*$mod)))/$mod]
sres=$[$hmsres-($hres*($mod*$mod))-($mres*$mod)]
echo "El tiempo que le queda: $hres:$mres:$sres" | wall
if [ $hres = 0 ];then
/sbin/shutdown $hap
echo "EL PC SE APAGARA EN $mres MIN" | wall
fi
