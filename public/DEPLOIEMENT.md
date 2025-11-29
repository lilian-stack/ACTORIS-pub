# 🚀 Guide de Déploiement GitHub Pages

## ✅ Déploiement Réussi

Le site a été déployé avec succès sur GitHub :
- **Repository** : https://github.com/lilian-stack/ACTORIS-pub
- **URL GitHub Pages** : https://lilian-stack.github.io/ACTORIS-pub/

## 📋 Activation de GitHub Pages

Pour activer GitHub Pages et rendre le site accessible en ligne :

### Méthode 1 : Via l'interface GitHub

1. Allez sur https://github.com/lilian-stack/ACTORIS-pub
2. Cliquez sur **Settings** (Paramètres)
3. Dans le menu de gauche, cliquez sur **Pages**
4. Sous **Source**, sélectionnez :
   - **Branch** : `main`
   - **Folder** : `/ (root)`
5. Cliquez sur **Save** (Enregistrer)
6. Attendez quelques minutes que GitHub génère le site
7. Votre site sera accessible à : `https://lilian-stack.github.io/ACTORIS-pub/`

### Méthode 2 : Via GitHub Actions (Automatique)

Le site sera automatiquement déployé à chaque push sur la branche `main`.

## 🔗 Configuration dans le Launcher

Le fichier `electron/ads-service.js` a été mis à jour pour utiliser l'URL GitHub Pages :

```javascript
const REDIRECT_URL = 'https://lilian-stack.github.io/ACTORIS-pub/'
```

## 📝 Fichiers Déployés

- ✅ `index.html` - Page principale du site
- ✅ `README.md` - Documentation d'utilisation
- ✅ `FLUX_COMPLET.md` - Récapitulatif du flux complet
- ✅ `register-protocol.ps1` - Script PowerShell pour enregistrer le protocole
- ✅ `register-protocol.bat` - Script batch pour enregistrer le protocole
- ✅ `.gitignore` - Fichiers à ignorer

## 🔄 Mise à Jour du Site

Pour mettre à jour le site après modification :

```bash
cd "C:\Users\lilia\Desktop\pub site"
git add .
git commit -m "Description des modifications"
git push
```

GitHub Pages se mettra à jour automatiquement en quelques minutes.

## 🧪 Test du Site

Une fois GitHub Pages activé, testez le site avec :

```
https://lilian-stack.github.io/ACTORIS-pub/?game=Geometry%20Dash&gameId=123
```

Le site devrait afficher :
- ✅ Message "Quêtes terminées !"
- ✅ Nom du jeu : "Geometry Dash"
- ✅ Bouton "Lancer le téléchargement"

## ⚙️ Configuration Alternative

Si vous préférez utiliser le site local pour le développement :

```javascript
// Dans electron/ads-service.js
const REDIRECT_URL = 'file:///C:/Users/lilia/Desktop/pub site/index.html'
```

Ou pour utiliser un autre serveur :

```javascript
const REDIRECT_URL = 'https://votre-domaine.com/pub/redirect'
```

## 📞 Support

En cas de problème :
1. Vérifiez que GitHub Pages est activé dans les paramètres du dépôt
2. Vérifiez que le fichier `index.html` est à la racine du dépôt
3. Attendez quelques minutes après l'activation (première génération peut prendre du temps)

