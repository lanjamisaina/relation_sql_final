<?php
// Connexion à la base de données
$connexion = new PDO('mysql:host=localhost;dbname=lanja', 'root', '');

// Récupération des données du formulaire
$Nom = $_POST['Nom'];
$Description = $_POST['Description'];

// Préparation de la requête
$requete = $connexion->prepare('INSERT INTO partenaire (Nom, Description) VALUES (:Nom, :Description)');

// Exécution de la requête avec les valeurs
$requete->execute([
    'Nom' => $Nom,
    'Description' => $Description
]);

// Redirection vers une page de confirmation
header('Location: confirmation.php');
exit();
?>
