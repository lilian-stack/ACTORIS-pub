# 📋 Récapitulatif du Flux Complet - Utilisateur Gratuit

## 🎮 Flux de téléchargement avec publicités

### Étape 1 : L'utilisateur lance le téléchargement
- L'utilisateur **gratuit (membre)** clique sur "Télécharger" pour un jeu
- Le système vérifie le statut utilisateur (`isVip: false`, `isBoost: false`)

### Étape 2 : Affichage de la publicité
- Le système détecte que l'utilisateur est un **membre gratuit**
- Une page de publicité s'ouvre dans le navigateur externe : `https://tonsite.com/pub?game=NOM_DU_JEU`
- L'utilisateur doit compléter les quêtes publicitaires sur cette page

### Étape 3 : Validation des quêtes
- Pendant que l'utilisateur complète les quêtes, le launcher vérifie périodiquement (toutes les 3 secondes) si les quêtes sont terminées
- Vérification via l'API : `https://tonsite.com/api/ads-status?userId=ID_UTILISATEUR`
- L'API doit retourner `{ completed: true }` ou `{ validated: true }` pour valider

### Étape 4 : Redirection vers le site de succès
- Une fois les quêtes validées, le système ouvre automatiquement le site de redirection
- URL : `file:///C:/Users/lilia/Desktop/pub site/index.html?game=NOM_DU_JEU&gameId=ID_DU_JEU`
- Le site affiche :
  - ✅ Message de succès "Quêtes terminées !"
  - 🎮 Nom du jeu sélectionné
  - 🚀 Bouton "Lancer le téléchargement"

### Étape 5 : Clic sur "Lancer le téléchargement"
- L'utilisateur clique sur le bouton "LANCER LE TÉLÉCHARGEMENT"
- Le site utilise le protocole personnalisé : `actoris://launch?game=NOM_DU_JEU&gameId=ID_DU_JEU`
- Windows ouvre automatiquement le launcher via ce protocole

### Étape 6 : Ouverture et navigation du launcher
- Le launcher s'ouvre automatiquement (ou se met au premier plan s'il est déjà ouvert)
- Le launcher reçoit l'URL du protocole et extrait :
  - `gameName` : Nom du jeu
  - `gameId` : ID du jeu (optionnel)
- Le launcher navigue automatiquement vers la page de détails du jeu

### Étape 7 : Déblocage du jeu
- Le jeu est automatiquement débloqué pour le téléchargement
- L'utilisateur peut maintenant télécharger et installer le jeu normalement

---

## 🔄 Comparaison : Utilisateur VIP/Boost vs Membre Gratuit

### Utilisateur VIP ou Boost
1. Clique sur "Télécharger"
2. **Lancement direct** → Pas de publicité, pas de quêtes
3. Le jeu se télécharge immédiatement

### Utilisateur Gratuit (Membre)
1. Clique sur "Télécharger"
2. **Publicité s'ouvre** → `https://tonsite.com/pub?game=NOM_DU_JEU`
3. **Complète les quêtes** sur la page de pub
4. **Validation automatique** → Vérification toutes les 3 secondes
5. **Site de redirection** → `file:///C:/Users/lilia/Desktop/pub site/index.html?game=...`
6. **Clic sur "Lancer"** → Utilise `actoris://launch?game=...`
7. **Launcher s'ouvre** → Navigation automatique vers le jeu
8. **Jeu débloqué** → Téléchargement disponible

---

## 🔧 Configuration Technique

### Fichiers impliqués

1. **`electron/main.js`**
   - Handler IPC : `games:launchGameWithAds`
   - Vérifie le statut utilisateur
   - Ouvre la pub si membre gratuit
   - Vérifie la validation périodiquement
   - Ouvre le site de redirection après validation
   - Gère le protocole `actoris://`

2. **`electron/ads-service.js`**
   - `shouldShowAds(userStatus)` : Détermine si l'utilisateur doit voir des pubs
   - `getAdsUrl(gameName)` : Génère l'URL de la page de pub
   - `checkAdsValidation(userId)` : Vérifie si les quêtes sont complétées
   - `getRedirectUrl(gameName, exePath, gameId)` : Génère l'URL de redirection

3. **`C:\Users\lilia\Desktop\pub site\index.html`**
   - Site web de redirection après les quêtes
   - Affiche le message de succès
   - Bouton pour lancer le launcher via `actoris://`

4. **`src/pages/Library.jsx`**
   - Utilise `window.electron.games.launchGameWithAds()`
   - Passe le statut utilisateur (`currentUser`)

5. **`src/App.jsx`**
   - Écoute l'événement IPC `navigate-to-game`
   - Navigue automatiquement vers la page du jeu

---

## ⚙️ Paramètres de Configuration

### URLs (dans `electron/ads-service.js`)
```javascript
const ADS_URL = 'https://tonsite.com/pub'
const ADS_VALIDATION_API = 'https://tonsite.com/api/ads-status'
const REDIRECT_URL = 'file:///C:/Users/lilia/Desktop/pub site/index.html'
```

### Protocole personnalisé
- **Nom** : `actoris://`
- **Enregistrement** : Automatique au démarrage du launcher
- **Format** : `actoris://launch?game=NOM_DU_JEU&gameId=ID_DU_JEU`

---

## 🐛 Dépannage

### Le protocole `actoris://` ne fonctionne pas
1. **Solution 1** : Lancez le launcher au moins une fois (enregistre automatiquement le protocole)
2. **Solution 2** : Exécutez `register-protocol.bat` en tant qu'administrateur
3. **Solution 3** : Fermez et rouvrez votre navigateur après avoir lancé le launcher

### Les quêtes ne sont pas validées
- Vérifiez que l'API `https://tonsite.com/api/ads-status` retourne `{ completed: true }`
- Vérifiez que l'`userId` est correctement passé
- Le timeout est de 5 minutes maximum

### Le site de redirection ne s'ouvre pas
- Vérifiez que le chemin dans `REDIRECT_URL` est correct
- Vérifiez que le fichier `index.html` existe à cet emplacement
- Pour un site en ligne, changez `REDIRECT_URL` vers une URL HTTP/HTTPS

---

## ✅ Checklist de Test

- [ ] Utilisateur gratuit clique sur "Télécharger"
- [ ] La page de pub s'ouvre dans le navigateur
- [ ] Les quêtes sont complétées sur la page de pub
- [ ] L'API retourne `{ completed: true }`
- [ ] Le site de redirection s'ouvre automatiquement
- [ ] Le nom du jeu est affiché correctement
- [ ] Le bouton "Lancer le téléchargement" fonctionne
- [ ] Le launcher s'ouvre via le protocole `actoris://`
- [ ] La navigation vers le jeu se fait automatiquement
- [ ] Le jeu est débloqué et prêt à être téléchargé

---

## 📝 Notes Importantes

1. **Protocole personnalisé** : Doit être enregistré dans Windows pour fonctionner
2. **Validation API** : Doit retourner `completed: true` ou `validated: true`
3. **Timeout** : 5 minutes maximum pour compléter les quêtes
4. **VIP/Boost** : Bypassent complètement le système de pub
5. **Site local** : Utilise `file://` pour le site de redirection (peut être changé en URL HTTP/HTTPS)

