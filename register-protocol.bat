@echo off
echo ========================================
echo Enregistrement du protocole actoris://
echo ========================================
echo.

REM Vérifier les privilèges administrateur
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ERREUR : Ce script doit être exécuté en tant qu'administrateur.
    echo Clic droit sur le fichier -^> Exécuter en tant qu'administrateur
    pause
    exit /b 1
)

echo Exécution du script PowerShell...
powershell -ExecutionPolicy Bypass -File "%~dp0register-protocol.ps1"

pause

