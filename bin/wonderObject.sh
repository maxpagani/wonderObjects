#!/bin/bash
# @author Massimiliano Pagani <maxpag@gmail.com>

MAX_RANDOM=32767

prefixes="
areo
bi
co
eco
emi
endo
epi
eso
eta
iper
ipo
iso
kilo
mega
micro
mono
nano
omo
pico
stato
tera
tri
turbo
"

names="\
ammortizzatore
abbattitore
analizzatore
attrattore
catalizzatore
catamorfimetro
dematerializzatore
fasimetro
flareometro
flussometro
flussore
flusso_canalizzatore
funtometro
funtore
gaussimetro
generatore
giratore
globulizzatore
gradiente
induttore
iniettore
materializzatore
misuratore
monoide
parzializzatore
polimerizzatore
radimetro
radiometro
reattore
repulsore
rettificatore
rifasatore
rotore
sequenziatore
sfasatore
sminuzzatore
smussimetro
"

objects="\
atomico
di_antimateria
di_atomi
di_campo
di_dilitio
di_ioni
di_materia_esotica
di_materia_oscura
di_molecole
di_onde_gravitazionali
di_tachioni
per_siluro
"

qualifiers="\
a_inversione_di_fase
abeliano
adiabatico
a_induzione
alcaloide
al_dilitio
amorfo
analitico
analogico
anamorfico
a_onde_moventi
a_sfasamento
asimmetrico
assiale
atomico
a_transizioni_quantiche
cardinale
catamorfico
coassiale
di_Cauchy
di_Cochrane
di_Einstein-Rosen
di_Eulero
differenziale
digitale
di_Pascal
di_Tesla
di_Turing
di_Watt
endotermico
entropico
enzimatico
esotermico
fasico
fotonico
genico
gravitazionale
igroscopico
inerte
inerziale
integrale
ionico
iperbolico
isotropico
isocrono
laser
logaritmico
logistico
magnetico
molecolare
monadico
nanotecnologico
nucleare
omeotropico
omomorfico
parabolico
polimerico
quantico
radiante
ricorsivo
simmetrico
solare
tachionico
telescopico
trifasico
trigonometrico
universale
"

function randomSelect()
{
  count=$(echo "$1" | wc -w )
  index=$(( 1+($RANDOM % $count) ))
  echo $index | \
    select name in $1; do echo ${name//_/ } ; break; done 2>/dev/null
}

theName=$(randomSelect "$names" )
theObject=$(randomSelect "$objects" )
theQualifier=$(randomSelect "$qualifiers" )

random=$RANDOM
if (( $random > $MAX_RANDOM/2 ))
then
  thePrefix=$(randomSelect "$prefixes")
  echo -n "$thePrefix-"
  if (( $random < $MAX_RANDOM/10 ))
  then
    otherPrefix=$(randomSelect "$prefixes")
    if [ "$thePrefix" != "$otherPrefix" ]
    then
      echo -n "$otherPrefix-"
    fi
  fi
fi

if (( $RANDOM > $MAX_RANDOM/3 ))
then
  echo "$theName $theObject $theQualifier"
else
  echo "$theName $theQualifier"
fi
