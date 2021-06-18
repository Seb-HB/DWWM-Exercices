-- B1. Insérez, en une seule requête, les 6 auditeurs mentionnés dans l’énoncé
INSERT INTO Auditeur (civilite, prenom, nom)
VALUES ('M.','Antoine','Bardet'),
	('Mme','Christelle','Delorme'),
	('M.','Éric','Foulard'),
	('M.','Gérard','Hoquart'),
	('Mme','Isabelle','Jacquet'),
	('M.','Kévin','Lopez');

-- B2. Insérez, en une seule requête, les 4 catégories de frais mentionnées dans l’énoncé
INSERT INTO Categorie (libelle)
VALUES ('Restaurant'),
	('Hôtel'),
	('Trajet'),
	('Matériel');

-- B3. Importez la procédure stockée d’ajout des industries fournie sur Moodle,
--     et exécutez-là.
BEGIN
 SET @maxi = 300 + RAND() * 100; -- Nombre aléatoire compris entre 300 et 400
 SET @i = 0;
  WHILE @i < @maxi DO
   SET @numeroSiretTemp = CONV(FLOOR(RAND() * 99999999999999), 20, 36); -- Le numéro de Siret doit être une suite de caractères aléatoire
   SET @raisonSocialeTemp = CONV(FLOOR(RAND() * 99999999999999), 20, 36); -- La raison sociale doit être une suite de caractères aléatoire
   INSERT INTO Industrie (numeroSiret, raisonSociale)
   VALUES (@numeroSiretTemp, @raisonSocialeTemp);
   SET @i = @i + 1;
  END WHILE;
  SELECT CONCAT(@i, ' industries ajoutées') AS Resultat;
END

-- B4. Importez la procédure stockée d’ajout des audits fournie sur Moodle,
--     et exécutez-là.
BEGIN
 DECLARE ajoutTermine BIT DEFAULT 0;
 DECLARE idInd INT;
 DECLARE cur CURSOR FOR SELECT idIndustrie FROM Industrie;
 DECLARE CONTINUE HANDLER FOR NOT FOUND SET ajoutTermine = 1;
 SET @totalCount = 0;
 SET @anneeCourante = YEAR(CURDATE());
 SET @anneeDebut = @anneeCourante - 2;
 OPEN cur;
  FETCH cur INTO idInd;
  WHILE ajoutTermine != 1 DO
   SET @nbAudit = FLOOR(1 + RAND() * 4); -- Nombre aléatoire compris entre 1 et 4
   SET @moisMax = 12 / @nbAudit; -- Mois le plus élevé pouvant accueillir le premier audit
   SET @annee = @anneeDebut;
   SET @mois = FLOOR(1 + RAND() * @moisMax); -- Mois aléatoire du premier audit
   WHILE @annee <= @anneeCourante DO
    SET @moisTemp = @mois;
    SET @i = 0;
    WHILE @i < @nbAudit DO
     SET @dateDebutTemp = DATE(CONCAT_WS('-', @annee, @moisTemp, FLOOR(1 + RAND() * 28))); -- Date de l'audit reconstruite
	 IF @dateDebutTemp < CURDATE() THEN
      SET @dureeTemp = FLOOR(1 + RAND() * 4.4); -- Nombre aléatoire compris entre 1 et 5, avec une probabilité faible pour 5
      SET @coutJournalierTemp = FLOOR(20 + RAND() * 60) * 50; -- Nombre aléatoire compris entre 1000 et 3000 par cran de 50
      SET @idAuditeurTemp = (SELECT idAuditeur FROM Auditeur ORDER BY RAND() LIMIT 1); -- L’auditeur est choisi aléatoirement parmi les auditeurs
      INSERT INTO Audit (dateDebut, duree, coutJournalier, idIndustrie, idAuditeur)
      VALUES (@dateDebutTemp, @dureeTemp, @coutJournalierTemp, idInd, @idAuditeurTemp);
	  SET @totalCount = @totalCount + 1;
	  /*SELECT CONCAT(idInd, ' -> ', @dateDebutTemp, ' (', @dureeTemp, ' jours) ', @coutJournalierTemp, ' €') AS Resultat;*/
	 END IF;
	 SET @moisTemp = @moisTemp + @moisMax; -- Les audits ont lieu à intervalles réguliers
     SET @i = @i + 1;
    END WHILE;
    SET @annee = @annee + 1;
   END WHILE;
   FETCH cur INTO idInd;
  END WHILE;
 CLOSE cur;
 SELECT CONCAT(@totalCount, ' audits ajoutées') AS Resultat;
END

-- B5. Importez la procédure stockée d’ajout des frais fournie sur Moodle,
--     et exécutez-là.
BEGIN
 SET @maxi = (SELECT FLOOR(SUM(duree) * 1.5) FROM Audit); -- On ajoute 1,5x plus de frais que de jour d'audit au total
 SET @i = 0;
  WHILE @i < @maxi DO
   SET @dateRealisationTemp = CURDATE() - INTERVAL RAND() * TIMESTAMPDIFF(day, '2018-01-01', CURDATE()) DAY; -- La date doit être aléatoire et comprise entre le 1er janvier 2018 et aujourd’hui
   SET @montantTemp = 10 + RAND() * (120 - 10); -- Le montant doit être aléatoire est compris entre 10 et 120 €
   SET @estRembourseTemp = IF(RAND() < 0.5, 1, 0); -- Le frais doit être remboursé dans 50 % des cas
   SET @idCategorieTemp = (SELECT idCategorie FROM Categorie ORDER BY RAND() LIMIT 1); -- La catégorie est choisie aléatoirement parmi les catégories de frais existants
   SET @dureeTemp = (SELECT ELT(FLOOR(1 + RAND() * 12), 1, 2, 2, 3, 3, 3, 4, 4, 4, 4, 5, 5));
   SET @idAuditTemp = (SELECT idAudit FROM Audit WHERE duree = @dureeTemp ORDER BY RAND() LIMIT 1); -- L’audit est choisi aléatoirement parmi les audits
   INSERT INTO Frais (dateRealisation, montant, estRembourse, idCategorie, idAudit)
   VALUES (@dateRealisationTemp, @montantTemp, @estRembourseTemp, @idCategorieTemp, @idAuditTemp);
   SET @i = @i + 1;
  END WHILE;
  SELECT CONCAT(@i, ' frais ajoutés') AS Resultat;
END

-- C1. Listez les frais non-remboursés, avec pour chacun d’eux leur catégorie
--     (triés du plus grand au plus petit montant). Le montant des frais sera suivi de l’unité.
SELECT F.dateRealisation AS Date, CONCAT(F.montant, ' €') AS Montant, C.libelle AS Catégorie
FROM Frais F
JOIN Categorie C ON F.idCategorie = C.idCategorie
WHERE estRembourse = 0
ORDER BY F.montant DESC;

-- C2. Listez les audits d’une durée de 2 ou 3 jours, avec pour chacun d’eux leur
--     auditeur et leur industrie (triés de la plus ancienne à la plus récente date de début).
SELECT I.numeroSiret AS "Numéro de SIRET", I.raisonSociale AS "Raison sociale",
       Ar.nom AS "Nom", Ar.prenom AS "Prénom", A.dateDebut AS "Date", A.duree AS "Durée"
FROM Audit A
JOIN Auditeur Ar ON A.idAuditeur = Ar.idAuditeur
JOIN Industrie I ON A.idIndustrie = I.idIndustrie
WHERE A.duree IN (2, 3)
ORDER BY A.dateDebut;

-- C3. Obtenez la moyenne des montants des frais, arrondie à 2 chiffres après la virgule.
SELECT ROUND(AVG(montant), 2) AS "Moyenne des montants des frais"
FROM Frais;

-- C4. Obtenez la moyenne des montants des frais pour chaque catégorie de frais
-- (triés du plus grand au plus petit). Ce montant sera arrondi comme précédemment et suivi de l’unité.
SELECT C.libelle, CONCAT(ROUND(AVG(montant), 2), ' €') AS "Montant moyen"
FROM Frais F
JOIN Categorie C ON F.idCategorie = C.idCategorie
GROUP BY C.libelle
ORDER BY AVG(F.montant) DESC;

-- C5. Obtenez le nombre de frais réalisés par chaque auditeur cette année (tri descendant).
SELECT Ar.prenom, Ar.nom, COUNT(*) AS "Nombre des frais"
FROM Frais F
JOIN Audit A ON F.idAudit = A.idAudit
JOIN Auditeur Ar ON A.idAuditeur = Ar.idAuditeur
WHERE YEAR(F.dateRealisation) = YEAR(CURDATE())
GROUP BY Ar.prenom, Ar.nom
ORDER BY COUNT(*) DESC;

-- C6. Listez les frais de catégorie « Restaurant » d’un montant de plus de 80 €,
-- n’ayant pas encore été remboursés
-- Solution avec IN :
SELECT *
FROM Frais
WHERE montant > 80
AND estRembourse = 0
AND idCategorie IN
(
 SELECT idCategorie
 FROM Categorie
 WHERE libelle = 'Restaurant'
);

-- Solution avec JOIN :
SELECT *
FROM Frais F
JOIN Categorie C on F.idCategorie = C.idCategorie
WHERE F.montant > 80
AND F.estRembourse = 0
AND C.libelle = 'Restaurant';

-- C7. Supprimez ces frais
-- Solution avec IN :
DELETE
FROM Frais
WHERE montant > 80
AND estRembourse = 0
AND idCategorie IN
(
 SELECT idCategorie
 FROM Categorie
 WHERE libelle = 'Restaurant'
);

-- Solution avec JOIN :
DELETE F
FROM Frais F
JOIN Categorie C on F.idCategorie = C.idCategorie
WHERE F.montant > 80
AND F.estRembourse = 0
AND C.libelle = 'Restaurant';

-- C8. Choisissez une industrie au hasard dans votre base de données :
SELECT idIndustrie
FROM Industrie
ORDER BY RAND()
LIMIT 1; -- Retourne 42

-- C9. Mettez-la à jour en y indiquant les informations données en exemple dans l’énoncé.
UPDATE Industrie
SET numeroSiret = '45398879200058', raisonSociale = 'Caloon SAS'
WHERE idIndustrie = 42;

-- C10. Obtenez le montant total des frais réalisés de chaque audit de cette industrie l’année dernière.
SELECT A.idAudit, SUM(F.montant)
FROM Frais F
JOIN Audit A ON F.idAudit = A.idAudit
WHERE A.idIndustrie = 42
AND YEAR(dateDebut) = YEAR(CURDATE()) - 1
GROUP BY A.idAudit;

-- C11. Obtenez le montant qu’ont rapportés chaque chaque audit réalisé dans cette industrie l’année dernière.
SELECT idAudit, duree * coutJournalier AS "Montant rapporté"
FROM Audit
WHERE idIndustrie = 42
AND YEAR(dateDebut) = YEAR(CURDATE()) - 1;

-- C12. Obtenez le pourcentage de rentabilité de chaque audit de cette industrie l’année dernière
SELECT A.idAudit, SUM(F.montant) AS "Montant des frais", duree * coutJournalier AS "Montant rapporté", 100 - SUM(F.montant) / (duree * coutJournalier) * 100 AS "Pourcentage de rentabilité"
FROM Frais F
JOIN Audit A ON F.idAudit = A.idAudit
WHERE A.idIndustrie = 42
AND YEAR(dateDebut) = YEAR(CURDATE()) - 1
GROUP BY A.idAudit

-- C13. Listez les 10 audits ayant le pourcentage de rentabilité le plus faible l’année dernière. Vous ferrez apparaitre le nom des industries concernées.
SELECT A.idAudit, I.raisonSociale, 100 - SUM(F.montant) / (duree * coutJournalier) * 100 AS "Pourcentage de rentabilité"
FROM Frais F
JOIN Audit A ON F.idAudit = A.idAudit
JOIN Industrie I ON I.idIndustrie = A.idIndustrie
WHERE YEAR(dateDebut) = YEAR(CURDATE()) - 1
GROUP BY A.idAudit, I.raisonSociale
ORDER BY 100 - SUM(F.montant) / (duree * coutJournalier) * 100
LIMIT 10;