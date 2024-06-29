# Jean Le Baptiste

Ce projet affiche un passage de la Bible lors de l'allumage d'un système Arch Linux.
Peut-être bien le Cathéchisme de Saint Pie X.

## Installation & Vérifications

1. Copiez les commandes suivantes et exécutez les :
   ```sh
   sudo cp jean-le-baptiste.sh /usr/local/bin/
   sudo chmod +x /usr/local/bin/jean-le-baptiste.sh

   sudo cp jean-le-baptiste.service /etc/systemd/system/jean-le-baptiste.service
   ```

   Elles permettent de placer le sh et le service, respectivement dans les `usr/local/bin` et `etc/systemd/system/`.
   NB : sudo est nécessaire pour la copie d'un fichier dans ces répertoires.

2. Activez le service `jean-le-baptiste.service` :

   Rechargez la configuration systemd
   ```sh
   sudo systemctl daemon-reload
   ```

   Activez le service
   ```sh
   sudo systemctl enable jean-le-baptiste.service
   ```

   NB : pensez à vérifier la bonne instalation du service. (voir étape suivante)

3. Vérifications

   Voici différentes commandes qui peuvent aider à tester le service.

   Lancez-le pour tester
   ```sh
   sudo systemctl start jean-le-baptiste.service
   ```

   Testez-le en cas pratique (redémarage de l'ordinateur)
   ```sh
   sudo reboot
   ```

   Vérifiez le bon lancement du service
   ```sh
   sudo systemctl status jean-le-baptiste.service
   ```
