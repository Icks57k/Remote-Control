#!/bin/bash
# Diagnostic en lecture seule. Ne pas publier la sortie brute.
set -euo pipefail

if [ "$(uname -s)" != "Darwin" ]; then
    printf '%s\n' 'Ce script est destiné à macOS (Denise).' >&2
    exit 1
fi

printf '\n%s\n' '=== Système ==='
sw_vers
uname -m

printf '\n%s\n' '=== Applications ==='
for app in Moonlight Tailscale; do
    found=0
    for base in /Applications "$HOME/Applications"; do
        bundle="$base/$app.app"
        if [ -d "$bundle" ]; then
            found=1
            printf '%s\n' "$bundle"
            /usr/libexec/PlistBuddy -c 'Print :CFBundleShortVersionString' \
                "$bundle/Contents/Info.plist" || printf '%s\n' 'Version non lisible.'
        fi
    done
    if [ "$found" -eq 0 ]; then
        printf '%s\n' "$app : absent des dossiers Applications habituels."
    fi
done

printf '\n%s\n' '=== CLI Tailscale ==='
if command -v tailscale >/dev/null 2>&1; then
    command -v tailscale
    tailscale version
elif [ -x /Applications/Tailscale.app/Contents/MacOS/Tailscale ]; then
    printf '%s\n' '/Applications/Tailscale.app/Contents/MacOS/Tailscale'
    /Applications/Tailscale.app/Contents/MacOS/Tailscale version
else
    printf '%s\n' 'CLI non détectée ; vérifier aussi Tailscale dans la barre de menus.'
fi

printf '\n%s\n' 'Diagnostic terminé. Aucun réglage modifié ; réseau et streaming non testés.'
