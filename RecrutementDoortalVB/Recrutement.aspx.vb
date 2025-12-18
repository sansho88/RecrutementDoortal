Imports System
Imports System.Collections.Generic
Imports System.Data.SqlClient
Imports System.Web.Configuration
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
    
    ''' <summary>
    ''' Test Ajax basique + vérification connexion BDD.
    ''' Retourne un objet avec le message et l'état de connexion à la BDD.
    ''' </summary>
    <WebMethod(EnableSession:=False)>
    Public Shared Function CallTelamonsSon() As Object
        Dim result As New Dictionary(Of String, Object)()
        result("message") = "Test Ajax validé !"
        result("dbConnected") = TestDatabaseConnection()
        Return result
    End Function
    
    ''' <summary>
    ''' Récupère un message aléatoire depuis la BDD SQL Server.
    ''' Protégé contre les valeurs nulles. Timeout rapide de 1 seconde.
    ''' </summary>
    <WebMethod(EnableSession:=False)>
    Public Shared Function GetMessageFromDatabase() As Object
        Dim result As New Dictionary(Of String, Object)()
        
        Try
            Dim connString As String = GetConnectionStringWithTimeout()
            
            Using connection As New SqlConnection(connString)
                connection.Open()
                
                ' Message aléatoire non NULL
                Dim query As String = "SELECT TOP 1 ID, Texte FROM Messages WHERE Texte IS NOT NULL AND LEN(Texte) > 0 ORDER BY NEWID()"
                
                Dim command As New SqlCommand(query, connection)
                Using reader As SqlDataReader = command.ExecuteReader()
                    If reader.Read() AndAlso Not reader.IsDBNull(0) AndAlso Not reader.IsDBNull(1) Then
                        result("success") = True
                        result("id") = reader.GetInt32(0)
                        result("texte") = reader.GetString(1)
                    Else
                        result("success") = False
                        result("error") = "Aucun message valide trouvé dans la base de données."
                    End If
                End Using
            End Using
        Catch ex As Exception
            result("success") = False
            result("error") = "Erreur: " & ex.Message
        End Try
        
        Return result
    End Function
    
    ''' <summary>
    ''' Teste la connexion à la base de données SQL Server.
    ''' Timeout rapide de 1 seconde pour ne pas bloquer l'interface.
    ''' </summary>
    Private Shared Function TestDatabaseConnection() As Boolean
        Try
            Dim connString As String = GetConnectionStringWithTimeout()
            
            If String.IsNullOrEmpty(connString) Then
                Return False
            End If
            
            Using connection As New SqlConnection(connString)
                connection.Open()
                Return True
            End Using
        Catch
            Return False
        End Try
    End Function
    
    ''' <summary>
    ''' Récupère la chaîne de connexion avec un timeout rapide (1 seconde).
    ''' </summary>
    Private Shared Function GetConnectionStringWithTimeout() As String
        Dim connStringObj = WebConfigurationManager.ConnectionStrings("RecrutementDB")
        
        If connStringObj Is Nothing OrElse String.IsNullOrEmpty(connStringObj.ConnectionString) Then
            Return Nothing
        End If
        
        Dim connString As String = connStringObj.ConnectionString
        
        ' Ajouter un timeout de connexion rapide (1 seconde = minimum SQL Server)
        If Not connString.ToLower().Contains("connection timeout") AndAlso Not connString.ToLower().Contains("connect timeout") Then
            connString = connString.TrimEnd(";"c) & ";Connection Timeout=1;"
        End If
        
        Return connString
    End Function

End Class


