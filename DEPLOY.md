# 🚀 Déployer sur Vercel - Instructions Rapides

## ⚡ Méthode Rapide (Double-clic)

1. **Double-cliquez** sur le fichier `deploy-vercel.bat`
2. Le script va :
   - Installer Vercel CLI (si nécessaire)
   - Ouvrir votre navigateur pour vous connecter
   - Déployer automatiquement le site

## 📋 Méthode Manuelle

### Étape 1 : Ouvrir le terminal

Ouvrez PowerShell ou CMD dans le dossier `pub site`

### Étape 2 : Se connecter

```bash
vercel login
```

Cela ouvrira votre navigateur. Connectez-vous avec votre compte GitHub.

### Étape 3 : Déployer

```bash
vercel --prod
```

Répondez aux questions :
- **Set up and deploy?** → Tapez `Y` et appuyez sur Entrée
- **Which scope?** → Sélectionnez votre compte (flèches + Entrée)
- **Link to existing project?** → Tapez `N` (nouveau projet)
- **Project name?** → Appuyez sur Entrée (nom par défaut)
- **Directory?** → Appuyez sur Entrée (racine)

### Étape 4 : Copier l'URL

Une fois déployé, Vercel affichera l'URL de votre site, par exemple :
```
https://actoris-pub.vercel.app
```

## 🔗 Après le Déploiement

Mettez à jour `electron/ads-service.js` avec l'URL Vercel :

```javascript
const REDIRECT_URL = 'https://votre-url-vercel.app'
```

## ✅ C'est tout !

Le site sera accessible en ligne et se mettra à jour automatiquement à chaque push sur GitHub.

