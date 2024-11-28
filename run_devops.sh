#!/bin/bash

Image_Name="devops_flask"
Container_Name="DevOps"
Log_File="log_message.txt"

echo "Création de l'image Docker..."
sudo docker stop $Container_Name
sudo docker container rm $Container_Name

sudo docker build -t $Image_Name .
if [ $? -ne 0 ]; then
	echo "Erreur lors de la crétion de l'image."
	exit 1
fi


echo "Execution du container Docker..."
sudo docker run -p 5000:5000 --name $Container_Name $Image_Name
if [ $? -ne 0 ]; then
	echo "Erreur lors du démarrage du container."
	exit 1
fi


echo "Récupération des logs du container..."
sudo docker logs $Container_Name > $Log_File
if [ $? -ne 0 ]; then
	echo "Erreur lors de la récupération des logs du container."
	exit 1
fi

echo "Vérification des logs pour déterminer si les tests ont réussis..."
if grep -q "SUCCESS" $Log_File; then
	echo "Les tests ont réussi !"
	git status

	if [ -n "$(git status --porcelain)" ]; then
 	       echo "Des modifications ont été détectées."
       	       git add .
	       git commit -m "Modification ajouté le $(date '+%d/%m/%y %H:%M')"
	else
	       echo "Aucune Modification."
	fi

	git checkout staging
	git merge dev

	echo "Etat du dépôt après merge :"
	git status

	git push origin staging
 

	if [ $? -eq 0 ]; then
	       echo "Push réussi vers la branche staging."
	else
	       echo "Erreur : le push a échoué."
               exit 1
	fi

else
	echo "Les tests ont échoué. Voici les Logs : "
	cat $Log_File
	exit 1
fi

echo "Arrêt du container..."
docker stop $Container_Name

echo  "Processus terminé."
