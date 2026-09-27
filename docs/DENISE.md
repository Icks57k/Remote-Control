# Denise : MacBook Air M4

## 1. Récupérer le projet

```sh
git clone git@github.com:Icks57k/Remote-Control.git
cd Remote-Control
bash scripts/macos/diagnose.sh
```

Si le dépôt est déjà cloné, vérifier `git status`, enregistrer les modifications locales,
puis utiliser `git pull --ff-only`.

## 2. Installer les clients

1. Vérifier si Moonlight et Tailscale sont déjà installés.
2. Installer la version macOS stable de [Moonlight](https://moonlight-stream.org/)
   depuis le téléchargement officiel, puis la placer dans Applications.
3. Installer [Tailscale pour macOS](https://tailscale.com/download/mac).
   Garder une seule variante de Tailscale ; ne pas cumuler App Store et installation autonome.
4. L'utilisateur autorise les composants réseau demandés par macOS et connecte Tailscale
   au même compte/réseau que Lovecaft.
5. Noter les versions réellement installées dans STATUS.md.

Sunshine n'est pas nécessaire sur Denise. Homebrew n'est pas un prérequis.

## 3. Associer les machines

- Pour le premier essai, connecter Denise au même réseau domestique que Lovecaft.
- Ouvrir Moonlight ; sélectionner Lovecaft s'il apparaît, sinon ajouter son adresse LAN manuellement.
- Saisir le PIN affiché par Moonlight dans la page d'association de Sunshine sur Lovecaft.
- Lancer Desktop/Bureau et tester image, son, clavier et souris.
- Pour l'accès extérieur, ajouter l'adresse Tailscale de Lovecaft à Moonlight si nécessaire.
  Consulter cette adresse dans Tailscale ; ne pas la committer.

## 4. Réglages de départ

| Réglage Moonlight | Valeur initiale |
| --- | --- |
| Résolution | 1920 × 1080 |
| Fréquence | 60 images/s |
| Débit | 15 Mbit/s |
| HDR | Désactivé |
| Codec | Automatique |

Le format de l'écran du Mac diffère du 16:9 : des bandes noires sont acceptables pour le premier test.
On ajustera la résolution une fois la liaison stable. Ne pas forcer AV1 ou HEVC avant d'avoir
vérifié le décodage utilisé et la stabilité réelle.

## 5. Utiliser l'iPhone

Activer le partage de connexion de l'iPhone et y connecter Denise en Wi-Fi.
Pour tester la route mobile, l'iPhone doit utiliser les données cellulaires et le Mac doit
être déconnecté du Wi-Fi domestique et de tout câble Ethernet.
Garder Tailscale actif sur le Mac. Vérifier la consommation restante du forfait.

Passer à [la validation](VALIDATION.md), puis committer et pousser uniquement le suivi sans données privées.
