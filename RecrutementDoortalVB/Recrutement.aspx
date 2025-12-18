<%@ Page Language="VB" AutoEventWireup="false" CodeBehind="Recrutement.aspx.vb" Inherits="RecrutementDoortalVB.Recrutement" EnableSessionState="False" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="utf-8" />
    <title>Recrutement</title>
    <meta http-equiv="Content-Security-Policy" content="default-src 'self'; script-src 'self'; style-src 'self'; object-src 'none';">
    
    <link rel="stylesheet" href="styles.css?v=1.2" />
</head>
<body>

    <div class="container">
        <h1>Recrutement de Thomas GRIFFITH (VB.NET)</h1>

        <% If Not String.IsNullOrEmpty(Msg) Then %>
            <div class="message-box server-msg">
                <%= Msg %>
            </div>
        <% End If %>

        <div id="ajaxResult" class="message-box ajax-msg" hidden></div>
        <div id="dbResult" class="message-box db-msg" hidden></div>

        <form id="form1" method="post" runat="server">
            <div class="actions">
                <button type="submit" name="action" value="recruterAvecPlaisir" class="pill bluePill">
                    Test du Postback
                </button>

                <button type="button" id="btnAjax" class="pill redPill">
                    Test Ajax
                </button>

                <button type="button" id="btnDatabase" class="pill greenPill" hidden>
                    Astuce du jour
                </button>
            </div>
        </form>
    </div>

    <script src="app.js?v=1.3"></script>
</body>
</html>

