# État du projet

## État actuel de Lovecaft — 27 septembre 2026

- Sunshine **2026.914.233613** et Tailscale **1.102.4** installés via winget,
  depuis leurs installateurs officiels avec vérification des empreintes par winget.
- Services `SunshineService` et `Tailscale` actifs, démarrage automatique.
- Tailscale connecté par l'utilisateur ; appareil `lovecaft` en ligne, mode sans utilisateur
  (`ForceDaemon`) actif, routes de sous-réseau non acceptées et serveur SSH désactivé.
- Diagnostic Tailscale : UDP, IPv4 et IPv6 disponibles. Le trajet direct vers Denise reste à tester.
- Liaison Ethernet active à 1 Gbit/s.
- Veille automatique sur secteur désactivée (ancien délai : 15 minutes).
  Extinction de l'écran et réglage sur batterie conservés.
- Sunshine annonce **Lovecaft**, interface française, UPnP désactivé,
  administration limitée au PC (`origin_web_ui_allowed = pc`).
- Compte administrateur Sunshine `lovecaft` créé avec mot de passe aléatoire.
  Copie chiffrée par Windows DPAPI dans `.local/sunshine-admin.credential.xml`, hors Git.
  Voir docs/LOVECAFT.md pour l'utilisation depuis la session Windows actuelle.
- Encodeurs H.264, HEVC et AV1 NVIDIA détectés lors du diagnostic de démarrage.
  Écran actuel détecté en 2560 × 1440, environ 144 Hz, SDR.
- Entrées Desktop et Steam Big Picture présentes. Le service GameStream répond localement
  sous le nom Lovecaft ; aucun client Moonlight n'est encore associé.
- API d'administration accessible avec le compte créé ; sans identifiants, réponse HTTP 401.
- Pare-feu Windows actif sur tous les profils. Les règles de l'installateur autorisent
  l'exécutable Sunshine ; aucune redirection de port sur la box ajoutée.
- Aucun pilote de manette virtuelle installé. Sélection `gamepad_driver = vigembus` enregistrée,
  sans installation de pilote ni achat de licence. Premier essai prévu au clavier/souris ;
  la manette demandera une préparation supplémentaire si nécessaire.
- Sunshine a été redémarré et sa configuration relue avec succès. Le PC n'a pas été redémarré.

## Historique de l'initialisation du dépôt

- Accès SSH en lecture fonctionnel ; dépôt initialement vide et public.
- Première version publiée sur `main`. Sur Lovecaft, la clé SSH est une clé de déploiement
  sans droit d'écriture : les pushes utilisent donc HTTPS via le compte GitHub CLI déjà connecté.
  Cette configuration est locale à `.git/config`, sans secret versionné. Les lectures restent en SSH.
  Sur Denise, le droit de push de sa propre clé reste à vérifier.
- Windows 11 Famille, version système 10.0.22631.
- NVIDIA GeForce RTX 5070 détectée.
- Git, GitHub CLI et winget disponibles.
- Aucun service ni entrée de désinstallation Sunshine/Tailscale trouvé lors de l'inspection initiale.
- Veille du PC configurée après 900 secondes (15 minutes) sur secteur ; à adapter avant accès distant.
- Aucun logiciel installé et aucun réglage réseau ou d'alimentation modifié par cette initialisation.

Le matériel de Denise, l'iPhone et les connexions fibre/5G sont renseignés par l'utilisateur.
Ils n'ont pas encore été inspectés sur place.

## Étapes

- [x] Créer les guides, les règles de reprise et les scripts de diagnostic.
- [x] Installer et configurer Sunshine sur Lovecaft.
- [x] Installer Tailscale et connecter Lovecaft au compte de l'utilisateur.
- [ ] Installer Moonlight et Tailscale sur Denise ; connecter le même réseau Tailscale.
- [ ] Associer Moonlight à Sunshine et valider une session sur le réseau local.
- [ ] Valider une liaison Tailscale directe et une session via le partage 5G.
- [ ] Valider écran éteint, veille désactivée et reprise après redémarrage.
- [ ] Tester Aion 2 quand le jeu est disponible pour l'utilisateur.

## Prochaine action

Passer sur **Denise**, cloner le dépôt ou effectuer `git pull --ff-only`, puis suivre docs/DENISE.md.
Installer Moonlight et Tailscale, et connecter le même compte Tailscale que sur Lovecaft.
Relever l'adresse de Lovecaft dans Tailscale, sans la publier dans Git.
L'association Moonlight nécessite de saisir son PIN dans Sunshine sur Lovecaft : prévoir
ce premier appairage avant de quitter le domicile. L'interface Sunshine est accessible
uniquement depuis Lovecaft ; aucune administration via son adresse Tailscale n'est activée.

## Vérifications des scripts

- Windows : analyse syntaxique PowerShell réussie et diagnostic exécuté avec succès sur Lovecaft.
- macOS : syntaxe vérifiée avec `bash -n` via Git Bash ; exécution réelle non testée, nécessite Denise.
- Aucun test de streaming effectué à ce stade.
