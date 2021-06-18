/*
Ce document est � lire avec notepad++ (ou tout autre �diteur de code)

Requ�tes SQL concernant l'�tude de cas "Boutique de v�tements �coresponsables"

Ressources utiles pour produire des requ�tes SQL :
 - Cours PDF sur Moodle
 - Memento PDF sur Moodle
 - Site web sql.sh
 
Logiciels requis :
 - JMerise
 - Wamp
 
Op�rations pour mettre la base de donn�es sur pied :
 1. Sous JMerise, faire le MCD.
 2. Sous JMerise, convertir le MCD en MLD.
 3. Sous JMerise, enregistrer le script SQL sur le disque
 4. Avec l'ic�ne de Wamp : ouvrir PhpMyAdmin (clic gauche)
 5. Sous PhpMyAdmin, Se connecter (root, pas de mot de passe)
 6. Sous PhpMyAdmin, Cr�er une base de donn�e, nomm�e "veteco"
 7. Sous PhpMyAdmin, Aller dans "Importer"
 8. Sous PhpMyAdmin, Importer le fichier ".sql" sauvegard� au point 2
 9. Sous PhpMyAdmin, Ex�cuter l'import
 10. Sous PhpMyAdmin, Parcourir les retours pour s'assurer qu'il n'y a pas d'erreur.
 11. Sous PhpMyAdmin, Aller dans l'onglet SQL pour faire les requ�tes ci-apr�s.
*/

-- 01. Ins�rer la mention � Issu du commerce �quitable �
INSERT INTO Mention (libelle)
VALUES ('Issu du commerce �quitable'); /* 1 ligne ins�r�e */

-- 02. Ins�rer la mention � Fabriqu� en France �
INSERT INTO Mention (libelle)
VALUES ('Fabriqu� en France'); /* 1 ligne ins�r�e */

-- 03. Consulter les mentions stock�es en base de donn�es
SELECT *
FROM Mention;

-- 04. Ins�rer les mentions � Contons biologiques � et � Fibres recycl�s � d'un seul coup
INSERT INTO Mention (libelle)
VALUES ('Contons biologiques'),
       ('Fibres recycl�s');  /* 2 lignes ins�r�es */

-- 05. Consulter les mentions stock�es en base de donn�es et les trier par ordre alphab�tique
SELECT * 
FROM Mention
ORDER BY libelle;

-- 06. Corriger 'Contons biologiques' en 'Cotons biologiques' dans la table Mention (mise � jour)
UPDATE Mention
SET libelle = 'Cotons biologiques'
WHERE libelle = 'Contons biologiques';  /* 1 ligne affect�e */

-- 07. Corriger 'Fibres recycl�s' en 'Fibres recycl�es' dans la table Mention (mise � jour)
UPDATE Mention
SET libelle = 'Fibres recycl�es'
WHERE libelle = 'Fibres recycl�s';  /* 1 ligne affect�e */

-- 08. Ins�rer, en une seule requ�te, les cat�gories � Pantalon �, � T-shirt �,
--     � Chemise �, � Short �, � Jupe �, � Chapeau �, � Chaussure � et � Chaussette �
INSERT INTO Categorie (nom) 
VALUES ('Pantalon'), ('T-shirt'), ('Chemise'), ('Short'), ('Jupe'), ('Chapeau'), ('Chaussure'), ('Chaussette');

-- 09. Consulter les cat�gories stock�es en base de donn�es et les trier par ordre alphab�tique
SELECT *
FROM Categorie
ORDER BY nom;

-- 10. Ins�rer, en une seule requ�te les moyens de paiement de l'�nonc�
INSERT INTO MoyenPaiement (designation)
VALUES ('Carte Bancaire'), ('Virement Bancaire'), ('Ch�que'), ('Paypal');

-- 11. Consulter les moyens de paiement et les trier par ordre alphab�tique
SELECT *
FROM MoyenPaiement
ORDER BY designation;

-- 12. Ins�rer un client qui correspond � soi-m�me (sans adresse postale)
-- NOTE : Pour ne pas mettre d'adresse, il faudra aller autoriser les valeurs NULL sur idAdresse auparavant,
-- dans PhpMyAdmin (modification de structure, cocher NULL)
-- 12a. Alternative en sp�cifiant les valeurs nulles :
INSERT INTO Client (nom, prenom, estHomme, numTel, adrMail, idadresse)
VALUES ('Dufils', 'Yohan', 1, '0605040302', 'ydufils@humanbooster.com', NULL);

-- 12b. Alternative sans sp�cifier les valeurs nulles :
INSERT INTO Client (nom, prenom, estHomme, numTel, adrMail)
VALUES ('Dufils', 'Yohan', 1, '0605040302', 'ydufils@humanbooster.com');

-- 13. S�lectionner tous les clients
SELECT *
FROM Client;

-- 14. COLLECTIF : Chacun ins�re deux autres clients : ses voisins de gauche et de droite (en une seule requ�te)
INSERT INTO Client (nom, prenom, estHomme, numTel, adrMail)
VALUES ('nom1', 'prenom', 1, 'numTel', 'adrMail'),
       ('nom2', 'prenom', 1, 'numTel', 'adrMail');

-- 15. Ins�rer un client fictif, correspondant � un personnage de fiction d'une s�rie ou d'un film que vous avez regard� (en ne lui sp�cifiant aucun num�ro de t�l�phone, aucun e-mail et aucune adresse).
-- NOTE : si numTel et adrMail sont non-nullable, les rendre NULLABLE au pr�alable, dans PhpMyAdmin (modification de structure, cocher NULL)
-- 15a. Alternative en sp�cifiant les valeurs nulles :
INSERT INTO Client (nom, prenom, estHomme, numTel, adrMail)
VALUES ('McFly', 'Marty', 1, NULL, NULL);

-- 15b. Alternative sans sp�cifier les valeurs nulles :
INSERT INTO Client (nom, prenom, estHomme)
VALUES ('McFly', 'Marty', 1);

-- 16. S�lectionner les clients qui sont des hommes
SELECT *
FROM Client
WHERE estHomme = 1;

-- 17. Ins�rer l'adresse postale du client correspondant � soi-m�me
-- Note : si ligne2 et ligne3 sont non-nullable, les rendre NULLABLE au pr�alable, dans PhpMyAdmin (modification de structure, cocher NULL)
-- Note : Il n'y a pas d'auto-incr�ment : on d�cide de l'ID nous m�me
-- 17a. Alternative en sp�cifiant les valeurs nulles :
INSERT INTO Adresse (idAdresse, ligne1, ligne2, ligne3, codePostal, commune)
VALUES (42, '4 rue Charles de Gaulle', NULL, NULL, '42000', 'Saint-�tienne');

-- 17b. Alternative sans sp�cifier les valeurs nulles :
INSERT INTO Adresse (idAdresse, ligne1, codePostal, commune)
VALUES (42, '4 rue Charles de Gaulle', '42000', 'Saint-�tienne');

-- 18. S�lectionner toutes les adresses
SELECT *
FROM Adresse;

-- 19. Affecter l'adresse nouvellement cr��e au bon client (soi-m�me)
-- Au pr�alable : il faut connaitre son idClient et son idAdresse
UPDATE Client
SET idAdresse = 42
WHERE idClient = 1; /* L'id doit correspondre � votre client. Possible d'utilisez nom = 'NOMFAMILLE', mais ceci impact tous les client ayant ce nom de famille */

-- 20. Ins�rer les adresses des clients correspondant � ses voisins de gauche et de droite (en une seule requ�te)
INSERT INTO Adresse (idAdresse, ligne1, ligne2, ligne3, codePostal, commune)
VALUES (2, '125 avenue des lilas', NULL, NULL, '69200', 'Venissieux'),
	   (3, 'Lotissement du grand ch�ne', '45 rue des cerisiers', NULL, '69100', 'Villeurbanne');

-- 21. Affecter les adresses nouvellement cr��es aux clients correspondants (deux requ�tes)
-- Au pr�alable : il faut connaitre les idClient et les idAdresse
UPDATE Client
SET idAdresse = 2
WHERE idClient = 2; /* L'id doit correspondre au client voulu. Possible d'utilisez nom = 'NOMFAMILLE', mais ceci impacte tous les client ayant ce nom de famille */

UPDATE Client
SET idAdresse = 3
WHERE idClient = 3; /* L'id doit correspondre au client voulu. Possible d'utilisez nom = 'NOMFAMILLE', mais ceci impacte tous les client ayant ce nom de famille */

-- 22. S�lectionner les clients et leur adresse
SELECT *
FROM Client
JOIN Adresse ON Client.idAdresse = Adresse.idAdresse;

-- 23. S�lectionner les clients et leur adresse et les trier par ordre alphab�tique du nom de famille
SELECT *
FROM Client
JOIN Adresse ON Client.idAdresse = Adresse.idAdresse
ORDER BY nom;

-- 24. S�lectionner les clients et leur adresse ayant votre nom de famille
SELECT * 
FROM Client
JOIN Adresse ON Client.idAdresse = Adresse.idAdresse
WHERE nom = 'DUFILS';

-- 25. S�lectionner les clients et leur adresse n'ayant PAS votre nom de famille
SELECT * 
FROM Client
JOIN Adresse ON Client.idAdresse = Adresse.idAdresse
WHERE nom != 'DUFILS'; /* ou nom <> 'DUFILS'   ou m�me    WHERE NOT nom = 'DUFILS' */

-- 26. S�lectionner les clients (hommes seulement) et leur adresse
SELECT *
FROM Client
JOIN Adresse ON Client.idAdresse = Adresse.idAdresse
WHERE estHomme = 1;

-- 27. S�lectionner les clients (femmes seulement) et leur adresse
SELECT *
FROM Client
JOIN Adresse ON Client.idAdresse = Adresse.idAdresse
WHERE estHomme != 1; /* ou estHomme = 0 */

-- 28. Lister les clients et leur adresse, m�mes s'ils n'ont pas d'adresse
SELECT *
FROM Client
LEFT JOIN Adresse ON Client.idAdresse = Adresse.idAdresse;

-- 29. S�lectionner tous les clients (hommes seulement) et leur adresse n'ayant PAS votre nom de famille, m�me s'ils n'ont pas d'adresse
SELECT *
FROM Client
LEFT JOIN Adresse ON Client.idAdresse = Adresse.idAdresse 
WHERE estHomme = 1
AND nom != 'DUFILS';

-- 30. S�lectionner les clients habitant � 'Villeurbanne' et leur adresse
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

-- 34. Supprimez les adresses postales situ�es � Villeurbanne (deux requ�tes)
-- 34a. Approche de suppression :
-- D'abord on supprime les clients en indiquant le nom de la table apr�s le "DELETE"
DELETE Client 
FROM Client
JOIN Adresse ON Client.idClient = Adresse.idAdresse
WHERE commune = 'Villeurbanne';

-- Ensuite, on supprime les adresses
DELETE 
FROM Adresse
WHERE commune = 'Villeurbanne';

-- 34b. Approche de mise � jour
-- D'abord on efface les idAdresse des clients habitants � Villeurbanne :
-- Choix 1 (sous requ�te dans un IN) :
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

-- Bon � savoir, dans l'onglet "Vue relationnelle" de PhpMyAdmin,
-- il est possible d'automatiser l'une des approche ci-dessus,
-- avec le ON DELETE CASADE ou ON DELETE SET NULL


-- 35. Ajouter un v�tement dans la base, nomm� 'Pantaloon bleu clair' avec la description
--     '�l�gant pantalon bleu clair qui vous ira � merveille', pour homme, 25,95 �, appartenant � la cat�gorie 'Pantalon'
-- Au pr�alable : il faut connaitre l'idCategorie qui correspond � Pantalon
-- NOTE : La description peut parfois d�passer le nombre de caract�res maximum : chez certain, ceci causera une troncatures : chez d'autres un message d'erreur : une modification de structure sur la taille de la donn�e doit alors �tre faire dans phpMyAdmin
INSERT INTO Vetement (nom, description, prix, pourHomme, idCategorie)
VALUES ('Pantaloon bleu fonc�', '�l�gant pantalon bleu fonc� qui vous ira � merveille', 25.95, 1, 1);

-- 36. COLLECTIF : En une seule requ�te, ajouter environ 5 v�tements dans la base de donn�es (utiliser des noms 
--     parlants & s�rieux, s�lectionner plusieurs cat�gories pertinentes et adapt�e au v�tement, choisir plusieurs prix (avec centimes parfois), varier homme et femme)
-- Astuce : pour utiliser une apostrophe, il faut la doubler
-- Rappel : La colonne "pourHomme" est un bool�en, donc 1 = pour homme, et 0 = pas pour homme
INSERT INTO Vetement (nom, description, prix, pourHomme, idCategorie)
VALUES ('Chemise hawa�enne', 'Par� pour les vacances !', 24.50, 1, 3),
       ('Short couleur sable', 'Id�ale pour la plage !', 18.90, 1, 4),
       ('Chapeau de Poudlard', 'Chapeau magique : attention', 135.50, 1, 6),
       ('Chaussettes trou�es', 'Et encore : d''occasion', 5.99, 1, 8),
       ('T-shirt-pyjama', 'Pas styl�, mais confortable', 17.49, 0, 2);

-- 37. Compter le nombre de v�tements dans la table v�tement
SELECT COUNT(*)
FROM Vetement;

-- 38. S�lectionner tous les v�tements et leur cat�gorie
SELECT *
FROM Vetement 
JOIN Categorie ON Vetement.idCategorie = Categorie.idCategorie;

-- 39. S�lectionner le nom de v�tement, la description, le prix, et la nom de cat�gorie des v�tements
SELECT Vetement.nom, description, prix, Categorie.nom
FROM Vetement
JOIN Categorie ON Vetement.idCategorie = Categorie.idCategorie;

-- 40. S�lectionner les v�tements de la cat�gorie 'Pantalon' (sans utiliser l'ID de la cat�gorie)
-- 40a. Variante sans jointure, avec sous-requ�te :
SELECT *
FROM Vetement
WHERE idCategorie = (SELECT idCategorie
					 FROM Categorie
					 WHERE nom = 'Pantalon');

-- 40b. Variante sans jointure, avec sous-requ�te et avec variable :
SET @idCateg = (SELECT idCategorie
				FROM Categorie
				WHERE nom = 'Pantalon');

SELECT *
FROM Vetement
WHERE Vetement.idCategorie = @idCateg;

-- 40c. Variante avec jointure, sans sous-requ�te :
SELECT *
FROM Vetement
JOIN Categorie ON Vetement.idCategorie = Categorie.idCategorie
WHERE Categorie.nom = 'Pantalon';

-- 41. S�lectionner les v�tements et leur cat�gorie de la cat�gorie 'Chemise' dont le prix est inf�rieur � 40 �
SELECT *
FROM Vetement
JOIN Categorie ON Vetement.idCategorie = Categorie.idCategorie
WHERE Categorie.nom = 'Chemise'
AND prix < 40;
-- D'autres variantes sont possibles, conform�ment � la requ�te pr�c�dente

-- 42. S�lectionner les v�tements dont le prix est entre 30 � (inclu) et 50 � (inclu)
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
--	   (= s�lectionner les v�tements et leur cat�gorie de la cat�gorie 'Pantalon'
--        + de la cat�gorie 'Short' + de la cat�gorie 'Jupe')
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

-- 43c. Variante avec des UNION (non-recommand�) :
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

-- 44. S�lectionner tous les v�tements et leur cat�gorie sauf les chaussettes, les chaussures et les chapeaux
-- 44a. Variante avec NOT IN :
SELECT *
FROM Vetement
JOIN Categorie ON Vetement.idCategorie = Categorie.idCategorie
WHERE Categorie.nom NOT IN ('Chaussette', 'Chaussure', 'Chapeau');

-- 44b. Variante avec LIKE (non-recommand� dans ce cas de figure) :
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

-- 44d. Certains moteurs de bases de donn�es supportent des variantes avec EXCEPT ou MINUS
SELECT  *
FROM Vetement
JOIN Categorie ON Vetement.idCategorie = Categorie.idCategorie
EXCEPT
SELECT *
FROM Vetement
JOIN Categorie ON Vetement.idCategorie = Categorie.idCategorie
WHERE Categorie.nom IN ('Chaussette', 'Chaussure', 'Chapeau');

-- 45. ...et les trier par ordre alphab�tique du nom
ORDER BY Vetement.nom;

-- 46. ...et les trier par prix d�croissant (du plus grand au plus petit)
ORDER BY Vetement.prix DESC;

-- 47. ...et les trier par prix croissant (du plus petit au plus grand)
ORDER BY Vetement.prix ASC;

-- 48. ...et les trier par prix d�croissant, puis par nom
ORDER BY Vetement.prix DESC, Vetement.nom;

-- 49. Compter le nombre de moyens de paiement
SELECT COUNT(*)
FROM MoyenPaiement;

-- 50. Compter le nombre de v�tements de la cat�gorie 'Pantalon'
SELECT COUNT(*)
FROM Vetement
JOIN Categorie ON Vetement.idCategorie = Categorie.idCategorie
WHERE Categorie.nom = 'Pantalon';

-- 51. Trouver le prix le moins �lev� parmi tout les v�tements
SELECT MIN(prix)
FROM Vetement;
-- Il existe une variante avec ORDER BY prix ASC et LIMIT 1

-- 52. Trouver le prix le plus �lev� parmi tout les v�tements
SELECT MAX(prix)
FROM Vetement;
-- Il existe une variante avec ORDER BY prix DESC et LIMIT 1

-- 53. Trouver le prix le plus �lev� parmi les v�tements de la cat�gorie 'Pantalon'
SELECT MAX(prix)
FROM Vetement
JOIN Categorie ON Vetement.idCategorie = Categorie.idCategorie
WHERE Categorie.nom = 'Pantalon';

-- 54. Trouver le prix moyen des v�tements en arrondissant ce prix � 2 chiffres apr�s la virgule
SELECT ROUND(AVG(prix), 2)
FROM Vetement;

-- 55. Trouver le prix moyen des v�tements en arrondissant ce prix � 2 chiffres apr�s la virgule en intitulant la colonne "prixMoyen" (alias)
-- 55a. Avec AS :
SELECT ROUND(AVG(prix), 2) AS prixMoyen
FROM Vetement;

-- 55b. Sans AS :
SELECT ROUND(AVG(prix), 2) prixMoyen
FROM Vetement;

-- 56. Trouver le prix le plus faible, le prix le plus �lev� et le prix moyen des v�tements en une seule requ�te
-- 56a. Sans alias, sans arrondi :
SELECT MIN(prix), MAX(prix), AVG(prix)
FROM Vetement;

-- 56b. Plus propre :
SELECT MIN(prix) prixMinimal, MAX(prix) prixMaximal, ROUND(AVG(prix), 2) prixMoyen
FROM Vetement;

-- 57. Trouver le(s) v�tement(s) ayant le prix le plus �lev�
-- 57a. Variante avec une sous-requ�te :
SELECT *
FROM Vetement
WHERE prix = (SELECT MAX(prix) FROM Vetement);

-- 57b. Solution avec une sous-requ�te et une variable :
SET @prixMax = (SELECT MAX(prix) FROM Vetement);

SELECT *
FROM Vetement
WHERE prix = @prixMax;

-- 57c. Solution avec tri et limite (pr�sentant UN DES v�tements avec le prix le plus �lev�) :
SELECT *
FROM Vetement
ORDER BY prix DESC
LIMIT 1;

-- 58. Lister les v�tements dont le prix est au dessus de la moyenne
-- 58a. Variante avec une sous-requ�te :
SELECT *
FROM Vetement
WHERE prix > (SELECT AVG(prix) FROM Vetement);

-- 58b. Solution avec une sous-requ�te et une variable :
SET @prixMoy = (SELECT AVG(prix) FROM Vetement);

SELECT *
FROM Vetement
WHERE prix > @prixMoy;

-- 59. Trouver le prix total de tous les v�tements
SELECT SUM(prix)
FROM Vetement;

-- 60. Lister le nombre de v�tement de chaque cat�gorie (cat�gorie par cat�gorie)
SELECT C.idCategorie, C.nom, COUNT(*) AS nombre
FROM Vetement V /* On utilise l'alias V pour d�signer la table Vetement */
JOIN Categorie C ON V.idCategorie = C.idCategorie /* On utilise l'alias C pour d�signer la table Categorie */
GROUP BY C.idCategorie, C.nom;

-- 61. Lister le nombre de v�tement, ainsi que le prix le plus faible constat�, le prix le plus �lev� constat� et le prix moyen, cat�gorie par cat�gorie
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

-- 62. Lister le nombre de v�tement, ainsi que le prix le plus faible constat�, le prix le plus �lev� constat� et le prix moyen, cat�gorie par cat�gorie en distinguant les v�tements pour homme des v�tements pour femme. Les v�tements pour homme apparaitront avant les v�tements pour femme. En deuxi�me lieu, les cat�gories seront affich�es par ordre alphab�tique.
-- 62a. Solution avec GROUP BY sur deux colonnes :
SELECT Categorie.nom, pourHomme, COUNT(*), MIN(prix), MAX(prix), AVG(prix)
FROM Categorie
JOIN Vetement ON Vetement.idCategorie = Categorie.idCategorie
GROUP BY Categorie.nom, pourHomme
ORDER BY pourHomme DESC, Categorie.nom ASC;

-- 62b. Solution avec UNION (non-recommand�) :
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

-- 63. Lister le nombre de v�tement pour homme de chaque cat�gorie, du plus grand au plus petit nombre
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

-- 64. Lister dans trois colonnes s�par�es le nombre de v�tement total, le nombre de v�tement pour homme et le nombre de v�tement pour femme de chaque cat�gorie, du plus grand au plus petit nombre total
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
-- Les valeurs NULL ne sont pas compt�es par COUNT
SELECT C.idCategorie, C.nom,
	   COUNT(*) AS nombreTotal,
       COUNT(IF(pourHomme = 1, 'Choucroute', NULL)) AS nbPourHomme,
       COUNT(IF(pourHomme = 0, 'Cornemuse', NULL)) AS nbPourFemme
FROM Vetement V
JOIN Categorie C ON V.idCategorie = C.idCategorie
GROUP BY C.nom
ORDER BY COUNT(*) DESC;

-- 65. Trouver la (ou les) cat�gorie(s) ayant le plus de v�tements
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

-- 66. Trouver les trois v�tements les plus chers de la base de donn�es
SELECT *
FROM Vetement
ORDER BY prix DESC
LIMIT 3;

-- 67. Trouver les six v�tements les plus chers de la base de donn�es (sauf les 3 premiers)
-- 67a. Alternative avec LIMIT et OFFSET
SELECT *
FROM Vetement
ORDER BY prix DESC
LIMIT 6 OFFSET 3; -- Principe de pagination

-- 67b. Alternative avec LIMIT et une virgule
SELECT *
FROM Vetement
ORDER BY prix DESC
LIMIT 3, 6; -- M�me chose qu'au dessus : Principe de pagination

-- 68. Trouver un moyen de paiement au hasard dans la base de donn�es
SELECT *
FROM MoyenPaiement
ORDER BY RAND()
LIMIT 1;

-- 69. (bonus) Ajouter deux commandes dans votre base de donn�es (en variant les informations)
INSERT INTO Commande (numero, dateRealisation, idClient, idMoyenPaiement)
VALUES (365, '2021-03-20', 1, 2),
       (389, '2021-03-23', 2, 4);

-- 70. (bonus) R�cup�rer les commandes avec leur moyen de paiement et leur client (nom et pr�nom)
SELECT Commande.numero, Commande.dateRealisation, Client.nom, Client.prenom, MoyenPaiement.designation
FROM Commande
JOIN Client ON  Commande.idClient = Client.idClient
JOIN MoyenPaiement ON MoyenPaiement.idMoyenPaiement = Commande.idMoyenPaiement

-- 71. (bonus) R�cup�rer les commandes leur moyen de paiement, leur client (nom et pr�nom) et la commune du client
SELECT Commande.numero, Commande.dateRealisation, Client.nom, Client.prenom, MoyenPaiement.designation, Adresse.commune
FROM Commande
JOIN Client ON  Commande.idClient = Client.idClient
JOIN MoyenPaiement ON MoyenPaiement.idMoyenPaiement = Commande.idMoyenPaiement
JOIN Adresse ON Client.idAdresse = Adresse.idAdresse