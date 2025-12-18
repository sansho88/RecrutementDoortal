# RecrutementDoortal

## 📋 Description

Site ASP.NET WebForms minimaliste contenant une page unique « Recrutement ». Ce projet démontre l'utilisation de plusieurs mécanismes d'interaction :

- **Bouton Postback** : Soumet un formulaire classique vers le serveur
- **Bouton AJAX** : Effectue un appel asynchrone vers une WebMethod
- **Bouton Message BDD** : Récupère un fun-fact aléatoire depuis SQL Server (version VB uniquement)

### Contraintes respectées

- ✅ CSP strict (Content Security Policy) : aucun script ou CSS inline
- ✅ Aucun contrôle serveur ASP.NET utilisé
- ✅ Bouton n°1 avec postback
- ✅ Bouton n°2 avec appel AJAX

---

## 🛠️ Projets disponibles

| Projet | Langage | Port | Description |
|--------|---------|------|-------------|
| RecrutementDoortal | C# | - | Version originale en C# |
| RecrutementDoortalVB | VB.NET | 5042 | Version VB.NET avec connexion SQL Server |

---

## 🛠️ Pré-requis

- **Visual Studio 2019** ou supérieur (ou **JetBrains Rider**)
- **.NET Framework 4.8.1**
- **IIS Express** (inclus avec Visual Studio)
- **Docker Desktop** (pour SQL Server - optionnel, version VB uniquement)

---

## 🚀 Lancement du projet

### Version C# (RecrutementDoortal)

1. Ouvrir la solution `RecrutementDoortal.sln`
2. Définir **RecrutementDoortal** comme projet de démarrage
3. Appuyer sur `F5` pour lancer

### Version VB.NET avec SQL Server (RecrutementDoortalVB)

1. **Démarrer SQL Server via Docker** :
   ```powershell
   cd Docker
   .\start-sqlserver.ps1 -Action start
   ```

2. Ouvrir la solution `RecrutementDoortal.sln`
3. Définir **RecrutementDoortalVB** comme projet de démarrage
4. Appuyer sur `F5` pour lancer (port 5042)

---

## 📖 Utilisation

Sur la page **Recrutement** :

| Bouton | Action |
|--------|--------|
| **Test du Postback** (bleu) | Recharge la page et affiche un message de confirmation côté serveur |
| **Test Ajax** (rouge) | Appelle une WebMethod et vérifie la connexion BDD |
| **Message BDD** (vert) | Affiche un fun-fact aléatoire depuis SQL Server (apparaît si BDD connectée) |

---

## 🐳 Configuration Docker (SQL Server)

Le dossier `Docker/` contient tout le nécessaire pour démarrer SQL Server :

```powershell
# Démarrer
.\Docker\start-sqlserver.ps1 -Action start

# Arrêter
.\Docker\start-sqlserver.ps1 -Action stop

# Réinitialiser (supprime les données)
.\Docker\start-sqlserver.ps1 -Action init
```

### Configuration BDD

| Paramètre | Valeur |
|-----------|--------|
| Serveur | localhost,4201 |
| Base de données | RecrutementDB |
| Utilisateur | sa |
| Mot de passe | GriffithDoortal2026! |

Voir [Docker/README.md](Docker/README.md) pour plus de détails.

---

## 📁 Structure du projet

```
RecrutementDoortal/
├── RecrutementDoortal/          # Version C#
│   ├── Recrutement.aspx         # Page principale
│   ├── Recrutement.aspx.cs      # Code-behind C#
│   ├── app.js                   # Script AJAX
│   ├── styles.css               # Styles
│   └── Web.config               # Configuration
│
├── RecrutementDoortalVB/        # Version VB.NET
│   ├── Recrutement.aspx         # Page principale
│   ├── Recrutement.aspx.vb      # Code-behind VB.NET
│   ├── app.js                   # Script AJAX
│   ├── styles.css               # Styles
│   └── Web.config               # Configuration (avec connexion SQL)
│
├── Docker/                      # Configuration Docker
│   ├── Dockerfile               # Image SQL Server 2025
│   ├── docker-compose.yml       # Orchestration
│   ├── init-db.sql              # Script init (21 fun-facts)
│   ├── entrypoint.sh            # Script de démarrage
│   ├── start-sqlserver.ps1      # Script PowerShell
│   └── README.md                # Documentation Docker
│
└── README.md                    # Ce fichier
```

---

## 👤 Auteur

Thomas GRIFFITH

