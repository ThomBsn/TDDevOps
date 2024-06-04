#!/bin/bash

root_doss="${1:-.}"

# Création des dossiers
dossiers=(
    "${root_doss}/personnages/mascottes"
    "${root_doss}/personnages/super heros/femmes/cape"
    "${root_doss}/personnages/super heros/femmes/sans cape"
    "${root_doss}/personnages/super heros/hommes/cape"
    "${root_doss}/personnages/super heros/hommes/sans cape"
    "${root_doss}/personnages/super heros/femmes/cape/batgirl"
    "${root_doss}/personnages/super heros/femmes/cape/wonderwoman"
    "${root_doss}/personnages/super heros/femmes/sans cape/electra"
    "${root_doss}/personnages/super heros/femmes/sans cape/superwoman"
)

for dir in "${dossiers[@]}"; do
    mkdir -m 775 -p "$dir"
done

# Création des fichiers
fichiers=(
    "${root_doss}/personnages/mascottes/beastie"
    "${root_doss}/personnages/mascottes/bibendum"
    "${root_doss}/personnages/mascottes/mario"
    "${root_doss}/personnages/mascottes/sonic"
    "${root_doss}/personnages/super heros/hommes/cape/batman"
    "${root_doss}/personnages/super heros/hommes/cape/superman"
    "${root_doss}/personnages/super heros/hommes/cape/thor"
    "${root_doss}/personnages/super heros/hommes/sans cape/antman"
    "${root_doss}/personnages/super heros/hommes/sans cape/daredevil"
    "${root_doss}/personnages/super heros/hommes/sans cape/linuxman"
    "${root_doss}/personnages/super heros/hommes/sans cape/spiderman"
)

for fichier in "${fichiers[@]}"; do
    if [[ -n "$fichier" ]]; then
        echo "Création du fichier: $fichier"
        touch "$fichier"
        chmod 664 "$fichier"
    else
        echo "Erreur: le nom de fichier est vide"
    fi
done

# Afficher les permissions de l'arborescence
ls -lR --color=auto "${root_doss}/personnages"
