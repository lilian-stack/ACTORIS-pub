# 🚀 Guide Complet : Déployer sur Vercel

## 📋 Méthode 1 : Déploiement via l'Interface Web (Recommandé)

### Étape 1 : Se connecter à Vercel

1. Allez sur **https://vercel.com**
2. Cliquez sur **Sign Up** (S'inscrire) ou **Log In** (Se connecter)
3. Choisissez **Continue with GitHub** pour connecter votre compte GitHub

### Étape 2 : Importer le projet

1. Une fois connecté, cliquez sur **Add New Project** (Nouveau Projet)
2. Vous verrez la liste de vos dépôts GitHub
3. Recherchez **ACTORIS-pub** ou **lilian-stack/ACTORIS-pub**
4. Cliquez sur **Import** à côté du dépôt

### Étape 3 : Configurer le projet

Vercel détectera automatiquement :
- ✅ **Framework Preset** : Other (site statique)
- ✅ **Root Directory** : `./` (racine)
- ✅ **Build Command** : (vide, pas nécessaire pour un site statique)
- ✅ **Output Directory** : (vide, fichiers à la racine)

**Vous pouvez laisser les paramètres par défaut** et cliquer sur **Deploy**

### Étape 4 : Déployer

1. Cliquez sur le bouton **Deploy**
2. Attendez 30-60 secondes pendant le déploiement
3. Une fois terminé, vous verrez :
   - ✅ **Success!** avec un lien vers votre site
   - L'URL sera quelque chose comme : `https://actoris-pub.vercel.app`

### Étape 5 : Tester le site

Cliquez sur le lien ou testez avec :
```
https://votre-url-vercel.app/?game=Geometry%20Dash&gameId=123
```

---

## 📋 Méthode 2 : Déploiement via la CLI (Ligne de commande)

### Étape 1 : Installer Vercel CLI

```bash
npm install -g vercel
```

### Étape 2 : Se connecter

```bash
vercel login
```

Cela ouvrira votre navigateur pour vous connecter.

### Étape 3 : Déployer

```bash
cd "C:\Users\lilia\Desktop\pub site"
vercel
```

Répondez aux questions :
- **Set up and deploy?** → `Y` (Oui)
- **Which scope?** → Sélectionnez votre compte
- **Link to existing project?** → `N` (Non, créer un nouveau)
- **What's your project's name?** → `actoris-pub` (ou laissez par défaut)
- **In which directory is your code located?** → `./` (appuyez sur Entrée)

### Étape 4 : Déployer en production

```bash
vercel --prod
```

Cela déploiera sur l'URL de production.

---

## 🔗 Obtenir l'URL de Déploiement

### Via l'Interface Web

1. Allez sur https://vercel.com/dashboard
2. Cliquez sur votre projet **ACTORIS-pub**
3. L'URL de production est affichée en haut de la page
4. Exemple : `https://actoris-pub.vercel.app`

### Via la CLI

```bash
vercel ls
```

Affiche la liste de vos projets avec leurs URLs.

---

## ⚙️ Configuration dans le Launcher

Une fois déployé, mettez à jour `electron/ads-service.js` :

```javascript
// Remplacer cette ligne :
const REDIRECT_URL = process.env.REDIRECT_URL || 'https://lilian-stack.github.io/ACTORIS-pub/'

// Par votre URL Vercel :
const REDIRECT_URL = process.env.REDIRECT_URL || 'https://actoris-pub.vercel.app'
```

Ou utilisez une variable d'environnement :

```javascript
const REDIRECT_URL = process.env.REDIRECT_URL || 'https://actoris-pub.vercel.app'
```

---

## 🔄 Déploiement Automatique

Une fois connecté à GitHub, Vercel déploiera automatiquement :

- ✅ **À chaque push sur `main`** → Déploiement en production
- ✅ **À chaque pull request** → Déploiement preview (URL temporaire)
- ✅ **À chaque commit** → Nouveau déploiement

Vous n'avez plus rien à faire ! 🎉

---

## 📝 Vérifier le Déploiement

### Dans le Dashboard Vercel

1. Allez sur https://vercel.com/dashboard
2. Cliquez sur **ACTORIS-pub**
3. Onglet **Deployments** → Voir tous les déploiements
4. Cliquez sur un déploiement pour voir les logs

### Tester l'URL

Ouvrez dans votre navigateur :
```
https://votre-url-vercel.app/?game=Test&gameId=123
```

Vous devriez voir :
- ✅ Page "Quêtes terminées !"
- ✅ Nom du jeu affiché
- ✅ Bouton "Lancer le téléchargement"

---

## 🐛 Dépannage

### Le projet est vide

1. Vérifiez que le dépôt GitHub contient bien les fichiers
2. Vérifiez que vous avez bien cliqué sur **Import** du bon dépôt
3. Vérifiez les logs dans Vercel Dashboard → Deployments

### Erreur de build

Pour un site statique, il ne devrait pas y avoir d'erreur de build. Si c'est le cas :
1. Vérifiez que `vercel.json` est correct
2. Vérifiez que `index.html` est à la racine
3. Vérifiez les logs dans Vercel

### Le site ne s'affiche pas

1. Vérifiez que le déploiement est terminé (statut "Ready")
2. Vérifiez l'URL dans le dashboard Vercel
3. Essayez en navigation privée (cache du navigateur)

---

## 🎯 Résumé Rapide

1. **Allez sur** https://vercel.com
2. **Connectez-vous** avec GitHub
3. **Cliquez** sur "Add New Project"
4. **Sélectionnez** le dépôt `ACTORIS-pub`
5. **Cliquez** sur "Deploy"
6. **Copiez** l'URL générée
7. **Mettez à jour** `ads-service.js` avec l'URL

C'est tout ! 🚀

