# cv_flutter

My CV - Florent Rousselle

## PAGE
- profil "ProfilPage"
- expérience "ExperiencePage"
- formation "EducationPage"
- compétences "SkillPage"
- infos 'InfoPage'

## Comment déployer
https://medium.com/@nayanbabariya/deploying-flutter-web-app-to-firebase-hosting-cac47636f140
(ceci est une doc d'assistance)

### 1. Compiler
$ flutter build web --wasp

### 2. Lancer le serveur local pour vérification
Installer serve : $ npm install -g serve
Lancer serve : $ serve build/web

### 2. Déployer sur Firebase
$ firebase deploy
