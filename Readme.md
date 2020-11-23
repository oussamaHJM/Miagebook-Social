# MiageBook
Membres : Oussama EL-HAJJAM  M1 MIAGE FI

## Etapes réaliser :
- Partie inscription avec verification du login + stockage du mot de passe crypté dans la BDD
- Login
- Listes des utilisateures, voir si c'est amies ou pas, pouvoir ajouter et retier avec une Api REST
- Profile utilisateur: Profile Contient les information de l'utilisateur avec la liste des amies
- Status : pouvoir ajouter des status et visualiser le feed personnel
- Récuperer les 10 statut les plus récentes
- Pouvoir ajouter des commentaires et afficher la liste des commentaires de chaque Status
- Toutes les pages ne sont pas accessible si vous étes pas connecté

## Projet :
Le projet contient plusieurs couches :
- DAO : cette couche contient les entités JPA avec l'implémentation Hibernate (User - Status - Comment).
- METIER : Contient Une InterfaceUser qu'est implémente par la classe UserImpl.
- Security : Contient une classe qui représente une fonction de cryptage avec une clé défini (utilisé pour crypter le mot de passe avant de le stocké en BDD et pour le récupérer pour faire la Comparaison)
- Service : Contient l'API REST
- WEB : Contient les différents contrôleurs, Servlets
- Persistance:
- Client / VIEW : Contient les différentes pages JSP 

## prérequis :
- Il faut que vous soyer connecter au VPN pour avoir accées pour interroger la base de donnée WEBTP.
## Utilisation :

C'est un projet Maven pour avoir le fichier '.WAR' il suffit de taper la commande suivante.

```bash
mvn clean install
```

## Usage

Après le déploient du fichier vous pouvez allez directement au lien du déploient suivit par:
* /login
* /subscribe

Après vous pouvez commencer à naviguer dans les différentes pages de l'application.

##Note :
- Si vous arriver pas à vous connecter avec le vpn et WEBTP, vous allez trouver un fichier de la BDD .SQL à importer en local.
