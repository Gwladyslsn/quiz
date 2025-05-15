document.addEventListener("DOMContentLoaded", function () {

let timer; // stockage du setInterval
let timeLeft; // temps restant
let totalTime; // tempsTotal
let reponseChoisie = null; // Stocke l'index de la réponse choisie
let questionActive = true; // Indique si une question est active et interactive

let currentIndex = 0;
let score = 0;
let questions = [];
let result = document.getElementById('result-container');
let visuScore = document.getElementById('score');

async function chargerQuestions() {
    try {
        const response = await fetch("http://localhost:3000/libs/get_questions.php");
        const data = await response.json();
        questions = data;
        afficherQuestion(currentIndex); // on affiche la première question une fois les données chargées
    } catch (error) {
        console.error("Erreur lors du chargement des questions :", error);
    }
}

function afficherQuestion(index){
    const questionElement = document.getElementById('question-text');
    const optionsButtons = document.querySelectorAll('.option-btn');

    const questionActuelle = questions[index];
    questionElement.textContent = questionActuelle.question;

    // Affiche les 4 options dans les boutons et réinitialise l'état
    optionsButtons.forEach((btn, i) => {
        btn.textContent = questionActuelle[`option${i + 1}`];
        btn.disabled = false;
        btn.classList.remove("check"); // Supprime la classe de sélection précédente
        btn.style.background = ""; // Réinitialise la couleur de fond
        btn.dataset.index = i + 1; // Assurez-vous que l'index est correct
    });

    reponseChoisie = null; // Réinitialise la réponse choisie pour la nouvelle question
    questionActive = true; // La nouvelle question est active
    setTimeout(()=>{startTimer()}, 100);
    choixRep();
}

function startTimer(){
    totalTime = 15; 
    timeLeft = totalTime;

    clearInterval(timer); // S'assurer qu'un timer précédent est effacé
    timer = setInterval(()=>{
        timeLeft--;
        updateTimerDisplay() // mettre à jour le timer en fonction nb secondes passées

        if (timeLeft <= 0 && questionActive){
            checkAnswer();
            clearInterval(timer); // affichage timer fini
            questionActive = false; // Désactiver les interactions après le temps écoulé
            setTimeout(() => afficherQuestionSuivante(), 2000); // Passer à la question suivante après un délai
        }
    }, 1000);
}

function updateTimerDisplay(){
    document.getElementById('timer-text').textContent = `${timeLeft} secondes restantes`;
    const percentage = (timeLeft / totalTime) * 100;
    document.getElementById('progress-bar').style.width = `${percentage}%`;
};

function choixRep(){
    const reponses = document.querySelectorAll('.option-btn');
    reponses.forEach(reponse => {
        reponse.addEventListener("click", (event) => {
            event.preventDefault();

            if (!questionActive || reponseChoisie !== null) {
                return; // Empêcher les clics si la question n'est pas active ou si une réponse a déjà été choisie
            }

            reponseChoisie = parseInt(reponse.dataset.index);

            // Empêcher d'autres clics
            reponses.forEach(btn => btn.disabled = true);

            // Marque visuellement la sélection
            reponse.classList.add("check");
        });
    });
};

function checkAnswer() {
    
    if (reponseChoisie === null) {
        result.textContent = "Aucune réponse choisie avant la vérification.";
        return;
    }

    const bonneReponse = questions[currentIndex].answer;
    const reponses = document.querySelectorAll('.option-btn');

    reponses.forEach(reponse => {
        const indexBtn = parseInt(reponse.dataset.index);
        if (indexBtn === bonneReponse) {
            reponse.style.background = "green";
        } else if (indexBtn === reponseChoisie) {
            reponse.style.background = "red";
        }
    });

    if (reponseChoisie === bonneReponse) {
        result.textContent = "Bravo, c'est la bonne réponse"
        score++;
    } else {
        result.textContent = `Mauvaise réponse.. La bonne réponse est la réponse : ${bonneReponse}`
    };
    visuScore.textContent = `Score actuel : ${score}`;
}

function afficherQuestionSuivante() {
    result.textContent = "";
    currentIndex++;
    if (currentIndex < questions.length) {
        afficherQuestion(currentIndex);
    } else {
        visuScore.textContent = "";
        let end = document.getElementById('next');
        end.textContent = `Quiz terminé ! Score final : ${score}`;
    }
}

// appel fonction principale
chargerQuestions();

});