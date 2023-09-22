# TP3_DEVOPS
TP 3 Mise en place pour une application en Python d’une chaine d’intégration continue  permettant de valider l’application  avant de la packager dans une  image de conteneur

## Pré-requis

* Avoir sur sa machine git, docker et docker-compose installé
* Créer un fork dans votre compte github du dépôt : https://github.com/xavnono/TP3_DEVOPS.git 
* Cloner le dépôt : git clone https://github.com/xavnono/TP3_DEVOPS 

## Installation de jenkins

* A partir du dossier cloné, se mettre dans le dossier docker [~/TP3/TP3_DEVOPS/Docker] et lancer la commande :
```
docker-compose up -d --build
```
* Cela permet d'avoir une image de jenkins qui contient Docker (qui nous sera utile pour les acitons d'intégration et de déploiement continue) et de lancer un conteneur
* Une fois le conteneur lancé (vérifier qu'il est au statut up), se rendre à l'url : http://localhost:8080 pour accéder à l'interface de Jenkins

## Configurer le jenkins

* La première chose que vous demande Jenkins est le mot de passe pour dévérouiller jenkins
![](https://paper-attachments.dropbox.com/s_33CE5684927EB1F665F2EEF2A8A615DFA881F46F04918B588BABDF4D08ACF025_1645484899181_jenkins-getting-started.png)
* Pour récupérer ce mot de passe afficher les logs de votre conteneur, il doit se trouver dedans :
![](https://paper-attachments.dropbox.com/s_33CE5684927EB1F665F2EEF2A8A615DFA881F46F04918B588BABDF4D08ACF025_1645553155314_Screenshot+from+2022-02-22+19-05-37.png)
* Ensuite Jenkins vous propose d'installer les plugins suggérés ou de choisir les plugins à installé, laissez l'option par défaut d'installer les plugins suggérés :
![](https://paper-attachments.dropbox.com/s_33CE5684927EB1F665F2EEF2A8A615DFA881F46F04918B588BABDF4D08ACF025_1645661908679_plugins-installation.png)
* Puis Jenkins vous demande de créer un compte administrateur, remplir le formulaire et cliquer sur  `Save and continue`
![](https://paper-attachments.dropbox.com/s_33CE5684927EB1F665F2EEF2A8A615DFA881F46F04918B588BABDF4D08ACF025_1645717974971_Screenshot+from+2022-02-24+16-52-36.png)
* Votre Jenkins est maintenant prêt à être utilisé
