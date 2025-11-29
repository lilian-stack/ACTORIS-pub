# Script PowerShell pour enregistrer le protocole actoris:// dans Windows
# Doit être exécuté en tant qu'administrateur

Write-Host "Enregistrement du protocole actoris://..." -ForegroundColor Cyan

# Chemin de l'exécutable (à adapter selon votre installation)
$exePath = "C:\Users\$env:USERNAME\AppData\Local\Programs\actoris-launcher\Actoris.exe"

# Vérifier si l'exécutable existe
if (-not (Test-Path $exePath)) {
    Write-Host "Erreur : L'exécutable n'a pas été trouvé à : $exePath" -ForegroundColor Red
    Write-Host "Veuillez modifier le chemin dans le script." -ForegroundColor Yellow
    pause
    exit 1
}

Write-Host "Exécutable trouvé : $exePath" -ForegroundColor Green

# Enregistrer le protocole dans le registre
$protocolName = "actoris"
$registryPath = "HKCU:\Software\Classes\$protocolName"

try {
    # Créer la clé principale
    New-Item -Path $registryPath -Force | Out-Null
    Set-ItemProperty -Path $registryPath -Name "(Default)" -Value "URL:Actoris Launcher Protocol" -Force
    Set-ItemProperty -Path $registryPath -Name "URL Protocol" -Value "" -Force
    
    # Créer la clé DefaultIcon
    $iconPath = "$registryPath\DefaultIcon"
    New-Item -Path $iconPath -Force | Out-Null
    Set-ItemProperty -Path $iconPath -Name "(Default)" -Value "$exePath,0" -Force
    
    # Créer la clé shell\open\command
    $commandPath = "$registryPath\shell\open\command"
    New-Item -Path $commandPath -Force | Out-Null
    Set-ItemProperty -Path $commandPath -Name "(Default)" -Value "`"$exePath`" `"%1`"" -Force
    
    Write-Host "✅ Protocole actoris:// enregistré avec succès !" -ForegroundColor Green
    Write-Host "Vous pouvez maintenant utiliser actoris:// dans votre navigateur." -ForegroundColor Cyan
} catch {
    Write-Host "Erreur lors de l'enregistrement : $_" -ForegroundColor Red
    pause
    exit 1
}

pause

