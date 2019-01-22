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

names="
analizzatore
flareometro
flussometro
funtore
gaussimetro
generatore
globulizzatore
gradiente
induttore
iniettore
misuratore
monoide
parzializzatore
polimerizzatore
radimetro
radiometro
reattore
rettificatore
rifasatore
rotore
sfasatore
smussimetro
"

objects="
di_antimateria
di_atomi
di_campo
di_dilitio
di_ioni
di_molecole
di_onde_gravitazionali
di_tachioni
per_siluro
"

qualifiers="
a_inversione_di_fase
abeliano
adiabatico
a_induzione
alcaloide
al_dilitio
amorfo
a_sfasamento
assiale
a_transizioni_quantiche
cardinale
coassiale
differenziale
endotermico
entropico
enzimatico
esotermico
fasico
fotonico
igroscopico
integrale
ionico
isotropico
laser
logistico
magnetico
monadico
nanotecnologico
nucleare
omeotropico
polimerico
quantico
radiante
solare
tachionico
telescopico
trifasico
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

if (( $RANDOM > $MAX_RANDOM/2 ))
then
  thePrefix=$(randomSelect "$prefixes")
  echo -n "$thePrefix-"
  if (( $RANDOM > $MAX_RANDOM/2 ))
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
