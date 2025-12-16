#!/bin/bash
########################
# pegase.bash
# Auteur Bruschi Nicolas
# date création 2021/04/30
#
# Calcule l'heure de départ minimale theorique pour effectuer 7h24
# d'apres renseignement de 1 ou 3 badgeages de type 
# xhmm exemple 9h24 ou 09h24 ou 13H56 (le h central accepte la casse min/maj)
#
# [ EN ENTREE ]
#   1 ou 3 arguments de type chaine = xxhmm ou xHmm 
#     exemple 9h24 ou 09H24 ou 13H56 (le h central accepte la casse min/maj)
#   Si un seul arg on appliquera automatiquement une pause midi obligatoire
#      de 45 minutes
#   Si 3 arg la duree entre arg 2 et arg 3 est la duree de la pause meridienne
#      ne pouvant etre inf a 45 minutes.
# [ EN SORTIE ]
#   0   OK => Affichage de l'heure du depart calcule ex: DEPART : 17H19 
#   1   KO Arguments appel incorrects ou en nombre incorrect. 
#          => Affichage raison pb.
#
# Historique :
#   BN 2021/04/30 V1.0 Initialisation du script
#   BN 2023/02/21 V1.1 ShellCheck
#
# Todo :
#   gerer arg passes de la forme= 09:02 - 11l45 - 12h38
########################

# VARIABLES GLOBALES :
######################

  DUREE_JOUR=444
  DUREE_PAUSE_DEFAUT=45

## Fonctions :
##############

function Fct_Gestion_Parametre() {
  # Fonction Fct_Gestion_Parametre
  # 
  # Gestion des parametres d'appel
  #
  # [ EN ENTREE ]
  #   $@ = Tous les parametres d'appel du script
  # [ EN SORTIE ]
  #   0   OK => Affichage : DEPART : 17H19
  #   1   KO arguments appel incorrects ou en nombre incorrect. 
  #          => Affichage raison Pb

  # Variables locales:
  ####################  

  compteur=0
  soir=0
  pause=0
  mise_en_forme=""
  depart=""
  declare -a minutes=() # tableau 

  if test $# -gt 0 ; then # nombre d'argument passes a la fonction >0
    # Boucle sur les arguments d'appel en prenant le premier puis en switchant 
    # avec le suivant jusqu'au dernier non null.
    while test -n "$1"; do
      if test "$1" != "-"; then  # cas arg separes par un espace tiret espace
	      mise_en_forme="$(echo "${1}"|tr '[:lower:]' '[:upper:]')"
        #echo "mise_en_forme=$mise_en_forme"
	      minutes["${compteur}"]="$(Fct_Conversion_Heure_Minute \
                                  "${mise_en_forme}")"
	      #echo "mise en forme ${minutes["${compteur}"]} Min"
	      ((compteur++))
      fi
      shift
    done

    case ${compteur} in
      3) #echo "debug minutes[2] = ${minutes[2]} . minutes[1] = ${minutes[1]}"
         pause="$((minutes[2] - minutes[1]))"
	       if test "${pause}" -lt "${DUREE_PAUSE_DEFAUT}"; then
           pause="${DUREE_PAUSE_DEFAUT}"
	       fi
         #echo "debug pause = ${pause}."
	       soir="$((minutes[0] + pause + DUREE_JOUR))"
	       depart="$(Fct_Conversion_Minute_Heure "${soir}")"
	       echo "depart : ${depart}"
	       ;;
      1) soir="$((minutes[0] + DUREE_PAUSE_DEFAUT + DUREE_JOUR))"
	       depart="$(Fct_Conversion_Minute_Heure "${soir}")"
	       echo "depart : ${depart}"
         ;;
      *) # imprevu
	       echo "Nb arg imprevu"
	       exit 1
	       ;;
    esac
  else
    echo "Pas d'argument"
    exit 1
  fi
  unset minutes
}

function Fct_Conversion_Minute_Heure() {
  # Fonction Fct_Conversion_Minute_Heure
  #
  # Conversion des chaines minutes en xHmm
  #
  # [ EN ENTREE ]
  #    minutes : entier
  # [ EN SORTIE ]
  #    Affiche chaine formatee sur 2

  # Variables locales
  ch_conv_retour=""
  lesheures=0
  lesminutes=0
  param_minute="${1}"
  #echo "param_minute = ${param_minute}"

  if test -n "$1"; then
    lesheures="$((param_minute / 60))"
    lesminutes="$((param_minute % 60))"
    lesminutes="$(printf "%02d" "${lesminutes}")"
    ch_conv_retour="${lesheures}H${lesminutes}"
  else
    echo "Fct_Conversion_Minute_Heure arg null imprevu"
    exit 1
  fi
  echo "${ch_conv_retour}"
}

function Fct_Conversion_Heure_Minute() {
  # Fonction Fct_Conversion_Heure_Minute
  #
  # Conversion chaine heures et minutes passe en appel (de type hhHmm)
  # en un entier = minutes
  #
  # [ EN ENTREE ]
  #   hhHmm : chaine exemple 09h15
  # [ En SORTIE ]
  #   minutes : entier exemple 9*60 + 15 = 555

  # Variables locales
  int_conv_retour=0
  lesheures=0
  lesminutes=0

  if test -n "$1"; then
    #filtre=$1
    # todo prise en compte tout type separateur
    filtre="$(echo "${1}"| tr '[:alpha:]': H )"
    lesheures=$(echo "${filtre}" | awk -F"H" '{print $1}' )
    ## subsitution des premiers caractères '0'
    #lesheures=$(echo "${lesheures}" | sed -r 's/0*([0-9]*)/\1/')
    lesheures=$(echo "${lesheures}" | awk '$0*=1')

    lesminutes="$(echo "${filtre}" |awk -F"H" '{print $2}')"
    int_conv_retour=$(((60 * lesheures) + lesminutes))
    #int_conv_retour=`expr \( 60 \* ${lesheures} \) + ${lesminutes}`
  fi
  echo "${int_conv_retour}"
}

### Principal
Fct_Gestion_Parametre "$@"
exit 0
