<?php

require_once "./asset/php/_header.php";
?>


<body>
    <main id="quiz-container" class="quiz">
        <div id="question-box">
            <h2 id="question-text">Chargement de la question...</h2>

            <div id="options-container">
                <button class="option-btn" data-index="1"></button>
                <button class="option-btn" data-index="2"></button>
                <button class="option-btn" data-index="3"></button>
                <button class="option-btn" data-index="4"></button>
            </div>

            <button id="next-btn" disabled>Suivant</button>
        </div>
    </main>

</body>

<?php
require_once "./asset/php/_footer.php";
