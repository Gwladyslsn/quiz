document.addEventListener("DOMContentLoaded", function () {

let currentIndex = 0;
let score = 0;
let questions = [];


async function chargerQuestions() {
    try {
        const response = await fetch("http://localhost:3000/asset/php/get_questions.php");
        const data = await response.json();
        questions = data;
        afficherQuestion(currentIndex); // on affiche la première question une fois les données chargées
    } catch (error) {
        console.error("Erreur lors du chargement des questions :", error);
    }
}

function afficherQuestion(index) {
    const questionElement = document.getElementById('question-text');
    const optionsButtons = document.querySelectorAll('.option-btn');

    const questionActuelle = questions[index];
    questionElement.textContent = questionActuelle.question;

    // Affiche les 4 options dans les boutons
    optionsButtons.forEach((btn, i) => {
        btn.textContent = questionActuelle[`option${i + 1}`];
        btn.disabled = false;
    });

    checkAnswer();
    document.getElementById('next-btn').disabled = true;
}

function checkAnswer() {
    const reponses = document.querySelectorAll('.option-btn');

    reponses.forEach(reponse => {
        reponse.addEventListener("click", (event) => {
            event.preventDefault();
            reponse.classList.add("check");

            // 2. Délai avant vérification
            setTimeout(() => {
                const indexChoisi = parseInt(reponse.dataset.index);
                const bonneReponse = questions[currentIndex].answer;

                if (indexChoisi === bonneReponse) {
                    console.log("bonne réponse");
                    reponse.style.background = "green";
                } else {
                    console.log("mauvaise réponse");
                    reponse.style.background = "red";
                }
            }, 2000); 
        });
    });
}

        

// Appel initial
chargerQuestions();


});



