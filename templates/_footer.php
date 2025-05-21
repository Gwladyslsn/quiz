<footer class="text-gray-400 bg-gray-900 body-font">
    <div class="container mx-auto px-5 py-8 flex flex-col flex-row items-center justify-baseline">
        <a class="flex title-font font-medium items-center md:justify-start justify-center text-white">
                <img src="./asset/img/quiz_app_logo.webp" alt="Logo Ludi'quiz" class="logoFooter">
                <span class="ml-3 text-xl">Ludi'Quiz</span>
        </a>
        <p class="text-sm text-gray-500 m-4">
            <a href="./contact.php" class="text-gray-600 ml-1 nowrap" rel="noopener noreferrer" target="_blank"> Contactez-nous </a>
        </p>
        <p class="text-sm text-gray-500 m-4"> © 2025
            <a href="mentions.php">Mentions légales</a>
        </p>
    </div>
</footer> 

<?php if (isset($page_script)): ?>
        <script src="<?php echo $page_script; ?>"></script>
    <?php endif; ?>
</body>

</html>