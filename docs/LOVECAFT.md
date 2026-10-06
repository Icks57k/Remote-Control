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

Le premier usage vise clavier/souris. Virtual HID 2026.914.1218.10 est maintenant installé
et sélectionné dans Sunshine ; licence active, clavier et souris HID présents en état OK.
La réception des commandes depuis Moonlight et la validation en jeu restent à faire.
ViGEmBus n’est pas installé. Voir le dernier relevé dans STATUS.md.

## Reprise prioritaire : Aion 2 et Virtual HID — 6 octobre 2026

Procédure initialement rédigée sur Denise, puis exécutée en partie sous Windows le 6 octobre :
pilote installé et reconnu compatible, choix Virtual HID enregistré, licence activée,
clavier et souris HID détectés ; fonctionnement en jeu non validé.
Voir STATUS.md avant de reprendre les étapes.
Le jeu est **Aion 2, version globale lancée via Steam**, joué au **clavier et à la souris**.
Aucune manette n’est demandée.

### Résultats déjà obtenus

- Bureau Windows accessible depuis Denise par Moonlight, clavier et clics fonctionnels.
- Tailscale direct, 34 ms sur une mesure ; ports Sunshine accessibles.
- Aion 2 se lance et la caméra bouge, mais touches et clics ne répondent pas.
- Ctrl+Échap ouvre Démarrer ; saisie et clics dans le Bloc-notes fonctionnent même
  avec Aion 2 ouvert. Revenir au jeu par la barre des tâches ne corrige pas le blocage.
- Alt+Tab revenait au Mac : la capture des raccourcis système Moonlight est désactivée.
  Ce constat est distinct du blocage des touches ordinaires et des clics dans Aion 2.
- L’essai via l’entrée Steam de Moonlight a été proposé, mais son résultat n’est pas connu.
  Desktop et Steam utilisent tous deux Sunshine/Moonlight, pas Steam Remote Play.

Ces tests orientent vers une incompatibilité des entrées avec le jeu. Ils ne prouvent
ni un blocage par l’anti-triche ni que Virtual HID résoudra le problème.

### Piste retenue pour la reprise

**Virtual HID Driver de LizardByte** prend en charge un clavier et une souris virtuels
visibles via Raw Input, en plus des manettes. Il s’installe sur **Lovecaft**, tandis que
Denise conserve Moonlight et ses périphériques habituels. Il ne convertit pas les touches
en commandes de manette. Une licence active est requise pour ce chemin clavier/souris.
La compatibilité spécifique avec Aion 2 global Steam n’a pas été confirmée officiellement.

Documentation officielle consultée le 6 octobre 2026, à revérifier avant installation :

- [Sunshine : pilote, licence et entrées clavier/souris](https://docs.lizardbyte.dev/projects/sunshine/latest/md_docs_2troubleshooting.html#no-gamepad-detected)
- [Sunshine : jeux ne recevant pas le clavier](https://docs.lizardbyte.dev/projects/sunshine/latest/md_docs_2troubleshooting.html#games-do-not-detect-keyboard-input)
- [Sunshine : jeux ne recevant pas la souris](https://docs.lizardbyte.dev/projects/sunshine/latest/md_docs_2troubleshooting.html#games-do-not-detect-mouse-input)
- [libvirtualhid : pilote Windows](https://docs.lizardbyte.dev/projects/libvirtualhid/latest/md_docs_2windows-driver.html)

### Marche à suivre sur Lovecaft

1. Identifier Windows, vérifier `git status`, puis faire `git pull --ff-only` avec
   un arbre propre. Lire ce guide et STATUS.md. Préserver les changements locaux.
2. Exécuter le diagnostic Windows ci-dessous en lecture seule. Inspecter les versions
   actuelles de Sunshine, les pilotes installés et l’état des services avant toute installation.
   Le dernier relevé date du 27 septembre : Sunshine 2026.914.233613,
   `gamepad_driver = vigembus`, aucun pilote virtuel installé à cette date.
3. Ouvrir l’administration Sunshine **sur le PC**, selon la procédure en tête du guide.
   Relever Configuration → Input et la page de dépannage : pilote, licence et erreurs
   éventuelles. Conserver toute sauvegarde de configuration et tout journal sous `.local/`.
4. Vérifier les versions stables compatibles depuis la documentation officielle et son lien
   de téléchargement Virtual HID. Au 6 octobre, la documentation Sunshine annonce le pilote
   2026.914.1218.10 ou plus récent ; vérifier aussi la compatibilité avec la version Sunshine
   réellement installée. Ne pas prendre une préversion par défaut ni compiler un pilote de test.
5. Vérifier les conditions de licence et l’existence éventuelle d’un essai officiel avant
   tout achat. Aucun achat n’est autorisé par la seule demande de préparer cette reprise.
   L’utilisateur effectue les connexions de compte et les validations Windows nécessaires.
6. Installer le paquet Windows officiel compatible après vérification de sa provenance et
   de sa signature, puis activer une licence valable. Ne pas installer de pilote sur le Mac.
   La documentation recommande un redémarrage après installation : l’organiser avec
   un accès local permettant de récupérer le PC, la reprise après redémarrage restant non testée.
7. Dans Configuration → Input, remplacer « ViGEmBus uniquement » par une option permettant
   Virtual HID (« All Available Drivers » ou « Virtual HID Driver » selon l’interface),
   enregistrer, puis vérifier dans le dépannage que le pilote et la licence sont reconnus.
   La sélection d’un pilote ne prouve pas que le clavier/souris l’utilise : vérifier les
   diagnostics locaux pour écarter un repli sur SendInput. La documentation indique que
   l’activation de licence peut recréer les périphériques sans redémarrer Sunshine.
8. Depuis Denise, tester d’abord le bureau et le Bloc-notes, puis Aion 2 : menu Échap,
   clics, déplacement, actions et saisie dans le chat sans envoyer de message de test.
   Vérifier le mode souris adapté aux jeux : les mouvements relatifs, boutons et molette
   peuvent passer par HID ; le positionnement absolu reste injecté selon la documentation.
9. Consigner les versions, le réglage retenu et les résultats réels dans STATUS.md.
   Si le jeu reste bloqué, conserver la cause comme non confirmée et consulter les supports
   officiels avec des informations expurgées. Ne pas désactiver ni contourner l’anti-triche.

Pour revenir aux réglages antérieurs en cas de régression, utiliser l’accès local et
rétablir le choix d’entrée précédemment relevé. Ne pas désinstaller Sunshine/Tailscale
ni supprimer l’association Moonlight. Garder UPnP désactivé et l’administration locale.

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
