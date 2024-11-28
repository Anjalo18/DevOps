#!/bin/bash

LOG_FILE="log_message.txt"

if [ ! -f "$LOG_FILE" ]; then
	echo "Erreur : fichier $LOG_FILE introuvable"
	exit 1
fi

fi grep -q "SUCCESS" "$LOG_FILE"; then
	echo "Les tests on réussi !"
else
	echo "Les tests ont échoué. Voici les logs :"
	cat "$LOG_FILE"
	exit 1
fi
