#!/usr/bin/env bash
#
# @author Massimiliano Pagani
# @version 1.0
# @date 2020-02-07
#

set -u

italianArticleFor()
{
  local thing="$1"

  case ${thing:0:2} in
    ps|pn|gn|[zy]?|s[bcdfghjklmnpqrstvwxyz])
      echo "lo "
      ;;
    [aeiou]?)
      echo "l'"
      ;;
    *)
      echo "il "
      ;;
  esac
}

articleFor()
{
  local lang="$1"
  local thing="$2"
  case "$lang" in
    it)
      italianArticleFor "$thing"
      ;;
    en)
      echo -n "the "
      ;;
  esac
}

excuses_it=(
  '$subject era controintuitivo'
  '$subject era fuori fase'
  '$subject era in congiuntura'
  '$subject era in crash'
  '$subject era in manutenzione'
  '$subject era in ricarica'
  '$subject era in sovraccarico'
  '$subject era in uno stato quantico esotico'
  '$subject era in uno stato quantico non compatibile'
  '$subject era occupato'
  '$subject era scarico'
  '$subject era sparito'
  '$subject era troppo complicato'
  '$subject era troppo distante'
  '$subject non aveva $(determinedObject)'
  '$subject non era disponibile'
  '$subject non era in posizione ergonomica'
  '$subject non era operativo'
  '$subject non era orientato correttamente'
  '$subject non funzionava'
  '$subject rischiava di esplodere'
  'non potevo aspettare che $subject si riposizionasse' 
  'non potevo aspettare che $subject si rifasasse' 
  'non potevo aspettare che $subject si ripristinasse' 
  'non sono riuscito a trovare $subject'
  'qualcuno ha spostato $subject'
)

excuses_en=(
  '$subject was counter intuitive'
  '$subject was not in phase'
  '$subject was on conjucture'
  '$subject was crashed'
  '$subject was on maintenance'
  '$subject was charging'
  '$subject was overloaded'
  '$subject was in an exotic quantum state'
  '$subject was in an uncompatible quantum state'
  '$subject was not available'
  '$subject was flat'
  '$subject couldnt be found'
  '$subject was too difficult'
  '$subject was out of reach'
  '$subject had no $(determinedObject)'
  '$subject was in use'
  '$subject was not in an ergonomic position'
  '$subject was not operational'
  '$subject was not properly oriented'
  '$subject was not working'
  '$subject was about to explode'
  'I had to wait that $subject moved to the right position' 
  'I had to wait that $subject returned in phase' 
  'I had to wait that $subject would reset' 
  'I could not find $subject'
  'Someone moved $subject'
)

function randomIndex()
{
  local arrayName="${2}_${1}"
  eval "local count=\${#$arrayName[@]}"
  echo $(( $RANDOM % $count ))
}

determinedObject()
{
  local lang="$1"
  local object=$(wonderObject.sh)
  local article=$(articleFor "$lang" "$object")
  echo "$article$object"
}

lang=${LANG?-en_US.UTF-8}
lang=${lang%_*}
if [ "${lang%.*}" = "C" ]
then
  lang="en"
fi

subject="$(determinedObject "$lang")"
index=$(randomIndex $lang excuses)
eval "excuse=\"\${excuses_$lang[$index]}\""
eval echo $excuse
