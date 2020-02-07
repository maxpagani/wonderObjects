#!/usr/bin/env bash
#
# @author Massimiliano Pagani
# @version 1.0
# @date 2020-02-07
#

articleFor()
{
  thing="$1"
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

excuses=(
  '$subject era controintuitivo'
  '$subject era fuori fase'
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
  'non sono riuscito a trovare $subject'
  'qualcuno ha spostato $subject'
)

function randomIndex()
{
  count=${#excuses[@]}
  echo $(( $RANDOM % $count ))
}

determinedObject()
{
  object=$(wonderObject.sh)
  article=$(articleFor "$object")
  echo "$article$object"
}

subject="$(determinedObject)"
index=$(randomIndex)
excuse=${excuses[$index]}
eval echo $excuse
