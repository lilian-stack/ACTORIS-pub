# Site de redirection Actoris Launcher

Ce site s'affiche après que l'utilisateur ait complété les quêtes publicitaires. Il permet de lancer le téléchargement du jeu via le launcher.

## Utilisation

### Ouvrir le site avec un jeu spécifique

```
index.html?game=NOM_DU_JEU&gameId=ID_DU_JEU
```

Exemples :
- `index.html?game=Geometry%20Dash&gameId=123`
- `index.html?game=Minecraft&gameId=456`

### Auto-lancement

Pour lancer automatiquement le téléchargement après 2 secondes :
```
index.html?game=NOM_DU_JEU&gameId=ID_DU_JEU&auto=true
```

## Intégration avec le launcher

Le site utilise le protocole personnalisé `actoris://` pour communiquer avec le launcher :

```javascript
actoris://launch?game=NOM_DU_JEU&gameId=ID_DU_JEU
```

Quand l'utilisateur clique sur "Lancer le téléchargement", le launcher :
1. S'ouvre automatiquement (s'il n'est pas déjà ouvert)
2. Navigue vers la page de détails du jeu
3. Débloque le jeu pour le téléchargement

## Configuration

Pour utiliser ce site avec le système de publicités, mettez à jour `electron/ads-service.js` :

```javascript
const REDIRECT_URL = 'file:///C:/Users/lilia/Desktop/pub site/index.html'
```

Ou si vous hébergez le site en ligne :
```javascript
const REDIRECT_URL = 'https://votre-site.com/pub/redirect'
```

## Enregistrement du protocole actoris://

Le protocole `actoris://` doit être enregistré dans Windows pour fonctionner. Il y a deux méthodes :

### Méthode 1 : Automatique (recommandée)
1. Lancez Actoris Launcher au moins une fois
2. Le protocole sera automatiquement enregistré
3. Fermez et rouvrez votre navigateur
4. Le protocole devrait maintenant fonctionner

### Méthode 2 : Manuelle
Si la méthode automatique ne fonctionne pas :
1. Ouvrez le fichier `register-protocol.bat` en tant qu'administrateur (clic droit → Exécuter en tant qu'administrateur)
2. Le script enregistrera le protocole dans le registre Windows
3. Fermez et rouvrez votre navigateur

## Notes

- Le protocole `actoris://` doit être enregistré dans le système pour fonctionner
- Le launcher doit être installé pour que le protocole fonctionne
- Si le protocole n'est pas enregistré, le site affichera des instructions pour le résoudre

