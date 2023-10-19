 drop database if exists LFP ;

create database if not exists LFP default character set utf8mb4 collate utf8mb4_unicode_ci;
use LFP;

create table if not exists Club
(
   Id_Equipe            int not null auto_increment,
   Nom_Equipe           varchar(100) not null,
   Division             boolean


   PRIMARY KEY (Id_Equipe)

);
Engine = InnoDB default Charset=utf8mb4 collate= utf8mb4_unicode_ci;

create table if not exists Joueur
(
   Id_Joueur           int not null auto_increment,
   Id_Equipe           int not null,
   Nom_Joueur          varchar(100) not null,
   Prenom_Joueur       varchar(100) not null,
   Date_Naissance      date not null,
   Numero_License      varchar(10) not null,
   Nationnalite        varchar(100) not null



   PRIMARY KEY (Id_Joueur)

);
Engine = InnoDB default Charset=utf8mb4 collate= utf8mb4_unicode_ci;

create table if not exists Titulaire
(
   Id_Joueur           int not null,
   Id_Match           int not null
   
   PRIMARY KEY (Id_Joueur, Id_Match)

);
Engine = InnoDB default Charset=utf8mb4 collate= utf8mb4_unicode_ci;

create table if not exists Banc_Touche
(
   Id_Joueur           int not null,
   Id_Match           int not null
   
   PRIMARY KEY (Id_Joueur, Id_Match)

);
Engine = InnoDB default Charset=utf8mb4 collate= utf8mb4_unicode_ci;

create table if not exists Matchs
(
   Id_Match           int not null auto_increment,
   Date_Match         date not null,
   Heure_Match         time not null


   PRIMARY KEY (Id_Match)

);
Engine = InnoDB default Charset=utf8mb4 collate= utf8mb4_unicode_ci;

create table if not exists Fait_Match
(
   Id_Match          int not null,
   Id_But           int not null,
   Id_Carton           int not null

   PRIMARY KEY (Id_Match, Id_But, Id_Carton)

);
Engine = InnoDB default Charset=utf8mb4 collate= utf8mb4_unicode_ci;

create table if not exists But
(
   Id_But             int not null auto_increment,
   Id_Match           int not null,
   Heure_But         time not null,
   CSC               boolean not null

   PRIMARY KEY (Id_But)

);
Engine = InnoDB default Charset=utf8mb4 collate= utf8mb4_unicode_ci;

create table if not exists Carton
(
   Id_Carton             int not null auto_increment,
   Id_Match              int not null,
   Heure_Carton          time not null,
   Couleur_Carton        boolean not null

   PRIMARY KEY (Id_Carton)

);
Engine = InnoDB default Charset=utf8mb4 collate= utf8mb4_unicode_ci;

create table if not exists Marque
(
   Id_Joueur           int not null,
   Id_But           int not null
   
   PRIMARY KEY (Id_Joueur, Id_But)

);
Engine = InnoDB default Charset=utf8mb4 collate= utf8mb4_unicode_ci;

create table if not exists Reçoit
(
   Id_Joueur           int not null,
   Id_Carton           int not null
   
   PRIMARY KEY (Id_Joueur, Id_Carton)

);
Engine = InnoDB default Charset=utf8mb4 collate= utf8mb4_unicode_ci;

create table if not exists Feuille_Match
(
   Id_Feuille_Match   int not null auto_increment, 
   Id_Match           int not null
   
   PRIMARY KEY (Id_Feuille_Match)

);
Engine = InnoDB default Charset=utf8mb4 collate= utf8mb4_unicode_ci;



ALTER TABLE Joueur
ADD FOREIGN KEY (Id_Equipe) REFERENCES Club(Id_Equipe);


ALTER TABLE Titulaire
ADD FOREIGN KEY (Id_Joueur) REFERENCES Joueur(Id_Joueur),
ADD FOREIGN KEY (Id_Match) REFERENCES Matchs(Id_Match);

ALTER TABLE Banc_Touche
ADD FOREIGN KEY (Id_Joueur) REFERENCES Joueur(Id_Joueur),
ADD FOREIGN KEY (Id_Match) REFERENCES Matchs(Id_Match);


ALTER TABLE Fait_Match
ADD FOREIGN KEY (Id_Match) REFERENCES Matchs(Id_Match),
ADD FOREIGN KEY (Id_But) REFERENCES But(Id_But),
ADD FOREIGN KEY (Id_Carton) REFERENCES Carton(Id_Carton);

ALTER TABLE But
ADD FOREIGN KEY (Id_Match) REFERENCES Matchs(Id_Match);

ALTER TABLE Carton
ADD FOREIGN KEY (Id_Match) REFERENCES Matchs(Id_Match);


ALTER TABLE Marque
ADD FOREIGN KEY (Id_Joueur) REFERENCES Joueur(Id_Joueur),
ADD FOREIGN KEY (Id_But) REFERENCES But(Id_But);

ALTER TABLE Reçoit
ADD FOREIGN KEY (Id_Joueur) REFERENCES Joueur(Id_Joueur),
ADD FOREIGN KEY (Id_Carton) REFERENCES Carton(Id_Carton);


ALTER TABLE Feuille_Match
ADD FOREIGN KEY (Id_Match) REFERENCES Matchs(Id_Match);


