#!/bin/bash

#NEPTUNKOD: U9E5CU

#Forras: https://www.freetogame.com/api-doc

echo "Udvozollek az ingyenes jatek keresoben."
genre=""
platform=""
json=""

type_menu(){
    local choice
    while [ "$choice" != "1" ] && [ "$choice" != "2" ] && [ "$choice" != "3" ] && [ "$choice" != "4" ]
    do
        echo "
        Valassz Jatek tipust:
        (1). Lovoldozos
        (2). Strategia
        (3). Verekedos
        (4). Sport
        "
        read -p "Melyik legyen?: " choice

    done
    case $choice in
        1) genre="Shooter";;
        2) genre="Strategy";;
        3) genre="Fighting";;
        4) genre="Sports";;
    esac
}

platform_menu(){
    local choice
    while [ "$choice" != "1" ] && [ "$choice" != "2" ]
    do
        echo "
        Valassz listazasi sorrendet:
        (1). Bongeszo
        (2). PC
        "
        read -p "Melyik legyen?: " choice

    done
    case $choice in
        1) platform="browser";;
        2) platform="pc";;
    esac
}

api_command(){
    json=$(curl "https://www.freetogame.com/api/games?platform=$platform&category=$genre" -H "Accept: application/json")
}

write_titles(){
  echo $json | tr , '\n' | grep title | cut -f2 -d ':'
}

type_menu
platform_menu
api_command
write_titles
