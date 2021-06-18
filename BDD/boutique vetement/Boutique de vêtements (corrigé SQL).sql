/*
Ce document est à lire avec notepad++ (ou tout autre éditeur de code)

Requêtes SQL concernant l'étude de cas "Boutique de vêtements écoresponsables"

Ressources utiles pour produire des requêtes SQL :
 - Cours PDF sur Moodle
 - Memento PDF sur Moodle
 - Site web sql.sh
 
Logiciels requis :
 - JMerise
 - Wamp
 
Opérations pour mettre la base de données sur pied :
 1. Sous JMerise, faire le MCD.
 2. Sous JMerise, convertir le MCD en MLD.
 3. Sous JMerise, enregistrer le script SQL sur le disque
 4. Avec l'icône de Wamp : ouvrir PhpMyAdmin (clic gauche)
 5. Sous PhpMyAdmin, Se connecter (root, pas de mot de passe)
 6. Sous PhpMyAdmin, Créer une base de donnée, nommée "veteco"
 7. Sous PhpMyAdmin, Aller dans "Importer"
 8. Sous PhpMyAdmin, Importer le fichier ".sql" sauvegardé au point 2
 9. Sous PhpMyAdmin, Exécuter l'import
 10. Sous PhpMyAdmin, Parcourir les retours pour s'assurer qu'il n'y a pas d'erreur.
 11. Sous PhpMyAdmin, Aller dans l'onglet SQL pour faire les requêtes ci-après.
*/

-- 01. Insérer la mention « Issu du commerce équitable »
INSERT INTO Mention (libelle)
VALUES ('Issu du commerce équitable'); /* 1 ligne insérée */

-- 02. Insérer la mention « Fabriqué en France »
INSERT INTO Mention (libelle)
VALUES ('Fabriqué en France'); /* 1 ligne insérée */

-- 03. Consulter les mentions stockées en base de données
SELECT *
FROM Mention;

-- 04. Insérer les mentions « Contons biologiques » et « Fibres recyclés » d'un seul coup
INSERT INTO Mention (libelle)
VALUES ('Contons biologiques'),
       ('Fibres recyclés');  /* 2 lignes insérées */

-- 05. Consulter les mentions stockées en base de données et les trier par ordre alphabétique
SELECT * 
FROM Mention
ORDER BY libelle;

-- 06. Corriger 'Contons biologiques' en 'Cotons biologiques' dans la table Mention (mise à jour)
UPDATE Mention
SET libelle = 'Cotons biologiques'
WHERE libelle = 'Contons biologiques';  /* 1 ligne affectée */

-- 07. Corriger 'Fibres recyclés' en 'Fibres recyclées' dans la table Mention (mise à jour)
UPDATE Mention
SET libelle = 'Fibres recyclées'
WHERE libelle = 'Fibres recyclés';  /* 1 ligne affectée */

-- 08. Insérer, en une seule requête, les catégories « Pantalon », « T-shirt »,
--     « Chemise », « Short », « Jupe », « Chapeau », « Chaussure » et « Chaussette »
INSERT INTO Categorie (nom) 
VALUES ('Pantalon'), ('T-shirt'), ('Chemise'), ('Short'), ('Jupe'), ('Chapeau'), ('Chaussure'), ('Chaussette');

-- 09. Consulter les catégories stockées en base de données et les trier par ordre alphabétique
SELECT *
FROM Categorie
ORDER BY nom;

-- 10. Insérer, en une seule requête les moyens de paiement de l'énoncé
INSERT INTO MoyenPaiement (designation)
VALUES ('Carte Bancaire'), ('Virement Bancaire'), ('Chèque'), ('Paypal');

-- 11. Consulter les moyens de paiement et les trier par ordre alphabétique
SELECT *
FROM MoyenPaiement
ORDER BY designation;

-- 12. Insérer un client qui correspond à soi-même (sans adresse postale)
-- NOTE : Pour ne pas mettre d'adresse, il faudra aller autoriser les valeurs NULL sur idAdresse auparavant,
-- dans PhpMyAdmin (modification de structure, cocher NULL)
-- 12a. Alternative en spécifiant les valeurs nulles :
INSERT INTO Client (nom, prenom, estHomme, numTel, adrMail, idadresse)
VALUES ('Dufils', 'Yohan', 1, '0605040302', 'ydufils@humanbooster.com', NULL);

-- 12b. Alternative sans spécifier les valeurs nulles :
INSERT INTO Client (nom, prenom, estHomme, numTel, adrMail)
VALUES ('Dufils', 'Yohan', 1, '0605040302', 'ydufils@humanbooster.com');

-- 13. Sélectionner tous les clients
SELECT *
FROM Client;

-- 14. COLLECTIF : Chacun insère deux autres clients : ses voisins de gauche et de droite (en une seule requête)
INSERT INTO Client (nom, prenom, estHomme, numTel, adrMail)
VALUES ('nom1', 'prenom', 1, 'numTel', 'adrMail'),
       ('nom2', 'prenom', 1, 'numTel', 'adrMail');

-- 15. Insérer un client fictif, correspondant à un personnage de fiction d'une série ou d'un film que vous avez regardé (en ne lui spécifiant aucun numéro de téléphone, aucun e-mail et aucune adresse).
-- NOTE : si numTel et adrMail sont non-nullable, les rendre NULLABLE au préalable, dans PhpMyAdmin (modification de structure, cocher NULL)
-- 15a. Alternative en spécifiant les valeurs nulles :
INSERT INTO Client (nom, prenom, estHomme, numTel, adrMail)
VALUES ('McFly', 'Marty', 1, NULL, NULL);

-- 15b. Alternative sans spécifier les valeurs nulles :
INSERT INTO Client (nom, prenom, estHomme)
VALUES ('McFly', 'Marty', 1);

-- 16. Sélectionner les clients qui sont des hommes
SELECT *
FROM Client
WHERE estHomme = 1;

-- 17. Insérer l'adresse postale du client correspondant à soi-même
-- Note : si ligne2 et ligne3 sont non-nullable, les rendre NULLABLE au préalable, dans PhpMyAdmin (modification de structure, cocher NULL)
-- Note : Il n'y a pas d'auto-incrément : on décide de l'ID nous même
-- 17a. Alternative en spécifiant les valeurs nulles :
INSERT INTO Adresse (idAdresse, ligne1, ligne2, ligne3, codePostal, commune)
VALUES (42, '4 rue Charles de Gaulle', NULL, NULL, '42000', 'Saint-Étienne');

-- 17b. Alternative sans spécifier les valeurs nulles :
INSERT INTO Adresse (idAdresse, ligne1, codePostal, commune)
VALUES (42, '4 rue Charles de Gaulle', '42000', 'Saint-Étienne');

-- 18. Sélectionner toutes les adresses
SELECT *
FROM Adresse;

-- 19. Affecter l'adresse nouvellement créée au bon client (soi-même)
-- Au préalable : il faut connaitre son idClient et son idAdresse
UPDATE Client
SET idAdresse = 42
WHERE idClient = 1; /* L'id doit correspondre à votre client. Possible d'utilisez nom = 'NOMFAMILLE', mais ceci impact tous les client ayant ce nom de famille */

-- 20. Insérer les adresses des clients correspondant à ses voisins de gauche et de droite (en une seule requête)
INSERT INTO Adresse (idAdresse, ligne1, ligne2, ligne3, codePostal, commune)
VALUES (2, '125 avenue des lilas', NULL, NULL, '69200', 'Venissieux'),
	   (3, 'Lotissement du grand chêne', '45 rue des cerisiers', NULL, '69100', 'Villeurbanne');

-- 21. Affecter les adresses nouvellement créées aux clients correspondants (deux requêtes)
-- Au préalable : il faut connaitre les idClient et les idAdresse
UPDATE Client
SET idAdresse = 2
WHERE idClient = 2; /* L'id doit correspondre au client voulu. Possible d'utilisez nom = 'NOMFAMILLE', mais ceci impacte tous les client ayant ce nom de famille */

UPDATE Client
SET idAdresse = 3
WHERE idClient = 3; /* L'id doit correspondre au client voulu. Possible d'utilisez nom = 'NOMFAMILLE', mais ceci impacte tous les client ayant ce nom de famille */

-- 22. Sélectionner les clients et leur adresse
SELECT *
FROM Client
JOIN Adresse ON Client.idAdresse = Adresse.idAdresse;

-- 23. Sélectionner les clients et leur adresse et les trier par ordre alphabétique du nom de famille
SELECT *
FROM Client
JOIN Adresse ON Client.idAdresse = Adresse.idAdresse
ORDER BY nom;

-- 24. Sélectionner les clients et leur adresse ayant votre nom de famille
SELECT * 
FROM Client
JOIN Adresse ON Client.idAdresse = Adresse.idAdresse
WHERE nom = 'DUFILS';

-- 25. Sélectionner les clients et leur adresse n'ayant PAS votre nom de famille
SELECT * 
FROM Client
JOIN Adresse ON Client.idAdresse = Adresse.idAdresse
WHERE nom != 'DUFILS'; /* ou nom <> 'DUFILS'   ou même    WHERE NOT nom = 'DUFILS' */

-- 26. Sélectionner les clients (hommes seulement) et leur adresse
SELECT *
FROM Client
JOIN Adresse ON Client.idAdresse = Adresse.idAdresse
WHERE estHomme = 1;

-- 27. Sélectionner les clients (femmes seulement) et leur adresse
SELECT *
FROM Client
JOIN Adresse ON Client.idAdresse = Adresse.idAdresse
WHERE estHomme != 1; /* ou estHomme = 0 */

-- 28. Lister les clients et leur adresse, mêmes s'ils n'ont pas d'adresse
SELECT *
FROM Client
LEFT JOIN Adresse ON Client.idAdresse = Adresse.idAdresse;

-- 29. Sélectionner tous les clients (hommes seulement) et leur adresse n'ayant PAS votre nom de famille, même s'ils n'ont pas d'adresse
SELECT *
FROM Client
LEFT JOIN Adresse ON Client.idAdresse = Adresse.idAdresse 
WHERE estHomme = 1
AND nom != 'DUFILS';

-- 30. Sélectionner les clients habitant à 'Villeurbanne' et leur adresse
SELECT *
FROM Client
JOIN Adresse ON Client.idAdresse = Adresse.idAdresse /* Le LEFT JOIN n'est pas utile */
WHERE commune = 'Villeurbanne';

-- 31. Retrouver les clients sans adresse
SELECT *
FROM Client /* La jointure n'est pas utile */
WHERE idAdresse IS NULL;

-- 32. Retrouver les clients avec adresse
SELECT * 
FROM Client
WHERE idAdresse IS NOT NULL;

-- 33. Supprimer les clients sans adresse
DELETE
FROM Client
WHERE idAdresse IS NULL;

-- 34. Supprimez les adresses postales situées à Villeurbanne (deux requêtes)
-- 34a. Approche de suppression :
-- D'abord on supprime les clients en indiquant le nom de la table après le "DELETE"
DELETE Client 
FROM Client
JOIN Adresse ON Client.idClient = Adresse.idAdresse
WHERE commune = 'Villeurbanne';

-- Ensuite, on supprime les adresses
DELETE 
FROM Adresse
WHERE commune = 'Villeurbanne';

-- 34b. Approche de mise à jour
-- D'abord on efface les idAdresse des clients habitants à Villeurbanne :
-- Choix 1 (sous requête dans un IN) :
UPDATE client
SET idAdresse = NULL
WHERE idAdresse IN
(
	SELECT idAdresse 
	FROM adresse
	WHERE commune = 'Saint-Etienne'
);

-- Choix 2 (jointure dans le UPDATE) :
UPDATE Client
LEFT JOIN Adresse ON Client.idAdresse = Adresse.idAdresse
SET Client.idAdresse = NULL
WHERE Commune = 'Villeurbanne';

-- Ensuite, on supprime les adresses
DELETE 
FROM Adresse
WHERE commune = 'Villeurbanne';

-- Bon à savoir, dans l'onglet "Vue relationnelle" de PhpMyAdmin,
-- il est possible d'automatiser l'une des approche ci-dessus,
-- avec le ON DELETE CASADE ou ON DELETE SET NULL


-- 35. Ajouter un vêtement dans la base, nommé 'Pantaloon bleu clair' avec la description
--     'Élégant pantalon bleu clair qui vous ira à merveille', pour homme, 25,95 €, appartenant à la catégorie 'Pantalon'
-- Au préalable : il faut connaitre l'idCategorie qui correspond à Pantalon
-- NOTE : La description peut parfois dépasser le nombre de caractères maximum : chez certain, ceci causera une troncatures : chez d'autres un message d'erreur : une modification de structure sur la taille de la donnée doit alors être faire dans phpMyAdmin
INSERT INTO Vetement (nom, description, prix, pourHomme, idCategorie)
VALUES ('Pantaloon bleu foncé', 'Élégant pantalon bleu foncé qui vous ira à merveille', 25.95, 1, 1);

-- 36. COLLECTIF : En une seule requête, ajouter environ 5 vêtements dans la base de données (utiliser des noms 
--     parlants & sérieux, sélectionner plusieurs catégories pertinentes et adaptée au vêtement, choisir plusieurs prix (avec centimes parfois), varier homme et femme)
-- Astuce : pour utiliser une apostrophe, il faut la doubler
-- Rappel : La colonne "pourHomme" est un booléen, donc 1 = pour homme, et 0 = pas pour homme
INSERT INTO Vetement (nom, description, prix, pourHomme, idCategorie)
VALUES ('Chemise hawaïenne', 'Paré pour les vacances !', 24.50, 1, 3),
       ('Short couleur sable', 'Idéale pour la plage !', 18.90, 1, 4),
       ('Chapeau de Poudlard', 'Chapeau magique : attention', 135.50, 1, 6),
       ('Chaussettes trouées', 'Et encore : d''occasion', 5.99, 1, 8),
       ('T-shirt-pyjama', 'Pas stylé, mais confortable', 17.49, 0, 2);

-- 37. Compter le nombre de vêtements dans la table vêtement
SELECT COUNT(*)
FROM Vetement;

-- 38. Sélectionner tous les vêtements et leur catégorie
SELECT *
FROM Vetement 
JOIN Categorie ON Vetement.idCategorie = Categorie.idCategorie;

-- 39. Sélectionner le nom de vêtement, la description, le prix, et la nom de catégorie des vêtements
SELECT Vetement.nom, description, prix, Categorie.nom
FROM Vetement
JOIN Categorie ON Vetement.idCategorie = Categorie.idCategorie;

-- 40. Sélectionner les vêtements de la catégorie 'Pantalon' (sans utiliser l'ID de la catégorie)
-- 40a. Variante sans jointure, avec sous-requête :
SELECT *
FROM Vetement
WHERE idCategorie = (SELECT idCategorie
					 FROM Categorie
					 WHERE nom = 'Pantalon');

-- 40b. Variante sans jointure, avec sous-requête et avec variable :
SET @idCateg = (SELECT idCategorie
				FROM Categorie
				WHERE nom = 'Pantalon');

SELECT *
FROM Vetement
WHERE Vetement.idCategorie = @idCateg;

-- 40c. Variante avec jointure, sans sous-requête :
SELECT *
FROM Vetement
JOIN Categorie ON Vetement.idCategorie = Categorie.idCategorie
WHERE Categorie.nom = 'Pantalon';

-- 41. Sélectionner les vêtements et leur catégorie de la catégorie 'Chemise' dont le prix est inférieur à 40 €
SELECT *
FROM Vetement
JOIN Categorie ON Vetement.idCategorie = Categorie.idCategorie
WHERE Categorie.nom = 'Chemise'
AND prix < 40;
-- D'autres variantes sont possibles, conformément à la requête précédente

-- 42. Sélectionner les vêtements dont le prix est entre 30 € (inclu) et 50 € (inclu)
-- 42a. Variante sans BETWEEN :
SELECT *
FROM Vetement
WHERE prix >= 30
AND prix <= 50;

-- 42b. Variante avec BETWEEN (30 est inclu et 50 est inclu) :
SELECT *
FROM Vetement
WHERE prix BETWEEN 30 AND 50;

-- 43. Afficher la liste des pantalons, des shorts et des jupes
--	   (= sélectionner les vêtements et leur catégorie de la catégorie 'Pantalon'
--        + de la catégorie 'Short' + de la catégorie 'Jupe')
-- 43a. Variante avec des OR :
SELECT * 
FROM Vetement 
JOIN Categorie ON Vetement.idCategorie = Categorie.idCategorie
WHERE Categorie.nom = 'Pantalon'
OR Categorie.nom = 'Short'
OR Categorie.nom = 'Jupe';

-- 43b. Variante avec un IN :
SELECT *
FROM Vetement
JOIN Categorie ON Vetement.idCategorie = Categorie.idCategorie
WHERE Categorie.nom IN ('Pantalon', 'Short', 'Jupe');

-- 43c. Variante avec des UNION (non-recommandé) :
SELECT * 
FROM Vetement 
JOIN Categorie ON Vetement.idCategorie = Categorie.idCategorie
WHERE Categorie.nom = 'Pantalon'
UNION
SELECT * 
FROM Vetement 
JOIN Categorie ON Vetement.idCategorie = Categorie.idCategorie
WHERE Categorie.nom = 'Jupe'
UNION
SELECT * 
FROM Vetement 
JOIN Categorie ON Vetement.idCategorie = Categorie.idCategorie
WHERE Categorie.nom = 'Short';

-- 44. Sélectionner tous les vêtements et leur catégorie sauf les chaussettes, les chaussures et les chapeaux
-- 44a. Variante avec NOT IN :
SELECT *
FROM Vetement
JOIN Categorie ON Vetement.idCategorie = Categorie.idCategorie
WHERE Categorie.nom NOT IN ('Chaussette', 'Chaussure', 'Chapeau');

-- 44b. Variante avec LIKE (non-recommandé dans ce cas de figure) :
SELECT *
FROM Vetement
JOIN Categorie ON Vetement.idCategorie = Categorie.idCategorie
WHERE Categorie.nom NOT LIKE 'Cha%';

-- 44c. Variante avec des AND :
SELECT * FROM Vetement
JOIN Categorie ON Categorie.idCategorie = Vetement.idCategorie
WHERE Categorie.nom != 'Chaussette'
AND Categorie.nom != 'Chaussure'
AND Categorie.nom != 'Chapeau';

-- 44d. Certains moteurs de bases de données supportent des variantes avec EXCEPT ou MINUS
SELECT  *
FROM Vetement
JOIN Categorie ON Vetement.idCategorie = Categorie.idCategorie
EXCEPT
SELECT *
FROM Vetement
JOIN Categorie ON Vetement.idCategorie = Categorie.idCategorie
WHERE Categorie.nom IN ('Chaussette', 'Chaussure', 'Chapeau');

-- 45. ...et les trier par ordre alphabétique du nom
ORDER BY Vetement.nom;

-- 46. ...et les trier par prix décroissant (du plus grand au plus petit)
ORDER BY Vetement.prix DESC;

-- 47. ...et les trier par prix croissant (du plus petit au plus grand)
ORDER BY Vetement.prix ASC;

-- 48. ...et les trier par prix décroissant, puis par nom
ORDER BY Vetement.prix DESC, Vetement.nom;

-- 49. Compter le nombre de moyens de paiement
SELECT COUNT(*)
FROM MoyenPaiement;

-- 50. Compter le nombre de vêtements de la catégorie 'Pantalon'
SELECT COUNT(*)
FROM Vetement
JOIN Categorie ON Vetement.idCategorie = Categorie.idCategorie
WHERE Categorie.nom = 'Pantalon';

-- 51. Trouver le prix le moins élevé parmi tout les vêtements
SELECT MIN(prix)
FROM Vetement;
-- Il existe une variante avec ORDER BY prix ASC et LIMIT 1

-- 52. Trouver le prix le plus élevé parmi tout les vêtements
SELECT MAX(prix)
FROM Vetement;
-- Il existe une variante avec ORDER BY prix DESC et LIMIT 1

-- 53. Trouver le prix le plus élevé parmi les vêtements de la catégorie 'Pantalon'
SELECT MAX(prix)
FROM Vetement
JOIN Categorie ON Vetement.idCategorie = Categorie.idCategorie
WHERE Categorie.nom = 'Pantalon';

-- 54. Trouver le prix moyen des vêtements en arrondissant ce prix à 2 chiffres après la virgule
SELECT ROUND(AVG(prix), 2)
FROM Vetement;

-- 55. Trouver le prix moyen des vêtements en arrondissant ce prix à 2 chiffres après la virgule en intitulant la colonne "prixMoyen" (alias)
-- 55a. Avec AS :
SELECT ROUND(AVG(prix), 2) AS prixMoyen
FROM Vetement;

-- 55b. Sans AS :
SELECT ROUND(AVG(prix), 2) prixMoyen
FROM Vetement;

-- 56. Trouver le prix le plus faible, le prix le plus élevé et le prix moyen des vêtements en une seule requête
-- 56a. Sans alias, sans arrondi :
SELECT MIN(prix), MAX(prix), AVG(prix)
FROM Vetement;

-- 56b. Plus propre :
SELECT MIN(prix) prixMinimal, MAX(prix) prixMaximal, ROUND(AVG(prix), 2) prixMoyen
FROM Vetement;

-- 57. Trouver le(s) vêtement(s) ayant le prix le plus élevé
-- 57a. Variante avec une sous-requête :
SELECT *
FROM Vetement
WHERE prix = (SELECT MAX(prix) FROM Vetement);

-- 57b. Solution avec une sous-requête et une variable :
SET @prixMax = (SELECT MAX(prix) FROM Vetement);

SELECT *
FROM Vetement
WHERE prix = @prixMax;

-- 57c. Solution avec tri et limite (présentant UN DES vêtements avec le prix le plus élevé) :
SELECT *
FROM Vetement
ORDER BY prix DESC
LIMIT 1;

-- 58. Lister les vêtements dont le prix est au dessus de la moyenne
-- 58a. Variante avec une sous-requête :
SELECT *
FROM Vetement
WHERE prix > (SELECT AVG(prix) FROM Vetement);

-- 58b. Solution avec une sous-requête et une variable :
SET @prixMoy = (SELECT AVG(prix) FROM Vetement);

SELECT *
FROM Vetement
WHERE prix > @prixMoy;

-- 59. Trouver le prix total de tous les vêtements
SELECT SUM(prix)
FROM Vetement;

-- 60. Lister le nombre de vêtement de chaque catégorie (catégorie par catégorie)
SELECT C.idCategorie, C.nom, COUNT(*) AS nombre
FROM Vetement V /* On utilise l'alias V pour désigner la table Vetement */
JOIN Categorie C ON V.idCategorie = C.idCategorie /* On utilise l'alias C pour désigner la table Categorie */
GROUP BY C.idCategorie, C.nom;

-- 61. Lister le nombre de vêtement, ainsi que le prix le plus faible constaté, le prix le plus élevé constaté et le prix moyen, catégorie par catégorie
-- 61a. Sans alias
SELECT C.idCategorie, C.nom, COUNT(*), MIN(prix), MAX(prix)
FROM Vetement V
JOIN Categorie C ON V.idCategorie = C.idCategorie
GROUP BY C.idCategorie, C.nom;

-- 61b. Avec alias
SELECT C.idCategorie, C.nom, COUNT(*) AS Nombre, MIN(prix) AS PrixMini, MAX(prix) AS Maximum, AVG(prix) AS Moyenne
FROM Categorie C
JOIN Vetement V ON V.idCategorie = C.idCategorie
GROUP BY C.idCategorie, C.nom;

-- 62. Lister le nombre de vêtement, ainsi que le prix le plus faible constaté, le prix le plus élevé constaté et le prix moyen, catégorie par catégorie en distinguant les vêtements pour homme des vêtements pour femme. Les vêtements pour homme apparaitront avant les vêtements pour femme. En deuxième lieu, les catégories seront affichées par ordre alphabétique.
-- 62a. Solution avec GROUP BY sur deux colonnes :
SELECT Categorie.nom, pourHomme, COUNT(*), MIN(prix), MAX(prix), AVG(prix)
FROM Categorie
JOIN Vetement ON Vetement.idCategorie = Categorie.idCategorie
GROUP BY Categorie.nom, pourHomme
ORDER BY pourHomme DESC, Categorie.nom ASC;

-- 62b. Solution avec UNION (non-recommandé) :
SELECT Categorie.nom, pourHomme, COUNT(*), MIN(prix), MAX(prix), AVG(prix)
FROM Categorie
JOIN Vetement ON Vetement.idCategorie = Categorie.idCategorie
WHERE pourHomme = 1
GROUP BY Categorie.nom, pourHomme
UNION
SELECT Categorie.nom, pourHomme, COUNT(*), MIN(prix), MAX(prix), AVG(prix)
FROM Categorie
JOIN Vetement ON Vetement.idCategorie = Categorie.idCategorie
WHERE pourHomme = 0
GROUP BY Categorie.nom, pourHomme
ORDER BY pourHomme DESC, nom ASC;

-- 62c. Solution propre (fonction IF, Arrondi, etc) :
-- Explication de la fonction IF : https://www.w3resource.com/mysql/control-flow-functions/if-function.php
SELECT Categorie.nom, IF(vetement.pourHomme, 'pour homme', 'pour femme') AS genre, COUNT(*) AS nombre, MIN(prix) AS prixMin, MAX(prix) AS prixMax, ROUND(AVG(prix), 2) AS prixMoyen
FROM Categorie
JOIN Vetement ON Vetement.idCategorie = Categorie.idCategorie
GROUP BY Categorie.nom, IF(vetement.pourHomme, 'pour homme', 'pour femme')
ORDER BY IF(vetement.pourHomme, 'pour homme', 'pour femme') DESC, Categorie.nom ASC

-- 63. Lister le nombre de vêtement pour homme de chaque catégorie, du plus grand au plus petit nombre
-- 63a. Solution intuitive :
SELECT COUNT(*) AS nombre, C.idCategorie, C.nom
FROM Vetement V
JOIN Categorie C ON V.idCategorie = C.idCategorie
WHERE pourHomme = 1
GROUP BY C.idCategorie, C.nom
ORDER BY COUNT(*) DESC;

-- 63b. Solution alternative, sans WHERE :
SELECT SUM(pourHomme) AS nombre, C.idCategorie, C.nom
FROM Vetement V
JOIN Categorie C ON V.idCategorie = C.idCategorie
GROUP BY C.idCategorie, C.nom
ORDER BY SUM(pourHomme) DESC;

-- 64. Lister dans trois colonnes séparées le nombre de vêtement total, le nombre de vêtement pour homme et le nombre de vêtement pour femme de chaque catégorie, du plus grand au plus petit nombre total
-- 64a. Solution pratique :
SELECT C.idCategorie, C.nom,
	   COUNT(*) AS nombreTotal,
	   SUM(pourHomme) AS nbPourHomme,
	   SUM(NOT pourHomme) AS nbPourFemme
FROM Vetement V
JOIN Categorie C ON V.idCategorie = C.idCategorie
GROUP BY C.idCategorie, C.nom
ORDER BY COUNT(*) DESC;

-- 64b. Alternative avec COUNT :
-- Les valeurs NULL ne sont pas comptées par COUNT
SELECT C.idCategorie, C.nom,
	   COUNT(*) AS nombreTotal,
       COUNT(IF(pourHomme = 1, 'Choucroute', NULL)) AS nbPourHomme,
       COUNT(IF(pourHomme = 0, 'Cornemuse', NULL)) AS nbPourFemme
FROM Vetement V
JOIN Categorie C ON V.idCategorie = C.idCategorie
GROUP BY C.nom
ORDER BY COUNT(*) DESC;

-- 65. Trouver la (ou les) catégorie(s) ayant le plus de vêtements
SET @higherCount = (SELECT COUNT(*)
FROM Categorie C
JOIN Vetement V ON V.idCategorie = C.idCategorie
GROUP BY C.idCategorie
ORDER BY COUNT(*) DESC
LIMIT 1);

SELECT COUNT(*), C.nom
FROM Categorie C
JOIN Vetement V ON V.idCategorie = C.idCategorie
GROUP BY C.nom
HAVING COUNT(*) = @higherCount;

-- 66. Trouver les trois vêtements les plus chers de la base de données
SELECT *
FROM Vetement
ORDER BY prix DESC
LIMIT 3;

-- 67. Trouver les six vêtements les plus chers de la base de données (sauf les 3 premiers)
-- 67a. Alternative avec LIMIT et OFFSET
SELECT *
FROM Vetement
ORDER BY prix DESC
LIMIT 6 OFFSET 3; -- Principe de pagination

-- 67b. Alternative avec LIMIT et une virgule
SELECT *
FROM Vetement
ORDER BY prix DESC
LIMIT 3, 6; -- Même chose qu'au dessus : Principe de pagination

-- 68. Trouver un moyen de paiement au hasard dans la base de données
SELECT *
FROM MoyenPaiement
ORDER BY RAND()
LIMIT 1;

-- 69. (bonus) Ajouter deux commandes dans votre base de données (en variant les informations)
INSERT INTO Commande (numero, dateRealisation, idClient, idMoyenPaiement)
VALUES (365, '2021-03-20', 1, 2),
       (389, '2021-03-23', 2, 4);

-- 70. (bonus) Récupérer les commandes avec leur moyen de paiement et leur client (nom et prénom)
SELECT Commande.numero, Commande.dateRealisation, Client.nom, Client.prenom, MoyenPaiement.designation
FROM Commande
JOIN Client ON  Commande.idClient = Client.idClient
JOIN MoyenPaiement ON MoyenPaiement.idMoyenPaiement = Commande.idMoyenPaiement

-- 71. (bonus) Récupérer les commandes leur moyen de paiement, leur client (nom et prénom) et la commune du client
SELECT Commande.numero, Commande.dateRealisation, Client.nom, Client.prenom, MoyenPaiement.designation, Adresse.commune
FROM Commande
JOIN Client ON  Commande.idClient = Client.idClient
JOIN MoyenPaiement ON MoyenPaiement.idMoyenPaiement = Commande.idMoyenPaiement
JOIN Adresse ON Client.idAdresse = Adresse.idAdresse