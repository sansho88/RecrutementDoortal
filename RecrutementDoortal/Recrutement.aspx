<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Recrutement.aspx.cs" Inherits="RecrutementDoortal.Recrutement" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="utf-8" />
    <title>Recrutement</title>
    <meta http-equiv="Content-Security-Policy" content="default-src 'self'; script-src 'self'; style-src 'self'; object-src 'none';">
    
    <link rel="stylesheet" href="styles.css?v=1.1" />
</head>
<body>

    <div class="container">
        <h1>Recrutement de Thomas GRIFFITH</h1>

        <% if (!string.IsNullOrEmpty(Msg)) { %>
            <div class="message-box server-msg">
                <%= Msg %>
            </div>
        <% } %>

        <div id="ajaxResult" class="message-box ajax-msg" hidden></div>

        <form method="post" action="Recrutement.aspx">
            <div class="actions">
                <button type="submit" name="action" value="recruterAvecPlaisir" class="pill bluePill">
                    Test du Postback
                </button>

                <button type="button" id="btnAjax" class="pill redPill">
                    Test Ajax
                </button>
            </div>
        </form>
    </div>

    <script src="app.js"></script>
</body>
</html>