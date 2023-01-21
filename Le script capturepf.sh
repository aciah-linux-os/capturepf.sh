#!/bin/sh
# dépendances : requiert zenity, curl et scrot
# fonction : capture d'écran améliorée
# autyeur : thuban@yeuxdelibad.net
# attention : penser à bien contrôler les adresses aux lignes 17 et 20 ci-dessous pour tenir compte d el'adresse exacte de PhotoFiltre7.exe et de gimp

IMAGE=~/capt-$(date +%d-%H-%M).png  #on envoie la capture à la racine

R=$(zenity --list --height=225 --text "Capture d'écran"\
    --radiolist --column "" --column "Capturer..." --print-column=2 \
    TRUE "1: ouvrir photofiltre" \
    FALSE "2: ouvrir gimp" \
    | cut -d':' -f1)
    
case $R in 
    1 ) #on envoie l'image vers photofiltre
        scrot $IMAGE -d 1 -s -e 'wine /usr/local/bin/photofiltre/PhotoFiltre7/PhotoFiltre7.exe $f'
        ;;
    2 ) #on envoie l'image vers gimp
        scrot $IMAGE -d 1 -s -e 'gimp $f'
        ;;
   
esac

exit 0
