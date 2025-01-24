CREATE TABLE Partenaire(
   IDpartenaire INT AUTO_INCREMENT,
   Nom VARCHAR(50)  NOT NULL,
   Description VARCHAR(50) ,
   PRIMARY KEY(IDpartenaire)
);

CREATE TABLE Specialite(
   IDspecialite INT AUTO_INCREMENT,
   Intitule VARCHAR(50)  NOT NULL,
   PRIMARY KEY(IDspecialite)
);

CREATE TABLE Projet(
   IDprojet INT AUTO_INCREMENT,
   Num INT NOT NULL,
   Nom VARCHAR(50) ,
   Debut DATE,
   Fin DATE,
   IDspecialite INT NOT NULL,
   PRIMARY KEY(IDprojet),
   FOREIGN KEY(IDspecialite) REFERENCES Specialite(IDspecialite)
);

CREATE TABLE Membre(
   IdMembre INT AUTO_INCREMENT,
   Prenom VARCHAR(50)  NOT NULL,
   Nom VARCHAR(50) ,
   IDspecialite INT,
   IDprojet INT NOT NULL,
   PRIMARY KEY(IdMembre),
   FOREIGN KEY(IDspecialite) REFERENCES Specialite(IDspecialite),
   FOREIGN KEY(IDprojet) REFERENCES Projet(IDprojet)
);

CREATE TABLE Sprint(
   IDsprint VARCHAR(50) ,
   Nom VARCHAR(50) ,
   IDprojet INT NOT NULL,
   PRIMARY KEY(IDsprint),
   FOREIGN KEY(IDprojet) REFERENCES Projet(IDprojet)
);

CREATE TABLE Backlog(
   IDBacklog INT AUTO_INCREMENT,
   Nom VARCHAR(50) ,
   IDsprint VARCHAR(50)  NOT NULL,
   PRIMARY KEY(IDBacklog),
   FOREIGN KEY(IDsprint) REFERENCES Sprint(IDsprint)
);

CREATE TABLE Tache(
   IDprojet INT,
   IDtache INT AUTO_INCREMENT,
   Num INT NOT NULL,
   Nom VARCHAR(50) ,
   Debut DATE,
   Fin DATE,
   IDBacklog INT NOT NULL,
   PRIMARY KEY(IDprojet, IDtache),
   FOREIGN KEY(IDprojet) REFERENCES Projet(IDprojet),
   FOREIGN KEY(IDBacklog) REFERENCES Backlog(IDBacklog)
);

CREATE TABLE estAssocie(
   IDprojet INT,
   IDpartenaire INT,
   Role VARCHAR(50) ,
   PRIMARY KEY(IDprojet, IDpartenaire),
   FOREIGN KEY(IDprojet) REFERENCES Projet(IDprojet),
   FOREIGN KEY(IDpartenaire) REFERENCES Partenaire(IDpartenaire)
);

CREATE TABLE Participe(
   IDprojet INT,
   IDtache INT,
   IdMembre INT,
   Fonction VARCHAR(50) ,
   PRIMARY KEY(IDprojet, IDtache, IdMembre),
   FOREIGN KEY(IDprojet, IDtache) REFERENCES Tache(IDprojet, IDtache),
   FOREIGN KEY(IdMembre) REFERENCES Membre(IdMembre)
);
