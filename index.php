<?php

require_once "./templates/header.php";
require "./libs/_theme.php";
$themes = getAllThemes();
?>

<body>
    <main>

        <section class="text-gray-400 body-font bg-gray-900">
            <div class="container px-5 py-24 mx-auto">
                <div class="flex flex-wrap w-full mb-20">
                    <div class="lg:w-1/2 w-full mb-6 lg:mb-0">
                        <h1 class="sm:text-2xl text-3xl font-medium title-font mb-2 text-white">Venez tester vos connaissances sur nos quiz ! </h1>
                        <div class="h-1 w-20 bg-blue-500 rounded"></div>
                    </div>
                </div>
                <div class="flex flex-wrap -m-4">
                    <?php foreach($themes as $index=>$theme):?>
                    <?php require "./templates/theme_item.php";?>
                    <?php endforeach; ?>
                </div>

            </div>
        </section>





    </main>
    <?php $page_script = './asset/js/index.js'; ?>
</body>


<?php
require_once "./templates/footer.php";
