-- Active: 1744105221537@@127.0.0.1@3306@quiz_dynamique
CREATE DATABASE quiz_dynamique;

USE quiz_dynamique;

CREATE TABLE theme_quiz(
    id_theme INT AUTO_INCREMENT NOT NULL,
    nom_theme VARCHAR(50) NOT NULL
        ,CONSTRAINT theme_quiz_PK PRIMARY KEY (id_theme)
);

CREATE TABLE questions(
    id_question INT AUTO_INCREMENT NOT NULL,
    question VARCHAR (255) NOT NULL,
    option1 VARCHAR (50) NOT NULL,
    option2 VARCHAR (50) NOT NULL,
    option3 VARCHAR (50) NOT NULL,
    option4 VARCHAR (50) NOT NULL,
    answer INT NOT NULL,
    id_theme INT NOT NULL
        ,CONSTRAINT questions_PK PRIMARY KEY (id_question)
        ,CONSTRAINT quiz_theme_quiz_FK FOREIGN KEY (id_theme) REFERENCES theme_quiz(id_theme)
)


CREATE TABLE user(
    id_user INT AUTO_INCREMENT NOT NULL,
    peusdo_user VARCHAR (25) NOT NULL,
    mdp_user VARCHAR (25) NOT NULL,
    date_inscription DATE NOT NULL
        ,CONSTRAINT user_PK PRIMARY KEY (id_user)
);

CREATE TABLE quiz(
    id_quiz INT AUTO_INCREMENT NOT NULL,
    date_quiz DATE NOT NULL,
    score INT NOT NULL,
    id_theme INT NOT NULL,
    id_user INT NOT NULL    
        ,CONSTRAINT quiz_PK PRIMARY KEY (id_quiz)
        ,CONSTRAINT quiz_user0_FK FOREIGN KEY (id_user) REFERENCES user(id_user)
);

CREATE TABLE Choisir(
    id_theme INT NOT NULL,
    id_user INT NOT NULL
        ,CONSTRAINT Choisir_PK PRIMARY KEY (id_theme, id_user)
        ,CONSTRAINT Choisir_theme_quiz_FK FOREIGN KEY (id_theme) REFERENCES theme_quiz(id_theme)
	    ,CONSTRAINT Choisir_user0_FK FOREIGN KEY (id_user) REFERENCES user(id_user)
);

CREATE TABLE Composer(
        id_quiz     Int NOT NULL ,
        id_question Int NOT NULL
	,CONSTRAINT Composer_PK PRIMARY KEY (id_quiz,id_question)

	,CONSTRAINT Composer_quiz_FK FOREIGN KEY (id_quiz) REFERENCES quiz(id_quiz)
	,CONSTRAINT Composer_questions0_FK FOREIGN KEY (id_question) REFERENCES questions(id_question)
);

INSERT INTO theme_quiz (nom_theme)
VALUES 
('Histoire'),
('Art'),
('Foot'),
('Formule 1'),
('Musique'),
('Cinéma');

INSERT INTO questions (question, option1, option2, option3, option4, answer, id_theme) 
VALUES 
("Qui était le premier empereur de France ?", "Louis XIV", "Charlemagne", "Napoléon Bonaparte", "François Ier", 3,1),
("Quel événement historique a eu lieu le 14 juillet 1789 en France ?", "La prise de la Bastille", "Le sacre de Napoléon", "La chute de l’Empire romain", "La signature de la Déclaration des Droits de l’Homme", 1,1),
("Comment s’appelait le roi surnommé « le Roi Soleil » ?", "Louis XVI", "François Ier", "Louis XIV", "Henri IV", 3,1),
("Quel peuple a construit les pyramides d'Égypte ?", "Les Romains", "Les Égyptiens", "Les Grecs", "Les Perses", 2,1),
("Dans quel pays a commencé la Seconde Guerre mondiale ?", "Allemagne", "France", "Italie", "Russie", 1,1),
("Qui a découvert l'Amérique en 1492 ?", "Fernand de Magellan", "Christophe Colomb", "Vasco de Gama", "Marco Polo", 2,1),
("Comment s’appelait la première femme à obtenir le prix Nobel ?", "Simone de Beauvoir", "Rosa Parks", "Jeanne d’Arc", "Marie Curie", 4,1),
("Quelle guerre a opposé le Nord et le Sud des États-Unis ?", "La guerre d’indépendance", "La guerre du Golfe", "La guerre de Sécession", "La guerre de Cent Ans", 3,1),
("Quel était le nom du général français devenu président en 1958 ?", "Georges Pompidou", "Charles de Gaulle", "François Mitterrand", "Jacques Chirac", 2,1),
("En quelle année a eu lieu le débarquement en Normandie ?", "1939", "1942", "1944", "1945", 3,1),
("Quel empire est tombé en 476 après J.-C. ?", "L’Empire ottoman", "L’Empire byzantin", "L’Empire romain d’Occident", "L’Empire perse", 3,1),
("Qui a été la première présidente du Conseil en France ?", "Édith Cresson", "Simone Veil", "Ségolène Royal", "Christiane Taubira", 1,1),
("Quelle révolution a précédé l’arrivée de Napoléon au pouvoir ?", "La révolution industrielle", "La révolution bolchevique", "La révolution française", "La révolution de 1848", 3,1),
("Qui était Cléopâtre ?", "Une impératrice romaine", "Une reine égyptienne", "Une guerrière grecque", "Une prophétesse perse", 2,1),
("Quel pays a été le dernier à abolir l’esclavage en Europe ?", "France", "Royaume-Uni", "Espagne", "Portugal", 3,1),
("Quel traité met officiellement fin à la Première Guerre mondiale ?", "Le traité de Rome", "Le traité de Trianon", "Le traité de Versailles", "Le traité de Yalta", 3,1),
("Qui a mené les troupes françaises pendant la guerre de Cent Ans ?", "Jeanne d’Arc", "Marie Curie", "Anne de Bretagne", "Aliénor d’Aquitaine", 1,1),
("Quel événement marque le début de l’époque moderne ?", "La chute de Constantinople", "La découverte de l’imprimerie", "La découverte de l’Amérique", "Le début de la Réforme", 3,1),
("Quel événement marque la fin de la Seconde Guerre mondiale en Europe ?", "La chute du mur de Berlin", "L’attaque de Pearl Harbor", "Le débarquement en Normandie", "La capitulation de l'Allemagne", 4,1),
("Quel roi de France a été guillotiné en 1793 ?", "Louis XIV", "Louis XVI", "Louis XV", "Napoléon II", 2,1);

INSERT INTO questions (question, option1, option2, option3, option4, answer, id_theme) 
VALUES 
("Quelle dynastie régnait en France avant la Révolution de 1789 ?", "Les Mérovingiens", "Les Carolingiens", "Les Capétiens", "Les Bourbons", 4,1),
("En quelle année l’URSS s’est-elle officiellement effondrée ?", "1989", "1990", "1991", "1992", 3,1),
("Qui a succédé à Staline à la tête de l’URSS ?", "Lénine", "Brejnev", "Khrouchtchev", "Gorbatchev", 3,1),
("Quelle civilisation précolombienne a construit la cité de Machu Picchu ?", "Les Aztèques", "Les Mayas", "Les Toltèques", "Les Incas", 4,1),
("Quelle bataille de 1815 a marqué la chute définitive de Napoléon ?", "Austerlitz", "Leipzig", "Trafalgar", "Waterloo", 4,1);


SELECT * FROM theme_quiz;
SELECT * FROM questions;
SELECT * FROM user;
SELECT * FROM quiz;
SELECT * FROM Choisir;
SELECT * FROM Composer;
