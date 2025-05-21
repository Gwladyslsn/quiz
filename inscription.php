<?php
require_once "./templates/_header.php";
require_once "libs/pdo.php";
require_once "libs/user.php";

$errors = [];
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $errors = verifyUser($_POST);

    var_dump($errors);
};


?>

<section class="text-gray-400 bg-gray-900 body-font">
    <div class="container px-5 py-24 mx-auto flex flex-wrap items-center ">
        <div class="lg:w-3/6 md:w-1/2 md:pr-16 lg:pr-0 pr-0 m-auto">
            <h1 class="title-font font-medium text-3xl text-white">Inscrivez-vous ici ! </h1>
            <p class="leading-relaxed mt-4">Sauvegardez vos scores et comparez vos résultats d'un quiz à l'autre</p>
        </div>

<!--FORMULAIRE CONNEXION-->
        <form action="" method="post" class="lg:w-2/6 md:w-1/2 bg-gray-800  bg-opacity-50 rounded-lg p-8 flex flex-col md:ml-auto w-full mt-10 md:mt-0">
            <h2 class="text-white text-lg font-medium text-center title-font mb-5">Inscription</h2>
            <div class="relative mb-4">
                <label for="username" class="leading-7 text-sm text-gray-400">Pseudo</label>
                <input type="text" id="username" name="pseudo_user" class="w-full bg-gray-600 bg-opacity-20 focus:bg-transparent focus:ring-2 focus:ring-blue-900 rounded border border-gray-600 focus:border-blue-500 text-base outline-none text-gray-100 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out">
            </div>
            <div class="relative mb-4">
                <label for="email" class="leading-7 text-sm text-gray-400">Email</label>
                <input type="email" id="email" name="mail_user" class="w-full bg-gray-600 bg-opacity-20 focus:bg-transparent focus:ring-2 focus:ring-blue-900 rounded border border-gray-600 focus:border-blue-500 text-base outline-none text-gray-100 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out">
            </div>
            <div class="relative mb-4">
                <label for="password" class="leading-7 text-sm text-gray-400">Mot de passe</label>
                <input type="password" id="password" name="mdp_user" class="w-full bg-gray-600 bg-opacity-20 focus:bg-transparent focus:ring-2 focus:ring-blue-900 rounded border border-gray-600 focus:border-blue-500 text-base outline-none text-gray-100 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out">
            </div>
            <button class="text-white bg-blue-500 border-0 py-2 px-8 focus:outline-none hover:bg-blue-600 rounded text-lg mt-3">S'inscrire</button>
        </form>
    </div>
</section>

<?php

require_once "templates/_footer.php";
?>