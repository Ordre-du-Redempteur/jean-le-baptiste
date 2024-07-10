#!/bin/bash

get_home_directory() {
    echo "$HOME"
}

find_file() {
    local home_directory="$1"
    local file_name="$2"

    local file_path=$(find "$home_directory" -type f -name "$file_name" 2>/dev/null | head -n 1)

    if [ -z "$file_path" ]; then
        echo "Erreur : Le fichier $file_name n'a pas été trouvé."
        exit 1
    fi

    echo "$file_path"
}

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
