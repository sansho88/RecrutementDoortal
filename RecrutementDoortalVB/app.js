document.addEventListener('DOMContentLoaded', function () {

    const btnAjax = document.getElementById('btnAjax');
    const btnDatabase = document.getElementById('btnDatabase');
    const resultDiv = document.getElementById('ajaxResult');
    const dbResultDiv = document.getElementById('dbResult');

    // Bouton Test Ajax - teste aussi la connexion BDD
    if (btnAjax) {
        btnAjax.addEventListener('click', function () {

            fetch('Recrutement.aspx/CallTelamonsSon', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'Cache-Control': 'no-cache, no-store, must-revalidate',
                    'Pragma': 'no-cache'
                },
                body: JSON.stringify({ timestamp: Date.now() }),
                cache: 'no-store'
            })
                .then(response => response.json())
                .then(data => {
                    const result = data.d;
                    resultDiv.textContent = result.message;
                    resultDiv.hidden = false;
                    resultDiv.style.display = 'block';
               

                    // Si la BDD est connectée, afficher le 3ème bouton
                    if (result.dbConnected) {
                        btnDatabase.hidden = false;
                        btnDatabase.style.display = 'inline-block';
                    } else {
                        btnDatabase.hidden = true;
                        btnDatabase.style.display = 'none';
                    }
                })
                .catch(error => {
                    console.error('Erreur:', error);
                    resultDiv.textContent = "Erreur lors de l'appel AJAX.";
                    resultDiv.hidden = false;
                    resultDiv.style.display = 'block';
                });
        });
    }

    // Bouton Message BDD - récupère le message depuis SQL Server
    if (btnDatabase) {
        btnDatabase.addEventListener('click', function () {

            fetch('Recrutement.aspx/GetMessageFromDatabase', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'Cache-Control': 'no-cache, no-store, must-revalidate',
                    'Pragma': 'no-cache'
                },
                body: JSON.stringify({ timestamp: Date.now() }),
                cache: 'no-store'
            })
                .then(response => response.json())
                .then(data => {
                    const result = data.d;

                    if (result.success) {
                        dbResultDiv.textContent = result.texte;
                        dbResultDiv.className = 'message-box db-msg db-success';
                    } else {
                        dbResultDiv.textContent = result.error;
                        dbResultDiv.className = 'message-box db-msg db-error';
                    }

                    dbResultDiv.hidden = false;
                    dbResultDiv.style.display = 'block';
                })
                .catch(error => {
                    console.error('Erreur:', error);
                    dbResultDiv.textContent = "Erreur lors de la récupération du message.";
                    dbResultDiv.className = 'message-box db-msg db-error';
                    dbResultDiv.hidden = false;
                    dbResultDiv.style.display = 'block';
                });
        });
    }
});
