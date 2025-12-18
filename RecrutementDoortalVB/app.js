document.addEventListener('DOMContentLoaded', function() {

    const btnAjax = document.getElementById('btnAjax');
    const resultDiv = document.getElementById('ajaxResult');

    if (btnAjax) {
        btnAjax.addEventListener('click', function() {

            fetch('Recrutement.aspx/CallTelamonsSon', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: '{}' 
            })
                .then(response => response.json())
                .then(data => {
                    resultDiv.textContent = data.d;
                    resultDiv.hidden = false;
                    resultDiv.style.display = 'block'; 
                })
                .catch(error => {
                    console.error('Erreur:', error);
                    resultDiv.textContent = "Erreur lors de l'appel AJAX.";
                    resultDiv.hidden = false;
                });
        });
    }
});
