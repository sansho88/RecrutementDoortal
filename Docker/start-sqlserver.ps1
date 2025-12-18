# Usage: .\start-sqlserver.ps1 [-Action <start|stop|restart|status|logs|init>]

param(
    [Parameter(Position=0)]
    [ValidateSet("start", "stop", "restart", "status", "logs", "init")]
    [string]$Action = "start"
)

$ErrorActionPreference = "Stop"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$SA_PASSWORD = "GriffithDoortal2026!"

Write-Host "=== Gestion SQL Server Docker ===" -ForegroundColor Cyan

# Fonction pour attendre que SQL Server soit pret
function Wait-ForSqlServer {
    param(
        [string]$SuccessMessage = "SQL Server est pret!"
    )
    
    Write-Host "`nAttente du demarrage de SQL Server..." -ForegroundColor Yellow
    
    $maxAttempts = 60
    $attempt = 0
    $connected = $false
    
    Start-Sleep -Seconds 15
    
    while ($attempt -lt $maxAttempts -and -not $connected) {
        $attempt++
        Write-Host "Test de connexion... (tentative $attempt/$maxAttempts)" -ForegroundColor Yellow
        
        $null = docker exec recrutement-sqlserver /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -C -Q "SELECT 1" 2>&1
        
        if ($LASTEXITCODE -eq 0) {
            $connected = $true
            Write-Host $SuccessMessage -ForegroundColor Green
        } else {
            Write-Host "SQL Server pas encore pret, attente 2 secondes..." -ForegroundColor DarkYellow
            Start-Sleep -Seconds 2
        }
    }
    
    if (-not $connected) {
        Write-Host "ERREUR: SQL Server n'a pas demarre dans le temps imparti" -ForegroundColor Red
    }
    
    return $connected
}

# Fonction pour demarrer le conteneur
function Start-SqlServerContainer {
    param(
        [switch]$RemoveVolumes,
        [string]$ActionLabel = "Demarrage"
    )
    
    Set-Location $ScriptDir
    
    if ($RemoveVolumes) {
        Write-Host "Reinitialisation complete (suppression des donnees)..." -ForegroundColor Red
        docker-compose down -v
    }
    
    Write-Host "$ActionLabel du conteneur SQL Server..." -ForegroundColor Green
    docker-compose up -d --build
    
    $successMsg = if ($RemoveVolumes) { "SQL Server reinitialise." } else { "SQL Server demarre sur localhost:4201" }
    Wait-ForSqlServer -SuccessMessage $successMsg
}

switch ($Action) {
    "start" {
        Start-SqlServerContainer -ActionLabel "Demarrage"
    }
    
    "stop" {
        Write-Host "Arret du conteneur SQL Server..." -ForegroundColor Yellow
        Set-Location $ScriptDir
        docker-compose down
        Write-Host "Conteneur arrete." -ForegroundColor Green
    }
    
    "restart" {
        Write-Host "Arret du conteneur..." -ForegroundColor Yellow
        Set-Location $ScriptDir
        docker-compose down
        Start-SqlServerContainer -ActionLabel "Redemarrage"
    }
    
    "status" {
        Write-Host "Statut du conteneur:" -ForegroundColor Yellow
        docker ps -a --filter "name=recrutement-sqlserver" --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
    }
    
    "logs" {
        Write-Host "Logs du conteneur:" -ForegroundColor Yellow
        docker logs recrutement-sqlserver --tail 50
    }
    
    "init" {
        Start-SqlServerContainer -RemoveVolumes -ActionLabel "Reinitialisation"
    }
}

Write-Host "`n=== Termine ===" -ForegroundColor Cyan

