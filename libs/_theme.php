<?php

function getAllThemes(){

    $themes = [
        ["nom_theme" => "Histoire"],
        ["nom_theme" => "Art"],
        ["nom_theme" => "Foot"],
        ["nom_theme" => "Formule 1"],
        ["nom_theme" => "Musique"],
        ["nom_theme" => "Cinéma"]
    ];
    return $themes;
};

function getTheme(int $id){
    $themes = getAllThemes();
    return $themes[$id];
}