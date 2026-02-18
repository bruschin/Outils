# Outils [2026-02-18] 👉 BN V1.5.0

[![pipeline status](https://gitlab.meteo.fr/desr-sires-pga/support_n1/outils/badges/main/pipeline.svg)](https://gitlab.meteo.fr/desr-sires-pga/support_n1/outils/-/commits/main)
[![coverage report](https://gitlab.meteo.fr/desr-sires-pga/support_n1/outils/badges/main/coverage.svg)](https://gitlab.meteo.fr/desr-sires-pga/support_n1/outils/-/commits/main)
[![Latest Release](https://gitlab.meteo.fr/desr-sires-pga/support_n1/outils/-/badges/release.svg)](https://gitlab.meteo.fr/desr-sires-pga/support_n1/outils/-/releases)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=bruschin_Outils&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=bruschin_Outils)
[![SonarQube Cloud](https://sonarcloud.io/images/project_badges/sonarcloud-dark.svg)](https://sonarcloud.io/summary/new_code?id=bruschin_Outils)

## [2026-02-18] BN V1.5.0

+ A partir de la branche main V1.4.2, création d'une tâche et d'une branche de développement pour la V1.5.0 qui intègrera le dépôt final du fichier whl sur nexus avec twine.
+ [Documentation Nexus/twine](http://confluence.meteo.fr/display/MOT/Nexus+-+Guide+d%27utilisation#NexusGuided'utilisation-PublierunpaquetpythonavecTwine)
+ [Ticket GLPI](http://support.meteo.fr/front/ticket.form.php?id=379467)
+ [Nexus](http://nexm01-sidev.meteo.fr)  
+ TODO : ajouter un diagramme de documentation.

## [2025-12-24] BN V1.4.2

+ Meilleure gestion départ avec 1 ou 2 badgeages
+ Révision gitlab ci/cd. Production documentations, linter, tests.
+ TODO: gérer une liste de todo.
  + DO : gérer pipelines sur gitlab & github
  + DO : Identifier packages systemes nécessaires par action.
    + DO : Doxygen
    + DO : Shellcheck
    + DO : Pylint
    + DO : pyenv
    + DO : Ruff
    + DO : Tox
    + DO : Sphinx
    + DO : Build wheel

## [2025-12-17] CA V1.4.1

+ Ajout calcul gain bilan
+ Prise en compte 4 badgeages

## [2024-09-11] BN V1.3

+ Ajout calcul systeme pivot autre que 37h5j

## [2023-04-13] BN V1.2

+ Test unitaires + corretion bug _conversion_heures %02d
+ Prise en compte 1 ou 3 badgeages => 1 ou 2 ou 3.

## [2023-04-09] BN V1.1

+ Test unitaires + gestion param aide + version

## [2023-03-14] BN V1.0

+ Initialisation

## Documentations

+ [documentation du projet gitlab](https://outils-e76d7e.gitlab.meteo.fr/)
+ [documentation du projet github](https://bruschin.github.io/Outils/)
