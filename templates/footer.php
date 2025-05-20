<footer class="text-gray-400 bg-gray-900 body-font">
    <div class="container px-5 py-8 mx-auto flex items-center sm:flex-row flex-col">
        <a class="flex title-font font-medium items-center md:justify-start justify-center text-white">
                <img src="./asset/img/quiz_app_logo.webp" alt="Logo Ludi'quiz" class="logoFooter">
                <span class="ml-3 text-xl">Ludi'Quiz</span>
        </a>
        <p class="text-sm text-gray-500  sm:py-2 sm:mt-0 mt-4">
            <a href="./contact.php" class="text-gray-600 ml-1" rel="noopener noreferrer" target="_blank"> Contactez-nous </a>
        </p>
        <p class="text-sm text-gray-500 sm:ml-4 sm:pl-4 sm:border-l-2 sm:border-gray-200 sm:py-2 sm:mt-0 mt-4">© 2025 Ludi'Quiz —
            <a href="" class="text-gray-600 ml-1" rel="noopener noreferrer" target="_blank">@Gwladys</a>
        </p>
    </div>
</footer> 

<?php if (isset($page_script)): ?>
        <script src="<?php echo $page_script; ?>"></script>
    <?php endif; ?>
</body>

</html>