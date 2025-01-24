-- Table Utilisateur
CREATE TABLE Utilisateur (
    IdUtilisateur INT PRIMARY KEY,
    Nom VARCHAR(50),
    Prenom VARCHAR(50),
    Email VARCHAR(100),
    Role VARCHAR(50)
);

-- Table Evenement  
CREATE TABLE Evenement (
    IdEvenement INT PRIMARY KEY,
    Nom VARCHAR(100),
    Date DATE,
    Type VARCHAR(50),
    Description TEXT,
    Statut VARCHAR(20)
);

-- Table de relation Utilisateur_Evenement
CREATE TABLE Utilisateur_Evenement (
    IdUtilisateur INT,
    IdEvenement INT,
    PRIMARY KEY (IdUtilisateur, IdEvenement),
    FOREIGN KEY (IdUtilisateur) REFERENCES Utilisateur(IdUtilisateur),
    FOREIGN KEY (IdEvenement) REFERENCES Evenement(IdEvenement)
);

-- Table Sprint
CREATE TABLE Sprint (
    IDsprint INT PRIMARY KEY,
    Nom VARCHAR(100),
    DateDebut DATE,
    DateFin DATE, 
    Description TEXT,
    Statut VARCHAR(20),
    IDprojet INT,
    FOREIGN KEY (IDprojet) REFERENCES Projet(IDprojet)
);

-- Table Projet
CREATE TABLE Projet (
    IDprojet INT PRIMARY KEY,
    Num VARCHAR(20),
    Nom VARCHAR(100),
    Debut DATE,
    Fin DATE,
    Description TEXT,
    Budget DECIMAL(10,2),
    Statut VARCHAR(20)
);

-- Table de relation Utilisateur_Projet
CREATE TABLE Utilisateur_Projet (
    IdUtilisateur INT,
    IDprojet INT,
    PRIMARY KEY (IdUtilisateur, IDprojet),
    FOREIGN KEY (IdUtilisateur) REFERENCES Utilisateur(IdUtilisateur),
    FOREIGN KEY (IDprojet) REFERENCES Projet(IDprojet)
);

-- Table Tache
CREATE TABLE Tache (
    IDtache INT PRIMARY KEY,
    Num VARCHAR(20),
    Nom VARCHAR(100),
    Debut DATE,
    Fin DATE,
    Priorite INT,
    Statut VARCHAR(20),
    Description TEXT,
    EstimationTemps DECIMAL(8,2),
    IDprojet INT,
    FOREIGN KEY (IDprojet) REFERENCES Projet(IDprojet)
);

-- Table de relation Utilisateur_Tache
CREATE TABLE Utilisateur_Tache (
    IdUtilisateur INT,
    IDtache INT,
    PRIMARY KEY (IdUtilisateur, IDtache),
    FOREIGN KEY (IdUtilisateur) REFERENCES Utilisateur(IdUtilisateur),
    FOREIGN KEY (IDtache) REFERENCES Tache(IDtache)
);

-- Table Deliverable
CREATE TABLE Deliverable (
    IdDeliverable INT PRIMARY KEY,
    Nom VARCHAR(100),
    Date DATE,
    Description TEXT,
    Statut VARCHAR(20),
    IDprojet INT,
    FOREIGN KEY (IDprojet) REFERENCES Projet(IDprojet)
);

-- Table de relation Utilisateur_Deliverable
CREATE TABLE Utilisateur_Deliverable (
    IdUtilisateur INT,
    IdDeliverable INT,
    PRIMARY KEY (IdUtilisateur, IdDeliverable),
    FOREIGN KEY (IdUtilisateur) REFERENCES Utilisateur(IdUtilisateur),
    FOREIGN KEY (IdDeliverable) REFERENCES Deliverable(IdDeliverable)
);