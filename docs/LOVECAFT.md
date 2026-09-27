# Lovecaft : PC hôte

## Installation actuelle et accès administrateur

Sunshine et Tailscale sont installés et configurés. Consulter [STATUS.md](STATUS.md)
avant de réexécuter l'installation ci-dessous.

Ouvrir `https://localhost:47990` **sur Lovecaft**. Identifiant Sunshine : `lovecaft`.
Le mot de passe généré est conservé chiffré par Windows dans
`.local/sunshine-admin.credential.xml`, accessible depuis le compte Windows qui l'a créé.
Depuis la racine du dépôt, cette commande copie le mot de passe dans le presse-papiers
sans l'afficher dans le terminal :

```powershell
(Import-Clixml .local/sunshine-admin.credential.xml).GetNetworkCredential().Password | Set-Clipboard
```

Coller dans le formulaire Sunshine. Vider ensuite le presse-papiers avec `Set-Clipboard -Value ''`.
Ce fichier ne se synchronise pas via Git et ne se déchiffre pas sur Denise.
L'administration est volontairement limitée à localhost ; cela n'empêche pas le streaming.

Les réglages d'alimentation d'origine sont relevés dans `.local/power-before.txt`.
Pour rétablir le délai de veille initial sur secteur, exécuter `powercfg /change standby-timeout-ac 15`.
Laisser la veille désactivée pendant les périodes où l'accès distant doit rester disponible.

Le premier usage vise clavier/souris. Aucun pilote de manette virtuelle n'a été installé.
Ne pas confondre le choix `vigembus` enregistré dans Sunshine avec la présence de ce pilote.

## 1. Diagnostic

Depuis la racine du dépôt, dans PowerShell :

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\windows\diagnose.ps1
```

`Bypass` s'applique uniquement à ce processus, sans changer la stratégie globale.
Le diagnostic ne modifie rien. Ses résultats peuvent contenir des informations locales :
ne pas les publier tels quels.

## 2. Installer

1. Vérifier si les applications sont déjà présentes.
2. Télécharger l'installateur Windows de la version stable de
   [Sunshine, projet LizardByte](https://github.com/LizardByte/Sunshine/releases/latest).
   Suivre la [documentation officielle](https://docs.lizardbyte.dev/projects/sunshine/latest/md_docs_2getting__started.html).
3. Installer [Tailscale pour Windows](https://tailscale.com/download/windows).
4. Noter les versions effectivement installées dans STATUS.md.

Laisser l'utilisateur valider les demandes UAC et se connecter à Tailscale.
Utiliser le même compte/réseau Tailscale sur Denise. Aucun besoin de Tailscale sur l'iPhone
pour fournir le partage de connexion au Mac.

## 3. Configurer Sunshine

- Ouvrir l'interface locale `https://localhost:47990` après démarrage de Sunshine.
  Son certificat local autosigné peut déclencher un avertissement du navigateur ;
  vérifier l'adresse locale avant de continuer.
- L'utilisateur choisit un identifiant et un mot de passe propres à Sunshine, hors du dépôt.
- Garder **UPnP désactivé**, sans redirection de ports sur la box pour ce projet.
- Vérifier l'utilisation de l'encodeur matériel NVIDIA dans les journaux locaux lors du premier flux.
- Utiliser l'entrée Desktop/Bureau pour le premier essai ; le lancement du jeu pourra être ajouté ensuite.
- Autoriser le trafic nécessaire dans le pare-feu Windows pour le réseau Tailscale
  si les règles créées par l'installation ne suffisent pas. Ne pas désactiver le pare-feu.

## 4. Préparer l'accès sans présence

- Brancher le PC en Ethernet si possible.
- Vérifier le démarrage automatique de Sunshine et Tailscale.
- Pour l'accès avant ouverture de session Windows, vérifier le mode d'exécution sans utilisateur
  de Tailscale dans la version installée, puis tester un redémarrage réel.
- Relever le réglage de veille actuel avant de le modifier. Désactiver la veille du PC sur secteur
  pendant les périodes d'accès distant ; traiter l'extinction de l'écran séparément.
- Tester la capture écran éteint. Si elle échoue, étudier un écran virtuel ou un adaptateur HDMI
  après diagnostic, sans installer de pilote supplémentaire par défaut.
- Le réveil à distance n'est pas configuré dans ce premier lot. Un PC éteint ne sera pas accessible.

## 5. Associer Denise

Suivre le guide Denise. Moonlight affiche un PIN à saisir dans l'interface Sunshine de Lovecaft.
Cette association reste locale et n'est jamais copiée dans Git.
Passer ensuite à [la validation](VALIDATION.md).
