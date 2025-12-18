-- Script d'initialisation de la base de données RecrutementDB
-- Création de la base de données
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'RecrutementDB')
BEGIN
    CREATE DATABASE RecrutementDB;
END
GO

USE RecrutementDB;
GO

-- Suppression et recréation de la table Messages pour garantir les données
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'Messages')
BEGIN
    DROP TABLE Messages;
END
GO

-- Création de la table Messages
CREATE TABLE Messages (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Texte VARCHAR(500) NOT NULL
);
GO

-- Insertion des 21 fun-facts
INSERT INTO Messages (Texte) VALUES 
('Le miel ne se perime jamais. Des pots de miel vieux de 3000 ans ont ete trouves en Egypte et etaient encore comestibles.'),
('Les poulpes ont trois coeurs et leur sang est bleu.'),
('Une journee sur Venus est plus longue qu''une annee sur Venus.'),
('Les flamants roses naissent blancs et deviennent roses a cause de leur alimentation.'),
('Le cerveau humain utilise environ 20% de l''energie totale du corps.'),
('Les dauphins dorment avec un oeil ouvert pour rester vigilants.'),
('La Tour Eiffel peut grandir de 15 cm en ete a cause de la dilatation thermique.'),
('Les empreintes digitales des koalas sont si similaires aux notres qu''elles ont deja confondu des enquetes policieres.'),
('Un escargot peut dormir pendant 3 ans.'),
('Le coeur d''une crevette est situe dans sa tete.'),
('Les bananes sont radioactives car elles contiennent du potassium-40.'),
('Cléopâtre a vecu plus pres de l''invention de l''iPhone que de la construction des pyramides.'),
('Les pieuvres ont un cerveau dans chaque tentacule.'),
('Il y a plus d''etoiles dans l''univers que de grains de sable sur Terre.'),
('Les vaches ont des meilleurs amis et deviennent stressees quand elles sont separees.'),
('Le plus vieux chewing-gum connu a 9000 ans.'),
('Un nuage moyen pese environ 500 tonnes.'),
('Les araignees ne peuvent pas voler mais peuvent planer sur des fils de soie sur des centaines de kilometres.'),
('Le son voyage 4 fois plus vite dans l''eau que dans l''air.'),
('Les hippopotames produisent une sueur rouge qui agit comme ecran solaire.'),
('SQL Server est sorti pour la premiere fois en 1989, developpe conjointement par Microsoft et Sybase.');
GO

SELECT 'Base de donnees RecrutementDB initialisee' AS Status;
GO

