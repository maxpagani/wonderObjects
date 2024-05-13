#!/usr/bin/env bash
# @author Massimiliano Pagani <maxpag@gmail.com>

set -u

lang=${LANG?-en_US.UTF-8}
lang=${lang%_*}

case "$lang" in
  it|en)
    ;;
  C.UTF-8)
    lang=en
    ;;
  *)
    echo "Unsupported language ($LANG)"
    exit 1
    ;;
esac

prefixes_it=(
  "areo"
  "bi"
  "co"
  "eco"
  "emi"
  "endo"
  "epi"
  "eso"
  "eta"
  "iper"
  "ipo"
  "iso"
  "kilo"
  "mega"
  "micro"
  "mono"
  "nano"
  "omo"
  "pico"
  "stato"
  "tera"
  "tri"
  "turbo"
)

prefixes_en=(
  "areo"
  "bi"
  "co"
  "eco"
  "emi"
  "endo"
  "epi"
  "exo"
  "eta"
  "hyper"
  "hypo"
  "iso"
  "kilo"
  "mega"
  "micro"
  "mono"
  "nano"
  "homo"
  "pico"
  "stato"
  "tera"
  "tri"
  "turbo"
)

names_it=(
  "ammortizzatore"
  "abbattitore"
  "analizzatore"
  "attrattore"
  "catalizzatore"
  "catamorfimetro"
  "dematerializzatore"
  "fasimetro"
  "flareometro"
  "flussometro"
  "flussore"
  "flusso canalizzatore"
  "funtometro"
  "funtore"
  "gaussimetro"
  "generatore"
  "giratore"
  "globulizzatore"
  "gradiente"
  "induttore"
  "iniettore"
  "materializzatore"
  "misuratore"
  "monoide"
  "parzializzatore"
  "polimerizzatore"
  "radimetro"
  "radiometro"
  "reattore"
  "repulsore"
  "rettificatore"
  "rifasatore"
  "rotore"
  "sequenziatore"
  "sfasatore"
  "sminuzzatore"
  "smussimetro"
)

names_en=(
  "dumper"
  "blast chiller"
  "analyzer"
  "attractor"
  "catalyst"
  "catamorphimeter"
  "dematerializer"
  "phase meter"
  "flare meter"
  "flux meter"
  "fluxer"
  "flux capacitor"
  "functometer"
  "functor"
  "gauss meter"
  "generator"
  "gyrator"
  "globulizer"
  "gradient"
  "inductor"
  "injector"
  "materializer"
  "meter"
  "monoid"
  "divider"
  "polymerizer"
  "radimeter"
  "radiometer"
  "reactor"
  "repulsor"
  "rectifier"
  "phase plug"
  "rotor"
  "sequencer"
  "phase shifter"
  "shredder"
  "bevel gauge"
)

objects_it=(
  "atomico"
  "di antimateria"
  "di atomi"
  "di campo"
  "di dilitio"
  "di ioni"
  "di materia esotica"
  "di materia oscura"
  "di molecole"
  "di onde gravitazionali"
  "di tachioni"
  "per siluro"
)

objects_en=(
  "atom"
  "antimatter"
  "field"
  "dilithium"
  "ion"
  "exotic matter"
  "dark matter"
  "molecule"
  "gravitational wave"
  "tachyon"
  "torpedo"
)

qualifiers_it=(
  "a inversione di fase"
  "abeliano"
  "adiabatico"
  "a induzione"
  "alcaloide"
  "al dilitio"
  "amorfo"
  "analitico"
  "analogico"
  "anamorfico"
  "a onde moventi"
  "a sfasamento"
  "asimmetrico"
  "assiale"
  "atomico"
  "a transizioni quantiche"
  "cardinale"
  "catamorfico"
  "coassiale"
  "di Cauchy"
  "di Cochrane"
  "di Einstein-Rosen"
  "di Eulero"
  "differenziale"
  "digitale"
  "di Pascal"
  "di Tesla"
  "di Turing"
  "di Watt"
  "endotermico"
  "entropico"
  "enzimatico"
  "esotermico"
  "fasico"
  "fotonico"
  "genico"
  "gravitazionale"
  "igroscopico"
  "inerte"
  "inerziale"
  "integrale"
  "ionico"
  "iperbolico"
  "isotropico"
  "isocrono"
  "laser"
  "logaritmico"
  "logistico"
  "magnetico"
  "molecolare"
  "monadico"
  "nanotecnologico"
  "nucleare"
  "omeotropico"
  "omomorfico"
  "parabolico"
  "polimerico"
  "quantico"
  "radiante"
  "ricorsivo"
  "simmetrico"
  "solare"
  "tachionico"
  "telescopico"
  "trifasico"
  "trigonometrico"
  "universale"
)

qualifiers_en=(
  "abelian"
  "adiabatic"
  "alkaloid"
  "amorphous"
  "analog"
  "analytical"
  "anamorphic"
  "asymmetrical"
  "atomic"
  "axial"
  "cardinal"
  "catamorphic"
  "Cauchy's"
  "coaxial"
  "Cochrane's"
  "differential"
  "digital"
  "dilithium based"
  "Einstein-Rosen"
  "endothermic"
  "entropic"
  "enzymatic"
  "Euler's"
  "exothermic"
  "genic"
  "gravitational"
  "homeotropic"
  "homomorphic"
  "hygroscopic"
  "hyperbolic"
  "induction"
  "inert"
  "inertial"
  "ionic"
  "isochronous"
  "isotropic"
  "laser"
  "logarithmic"
  "logistical"
  "magnetic"
  "molecular"
  "monadic"
  "nanotechnological"
  "nuclear"
  "parabolic"
  "Pascal's"
  "phase displacement"
  "phase inversion"
  "phasic"
  "photonic"
  "polymeric"
  "quantum"
  "quantum transition"
  "radiant"
  "recursive"
  "solar"
  "symmetrical"
  "tachyonic"
  "telescopic"
  "Tesla's"
  "trigonometric"
  "triphasic"
  "Turing's"
  "universal"
  "Watt's"
  "wave motion"
  "whole wheat"
)

drawRandom()
{
  local upper=$1
  local random=$RANDOM
  echo -n $(( $random % $upper ))
}

echoRandomEntry()
{
  local lang="$1"
  local arrayName="$2_$lang"
  eval "local count=\${#$arrayName[@]}"
  local index=$(drawRandom $count)
  eval "echo -n \"\${$arrayName[$index]}\""
}

echoRandomPrefix()
{
  local lang=$1
  echoRandomEntry $lang prefixes
}

drawPrefixes()
{
  local lang="$1"
  local wantOnePrefix="$(drawRandom 2)"

  if [ $wantOnePrefix = 0 ]
  then
    echoRandomPrefix "$lang"
    local wantTwoPrefixex="$(drawRandom 10)"
    if [ $wantTwoPrefixex = 0 ]
    then
      echoRandomPrefix "$lang"
    fi
  fi
}

print3()
{
  local lang="$1"
  local prefixes="$2"
  local name="$3"
  local object="$4"
  local qualifier="$5"
  case "$lang" in
    it)
      echo "$prefixes$name" "$object" "$qualifier"
      ;;
    en)
      echo "$qualifier" "$object" "$prefixes$name"
      ;;
  esac
}

print2()
{
  local lang="$1"

  local prefixes="$2"
  local name="$3"
  local qualifier="$4"
  case "$lang" in
    it)
      echo "$prefixes$name" "$qualifier"
      ;;
    en)
      echo "$qualifier" "$prefixes$name"
      ;;
  esac
}


theName=$(echoRandomEntry "$lang" names )
theObject=$(echoRandomEntry "$lang" objects )
theQualifier=$(echoRandomEntry "$lang" qualifiers )


prefixes="$(drawPrefixes "$lang")"

wantObject=$(drawRandom 3)
if [ $wantObject = 0 ]
then
  print3 "$lang" "$prefixes" "$theName" "$theObject" "$theQualifier"
else
  print2 "$lang" "$prefixes" "$theName" "$theQualifier"
fi
