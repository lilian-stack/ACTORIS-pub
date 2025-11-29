@echo off
echo ========================================
echo Deploiement automatique sur Vercel
echo ========================================
echo.

REM Aller dans le bon dossier
cd /d "%~dp0"

echo Etape 1: Connexion a Vercel...
echo (Une fenetre de navigateur va s'ouvrir)
echo.
vercel login

if %errorLevel% neq 0 (
    echo.
    echo ERREUR: Echec de la connexion
    echo Veuillez reessayer manuellement avec: vercel login
    pause
    exit /b 1
)

echo.
echo Etape 2: Deploiement en production...
echo.
vercel --prod --yes

if %errorLevel% neq 0 (
    echo.
    echo ERREUR: Echec du deploiement
    pause
    exit /b 1
)

echo.
echo ========================================
echo ✅ Deploiement termine avec succes!
echo ========================================
echo.
echo Votre site est maintenant en ligne!
echo Copiez l'URL affichee ci-dessus.
echo.
pause

