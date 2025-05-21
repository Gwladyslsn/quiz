<?php 

function addUser(PDO $pdo, string $pseudo_user, string $mail_user, string $mdp_user):bool
{
    $query = $pdo->prepare("INSERT INTO `user`(`mail_user`, `pseudo_user`, `mdp_user`) VALUES (:mail_user, :pseudo_user, :mdp_user)");

    $password = password_hash($mdp_user, PASSWORD_DEFAULT);

    $query->bindValue(':mail_user', $mail_user);
    $query->bindValue(':pseudo_user', $pseudo_user);
    $query->bindValue(':mdp_user', $mdp_user);

    return $query->execute();
}

function verifyUser(array $user):array
{
    $errors = [];

    if(isset($user["pseudo_user"])) {
        if($user["pseudo_user"] === ""){
            $errors["pseudo_user"] = "Le champ Pseudo ne doit pas etre vide";
        }
    }else{
        $errors["pseudo_user"] = "Il manque le champ Pseudo";
    }

    if(count($errors)){
        return $errors;
    }
    return $errors;
}