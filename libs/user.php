<?php 

function addUser(PDO $pdo, string $pseudo_user, string $mail_user, string $mdp_user):bool
{
    $query = $pdo->prepare("INSERT INTO `user`(`mail_user`, `pseudo_user`, `mdp_user`) VALUES (:mail_user, :pseudo_user, :mdp_user)");

    $password = password_hash($mdp_user, PASSWORD_DEFAULT);

    $query->bindValue(':mail_user', $mail_user);
    $query->bindValue(':pseudo_user', $pseudo_user);
    $query->bindValue(':mdp_user', $password);

    return $query->execute();
}

function verifyUserInput(array $user):array
{
    $errors = [];

        if($user["pseudo_user"] === ""){
            $errors["pseudo_user"] = "Le champ Pseudo ne doit pas etre vide";
        }
    if($user["mail_user"] === ""){
            $errors["mail_user"] = "Le champ Email ne doit pas etre vide";
    }
    if($user["mdp_user"] === ""){
            $errors["mdp_user"] = "Le champ Mot de passe ne doit pas etre vide";
    }
    if(count($errors)){
        return $errors;
    }
    return $errors;
};
    
function emailExists($pdo, $mail_user){
    $sql = "SELECT COUNT(*) FROM user WHERE mail_user = :mail_user";
    $stmt = $pdo->prepare($sql);
    $stmt->execute(['mail_user' => $mail_user]);
    return $stmt->fetchColumn() > 0;
}

function pseudoExists($pdo, $pseudo_user){
    $sql = "SELECT COUNT(*) FROM user WHERE pseudo_user = :pseudo_user";
    $stmt = $pdo->prepare($sql);
    $stmt->execute(['pseudo_user' => $pseudo_user]);
    return $stmt->fetchColumn() > 0;
}

function verifUserExists($pdo, $mail_user, $password) {
    $sql = "SELECT mdp_user FROM user WHERE mail_user = :mail_user";
    $stmt = $pdo->prepare($sql);
    $stmt->execute(['mail_user' => $mail_user]);
    $hash = $stmt->fetchColumn();

    if ($hash && password_verify($password, $hash)) {
        return true;
    } else {
        return false;
    }
}
