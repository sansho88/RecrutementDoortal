Imports System
Imports System.Web.Services

Public Class Recrutement
    Inherits System.Web.UI.Page

    Protected Property Msg As String = ""
    
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Request.HttpMethod = "POST" Then
            Dim action As String = Request.Form("action")
            If action = "recruterAvecPlaisir" Then
                Msg = "Test du Post-Back réussi !"
            End If
        End If
    End Sub
    
    <WebMethod()>
    Public Shared Function CallTelamonsSon() As String
        Return "Test Ajax validé !" & Environment.NewLine
    End Function

End Class


