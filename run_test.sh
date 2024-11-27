#!/bin/bash

git checkout dev
echo "-----------------------------$(date '+%d/%m/%y %H:%M')----------------------------"
echo "-----------------------------Début des Tests---------------------------"
echo "Execution des tests, Vérification de la version de python"
python3 --version
echo "Le 1er test est réussi."

if [ $? -ne 0 ]; then
	echo "Erreur : Python n'est pas installé, le test a échoué."
	exit 1
fi

echo "Execution d'un second test..."
python3 -c "print('Affichage via print !')"

echo "Le 2e test est réussi."
echo "------------------------------Fin des Tests-----------------------------"
echo "SUCCESS"

#git status

#if [ -n "$(git status --porcelain)" ]; then
#	echo "Des modifications ont été détectées."
#	git add .
#	git commit -m "Modification ajouté le $(date '+%d/%m/%y %H:%M')"
#else
#	echo "Aucune Modification."
#fi

#git checkout staging
#git merge dev

#echo "Etat du dépôt après merge :"
#git status

#git push origin staging
 

#if [ $? -eq 0 ]; then
#	echo "Push réussi vers la branche staging."
#else
#	echo "Erreur : le push a échoué."
#	exit 1
#fi
