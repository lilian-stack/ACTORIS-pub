@echo off
echo ========================================
echo Deploiement sur Vercel
echo ========================================
echo.

REM Vérifier si Vercel CLI est installé
where vercel >nul 2>&1
if %errorLevel% neq 0 (
    echo Installation de Vercel CLI...
    call npm install -g vercel
    if %errorLevel% neq 0 (
        echo ERREUR: Impossible d'installer Vercel CLI
        pause
        exit /b 1
    )
)

echo.
echo Connexion a Vercel...
echo (Cela ouvrira votre navigateur pour vous connecter)
echo.
vercel login

if %errorLevel% neq 0 (
    echo ERREUR: Echec de la connexion
    pause
    exit /b 1
)

echo.
echo Deploiement du projet...
echo.
vercel --prod

if %errorLevel% neq 0 (
    echo ERREUR: Echec du deploiement
    pause
    exit /b 1
)

echo.
echo ========================================
echo Deploiement termine avec succes!
echo ========================================
echo.
pause

