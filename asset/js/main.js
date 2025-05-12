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

    document.getElementById('next-btn').disabled = true;
}

function checkAnswer(){
    const answers = document.querySelectorAll('.option-btn');
    answers.forEach(answer =>{
        answer.addEventListener("click", (event) =>{
            event.preventDefault();
            if (event){
                answer.classList.toggle("check");
            }
        });
    })
}

// Appel initial
chargerQuestions();

//verif reponse
checkAnswer();

});



