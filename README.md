# RecrutementDoortal

## 📋 Description

Site ASP.NET WebForms minimaliste contenant une page unique « Recrutement ». Ce projet démontre l'utilisation de deux mécanismes d'interaction :

- **Bouton Postback** : Soumet un formulaire classique vers le serveur
- **Bouton AJAX** : Effectue un appel asynchrone vers une WebMethod

### Contraintes respectées

- ✅ CSP strict (Content Security Policy) : aucun script ou CSS inline
- ✅ Aucun contrôle serveur ASP.NET utilisé
- ✅ Bouton n°1 avec postback
- ✅ Bouton n°2 avec appel AJAX

---

## 🛠️ Pré-requis

- **Visual Studio 2019** ou supérieur (ou **JetBrains Rider**)
- **.NET Framework 4.7.2** ou supérieur
- **IIS Express** (inclus avec Visual Studio)

---

## 🚀 Lancement du projet

1. **Ouvrir la solution**  
   Double-cliquez sur `RecrutementDoortal.sln` ou ouvrez-le dans Visual Studio / Rider.

2. **Restaurer les packages NuGet** (si nécessaire)  
   Visual Studio/Rider le fait automatiquement, sinon clic droit sur la solution → "Restaurer les packages NuGet".

3. **Lancer le projet**  
   Appuyez sur `F5` (ou `Ctrl+F5` pour lancer sans débogage).

4. **Accéder à la page**  
   Le navigateur s'ouvre automatiquement sur `Recrutement.aspx`.

---

## 📖 Utilisation

Sur la page **Recrutement** :

| Bouton | Action |
|--------|--------|
| **Test du Postback** (bleu) | Recharge la page et affiche un message de confirmation côté serveur |
| **Test Ajax** (rouge) | Appelle une WebMethod sans recharger la page et affiche le résultat dynamiquement |

---

## 📁 Structure du projet

```
RecrutementDoortal/
├── Recrutement.aspx       # Page principale (HTML)
├── Recrutement.aspx.cs    # Code-behind (C#)
├── app.js                 # Script JavaScript pour l'appel AJAX
├── styles.css             # Feuille de styles
└── Web.config             # Configuration ASP.NET
```

---

## 👤 Auteur

Thomas GRIFFITH

