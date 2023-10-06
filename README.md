# Projet SQL

## Horaires

Le plan de formation change tout les 2-3 ans, il faut donc garder un historique des cours.
Lors de la formation un planning trimestriel est établi et peut changer d'une année à une autre, il faut donc aussi garder un historique de ces plannings.
Cependant, les classes on un planning fix durant l'entièreté du trimestre.
Finalement, les notes sont organisées en semestre ainsi que les promotions. 

## Salles

Les salles de l'établissement sont répertoriées dans la base de données. Elle sont identifiées par un nom sous la forme `{Lieux abrégé}-{étage}{numéro de salle}`. Ainsi la 31ème salle du troisième étage du batiment de St-Croix sera nomée: `SC-331`

## Classes

Les classes sont composées d'élèves et d'un seul professeur principal. Les classes sont toujours dans la même salle et nous devons avoir un historique des salles de classes de chaques classes au cours des années.

## Elèves

Un élève est identifié par un `nom`, un `prénom`, une `date de naissance`, un `email`, un `téléphone`, une `adresse` et un `status` (En cours, Fini, Arrêté). Cela dit le status ne **doit pas** être `redoublant`. Cepedant si un élève arrête ou à fini sa formation, les notes de celui-ci sont conservées. Tout élève appartient à une seul branche (DEV, SYS, etc...) et à une seul classe. Il peut cependant changer de branche en cours de formation. Un ancien élève peut devenir prof, dans ce cas l'élève devient un prof mais concerve ses notes.

## Prof

Un prof est identifié par un `nom`, un `prénom`, une `date de naissance`, un `email`, un `téléphone`, une `adresse`, un `IBAN` et un `status`(En cours, Arrêt prolongé, Retraite). Les profs ne font pas parti d'une branche, mais peuvent enseigner à toutes les branches. Un prof peut être maître d'une classe mais ne peut pas en avoir plusieurs. Un prof peut enseigner plusieurs cours.

## Cours

Un cours est identifié par un `nom`, la ou les `filliaire(s)` dans laquelle il est enseigné, une `description`, le `trimestre`, le ou les `prof(s)` qui l'enseigne ou peuvent l'enseigner et les `notes` de celui ci. Un cours en composé par des périodes. Une période dure 45 minutes. Le cours peut être donnée par un seul prof en même temps(dans la même salle) mais plusieurs profs peuvent enseigner ce cours à des classes différentes. Un cour est toujours donné dans la même salle durant le trimestre.

## Notes

Les notes sont composées d'un `nom`, d'une `valeur` de 0 à 6 avec un coefficiant de 0.5(arondi au 0.5). Un cours peut avoir plusieurs notes, c'est pourquoi les notes ont un nom. Et les élèves qui redoublent leur année doivent garder les notes de l'année redoublée.

## Général

Les fillières de l'établissement doivent être renseignées et sont sujettes à changement. Les seules personnes qui seront répertoriée dans la base de données sont les élèves et les profs.
