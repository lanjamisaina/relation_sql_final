<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "lanja";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Membres de la tâche</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h2>Sélectionner une tâche</h2>
    <form method="GET">
        <input type="number" name="idtache" placeholder="ID de la tâche" required>
        <input type="submit" value="Afficher les membres">
    </form>

    <?php
    if(isset($_GET['idtache'])) {
        $idtache = $_GET['idtache'];
        
        $sql = "SELECT 
                    m.Prenom, 
                    m.Nom, 
                    p.Fonction,
                    s.Intitule as Specialite,
                    t.Nom as NomTache,
                    t.Debut as DebutTache,
                    t.Fin as FinTache
                FROM Membre m 
                JOIN Participe p ON m.IdMembre = p.IdMembre
                JOIN Tache t ON p.IDtache = t.IDtache AND p.IDprojet = t.IDprojet
                LEFT JOIN Specialite s ON m.IDspecialite = s.IDspecialite
                WHERE p.IDtache = ?";
        
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $idtache);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            echo "<h3>Membres de la tâche " . htmlspecialchars($idtache) . "</h3>";
            echo "<table>";
            echo "<tr>
                    <th>Prénom</th>
                    <th>Nom</th>
                    <th>Fonction</th>
                    <th>Spécialité</th>
                    <th>Tâche</th>
                    <th>Début</th>
                    <th>Fin</th>
                  </tr>";
            
            while($row = $result->fetch_assoc()) {
                echo "<tr>";
                echo "<td>" . htmlspecialchars($row['Prenom']) . "</td>";
                echo "<td>" . htmlspecialchars($row['Nom']) . "</td>";
                echo "<td>" . htmlspecialchars($row['Fonction']) . "</td>";
                echo "<td>" . htmlspecialchars($row['Specialite']) . "</td>";
                echo "<td>" . htmlspecialchars($row['NomTache']) . "</td>";
                echo "<td>" . htmlspecialchars($row['DebutTache']) . "</td>";
                echo "<td>" . htmlspecialchars($row['FinTache']) . "</td>";
                echo "</tr>";
            }
            echo "</table>";
        } else {
            echo "<p>Aucun membre trouvé pour cette tâche.</p>";
        }
        
        $stmt->close();
    }
    $conn->close();
    ?>
</body>
</html>
