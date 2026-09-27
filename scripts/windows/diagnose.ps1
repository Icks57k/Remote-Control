# Diagnostic en lecture seule. Ne pas publier la sortie brute.
$ErrorActionPreference = 'Stop'

if ($env:OS -ne 'Windows_NT') {
    throw 'Ce script est destine a Windows (Lovecaft).'
}

Write-Output '=== Systeme ==='
Get-CimInstance Win32_OperatingSystem | Select-Object Caption, Version | Format-List
Get-CimInstance Win32_VideoController | Select-Object Name, DriverVersion | Format-Table -AutoSize

Write-Output '=== Outils ==='
foreach ($tool in @('git', 'winget', 'tailscale', 'nvidia-smi')) {
    $command = Get-Command $tool -ErrorAction SilentlyContinue
    if ($command) { Write-Output ('{0}: {1}' -f $tool, $command.Source) }
    else { Write-Output ('{0}: absent du PATH' -f $tool) }
}

Write-Output '=== Applications installees ==='
$registryPaths = @(
    'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*',
    'HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*',
    'HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*'
)
$apps = @(Get-ItemProperty $registryPaths -ErrorAction SilentlyContinue |
    Where-Object { $_.DisplayName -match 'Sunshine|Tailscale|Moonlight' })
if ($apps.Count -eq 0) { Write-Output 'Aucune entree Sunshine/Tailscale/Moonlight detectee.' }
else { $apps | Select-Object DisplayName, DisplayVersion | Format-Table -AutoSize }

Write-Output '=== Services ==='
$services = @(Get-Service -Name '*sunshine*', '*tailscale*' -ErrorAction SilentlyContinue)
if ($services.Count -eq 0) { Write-Output 'Aucun service Sunshine/Tailscale detecte.' }
else { $services | Select-Object Name, Status, StartType | Format-Table -AutoSize }

Write-Output '=== Alimentation : veille sur secteur et batterie ==='
powercfg /query SCHEME_CURRENT SUB_SLEEP STANDBYIDLE
if ($LASTEXITCODE -ne 0) { throw 'Lecture du reglage de veille impossible.' }

Write-Output 'Diagnostic termine. Aucun reglage modifie ; streaming non teste.'
