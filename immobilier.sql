CREATE DATABASE immobilier;

CREATE Table logement(idlogement INT(6) ZEROFILL AUTO_INCREMENT PRIMARY KEY NOT NULL, type VARCHAR(20), ville VARCHAR(50), prix INT(10),superficie int(10),catégorie VARCHAR(50));

CREATE Table agence (idagence int(6) ZEROFILL AUTO_INCREMENT PRIMARY KEY NOT NULL , nom VARCHAR(50), adresse VARCHAR(50) UNIQUE);

CREATE Table personne (idpersonne INT(6) AUTO_INCREMENT NOT NULL PRIMARY KEY,nom VARCHAR(100),prenom VARCHAR(100),email VARCHAR(50) UNIQUE);

CREATE Table logement_agence (idlogementAgence int(5) AUTO_INCREMENT NOT NULL PRIMARY KEY,idAgence INT(6) ZEROFILL NOT NULL, idlogement INT(6) ZEROFILL NOT NULL, frais INT(6),
CONSTRAINT fk_idagence FOREIGN key(idAgence)REFERENCES agence(idagence),
CONSTRAINT fk_idlogement FOREIGN KEY (idlogement)REFERENCES logement(idlogement));

CREATE Table logement_personne (idLogementPersonne int (6) AUTO_INCREMENT NOT NULL PRIMARY KEY, idpersonne int(6) NOT NULL, idlogement_p INT(6) ZEROFILL NOT NULL,
CONSTRAINT fk_idpersonne FOREIGN KEY (idpersonne) REFERENCES personne(idpersonne),
CONSTRAINT fk_idlogement_p FOREIGN KEY (idlogement_p) REFERENCES logement(idlogement));

CREATE TABLE demande(idDemande INT(6) AUTO_INCREMENT NOT NULL PRIMARY KEY, idpersonne_d int(6) NOT NULL, types VARCHAR(50),ville VARCHAR(50),budget int(10),superficie int(10), catégorie VARCHAR(50),
CONSTRAINT fk_idpersonne_d FOREIGN KEY (idpersonne_d)REFERENCES personne(idpersonne));

/*2- creer trigger-*/
DELIMITER //
CREATE  TRIGGER ctrl_email BEFORE INSERT ON personne
 FOR EACH ROW
    BEGIN
        IF NEW.email NOT LIKE "%@%.__%"
        THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "mauvais format de l'email";
        END IF;
    END //
DELIMITER ;

DROP Trigger ctrl_email;

/*procédures stockées*/

DELIMITER //
CREATE PROCEDURE insert_logement()
BEGIN
INSERT INTO logement (type,ville,prix,superficie,catégorie) VALUES
('appartement','paris','185000','61','vente'),
('appartement','paris','115000','15','vente'),
('maison','paris','510000','130','vente'),
('appartement','bordeaux','550','17','location'),
('appartement','lyon','420','14','location'),
('appartement','paris','16000','40','vente'),
('appartement','paris','670','35','location'),
('appartement','lyon','110000','16','vente'),
('appartement','bordeaux','161500','33','vente'),
('appartement','paris','202000','90','vente');
END//

DELIMITER ;

CALL insert_logement();

DROP PROCEDURE insert_logement;
/**********************************************/
DELIMITER //
CREATE PROCEDURE insert_agence()
BEGIN
INSERT INTO agence (nom,adresse) VALUES
('logic-immo','www.logic-immo.com'),
('century21','rue century'),
('laforet','rue laforet'),
('fnaim','rue fnaim'),
('orpi','rue orpi'),
('foncia','rue foncia'),
('guy-hoquet','rue guy-hoquet'),
('seloger','www.seloger.com'),
('bouygues immobilier','www.bouygues-immobilier.net');
END//

DELIMITER ;

CALL insert_agence();

DROP PROCEDURE insert_agence;
/**********************************************/
DELIMITER //
CREATE PROCEDURE insert_demande()
BEGIN
INSERT INTO demande (idpersonne_d,types,ville,budget,superficie,catégorie) VALUES
('1','appartement','paris','530000','120','vente'),
('3','appartement','bordeaux','120000','18','vente'),
('4','appartement','bordeaux','145000','21','vente'),
('5','appartement','bordeaux','152000','26','vente'),
('6','appartement','lyon','200000','55','vente'),
('9','appartement','paris','171000','40','vente'),
('13','appartement','paris','163000','25','vente'),
('16','appartement','paris','132000','15','vente'),
('19','appartement','paris','350000','80','vente'),
('22','appartement','lyon','600','20','location'),
('25','appartement','lyon','188000','65','vente'),
('27','appartement','paris','400','15','location'),
('28','appartement','paris','330500','100','vente'),
('31','appartement','paris','90000','15','vente'),
('32','appartement','lyon','123800','21','vente'),
('35','appartement','lyon','1200','70','vente'),
('37','appartement','lyon','1500','100','vente'),
('43','appartement','paris','600','20','location'),
('44','appartement','paris','750','30','location'),
('45','appartement','bordeaux','680','30','location'),
('46','appartement','bordeaux','213000','40','vente');
END//

DELIMITER ;

CALL insert_demande();

DROP PROCEDURE insert_demande;

/**********************************************/
DELIMITER //
CREATE PROCEDURE insert_personne()
BEGIN
INSERT INTO personne (nom,prenom,email) VALUES
("Naomi Knox","Dieter Silva","dolor.elit.pellentesque@yahoo.com"),
("Cailin Smith","Chadwick Gentry","neque.pellentesque@google.org"),
("Velma Patton","Nathan Jackson","ipsum.ac.mi@aol.net"),
("Gray Stein","hugo","mattis.integer@google.edu"),
("Steel Wright","MacKenzie Sawyer","scelerisque.neque.sed@hotmail.org"),
("Octavius Holt","Cairo Summers","orci.lobortis@hotmail.ca"),
("James George","Sara Price","lectus.ante.dictum@aol.net"),
("Peter Rollins","Yoshi Bryant","quis@yahoo.couk"),
("Jolene Beck","Haley Rogers","sit@protonmail.edu"),
("Farrah Santana","Josephine Larson","dignissim.magna@icloud.couk"),
("Giacomo Mullen","Abraham Carney","amet.dapibus.id@aol.com"),
("Larissa Hahn","Chandler Buckley","pharetra@aol.couk"),
("Sophia Bonner","Miriam Hood","diam.sed.diam@yahoo.org"),
("Kalia Schultz","Giacomo Harrison","est@yahoo.org"),
("Adara Gonzalez","Chancellor Collins","auctor.mauris@aol.edu"),
("Meredith Short","Aphrodite Burns","vel.venenatis.vel@outlook.couk"),
("Wylie Combs","Hammett Miles","ac@icloud.edu"),
("Elaine Barnett","Kirsten Wiggins","nec.luctus@google.edu"),
("Briar Wells","Herrod Harvey","sit.amet.risus@icloud.net"),
("Colby Nieves","Amity Owen","faucibus.orci@hotmail.com"),
("Driscoll Whitehead","Cora Bridges","aenean@google.net");
END //

DELIMITER ;

CALL  insert_personne();
/********************************/


INSERT INTO logement_agence (idAgence,idlogement, frais) VALUES('000001','000002','15000'),
('000005','000003','800'),
('000008','000004','900'),
('000008','000005','1200');




/********************************/

/****EXERCICE 4******/
/*1. Affichez le nom des agences*/
SELECT nom FROM agence;

/*2. Affichez le numéro de l’agence « Orpi »*/
SELECT idagence FROM agence WHERE nom LIKE "orpi";

/*3. Affichez le premier enregistrement de la table logement*/
SELECT * from logement LIMIT 1;

/*4. Affichez le nombre de logements (Alias : Nombre de logements)
*/
SELECT count(*) AS Nombre_de_logements from logement;

/*5. Affichez les logements à vendre à moins de 150 000 € dans l’ordre croissant des 
prix.*/
SELECT * FROM logement WHERE prix <150000 ORDER BY prix DESC;

/*6. Affichez le nombre de logements à la location (alias : nombre*/
SELECT COUNT(*) as nombre FROM logement WHERE catégorie LIKE "location";

/*7. Affichez les villes différentes recherchées par les personnes demandeuses d'un 
logement*/
SELECT ville FROM demande GROUP BY ville;

/*8. Affichez le nombre de biens à vendre par ville*/
SELECT ville,COUNT(*) FROM logement WHERE catégorie LIKE  "vente" GROUP BY ville;

/*9. Quelles sont les id des logements destinés à la location ?*/
SELECT idlogement from logement WHERE catégorie LIKE "location";

/*10.Quels sont les id des logements entre 20 et 30m² ?  (pas de valeurs)*/
SELECT idlogement from logement WHERE superficie >=20 AND superficie<=30;

/*11.Quel est le prix vendeur (hors frais) du logement le moins cher à vendre ? (Alias : 
prix minimum)*/

SELECT ville,prix as "prix minimum" from logement WHERE catégorie LIKE  "vente" ORDER BY prix ASC LIMIT 1;

/*12.Dans quelles villes se trouve les maisons à vendre ?*/
SELECT ville  from logement  WHERE type LIKE "maison" AND catégorie LIKE "vente"; 

/*13. L’agence Orpi souhaite diminuer les frais qu’elle applique sur le logement ayant l'id 
« 3 ». Passer les frais de ce logement de 800 à 730€*/
UPDATE logement_agence SET frais="730"  WHERE frais="800" ;

/*14.Quels sont les logements gérés par l’agence « seloger »*/
SELECT * from logement_agence l,agence a where l.idAgence=a.idagence and a.nom LIKE "seloger";

/*15.Affichez le nombre de propriétaires dans la ville de Paris (Alias : Nombre)*/
SELECT lp.ville,COUNT(*) as "nombre" from logement_personne l, personne p, logement lp WHERE
l.idpersonne=p.idpersonne AND l.idlogement_p=lp.idlogement AND lp.ville LIKE "paris";

/*16.Affichez les informations des trois premières personnes souhaitant acheter un 
logement
*/
SELECT * FROM demande LIMIT 3;

/*17.Affichez les prénoms, email des personnes souhaitant accéder à un logement en 
location sur la ville de Paris*/

SELECT ville,prenom,email from personne p,demande d where p.idpersonne = d.idpersonne_d AND d.ville LIKE "paris";


/*18. Si l’ensemble des logements étaient vendus ou loués demain, quel serait le 
bénéfice généré grâce aux frais d’agence et pour chaque agence (Alias : bénéfice, 
classement : par ordre croissant des gains)
*/
SELECT a.nom ,SUM(frais) as "bénéfice" from logement_agence la, agence a where la.idagence= a.idagence GROUP BY a.nom ORDER BY la.frais DESC;

/*19.Affichez le prénom et la ville où se trouve le logement de chaque propriétaire*/

SELECT  DISTINCT prenom, ville from personne p, logement_personne lp, logement l WHERE p.idpersonne=lp.idpersonne AND lp.idlogement_p=l.idlogement;

/*20.Affichez le nombre de logements à la vente dans la ville de recherche de « hugo » 
(alias : nombre) (ville de demande d'hugo c'est bordeaux)*/

SELECT COUNT(*) AS nombre FROM personne p,demande d where p.idpersonne=d.idpersonne_d AND d.ville LIKE "bordeaux";



/****EXERCICE 5******/

SELECT * from mysql.user;
/*Créer deux utilisateurs ‘afpa’ et ‘cda’*/

create user 'afpa'@'localhost' identified by 'afpa';

create user 'cda'@'localhost' identified by 'cda';

/*Donner les droits d’afficher et d’ajouter des personnes et logements pour l’utilisateur 
afpa
*/

GRANT SELECT, INSERT ON `immobilier`.personne TO ' afpa'@'localhost';

GRANT SELECT, INSERT ON `immobilier`.logement TO ' afpa'@'localhost';

/*Donner les droits de supprimer des demandes d’achat et logements pour l’utilisateur 
cda*/
/*je rajoute le select sinon il ne peut pas voir ce qu'il supprime....*/
GRANT SELECT,DELETE ON `immobilier`.logement TO ' cda'@'localhost';

GRANT SELECT,DELETE ON `immobilier`.demande TO ' cda'@'localhost';

/***************************************************/
show GRANTS for 'afpa'@'localhost';
show GRANTS for 'cda'@'localhost';

/************************************************************************************/



