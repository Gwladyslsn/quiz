<?php

# Récupère 10 questions aléatoires (JSON)
header('Content-Type: application/json');
require_once '_db.php';
require "_theme.php";
$themes = getAllThemes();

$themeId = isset($_GET['theme_id']) ? $_GET['theme_id'] : null;
error_log("Theme ID récupéré : " . $themeId);

try {
    // Récupère le nombre total de questions pour s'assurer qu'il y en a au moins 10
    $countStmt = $pdo->query("SELECT COUNT(*) FROM questions");
    $totalQuestions = $countStmt->fetchColumn();

    if ($totalQuestions < 10 && !$themeId) {
        echo json_encode(['error' => 'Pas assez de questions dans la base de données.']);
        exit();
    }

    // Sélectionne 10 questions aléatoires en tenant compte du thème
    if ($themeId) {
        $stmt = $pdo->prepare("
            SELECT *
            FROM questions
            WHERE id_theme = :theme_id
            ORDER BY RAND()
            LIMIT 10
        ");
        $stmt->bindParam(':theme_id', $themeId, PDO::PARAM_INT);
        $stmt->execute();
        $questions = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } else {
        $stmt = $pdo->query("SELECT * FROM questions ORDER BY RAND() LIMIT 10");
        $questions = $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    echo json_encode($questions);



} catch (PDOException $e) {
    echo json_encode(['error' => 'Erreur : ' . $e->getMessage()]);
}


?>