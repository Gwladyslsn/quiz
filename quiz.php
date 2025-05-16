<?php

require_once "./templates/header.php";
require "./libs/_theme.php";
$themes = getAllThemes();
?>



<body>
    <main id="quiz-container" class="quiz">
        <div id="question-box">
            <h1 id="theme-title">
                Quiz sur le thème : 
                
            </h1>
            <div id="timer-text">Attention, le timer va bientot se lancer</div><br>
            <div id="progress-bar-container" style="background: #eee; height: 10px; width: 100%; margin-top: 5px;">
                <div id="progress-bar" style="background: #4CAF50; height: 10px; width: 100%;"></div>
            </div>
            <h2 id="question-text">Chargement de la question...</h2>

            <div id="options-container">
                <button class="option-btn" data-index="1"></button>
                <button class="option-btn" data-index="2"></button>
                <button class="option-btn" data-index="3"></button>
                <button class="option-btn" data-index="4"></button>
            </div>

            <div id="result-container">
                
            </div>
            <div id="score"></div>

            <div id="next">
                <button id="next-btn" disabled>Suivant</button>
            </div>
        </div>
    </main>
<?php $page_script = './asset/js/quiz.js'; ?>
</body>

<?php
require_once "./templates/footer.php";
