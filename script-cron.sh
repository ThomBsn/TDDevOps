#!/usr/bin/env bash

# Mise à jour
sudo apt-get update

# Installer cron
sudo apt-get install cron

# Démarrer le service cron
sudo service cron start

# Vérifier le statut du service cron
sudo service cron status

# Définir le chemin du script
SCRIPT_PATH="$(pwd)/personnages.sh"

# Définir le format de la date
DATE_FORMAT="\$(date +\%Y-\%m-\%d-\%H-\%M)"

# Définir l'entrée de crontab
CRON_ENTRY="*/5 * * * * /bin/bash $SCRIPT_PATH $HOME/personnages-$DATE_FORMAT"

# Ajouter l'entrée à la crontab
(crontab -l; echo "$CRON_ENTRY" ) | crontab -
