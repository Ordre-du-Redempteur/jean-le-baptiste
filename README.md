# Jean Le Baptiste

Ce projet affiche un passage de la Bible lors de l'allumage d'un système Arch Linux.
Peut-être bien le Cathéchisme de Saint Pie X.

## Installation

Copiez les commandes suivantes et exécutez les :
   
   Exécutez le fichier d'installation
   ```sh
   chmod +x install_jlb.sh

   sudo ./install_jlb.sh
   ```
## Vérifications

Voici une liste non-exhaustive de commande pour vous aider :

   Exécuter le fichier de vérification
   ```sh
   chmod +x verif_jlb.sh

   sudo ./verif_jlb.sh
   ```
   Vous devriez voir le statut du service 'jean le baptiste'
   Voir son redémmarage
   La lecture du journal de log
   Le redémmarage de l'ordinateur

   Une fois l'ordinateur redemmaré, copiez et exécutez la commande :
   ```sh
   sudo journalctl -u jean-le-baptiste.service
   ```
