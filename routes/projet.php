<?php
    require_once '../classes/Database.php';

    // Créer une instance de la connexion
    $db = new Database();

    // Exemple d'utilisation pour une requête
    $query = $db->query("SELECT * FROM partenaire");
    $results = $query->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode($results);