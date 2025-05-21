<?php

function getAllThemes(){

    $themes = [
        ["id_theme" =>1,"nom_theme" => "Histoire", "img_theme" => "../asset/img/histoire.webp", "description_theme" => "Découvrez le Stephan Bern qui se cache en vous ! "],
        ["id_theme" =>2,"nom_theme" => "Art", "img_theme" => "../asset/img/art..webp", "description_theme" => "À vos pinceaux… euh, non, à vos neurones !"],
        ["id_theme" =>3,"nom_theme" => "Foot", "img_theme" => "../asset/img/foot.webp", "description_theme" => "Sors tes crampons, c’est l’heure de marquer des points !"],
        ["id_theme" =>4,"nom_theme" => "Formule 1", "img_theme" => "../asset/img/formule1.webp", "description_theme" => "Mets-toi en pole position et réponds plus vite qu’un tour de piste à Monaco !"],
        ["id_theme" =>5,"nom_theme" => "Musique", "img_theme" => "../asset/img/musique.webp", "description_theme" => "Ce quiz va te faire chanter… ou déchanter !"],
        ["id_theme" =>6,"nom_theme" => "Cinéma", "img_theme" => "../asset/img/cinema.webp", "description_theme" => "Silence, moteur, action… Et que le meilleur critique de canapé l’emporte !"]
    ];
    return $themes;
};

function getTheme($id){
    $themes = getAllThemes();
    return $themes[$id];
}

