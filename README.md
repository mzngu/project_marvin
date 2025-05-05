# MY_MARVIN

![Jenkins Logo](https://www.jenkins.io/images/logos/jenkins/jenkins.png)

## Description

MY_MARVIN est un projet centré sur la configuration automatisée de Jenkins, une plateforme d'automatisation populaire. Ce projet utilise la méthodologie "Configuration as Code" (JCasC) et Job DSL pour automatiser le déploiement d'une instance Jenkins complètement configurée.

Le projet vise à démontrer les compétences en DevOps, en particulier dans la mise en place d'un pipeline CI/CD (Continuous Integration & Continuous Delivery).

## Fonctionnalités

- Configuration complète de Jenkins via un fichier YAML (`my_marvin.yml`)
- Gestion des utilisateurs et des rôles d'autorisation
- Création de jobs Jenkins automatisés via Job DSL
- Structure de dossiers organisée
- Environnement conteneurisé pour faciliter les tests et le déploiement

## Structure du projet

```
.
├── my_marvin.yml        # Configuration Jenkins as Code
├── launch_local_jenkins.sh  # Script pour lancer Jenkins en local via Docker
├── Dockerfile           # Configuration du conteneur Docker pour Jenkins
├── job_dsl.groovy       # Script DSL pour créer des jobs Jenkins
└── README.md            # Ce fichier
```

## Prérequis

- Docker
- Bash (pour exécuter le script)

## Installation

1. Clonez ce dépôt :
   ```bash
   git clone <url-du-repository>
   cd MY_MARVIN
   ```

2. Assurez-vous que le script `launch_local_jenkins.sh` est exécutable :
   ```bash
   chmod +x launch_local_jenkins.sh
   ```

3. Lancez l'instance Jenkins :
   ```bash
   ./launch_local_jenkins.sh
   ```

4. Accédez à Jenkins via votre navigateur :
   ```
   http://localhost:8080
   ```

## Configuration

### Utilisateurs préconfigurés

L'instance Jenkins est préconfigurée avec les utilisateurs suivants :

| Nom | ID | Mot de passe (Variable d'environnement) |
|-----|----|-----------------------------------------|
| Hugo | chocolateen | test12345 |
| Garance | vaugie_g | test54321 |
| Jeremy | i_dont_know | password12345 |
| Nassim | nasso | nasso_password |

### Rôles et autorisations

- **admin** : Accès complet à l'instance Jenkins (attribué à Hugo)
- **ape** : Peut exécuter des jobs et voir leurs espaces de travail (attribué à Jeremy)
- **gorilla** : Mêmes permissions qu'ape, plus la capacité de créer, configurer et supprimer des jobs (attribué à Garance)
- **assist** : Peut uniquement consulter les jobs et leurs espaces de travail (attribué à Nassim)

### Jobs préconfigurés

1. **clone-repository** (dans le dossier Tools) :
   - Clone un dépôt Git spécifié via un paramètre
   - Exécution manuelle uniquement

2. **SEED** (dans le dossier Tools) :
   - Crée dynamiquement des jobs basés sur des paramètres fournis
   - Utilise le script job_dsl.groovy pour générer les jobs

3. **Jobs générés par SEED** :
   - Configuration GitHub automatique
   - Exécution des commandes standard (make)
   - Nettoyage de l'espace de travail avant chaque build

## Personnalisation

Pour modifier la configuration de Jenkins, vous pouvez éditer le fichier `my_marvin.yml`. Pour changer la logique de création des jobs, modifiez le fichier `job_dsl.groovy`.

## Variables d'environnement

Les mots de passe des utilisateurs sont définis via les variables d'environnement suivantes :
- USER_CHOCOLATEEN_PASSWORD
- USER_VAUGIE_G_PASSWORD
- USER_I_DONT_KNOW_PASSWORD
- USER_NASSO_PASSWORD

Ces variables sont automatiquement définies dans le script `launch_local_jenkins.sh`, mais peuvent être modifiées selon vos besoins.

## Améliorations possibles

- Ajout de pipelines supplémentaires
- Intégration avec d'autres outils DevOps
- Configuration de notifications
- Mise en place de tests automatisés pour la configuration

## À propos de Jenkins

Jenkins est une plateforme d'automatisation open source qui permet d'automatiser les aspects du développement logiciel liés à la construction, aux tests et au déploiement, facilitant l'intégration continue et la livraison continue.

