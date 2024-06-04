#!/bin/bash

# 1. Déplacer linuxman vers tux dans mascottes
mkdir -p personnages/mascottes
mv personnages/super\ heros/hommes/sans\ cape/linuxman personnages/mascottes/tux

# 2. Renommer super heros en comics
mv personnages/super\ heros personnages/comics

# 3. Écrire dans batman
echo "Bruce Wayne se cache derrière ce personnage" > personnages/comics/hommes/cape/batman

# 4. Ajouter à batman
echo "Il vit à Gotham" >> personnages/comics/hommes/cape/batman

# 5. Écrire dans daredevil
echo "Homer Simpson se cache derrière ce personnage" > personnages/comics/hommes/sans\ cape/daredevil

# 6. Remplacer le contenu
echo "DareDevil est un personnage aveugle" > personnages/comics/hommes/sans\ cape/daredevil

# 7. Copier batman et daredevil dans mixdarbat
cat personnages/comics/hommes/cape/batman personnages/comics/hommes/sans\ cape/daredevil > personnages/mascottes/mixdarbat

# 8. Créer l'utilisateur fanboy
sudo useradd -m fanboy || true

# 9. Copier personnages dans /home/fanboy
sudo cp -r personnages /home/fanboy

# 10. Changer propriétaire et groupe de personnages
sudo chown -R fanboy:fanboy /home/fanboy/personnages

# 11. Créer un lien symbolique persofanboy
sudo ln -sf /home/fanboy/personnages /home/fanboy/persofanboy

# 12. Créer un lien symbolique mon_nom
mon_nom=$(whoami)
cp -r personnages /home/$mon_nom/
sudo ln -sf /home/$mon_nom/personnages /home/$mon_nom/perso_$mon_nom

# 13. Sauvegarder l'arborescence dans 14.txt
sudo apt install -y tree
sudo tree /home/fanboy/personnages > 14.txt

# 14. Retirer "directories" de 14.txt et sauvegarder dans 15.txt
grep -v "directories" 14.txt > 15.txt

# 15. Sauvegarder les 250 dernières lignes de l'historique sans "cd" dans myhistory
history_file_path=$HISTFILE
if [[ -f $history_file_path ]]; then
    grep -v "cd" $history_file_path | tail -n 250 > myhistory
else
    echo "Erreur: fichier .bash_history introuvable"
fi
