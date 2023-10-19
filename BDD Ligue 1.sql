DROP DATABASE IF EXISTS LFP;

CREATE DATABASE IF NOT EXISTS LFP DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE LFP;

CREATE TABLE IF NOT EXISTS Club (
    Id_Equipe INT NOT NULL AUTO_INCREMENT,
    Nom_Equipe VARCHAR(100) NOT NULL,
    Division BOOLEAN,
    PRIMARY KEY (Id_Equipe)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS Joueur (
    Id_Joueur INT NOT NULL AUTO_INCREMENT,
    Id_Equipe INT NOT NULL,
    Nom_Joueur VARCHAR(100) NOT NULL,
    Prenom_Joueur VARCHAR(100) NOT NULL,
    Date_Naissance DATE NOT NULL,
    Numero_License VARCHAR(10) NOT NULL,
    Nationalite VARCHAR(100) NOT NULL,
    PRIMARY KEY (Id_Joueur),
    FOREIGN KEY (Id_Equipe) REFERENCES Club(Id_Equipe)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS Matchs (
    Id_Match INT NOT NULL AUTO_INCREMENT,
    Date_Match DATE NOT NULL,
    Heure_Match TIME NOT NULL,
    PRIMARY KEY (Id_Match)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS Titulaire (
    Id_Joueur INT NOT NULL,
    Id_Match INT NOT NULL,
    PRIMARY KEY (Id_Joueur, Id_Match),
    FOREIGN KEY (Id_Joueur) REFERENCES Joueur(Id_Joueur),
    FOREIGN KEY (Id_Match) REFERENCES Matchs(Id_Match)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS Banc_Touche (
    Id_Joueur INT NOT NULL,
    Id_Match INT NOT NULL,
    PRIMARY KEY (Id_Joueur, Id_Match),
    FOREIGN KEY (Id_Joueur) REFERENCES Joueur(Id_Joueur),
    FOREIGN KEY (Id_Match) REFERENCES Matchs(Id_Match)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS Matchs (
    Id_Match INT NOT NULL AUTO_INCREMENT,
    Date_Match DATE NOT NULL,
    Heure_Match TIME NOT NULL,
    PRIMARY KEY (Id_Match)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS Fait_Match (
    Id_Match INT NOT NULL,
    Id_But INT NOT NULL,
    Id_Carton INT NOT NULL,
    PRIMARY KEY (Id_Match, Id_But, Id_Carton),
    FOREIGN KEY (Id_Match) REFERENCES Matchs(Id_Match),
    FOREIGN KEY (Id_But) REFERENCES But(Id_But),
    FOREIGN KEY (Id_Carton) REFERENCES Carton(Id_Carton)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS But (
    Id_But INT NOT NULL AUTO_INCREMENT,
    Id_Match INT NOT NULL,
    Heure_But TIME NOT NULL,
    CSC BOOLEAN NOT NULL,
    PRIMARY KEY (Id_But),
    FOREIGN KEY (Id_Match) REFERENCES Matchs(Id_Match)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS Carton (
    Id_Carton INT NOT NULL AUTO_INCREMENT,
    Id_Match INT NOT NULL,
    Heure_Carton TIME NOT NULL,
    Couleur_Carton BOOLEAN NOT NULL,
    PRIMARY KEY (Id_Carton),
    FOREIGN KEY (Id_Match) REFERENCES Matchs(Id_Match)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS Marque (
    Id_Joueur INT NOT NULL,
    Id_But INT NOT NULL,
    PRIMARY KEY (Id_Joueur, Id_But),
    FOREIGN KEY (Id_Joueur) REFERENCES Joueur(Id_Joueur),
    FOREIGN KEY (Id_But) REFERENCES But(Id_But)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS Recoit (
    Id_Joueur INT NOT NULL,
    Id_Carton INT NOT NULL,
    PRIMARY KEY (Id_Joueur, Id_Carton),
    FOREIGN KEY (Id_Joueur) REFERENCES Joueur(Id_Joueur),
    FOREIGN KEY (Id_Carton) REFERENCES Carton(Id_Carton)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS Feuille_Match (
    Id_Feuille_Match INT NOT NULL AUTO_INCREMENT,
    Id_Match INT NOT NULL,
    PRIMARY KEY (Id_Feuille_Match),
    FOREIGN KEY (Id_Match) REFERENCES Matchs(Id_Match)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE utf8mb4_unicode_ci;