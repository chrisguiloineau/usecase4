# Restitutions cas d’usages

## Cas d'usage 4 : Livraison d’un moteur de base de donnnées


Le traitement de la donnée chez Synapse fait l’objet d’un environnement dédié, utilisé chaque jour pour agréger les données “open data” sur l’information médicale et médicamenteuse. 

Des pipelines Prefect sont développés pour automatiser cela. 

Cet environnement peut être considéré comme de la “production” : même si il n’est pas directement requêté par les applicatifs Synapse, il a pour utilisateurs les équipes *data* (*science* + *engineering*) et la mise à jour régulière de la donnée est un atout concurrentiel pour Synapse.

Un beau jour, on décide d’ajouter dans cet environnement une nouvelle base de données médicamenteuse très prometteuse. 

Le format de la base de données est un dump SQL au format MySQL. 

Votre mission, Mr. DataDevOps, sera de : 

- containeriser (sic) le moteur de base de données MariaDB
    - pour qu’il puisse charger au démarrage le dump SQL et se lancer
    - le dump doit pouvoir être rendu paramétrable au moyen d’un *volume*
- la livrer sous forme de pipeline de CI/CD dans l’environnement AKS de telle sorte à ce que le dump SQL puisse être livré, mis à jour, au travers d’un pipeline Prefect
    - Le process doit être orchestrable (Kubernetes) et observable (Prometheus)
    Partir du principe que sont déja installés et paramétrés ces 2 outils “socle” Kubernetes et Prometheus

### **Livrables**

On souhaite lire / voir ensemble :

- Repository Git (github, gitlab, etc..) contenant :
    - Code de l’image
    - YAML kubernetes utilisant la notion de volume
- Pod déployé sur un minikube local ou autre Kubernetes

Le reste de la mission (CI/CD…) pourra être discuté ensemble lors de la restitution 🙂

## Travail effectué

### 1
- Livraison avec l'utilisation de l'image officielle de MariaDB
- Exploitation du module d'initialisation intégré
- Déploiement en side car container mysqld-exporter pour exporter les métriques de MariaDB, et les rendre accessible pour Prometheus
- Mise en place d'un réplicat de 2 pods avec volume partagé
- Exposition avec utilisation de Services Load Balancer

### 2
- Proposition d'utilisation d'un autre outil pour simplifier l'écriture de ce genre de scripts : l'opérateur MariaDB
- Cette solution n'intègre pas de mécanique d'automatisation de l'initialisation, mais peut être ochestré par l'outil de CI
- Possibilité d'utiliser KubeDB 

# Utils
```
 minikube service mariadb-service -n mariadb-1
 ```
