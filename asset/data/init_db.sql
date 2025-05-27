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
    option1 VARCHAR (255) NOT NULL,
    option2 VARCHAR (255) NOT NULL,
    option3 VARCHAR (255) NOT NULL,
    option4 VARCHAR (255) NOT NULL,
    answer INT NOT NULL,
    id_theme INT NOT NULL
        ,CONSTRAINT questions_PK PRIMARY KEY (id_question)
        ,CONSTRAINT quiz_theme_quiz_FK FOREIGN KEY (id_theme) REFERENCES theme_quiz(id_theme)
);

CREATE TABLE user(
    id_user INT AUTO_INCREMENT NOT NULL,
    peusdo_user VARCHAR (25) NOT NULL,
    mdp_user VARCHAR (25) NOT NULL,
    date_inscription DATE NOT NULL
        ,CONSTRAINT user_PK PRIMARY KEY (id_user)
);

ALTER TABLE `user`
ADD mail_user VARCHAR (100) NOT NULL;

ALTER TABLE `user`
CHANGE peusdo_user pseudo_user VARCHAR (25) NOT NULL

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

INSERT INTO questions (question, option1, option2, option3, option4, answer, id_theme) 
VALUES
("Qui a peint La Joconde ?", "Léonard de Vinci", "Vincent van Gogh", "Pablo Picasso", "Claude Monet", 1,2),
("Quel mouvement artistique est associé à Salvador Dalí ?", "Cubisme", "Réalisme", "Surréalisme", "Impressionnisme", 3,2),
("Quel peintre est célèbre pour ses tournesols ?", "Paul Cézanne", "Vincent van Gogh", "Edgar Degas", "Henri Matisse", 2,2),
("En sculpture, qu’est-ce qu’un bas-relief ?", "Une sculpture en trois dimensions", "Une peinture murale", "Une sculpture faite en argile", "Une sculpture légèrement en relief", 4,2),
("Quel artiste a peint Les Nymphéas ?", "Claude Monet", "Georges Seurat", "Auguste Renoir", "Paul Gauguin", 1,2),
("Quel architecte a conçu la Sagrada Familia à Barcelone ?", "Santiago Calatrava", "Antoni Gaudí", "Le Corbusier", "Frank Gehry", 2,2),
("Quel courant artistique est apparu en réaction à la photographie ?", "Baroque", "Art nouveau", "Cubisme", "Impressionnisme", 4,2),
("En quelle matière est la statue de David de Michel-Ange ?", "Bronze", "Bois", "Marbre", "Fer", 3,2),
("Quel artiste est connu pour ses Boîtes de soupe Campbell ?", "Andy Warhol", "Roy Lichtenstein", "Keith Haring", "Jean-Michel Basquiat", 1,2),
("Où se trouve le musée du Louvre ?", "Londres", "Rome", "Madrid", "Paris", 4,2),
("Quel peintre est un représentant majeur du cubisme ?", "Pablo Picasso", "Edvard Munch", "Gustav Klimt", "Henri Rousseau", 1,2),
("Quel artiste autrichien est célèbre pour son tableau Le Baiser ?", "Gustav Klimt", "Egon Schiele", "Oskar Kokoschka", "Paul Klee", 1,2),
("Lequel de ces matériaux n’est pas traditionnellement utilisé en sculpture ?", "Bois", "Verre", "Pierre", "Bronze", 2,2),
("Quel est le nom du célèbre plafond peint par Michel-Ange ?", "Le plafond de Versailles", "La fresque de la Basilique Saint-Pierre", "La chapelle Sixtine", "Le plafond de Notre-Dame", 3,2),
("Quelle technique consiste à peindre sur du plâtre frais ?", "Aquarelle", "Fresque", "Gouache", "Enluminure", 2,2),
("Quel artiste est célèbre pour ses «formes mobiles suspendues» appelées mobiles ?", "Marcel Duchamp", "Joan Miró", "Piet Mondrian", "Alexander Calder", 4,2),
("Quel peintre français a fondé le mouvement fauviste ?", "Henri Matisse", "Paul Signac", "Fernand Léger", "Edgar Degas", 1,2),
("Quelle couleur domine dans l’œuvre Le Cri de Munch ?", "Vert", "Rouge", "Bleu", "Jaune", 3,2),
("Quel artiste peignait souvent des formes géométriques colorées en lignes droites ?", "Jackson Pollock", "Piet Mondrian", "Mark Rothko", "Wassily Kandinsky", 2,2),
("Quel artiste est connu pour ses autoportraits et ses sourcils prononcés ?", "Georgia O'Keeffe", "Tamara de Lempicka", "Frida Kahlo", "Marina Abramović", 3,2),
("Quel mouvement artistique utilise principalement des formes géométriques et des couleurs primaires ?", "Surréalisme", "Pop Art", "Art déco", "De Stijl", 4,2),
("Quel peintre espagnol a réalisé Guernica ?", "Diego Velázquez", "Pablo Picasso", "El Greco", "Francisco Goya", 2,2),
("Quel musée abrite La Nuit étoilée de Van Gogh ?", "Musée d'Orsay", "Musée du Prado", "Museum of Modern Art (MoMA)", "Tate Modern", 3,2),
("Quel artiste est célèbre pour ses installations d'art immersif avec des miroirs et des lumières ?", "Olafur Eliasson", "Anish Kapoor", "Christo", "Ai Weiwei", 1,2),
("Quel courant artistique associe souvent des formes abstraites et des émotions intenses ?", "Expressionnisme", "Romantisme", "Réalisme", "Néo-classicisme", 1,2),
("Quel peintre impressionniste a souvent représenté des danseuses ?", "Pierre-Auguste Renoir", "Edgar Degas", "Claude Monet", "Alfred Sisley", 2,2),
("Comment s’appelle l’art de décorer les livres au Moyen Âge ?", "Lithographie", "Gravure", "Calligraphie", "Enluminure", 4,2),
("Quel artiste contemporain a installé des structures géantes recouvrant le Pont-Neuf à Paris ?", "Banksy", "Daniel Buren", "JR", "Christo", 4,2),
("Quel artiste japonais est célèbre pour ses pois colorés et ses citrouilles ?", "Takashi Murakami", "Hiroshi Sugimoto", "Yayoi Kusama", "Yoko Ono", 3,2);

INSERT INTO questions (question, option1, option2, option3, option4, answer, id_theme) 
VALUES
("Quel joueur est surnommé «la Pulga» ?", "Cristiano Ronaldo", "Neymar", "Lionel Messi", "Kylian Mbappé", 3,3),
("En quelle année la France a-t-elle remporté sa première Coupe du Monde ?", "1998", "2006", "2018", "1982", 1,3),
("Quel club est surnommé Les Reds ?", "Arsenal", "Liverpool", "Manchester City", "Chelsea", 2,3),
("Combien de joueurs composent une équipe de football sur le terrain (hors remplaçants) ?", "9", "10", "11", "12", 3,3),
("Quel pays a remporté la Coupe du Monde 2014 ?", "Argentine", "Espagne", "Brésil", "Allemagne", 4,3),
("Dans quel club Kylian Mbappé a-t-il commencé sa carrière professionnelle ?", "PSG", "Monaco", "Marseille", "Lyon", 2,3),
("Que signifie VAR dans le football ?", "Valeur Athlétique de Réserve", "Vidéo Arbitrage Réussi", "Vidéo Assistant Referee", "Vérification Arbitraire Rapide", 4,3),
("Quel club français est surnommé Les Gones ?", "Lyon", "Paris", "Marseille", "Saint-Étienne", 1,3),
("Qui a marqué le but en or en finale de l’Euro 2000 ?", "Thierry Henry", "Zinédine Zidane", "David Trezeguet", "Patrick Vieira", 3,3),
("Quelle est la couleur principale du maillot de l’équipe du Brésil ?", "Rouge", "Bleu", "Jaune", "Vert", 3,3),
("Quel joueur portugais est surnommé CR7 ?", "Pepe", "Bernardo Silva", "João Félix", "Cristiano Ronaldo", 4,3),
("Jusqu'en 2023, quel club français détenait le plus de titres de Ligue 1 ?", "PSG", "Marseille", "Lyon", "Saint-Étienne", 4,3),
("Combien de minutes dure un match de foot (hors prolongation) ?", "80", "90", "100", "75", 2,3),
("Qui a entraîné l’équipe de France championne du monde en 2018 ?", "Didier Deschamps", "Laurent Blanc", "Raymond Domenech", "Aimé Jacquet", 2,3),
("Dans quel club évolue Erling Haaland depuis 2022 ?", "Borussia Dortmund", "Real Madrid", "Manchester United", "Manchester City", 4,3),
("Quel pays a remporté l’Euro 2020 (joué en 2021) ?", "Angleterre", "France", "Italie", "Espagne", 3,3),
("Quel est le surnom de l’équipe nationale d’Allemagne ?", "La Mannschaft", "La Roja", "Les Bleus", "Les Aigles", 1,3),
("Quel joueur a inscrit un doublé en finale de la Coupe du Monde 2022 ?", "Messi", "Mbappé", "Griezmann", "Di María", 2,3),
("Où s'est déroulé la finale de la Ligue des Champions 2025 ?", "Istanbul", "Londres", "Munich", "Rome", 3,3),
("Quelle équipe a remporté la Ligue des Champions 2023 ?", "Real Madrid", "Manchester City", "Inter Milan", "Bayern Munich", 1,3),
("Quel ancien joueur français est connu pour son coup de tête en finale du Mondial 2006 ?", "Lilian Thuram", "Thierry Henry", "Zinédine Zidane", "Claude Makélélé", 3,3),
("Quelle est la nationalité de Luka Modrić ?", "Serbe", "Croate", "Polonais", "Slovaque", 2,3),
("En 2025, combien de Coupes du Monde le Brésil a-t-il remportées ?", "3", "4", "5", "6", 3,3),
("Quel joueur est connu pour son style de jeu surnommé «Tiki-Taka» ?", "Zlatan Ibrahimović", "Andrés Iniesta", "Ronaldinho", "Kevin De Bruyne", 2,3),
("Quel club espagnol joue au stade Santiago Bernabéu ?", "FC Barcelone", "Atlético Madrid", "Real Madrid", "Séville FC", 3,3),
("En 2025, Qui est le sélectionneur de l'équipe d’Angleterre ?", "Roy Hodgson", "Gareth Southgate", "Sam Allardyce", "Frank Lampard", 2,3),
("Quel poste occupe un joueur qui peut utiliser ses mains ?", "Milieu", "Défenseur", "Gardien de but", "Attaquant", 3,3),
("Quel trophée individuel récompense le meilleur joueur FIFA de l’année ?", "The Best", "Golden Boot", "Super Ballon", "World Class Award", 1,3),
("Quel club est surnommé Les Citizens ?", "Arsenal", "Manchester City", "Tottenham", "Chelsea", 2,3),
("Quel est le poste principal de N’Golo Kanté ?", "Attaquant", "Milieu défensif", "Défenseur central", "Gardien", 2,3),
("Quel est le club formateur de Zinédine Zidane ?", "Marseille", "Bordeaux", "Cannes", "Monaco", 3,3);


UPDATE questions
SET answer = 1
WHERE id_question = 88;


INSERT INTO questions (question, option1, option2, option3, option4, answer, id_theme) 
VALUES
("En 2025, quel pilote détient le record de victoires en Grand Prix ?", "Ayrton Senna", "Michael Schumacher", "Lewis Hamilton", "Alain Prost", 3,4),
("Quelle écurie est surnommée «La Scuderia» ?", "Mercedes", "Ferrari", "Red Bull", "Alpine", 2,4),
("Quel pays accueille le Grand Prix de Monaco ?", "Italie", "France", "Espagne", "Monaco", 4,4),
("Quelle est la nationalité de Max Verstappen ?", "Allemande", "Néerlandaise", "Belge", "Autrichienne", 2,4),
("Qui a remporté le championnat du monde 2023 ?", "Charles Leclerc", "Sergio Pérez", "Lewis Hamilton", "Max Verstappen", 4,4),
("Quel pilote est célèbre pour son casque jaune ?", "Ayrton Senna", "Fernando Alonso", "Nico Rosberg", "Sebastian Vettel", 1,4),
("Quelle équipe motorise Red Bull Racing depuis 2022 ?", "Mercedes", "Renault", "Honda", "Ferrari", 3,4),
("Combien de pilotes prennent le départ d’une course de Formule 1 ?", "18", "20", "22", "24", 2,4),
("Quelle ville accueille un Grand Prix de nuit spectaculaire ?", "Barcelone", "Abu Dhabi", "Singapour", "Montréal", 3,4),
("Quel pilote a remporté 7 titres de champion du monde, à égalité avec Michael Schumacher ?", "Sebastian Vettel", "Fernando Alonso", "Lewis Hamilton", "Aucun pilote", 3,4),
("Quel pays possède le circuit de Silverstone ?", "Allemagne", "Royaume-Uni", "Pays-Bas", "Italie", 2,4),
("Que signifie le sigle «DRS» ?", "Drag Reduction System", "Dynamic Rear Steering", "Downforce Ratio Sensor", "Dual Rear Suspension", 1,4),
("Quel constructeur français a été champion du monde des constructeurs en 2005 et 2006 ?", "Peugeot", "Alpine", "Renault", "Citroën", 3,4),
("Quelle est la durée maximale d’un Grand Prix (hors interruptions) ?", "90 minutes", "1 heure 45", "2 heures", "2 heures 30", 3,4),
("Jusqu'en 2025, qui est l’ingénieur emblématique de Red Bull Racing ?", "Adrian Newey", "Ross Brawn", "James Allison", "Paddy Lowe", 1,4),
("Quel pilote français a remporté le Grand Prix de Hongrie 2021 ?", "Pierre Gasly", "Esteban Ocon", "Romain Grosjean", "Jean Alesi", 2,4),
("Quel est le surnom de Charles Leclerc ?", "Le Kid", "Le Monégasque Volant", "Il Cavallino", "Leclercator", 2,4),
("Quel pilote espagnol est double champion du monde ?", "Carlos Sainz", "Pedro de la Rosa", "Marc Gené", "Fernando Alonso", 4,4),
("Quel est le nom officiel du championnat F1 ?", "F1 World Race", "World Racing Championship", "FIA Formula One World Championship", "Grand Prix World Cup", 3,4),
("Quel constructeur britannique est revenu en F1 en 2021 avec Sebastian Vettel ?", "Aston Martin", "Jaguar", "Lotus", "McLaren", 1,4),
("Quelle écurie a dominé la F1 entre 2014 et 2020 ?", "Red Bull", "Mercedes", "Ferrari", "Williams", 2,4),
("Qui est le fondateur de la Formule 1 ?", "Jean Todt", "Enzo Ferrari", "Max Mosley", "Bernie Ecclestone", 4,4),
("Quel pays accueille souvent le dernier Grand Prix de la saison ?", "France", "Italie", "Qatar", "Émirats Arabes Unis", 4,4),
("Quelle est la couleur traditionnelle de Ferrari en F1 ?", "Jaune", "Bleu", "Rouge", "Noir", 3,4),
("Quelle est la nationalité de Charles Leclerc ?", "Italien", "Monégasque", "Français", "Suisse", 2,4),
("Quel constructeur est associé au moteur «Power Unit» en F1 ?", "BMW", "Ford", "Honda", "Tous les choix", 4,4),
("Qui est le recordman du plus jeune vainqueur de Grand Prix ?", "Max Verstappen", "Sebastian Vettel", "Charles Leclerc", "Fernando Alonso", 1,4),
("Combien de points le vainqueur d’un Grand Prix marque-t-il ?", "18", "20", "25", "30", 2,4),
("Quelle pénalité est la plus légère ?", "Drive-through", "10 secondes", "5 secondes", "Disqualification", 3,4),
("Quel Grand Prix est couru dans les rues de Bakou ?", "Azerbaïdjan", "Turquie", "Russie", "Kazakhstan", 1,4),
("Quel pilote a conduit pour Ferrari, McLaren, Renault et Alpine ?", "Carlos Sainz", "Lewis Hamilton", "Fernando Alonso", "Kimi Räikkönen", 3,4),
("Quel est le rôle du Safety Car ?", "Augmenter la vitesse", "Sécuriser la piste en cas d’incident", "Pénaliser les pilotes", "Chronométrer les arrêts", 2,4),
("Quelle technologie est utilisée pour économiser du carburant et augmenter la puissance ?", "ABS", "KERS", "NOS", "VTEC", 2,4),
("En quelle année a débuté la première saison officielle de Formule 1 ?", "1946", "1950", "1960", "1938", 2,4),
("Quel est le circuit le plus rapide du calendrier 2025 ?", "Monza", "Spa-Francorchamps", "Silverstone", "Suzuka", 1,4),
("Qui est le coéquipier de Lewis Hamilton en 2024 ?", "George Russell", "Nico Rosberg", "Lando Norris", "Esteban Ocon", 1,4),
("Quelle est la fonction d’un ingénieur de course ?", "Concevoir le moteur", "Nettoyer les pneus", "Gérer la stratégie et la radio avec le pilote", "Conduire la voiture de secours", 3,4),
("Quel pilote français a piloté pour AlphaTauri en 2022 ?", "Esteban Ocon", "Pierre Gasly", "Lando Norris", "Jean-Éric Vergne", 2,4);


INSERT INTO questions (question, option1, option2, option3, option4, answer, id_theme) 
VALUES
("Quel est le prénom de Mozart ?", "Franz", "Johann", "Ludwig", "Wolfgang", 4,5),
("Quel artiste a chanté «Thriller» ?", "Prince", "Michael Jackson", "Stevie Wonder", "Lionel Richie", 2,5),
("Quel groupe a sorti l’album «The Dark Side of the Moon» ?", "Led Zeppelin", "The Rolling Stones", "Pink Floyd", "Queen", 3,5),
("Quelle est la nationalité de la chanteuse Björk ?", "Islandaise", "Suédoise", "Norvégienne", "Danoise", 1,5),
("Quel instrument a 88 touches ?", "L’orgue", "Le synthétiseur", "Le piano", "Le clavecin", 3,5),
("Quel est le vrai nom de Lady Gaga ?", "Stefani Germanotta", "Sarah Ciccone", "Kate Perry", "Emma Lambert", 1,5),
("Qui a composé la «Lettre à Élise» ?", "Mozart", "Beethoven", "Chopin", "Liszt", 2,5),
("Quel groupe chante «Bohemian Rhapsody» ?", "The Beatles", "Genesis", "AC/DC", "Queen", 4,5),
("Quel rappeur français a sorti l'album «L'Éverest» ?", "Orelsan", "Kaaris", "Soprano", "SCH", 3,5),
("Quel chanteur est surnommé «le Boss» ?", "Bruce Springsteen", "Bon Jovi", "Elton John", "Bob Dylan", 1,5),
("Quel duo a chanté «Get Lucky» en 2013 ?", "David Guetta et Rihanna", "Daft Punk et Pharrell Williams", "Calvin Harris et Sam Smith", "Avicii et Aloe Blacc", 2,5),
("Qui a écrit l’opéra «Carmen» ?", "Verdi", "Bizet", "Puccini", "Berlioz", 2,5),
("Quel est le genre musical de Bob Marley ?", "Ska", "Jazz", "Reggae", "Soul", 3,5),
("Quelle chanteuse a sorti «Rolling in the Deep» ?", "Beyoncé", "Amy Winehouse", "Katy Perry", "Adele", 4,5),
("Quel groupe est surnommé «les Fab Four» ?", "The Rolling Stones", "The Beach Boys", "The Beatles", "The Who", 3,5),
("Quel compositeur est devenu sourd ?", "Beethoven", "Bach", "Schubert", "Haydn", 1,5),
("Quel groupe français a chanté «Dernière danse» ?", "Indochine", "Louise Attaque", "Kyo", "Tryo", 3,5),
("Qui chante «Ne me quitte pas» ?", "Édith Piaf", "Charles Aznavour", "Jacques Brel", "Georges Brassens", 3,5),
("En quelle année a eu lieu le premier festival de Woodstock ?", "1965", "1969", "1972", "1975", 2,5),
("Quelle voix féminine est célèbre pour son vibrato puissant et naturel, surnommée «la môme» ?", "Barbara", "Vanessa Paradis", "Édith Piaf", "Zazie", 3,5),
("Quel instrument utilise des cordes frottées ?", "Harpe", "Guitare", "Piano", "Violon", 4,5),
("Quel chanteur a popularisé «Imagine» ?", "Paul McCartney", "Elton John", "John Lennon", "Freddie Mercury", 3,5),
("Qui est la chanteuse principale de Florence + The Machine ?", "Florence Nightingale", "Florence Welch", "Florence Jones", "Florence Griffith", 2,5),
("Quel groupe a chanté «Smells Like Teen Spirit» ?", "Pearl Jam", "Nirvana", "Radiohead", "Foo Fighters", 2,5),
("Quel est le nom de scène de Matthieu Chedid ?", "MC", "-X-", "M", "Tété", 3,5),
("Quel instrument est aussi appelé «les touches d’ivoire» ?", "Piano", "Accordéon", "Orgue", "Xylophone", 1,5),
("Qui est le compositeur de «La Moldau» ?", "Smetana", "Dvořák", "Tchaïkovski", "Chopin", 1,5);


INSERT INTO questions (question, option1, option2, option3, option4, answer, id_theme) 
VALUES
("Quel film a remporté l’Oscar du meilleur film en 1998 ?", "Titanic", "Shakespeare in Love", "La Ligne verte", "American Beauty", 2,6),
("Qui joue le rôle principal dans Forrest Gump ?", "Tom Cruise", "Kevin Costner", "Tom Hanks", "Robin Williams", 3,6),
("Dans Le Seigneur des Anneaux, comment s’appelle l’anneau ?", "L’Anneau de Pouvoir", "L’Anneau de Sauron", "L’Unique Anneau", "L’Anneau Maudit", 1,6),
("Qui a réalisé Pulp Fiction ?", "Martin Scorsese", "Steven Spielberg", "Guy Ritchie", "Quentin Tarantino", 4,6),
("Quel est le prénom du personnage principal dans Retour vers le futur ?", "Danny", "Marty", "Rick", "Sam", 2,6),
("Quel film met en scène un requin tueur ?", "Abyss", "Open Water", "Les Dents de la mer", "The Meg", 3,6),
("Qui est le compositeur principal des musiques de Star Wars ?", "John Williams", "Hans Zimmer", "Howard Shore", "Ennio Morricone", 1,6),
("Dans quel film peut-on entendre la réplique : «Je suis ton père» ?", "Star Wars: Un nouvel espoir", "Star Wars: L’Empire contre-attaque", "Star Wars: Le Retour du Jedi", "Rogue One", 2,6),
("Quel acteur incarne le Joker dans The Dark Knight ?", "Jared Leto", "Joaquin Phoenix", "Heath Ledger", "Jack Nicholson", 3,6),
("Dans quel film Leonardo DiCaprio lutte contre un ours ?", "Django Unchained", "Le Revenant", "Inception", "Shutter Island", 2,6),
("Quel est le métier de Julia Roberts dans Pretty Woman ?", "Danseuse", "Serveuse", "Escort girl", "Styliste", 3,6),
("Quel film d’animation met en scène un rat qui cuisine ?", "Chicken Run", "Le Monde de Nemo", "Les Aristochats", "Ratatouille", 4,6),
("Qui joue Jack dans Titanic ?", "Leonardo DiCaprio", "Brad Pitt", "Matt Damon", "Johnny Depp", 1,6),
("Dans Inception, que fait tourner Dom Cobb pour savoir s’il rêve ?", "Un dé", "Une pièce", "Une toupie", "Une montre", 3,6),
("Quel film est centré sur un vaisseau nommé le Nostromo ?", "Interstellar", "Alien", "2001 : L’Odyssée de l’espace", "Star Trek", 2,6),
("Qui a réalisé E.T. l’extra-terrestre ?", "George Lucas", "Ridley Scott", "James Cameron", "Steven Spielberg", 4,6),
("Quel film se déroule presque entièrement dans une salle de tribunal ?", "12 Hommes en colère", "Erin Brockovich", "Philadelphia", "Le Parrain", 1,6),
("Quelle actrice joue Hermione Granger ?", "Emma Stone", "Emma Thompson", "Emma Watson", "Natalie Portman", 3,6),
("Qui incarne Iron Man dans le MCU ?", "Mark Ruffalo", "Robert Pattinson", "Robert Downey Jr.", "Chris Evans", 3,6),
("Dans Matrix, quelle pilule permet de découvrir la vérité ?", "La rouge", "La bleue", "La verte", "La jaune", 1,6),
("Quel est le titre du premier film Marvel du MCU ? (Dans l'ordre de sortie)", "Hulk", "Iron Man", "Captain America", "Thor", 2,6),
("Quel film français a pour héros un agent secret maladroit ?", "La Cité de la peur", "Les Visiteurs", "OSS 117", "Le Dîner de cons", 3,6),
("Dans Le Fabuleux Destin d’Amélie Poulain, où travaille Amélie ?", "Un café", "Une boulangerie", "Une librairie", "Une fleuriste", 1,6),
("Dans quel film des années 90 découvre-t-on les dinosaures recréés ?", "Le Monde perdu", "Godzilla", "King Kong", "Jurassic Park", 4,6),
("Qui joue le capitaine Jack Sparrow ?", "Orlando Bloom", "Johnny Depp", "Colin Farrell", "Tom Hardy", 2,6),
("Dans quel film un clown terrifie les enfants ?", "Freddy", "Conjuring", "Ça", "The Ring", 3,6),
("Qui est le réalisateur de Inglourious Basterds ?", "Quentin Tarantino", "Zack Snyder", "Ridley Scott", "Wes Anderson", 1,6),
("Quel est le prénom du héros de Gladiator ?", "Titus", "Maximus", "Aurelius", "Antonius", 2,6),
("Quel film d’animation Pixar met en scène des émotions ?", "Les Nouveaux Héros", "En avant", "Là-haut", "Vice-Versa", 4,6),
("Qui a réalisé Avatar ?", "James Cameron", "Steven Spielberg", "J.J. Abrams", "Christopher Nolan", 1,6),
("Quel est le titre du film sur la création de Facebook ?", "Le Réseau", "Social World", "The Social Network", "Facebook: The Movie", 3,6),
("Dans Interstellar, quel élément naturel met la Terre en danger ?", "La poussière", "La chaleur", "Le froid", "Les inondations", 1,6),
("Dans Charmed, quel est le pouvoir de Prue Halliwell ?", "Lire dans les pensées", "Télékinésie", "Figer le temps", "Téléportation", 2,6),
("Dans Game of Thrones, comment s’appelle l’épée en acier valyrien de Jon Snow ?", "Aiguille", "Longclaw (Longuegriffe)", "Heartsbane (Pointdeguerre)", "Oathkeeper (Féale)", 2,6),
("Dans Gossip Girl, dans quelle école privée Serena, Blair et leurs amies sont-ils scolarisés au début de la série ?", "St. Jude", "Upper East Academy", "Manhattan Elite School", "Constance Billard", 4,6);








SELECT * FROM theme_quiz;
SELECT * FROM questions;
SELECT * FROM user;
SELECT * FROM quiz;
SELECT * FROM Choisir;
SELECT * FROM Composer;

DROP * FROM quiz_dynamique;

