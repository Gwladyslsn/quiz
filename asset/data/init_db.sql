-- Active: 1744105221537@@127.0.0.1@3306@quiz_dynamique
CREATE DATABASE quiz_dynamique;

USE quiz_dynamique;

CREATE TABLE questions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    question TEXT NOT NULL,
    option1 TEXT NOT NULL,
    option2 TEXT NOT NULL,
    option3 TEXT NOT NULL,
    option4 TEXT NOT NULL,
    answer TINYINT NOT NULL 
);


INSERT INTO questions (question, option1, option2, option3, option4, answer)
VALUES
("Quelle est la capitale de la France ?", "Paris", "Londres", "Rome", "Madrid", 1),
("Combien y a-t-il de continents ?", "5", "6", "7", "8", 3),
("Quelle est la couleur du cheval blanc d'Henri IV ?", "Noir", "Gris", "Blanc", "Marron", 3),
("En France, en quelle année est sorti le film AVATAR", "2000", "2005", "2009", "2010", 3);


INSERT INTO questions (question, option1, option2, option3, option4, answer)
VALUES
("Quel est le plus grand océan du monde ?", " L'océan Atlantique", "L'océan Indien", "L'océan Arctique", " L'océan Pacifique", 4),
("Qui a peint 'La Joconde' ?", "Vincent van Gogh", "Léonard de Vinci", "Pablo Picasso", "Claude Monet", 2),
("Quelle est la capitale du Japon ?", "Pékin", "Séoul", "Shanghai", "Tokyo", 4),
("Quel élément chimique porte le symbole 'Fe' dans le tableau périodique ?", "Fer", "Fluor", "Phosphore", "Francium", 1),
("Qui a écrit 'Les Misérables' ?", "Albert Camus", "Victor Hugo", "Émile Zola", "Gustave Flaubert", 2);


SELECT * FROM questions;


CREATE TABLE scores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pseudo VARCHAR (25) NOT NULL,
    score INT NOT NULL,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM scores;