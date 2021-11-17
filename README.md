# Eventbrite remastered : **EventCodR**

[![forthebadge](https://raw.githubusercontent.com/fleopaulD/README-parts/main/Badges/ftb-the-hacking-project.svg)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/made-with-ruby.svg)](https://forthebadge.com/images/badges/made-with-ruby.svg)
[![forthebadge](https://raw.githubusercontent.com/fleopaulD/README-parts/main/Badges/ftb-hosted-on-heroku.svg)](https://secret-harbor-58504.herokuapp.com/)

## 1. À propo

Encore un super projet pour cette **semaine 7** de la formation développeur web, un [*Eventbrite*](https://www.eventbrite.fr/)-like ! Tous les jours de cette semaine des petites améliorations vont venir améliorer notre appli !

Voici les requis pour la version initiale :

1. L'application roulera sur Rails avec une base de données en PostegreSQL
1. Designer une base avec les utilisateurs, les évènements, et la table de jointure qui correspondrait aux participations.
1. Intégrer un système de mailing
1. Vérifer tous les branchements en console
1. Seeder la base de donnée
1. Push et debug du code sur Heroku

## 2. Index des révisions

- Version initiale
- [Rev 1](https://github.com/joffrey7486/EventBrite_THP/commit/10005ae62a3d2041d8ff9d26c1ff19aea0137d8d) : Mettre en place un système de gestion d'utilisateurs avec la gem ['devise'](https://github.com/heartcombo/devise) et quelques fonctionnalités CRUD. Amélioration du front.
- [Rev 2](https://github.com/joffrey7486/EventBrite_THP/commit/509741b628a0aeb1ad050e0743caed4ac25e5a71) : Ajout d'un système de paiement pour participer aux évènements avec [Stripe](https://stripe.com/) et sa gem. Ajouts d'autres fonctionnalités du CRUD, notamemment pour gérer les évènements (modification, suppression, affichage des participants pour les organisateurs, etc...)
- [Rev 3](https://github.com/joffrey7486/EventBrite_THP/commit/7cc50602085f54677aba8c278b024f8ca1d3c1dd) : Possibilité d'ajouter un photo aux évènements ainsi qu'aux profils utilisateurs. Reprise de l'organisation du CSS pour l'asset pipeline.
- [Rev 4](https://github.com/joffrey7486/EventBrite_THP/commit/366e1552863086c2d44512cd49206d9bd89c4b0a) : Ajout d'une console administrateur à l'application avec la possibilité de gérer les utilisateurs et les évènements. Mise en place d'un système d'approbation des évènements par les admins avant publication.

## 3. Prérequis à l'installation

1. Ruby en version 2.7.4
1. Rails en version 5.2.3
1. PostgreSQL

## 4. Lancement de l'application

L'application est disponible en ligne sur :

> [**https://secret-harbor-58504.herokuapp.com/**](https://secret-harbor-58504.herokuapp.com/)

Pour l'ouvrir en mode développement :

1. Ouvrir un terminal dans le dossier racine de l'application
1. `bundle install` -> pour installer toutes les gems nécessaires
1. `rails db:create` -> création de la base de données
1. `rails db:migrate` -> réaliser les migrations
1. `rails db:seed` -> peupler la base de données
1. `rails s` -> lancement du serveur
1. [Accéder à la page web](http://localhost:3000/accueil)
1. Enjoy :smile:

## 5. Questions? Bugs?

Posez votre question [ici](https://github.com/joffrey7486/EventBrite_THP/issues/new/choose)  :smile:

## 6. Crédits

Une belle semaine en pair-programming chez [TheHackingProject](https://www.thehackingproject.org) !

Les try-harders du moment, pour vous servir :

- [joffrey7486](https://github.com/joffrey7486)
- [Roobios](https://github.com/Roobios)
- [profprogrammeur](https://github.com/profprogrammeur)
- [fleopaulD](https://github.com/fleopaulD)

- et le précieux soutien de la communauté THP :sparkling_heart:
