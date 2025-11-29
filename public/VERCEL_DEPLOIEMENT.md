# 🚀 Déploiement sur Vercel

## 📋 Configuration Vercel

Le projet Vercel est configuré avec l'ID : `prj_ijzOLxTRWNlP8IvIdLYOUlki79pp`

## ✅ Fichiers de Configuration Créés

- ✅ `vercel.json` - Configuration Vercel pour le déploiement
- ✅ `package.json` - Métadonnées du projet

## 🔧 Déploiement Automatique depuis GitHub

### Option 1 : Connexion GitHub → Vercel (Recommandé)

1. Allez sur https://vercel.com
2. Connectez-vous avec votre compte GitHub
3. Cliquez sur **Add New Project** (Nouveau Projet)
4. Sélectionnez le dépôt `lilian-stack/ACTORIS-pub`
5. Vercel détectera automatiquement la configuration
6. Cliquez sur **Deploy** (Déployer)
7. Votre site sera déployé automatiquement à chaque push sur `main`

### Option 2 : Déploiement Manuel via CLI

```bash
# Installer Vercel CLI
npm i -g vercel

# Se connecter à Vercel
vercel login

# Déployer le projet
cd "C:\Users\lilia\Desktop\pub site"
vercel

# Pour un déploiement en production
vercel --prod
```

## 🔗 URL de Déploiement

Une fois déployé, Vercel générera une URL comme :
- **Production** : `https://actoris-pub.vercel.app` (ou votre domaine personnalisé)
- **Preview** : `https://actoris-pub-xxx.vercel.app` (pour chaque commit)

## ⚙️ Configuration dans le Launcher

Mettez à jour `electron/ads-service.js` pour utiliser l'URL Vercel :

```javascript
const REDIRECT_URL = process.env.REDIRECT_URL || 'https://actoris-pub.vercel.app'
```

Ou utilisez votre domaine personnalisé si configuré.

## 🔄 Déploiement Automatique

Une fois connecté à GitHub, Vercel déploiera automatiquement :
- ✅ À chaque push sur la branche `main` → Déploiement en production
- ✅ À chaque pull request → Déploiement preview
- ✅ À chaque commit → Nouveau déploiement

## 📝 Variables d'Environnement (si nécessaire)

Si vous avez besoin de variables d'environnement :

1. Allez sur votre projet Vercel
2. **Settings** → **Environment Variables**
3. Ajoutez vos variables (ex: `REDIRECT_URL`, etc.)

## 🧪 Test du Déploiement

Une fois déployé, testez avec :

```
https://votre-url-vercel.app/?game=Geometry%20Dash&gameId=123
```

Le site devrait s'afficher correctement avec :
- ✅ Message "Quêtes terminées !"
- ✅ Nom du jeu affiché
- ✅ Bouton "Lancer le téléchargement" fonctionnel

## 🔍 Vérification du Déploiement

1. Allez sur https://vercel.com/dashboard
2. Sélectionnez votre projet `ACTORIS-pub`
3. Vérifiez l'onglet **Deployments** pour voir les déploiements
4. Cliquez sur un déploiement pour voir les logs

## 🆘 Dépannage

### Le projet Vercel est vide

1. Vérifiez que le dépôt GitHub contient bien les fichiers
2. Reconnectez le dépôt GitHub à Vercel
3. Vérifiez que la branche `main` est sélectionnée
4. Déclenchez un nouveau déploiement manuellement

### Le site ne se déploie pas

1. Vérifiez les logs dans Vercel Dashboard
2. Vérifiez que `vercel.json` est correct
3. Vérifiez que `index.html` est à la racine
4. Vérifiez les permissions GitHub

## 📞 Support Vercel

- Documentation : https://vercel.com/docs
- Support : https://vercel.com/support

