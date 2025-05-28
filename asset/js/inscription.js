    // Remplacer les caracteres utilisés pour faille xss :
    function escapeHtml(text){
        const map = {
        "&": "&amp",
        "<": "&lt;",
        ">": "&gt;",
        '"': "&quot;",
        "'": "&#039;",
        };
        return text.replace(/[&<>"']/g, function (m){
            return map[m]
        });
    }

    document.addEventListener("DOMContentLoaded", function(){

        const btnSign = document.getElementById('btnSign');
        const feedbackLogin = document.getElementById('feedbackLogin');
        const inputPseudo = document.getElementById('username');
        const inputEmail = document.getElementById('email');
        const inputMdp = document.getElementById('password');
        const form = document.querySelector('form');

        if (!btnSign || !feedbackLogin || !inputPseudo || !inputEmail || !inputMdp) {
        console.error("Erreur: Un ou plusieurs éléments du formulaire n'ont pas été trouvés. Vérifiez les IDs HTML.");
        return;
        }

    btnSign.addEventListener("click", function(event){
        event.preventDefault();
        console.log("click btn login");
        

        feedbackLogin.textContent = "";

        //Recuperation et nettoyage des valeurs
        let pseudo = inputPseudo.value.trim();
        let email = inputEmail.value.trim();
        let mdp = inputMdp.value.trim();
        console.log({ pseudo, email, mdp });

        //Stock des erreurs
        const errors = {};

        //Verif pseudo
        if (pseudo === ""){
            errors['pseudo'] = "Le champ pseudo ne doit pas etre vide"
        }

        //Verif mail avec Regex
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (email === ""){
            errors['email'] = "Le champ Mail ne doit pas etre vide !"
        }else if(!emailRegex.test(email)){
            errors['email'] = "Le format de l'adresse mail est invalide !"
        }

        //Verif mot de passe
        if (mdp === ""){
            errors['mdp'] = "Le champ Mot de passe ne doit pas etre vide"
        }

        //Afficher message si erreur
        if (Object.keys(errors).length > 0) { 
            console.log("💥 Erreurs détectées, on entre dans le bloc d'erreur !");
            console.log("Erreurs de validation côté client :", errors);
            let errorHtml = '<div class="alert alert-danger"><ul>'; 
            for (let key in errors) {
                errorHtml += `<li>${escapeHtml(errors[key])}</li>`;
            }
            errorHtml += '</ul></div>';
            feedbackLogin.innerHTML = errorHtml; 
            console.log({ pseudo, email, mdp });
            console.log("Erreurs de validation côté client :", errors); 
        } else {
            feedbackLogin.innerHTML = '<div class="alert alert-success">Formulaire valide côté client ! Envoi au serveur...</div>';
            console.log("Formulaire valide côté client. Prêt à envoyer au serveur.");
            form.submit();


            // Ici, tu mettras le code AJAX pour envoyer les données au serveur PHP
            // Nous le ferons à la prochaine étape. Pour l'instant, juste un message.
        }
    });
});
    


