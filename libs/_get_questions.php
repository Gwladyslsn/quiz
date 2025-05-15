<?php
# Récupère 10 questions aléatoires (JSON)
header('Content-Type: application/json');
require_once '_db.php';

try {
    // Récupère le nombre total de questions pour s'assurer qu'il y en a au moins 10
    $countStmt = $pdo->query("SELECT COUNT(*) FROM questions");
    $totalQuestions = $countStmt->fetchColumn();

    if ($totalQuestions < 10) {
        echo json_encode(['error' => 'Pas assez de questions dans la base de données.']);
        exit();
    }

    // Sélectionne 10 questions aléatoires
    $stmt = $pdo->query("SELECT * FROM questions ORDER BY RAND() LIMIT 10");
    $questions = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($questions);
} catch (PDOException $e) {
    echo json_encode(['error' => 'Erreur : ' . $e->getMessage()]);
}
?>