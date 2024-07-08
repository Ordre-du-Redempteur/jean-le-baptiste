#!/bin/bash

check_service_status() {
    local service_name=$1
    sudo systemctl status $service_name
    if [ $? -ne 0 ]; then
        echo "Le service $service_name n'est pas actif. Veuillez vérifier."
        exit 1
    else
        echo "Le service $service_name est actif."
    fi
}

check_service_logs() {
    local service_name=$1
    echo "Consultation des journaux pour le service $service_name..."
    sudo journalctl -u $service_name | tail -n 20
}

echo "Exécution du script d'installation..."
./installer.sh
if [ $? -ne 0 ]; then
    echo "Le script d'installation a échoué. Veuillez vérifier."
    exit 1
else
    echo "Le script d'installation a été exécuté avec succès."
fi

echo "Vérification du statut du service jean-le-baptiste.service..."
check_service_status jean-le-baptiste.service

echo "Redémarrage du service jean-le-baptiste.service..."
sudo systemctl restart jean-le-baptiste.service
check_service_status jean-le-baptiste.service

check_service_logs jean-le-baptiste.service

echo "Redémarrage de la machine pour vérifier le fonctionnement au démarrage..."
sudo reboot

# Attendre que la machine redémarre (ajuster si nécessaire)
sleep 60

echo "Consultation des journaux après redémarrage..."
check_service_logs jean-le-baptiste.service

echo "Vérification complète terminée."
