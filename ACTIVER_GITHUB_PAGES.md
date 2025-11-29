# 🔧 Activer GitHub Pages - Guide Étape par Étape

## ⚠️ Erreur : "Le dépôt GitHub fourni ne contient pas la branche"

Cette erreur apparaît généralement quand GitHub Pages n'est pas encore activé ou configuré.

## ✅ Solution : Activer GitHub Pages

### Étape 1 : Vérifier que le dépôt contient des fichiers

1. Allez sur https://github.com/lilian-stack/ACTORIS-pub
2. Vérifiez que vous voyez les fichiers suivants :
   - ✅ `index.html`
   - ✅ `README.md`
   - ✅ `FLUX_COMPLET.md`
   - ✅ `DEPLOIEMENT.md`
   - ✅ `register-protocol.bat`
   - ✅ `register-protocol.ps1`
   - ✅ `_config.yml`

### Étape 2 : Activer GitHub Pages

1. Sur la page du dépôt, cliquez sur **Settings** (Paramètres) en haut à droite
2. Dans le menu de gauche, cliquez sur **Pages**
3. Sous **Source**, sélectionnez :
   - **Branch** : `main`
   - **Folder** : `/ (root)`
4. Cliquez sur **Save** (Enregistrer)
5. **Attendez 1-2 minutes** pour que GitHub génère le site

### Étape 3 : Vérifier l'activation

1. Revenez sur la page **Settings → Pages**
2. Vous devriez voir un message vert : "Your site is live at https://lilian-stack.github.io/ACTORIS-pub/"
3. Cliquez sur le lien pour tester le site

## 🔄 Si l'erreur persiste

### Option 1 : Vérifier la branche

```bash
cd "C:\Users\lilia\Desktop\pub site"
git branch
# Doit afficher : * main
```

### Option 2 : Re-pousser le dépôt

```bash
cd "C:\Users\lilia\Desktop\pub site"
git push origin main --force
```

### Option 3 : Créer une branche `gh-pages` (alternative)

```bash
cd "C:\Users\lilia\Desktop\pub site"
git checkout -b gh-pages
git push origin gh-pages
```

Puis dans Settings → Pages, sélectionnez :
- **Branch** : `gh-pages`
- **Folder** : `/ (root)`

## 📝 Vérification Finale

Une fois GitHub Pages activé, testez l'URL :

```
https://lilian-stack.github.io/ACTORIS-pub/?game=Test&gameId=123
```

Le site devrait s'afficher correctement.

## 🆘 Support

Si le problème persiste :
1. Vérifiez que vous avez les droits d'administration sur le dépôt
2. Vérifiez que le dépôt n'est pas privé (GitHub Pages gratuit nécessite un dépôt public)
3. Attendez quelques minutes après l'activation (première génération peut prendre du temps)

