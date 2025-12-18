# Configuration Docker - SQL Server

Ce dossier contient les fichiers necessaires pour demarrer une instance SQL Server avec la base de donnees RecrutementDB pre-configuree.

## Fichiers

| Fichier | Description |
|---------|-------------|
| `Dockerfile` | Image SQL Server 2025 Express |
| `docker-compose.yml` | Orchestration Docker |
| `init-db.sql` | Script SQL d'initialisation (21 fun-facts) |
| `entrypoint.sh` | Script de demarrage (dans le conteneur Linux) |
| `start-sqlserver.ps1` | Script PowerShell de gestion (Windows) |

## Prerequis

- Docker Desktop installe et en cours d'execution
- Port 4201 disponible sur localhost

## Utilisation avec PowerShell

### Demarrer SQL Server
```powershell
.\start-sqlserver.ps1 -Action start
```

### Arreter SQL Server
```powershell
.\start-sqlserver.ps1 -Action stop
```

### Redemarrer
```powershell
.\start-sqlserver.ps1 -Action restart
```

### Voir le statut
```powershell
.\start-sqlserver.ps1 -Action status
```

### Voir les logs
```powershell
.\start-sqlserver.ps1 -Action logs
```

### Reinitialiser (supprime les donnees)
```powershell
.\start-sqlserver.ps1 -Action init
```

## Utilisation avec docker-compose

```powershell
# Demarrer
cd Docker
docker-compose up -d --build

# Arreter
docker-compose down

# Supprimer avec les donnees
docker-compose down -v
```

## Configuration de la base de donnees

| Parametre | Valeur |
|-----------|--------|
| Serveur | localhost,4201 |
| Base de donnees | RecrutementDB |
| Utilisateur | sa |
| Mot de passe | GriffithDoortal2026! |

## Table Messages

| Colonne | Type | Description |
|---------|------|-------------|
| ID | INT (PK, Identity) | Identifiant unique |
| Texte | VARCHAR(500) | Message texte (fun-fact) |

La table contient 21 fun-facts qui sont affiches aleatoirement via le bouton "Message BDD".

## Connexion manuelle a la base

```powershell
# Via Docker
docker exec -it recrutement-sqlserver /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "GriffithDoortal2026!" -C -d RecrutementDB

# Commandes SQL utiles une fois connecte
SELECT name FROM sys.databases;    -- Lister les bases
SELECT * FROM Messages;            -- Voir les messages
GO
```

## Test de connexion

1. Executer `.\start-sqlserver.ps1 -Action start`
2. Lancer le projet RecrutementDoortalVB sur le port 5042
3. Cliquer sur "Test Ajax" - si la BDD est connectee, le bouton "Message BDD" apparaitra
4. Cliquer sur "Message BDD" pour recuperer un fun-fact aleatoire depuis SQL Server

## Troubleshooting

| Probleme | Solution |
|----------|----------|
| "Login failed for user 'sa'" au demarrage | Normal, SQL Server n'est pas encore pret. Le script attend automatiquement. |
| Port 4201 deja utilise | Arreter l'autre service ou modifier le port dans `docker-compose.yml` |
| Connexion timeout depuis l'app | Verifier que Docker est demarre avec `.\start-sqlserver.ps1 -Action status` |

