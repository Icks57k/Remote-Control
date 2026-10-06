# État du projet

## Préparation Virtual HID sur Windows — 6 octobre 2026

- Diagnostic Windows exécuté en lecture seule : Windows 11 Famille 10.0.22631,
  RTX 5070, Sunshine 2026.914.233613 et Tailscale 1.102.4.
- SunshineService trouvé arrêté (démarrage automatique) ; Tailscale actif.
  Veille sur secteur toujours désactivée. Cause de l’arrêt Sunshine non déterminée.
- Aucun périphérique ROOT\LIBVIRTUALHID ni service Virtual HID détecté.
  Le périphérique Microsoft Virtual HID Framework ne prouve pas l’installation LizardByte.
- Réglages relus : `gamepad_driver = vigembus`, UPnP désactivé, administration limitée au PC.
- Installateur stable Virtual HID v2026.914.1218.10 téléchargé depuis la release officielle
  sous `.local/`. Signature Authenticode valide (David Lane) et SHA-256 conforme au
  digest GitHub. La release recommande Sunshine v2026.914.233613 ou ultérieur, déjà installé.
- La documentation du tag publié confirme la prise en charge clavier/souris HID avec licence.
  Utilisateur sans licence pour le moment ; aucun achat ni activation effectué.
- Boutique officielle consultée : 14,99 USD/an (abonnement) ou 49,99 USD à vie,
  cinq machines ; taxes au paiement. Aucun essai grand public trouvé.
  Source : https://app.lizardbyte.dev/store/
- Démarrage direct de Sunshine refusé faute de droits administrateur, puis demande UAC
  validée par l’utilisateur : service démarré. Assistant MSI lancé sans redémarrage automatique.
- Installation vérifiée par l’API Sunshine : pilote 2026.914.1218.10 présent et compatible ;
  service `libvirtualhid_broker` actif. Licence indiquée `unlicensed`.
- Configuration sauvegardée sous `.local/`, puis `gamepad_driver = virtualhid` enregistré
  via l’API locale. UPnP désactivé et administration limitée au PC, relus après modification.
- Redémarrage Sunshine demandé par son API ; connexion fermée pendant l’appel, puis service
  actif et API de configuration à nouveau accessibles avec le nouveau choix d’entrée.
- Page locale de dépannage ouverte pour l’activation par l’utilisateur. Windows non redémarré ;
  aucun clavier/souris HID actif ni résultat dans Aion 2 validé à ce stade.
- Prochaine action : l’utilisateur choisit et active une licence dans Sunshine (clé privée),
  puis vérifier le chemin HID et tester depuis Denise. Redémarrage Windows recommandé par
  la documentation, à organiser avec présence locale. Aucun achat effectué par l’assistant.

## Synchronisation Windows — 6 octobre 2026

- Système courant vérifié : Windows, version 10.0.22631.
- Arbre Git propre avant synchronisation ; `git pull --ff-only` réussi jusqu’au commit `478dcb7`.
- Dernières notes de Denise et guide de reprise Aion 2 / Virtual HID récupérés.
- Aucun diagnostic de streaming ni changement de configuration effectué pendant cette reprise.
- Prochaine action : suivre la reprise Lovecaft décrite ci-dessous, en inspectant l’existant.

## Accès en déplacement — 6 octobre 2026

- Utilisateur en déplacement ; intervention depuis macOS (Denise).
- Arbre Git propre avant synchronisation ; `git pull --ff-only` effectué, dépôt à jour.
- Tailscale actif (`Running`) ; Lovecaft annoncé en ligne.
- Ping Tailscale réussi en liaison directe, 34 ms sur la mesure effectuée.
- Ports TCP Sunshine 47989, 47984 et 48010 accessibles depuis Denise.
- Moonlight ouvert et processus présent ; utilisateur invité à sélectionner Lovecaft,
  puis Desktop / Bureau avec l'association existante.
- Bureau Windows affiché et contrôle au clavier et à la souris confirmés par
  l’utilisateur dans Moonlight : première prise de contrôle en déplacement validée.
- Le réseau d’accès exact (partage 5G ou autre) n’a pas été vérifié. Son, profil,
  durée, fluidité et fonctionnement en jeu restent à relever.
- Aion 2 se lance selon l’utilisateur, mais seule la caméra peut être déplacée ;
  les autres actions ne fonctionnent pas. Jouabilité non validée. Cause non déterminée.
- Test utilisateur dans Aion 2 : ni Échap, ni Entrée, ni les clics ne répondent.
- Préférences d’entrée Moonlight consultées en lecture seule sur Denise :
  `capturesyskeys = 0` (capture des raccourcis système désactivée, vérifiée dans
  le code officiel Moonlight 6.1.0). Aucun réglage modifié ni pilote installé.
- Alt+Tab ramenait l’utilisateur au Mac. Ctrl+Échap a ensuite ouvert Démarrer
  dans Windows ; clics et saisie dans le Bloc-notes confirmés avec Aion 2 ouvert.
- Retour dans Aion 2 par son icône dans la barre des tâches : Échap ne répond
  toujours pas. Le simple retour au premier plan n’a pas corrigé le problème.
- Le blocage constaté est propre au jeu ; sa cause technique exacte reste
  non confirmée. Aucune modification de l’anti-triche effectuée.
- Lanceur et région confirmés : Steam, version globale d’Aion 2.
- Prochain essai proposé par l’utilisateur : ouvrir l’entrée Steam de Moonlight
  au lieu de Desktop, puis accéder au jeu. Résultat en attente ; cette entrée
  reste un flux Sunshine/Moonlight et ne constitue pas Steam Remote Play.
- La documentation Sunshine décrit des jeux qui ne reçoivent pas les entrées
  SendInput et nécessitent Raw Input ; piste de compatibilité à confirmer ici,
  sans conclusion sur l’anti-triche ni garantie de correction par un pilote.
  Source : https://docs.lizardbyte.dev/projects/sunshine/latest/md_docs_2troubleshooting.html
- L’utilisateur prévoit de reprendre côté Lovecaft pour la piste **Virtual HID Driver**,
  au clavier/souris sans manette. Guide de reprise ajouté dans docs/LOVECAFT.md :
  inspection, versions compatibles, licence, réglage d’entrée et validation réelle.
- Aucun pilote téléchargé/installé, aucune licence achetée/activée et aucun réglage
  Sunshine modifié pendant cette session sur Denise. Virtual HID reste non testé.
- Session documentaire : diff relu et `git diff --check` réussi ; aucun script modifié
  et aucun diagnostic Windows exécuté depuis le Mac.
- Confirmer ensuite le réseau utilisé, le son et le profil Moonlight.

## État actuel de Denise — 27 septembre 2026

- Dépôt cloné en HTTPS sur `main`. Authentification SSH GitHub fonctionnelle ;
  URL de push configurée en SSH localement, pushes sur `main` réussis.
- MacBook Air, identifiant Mac16,13, Apple M4, 16 Go de mémoire ;
  macOS 26.6.2 (25G83), architecture arm64 vérifiés sur ce poste.
- Moonlight et Tailscale absents des dossiers Applications habituels avant intervention.
- Moonlight **6.1.0** installé dans `/Applications` via Homebrew depuis sa distribution
  officielle ; signature vérifiée avec `codesign --verify --deep --strict`, application ouverte.
- Installateur autonome Tailscale **1.102.4** téléchargé depuis `pkgs.tailscale.com`
  dans `.local/`, empreinte SHA-256 conforme au manifeste Homebrew,
  signature Tailscale Inc. et notarisation Apple vérifiées. Installation terminée :
  application **1.102.4** présente et extension réseau activée et autorisée.
- Le bouton « Sign in to your network » ne produisait aucun effet visible pour l'utilisateur.
  La CLI répondait `Logged out.` ; `tailscale login` a obtenu un lien de connexion,
  ouvert dans le navigateur par défaut. Connexion terminée par l'utilisateur ;
  état `Running` vérifié et Lovecaft présent et en ligne dans le même réseau.
- Ping Tailscale vers Lovecaft réussi avec trajet direct ; ports TCP Sunshine
  47989, 47984 et 48010 accessibles depuis Denise. Cela ne valide pas encore le streaming.
- Lovecaft n'apparaissait pas dans Moonlight ; son adresse Tailscale a été fournie
  pour l'ajout manuel (adresse non versionnée).
- L'utilisateur a récupéré le mot de passe Sunshine sur le PC via le fichier chiffré,
  s'est connecté à son interface locale et a effectué l'appairage par l'onglet **PIN**.
- Après l'appairage, l'utilisateur confirme « ça fonctionne ». Premier fonctionnement
  Moonlight confirmé par l'utilisateur ; image, son, clavier/souris, durée, qualité et
  réseau d'accès utilisé n'ont pas été relevés séparément. La validation détaillée reste à faire.
- Moonlight fermé à la demande de l'utilisateur. La fermeture AppleScript a renvoyé
  une annulation ; le processus a été terminé par `SIGTERM`, puis son absence vérifiée.
- Le profil 1080p/60/15 Mbit/s reste à appliquer et vérifier dans Moonlight.

## État actuel de Lovecaft — 27 septembre 2026

- Sunshine **2026.914.233613** et Tailscale **1.102.4** installés via winget,
  depuis leurs installateurs officiels avec vérification des empreintes par winget.
- Services `SunshineService` et `Tailscale` actifs, démarrage automatique.
- Tailscale connecté par l'utilisateur ; appareil `lovecaft` en ligne, mode sans utilisateur
  (`ForceDaemon`) actif, routes de sous-réseau non acceptées et serveur SSH désactivé.
- Diagnostic Tailscale : UDP, IPv4 et IPv6 disponibles. Trajet direct confirmé depuis Denise.
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
  sous le nom Lovecaft ; Denise associée ensuite par l'utilisateur via le PIN Sunshine.
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
  Sur Denise, les pushes SSH sur `main` ont ensuite été effectués avec succès.
- Windows 11 Famille, version système 10.0.22631.
- NVIDIA GeForce RTX 5070 détectée.
- Git, GitHub CLI et winget disponibles.
- Aucun service ni entrée de désinstallation Sunshine/Tailscale trouvé lors de l'inspection initiale.
- Veille du PC configurée après 900 secondes (15 minutes) sur secteur ; à adapter avant accès distant.
- Aucun logiciel installé et aucun réglage réseau ou d'alimentation modifié par cette initialisation.

L'iPhone et les connexions fibre/5G sont renseignés par l'utilisateur et restent à tester.
Le matériel de Denise a été inspecté sur place (voir ci-dessus).

## Étapes

- [x] Créer les guides, les règles de reprise et les scripts de diagnostic.
- [x] Installer et configurer Sunshine sur Lovecaft.
- [x] Installer Tailscale et connecter Lovecaft au compte de l'utilisateur.
- [x] Installer Moonlight et Tailscale sur Denise ; connecter le même réseau Tailscale.
- [x] Associer Moonlight à Sunshine ; premier fonctionnement confirmé par l'utilisateur.
- [x] Afficher le bureau et contrôler Lovecaft dans Moonlight en déplacement.
- [ ] Valider en détail une session sur le réseau local (image, son, commandes, qualité).
- [x] Vérifier une liaison Tailscale directe depuis Denise sur la connexion actuelle.
- [ ] Valider une liaison Tailscale directe et une session via le partage 5G.
- [ ] Valider écran éteint, veille désactivée et reprise après redémarrage.
- [ ] Valider la jouabilité d’Aion 2 : lancement réussi, commandes bloquées au test du 6 octobre.

## Prochaine action

Reprendre sur **Lovecaft** avec le guide
[Reprise Aion 2 et Virtual HID](LOVECAFT.md#reprise-prioritaire--aion-2-et-virtual-hid--6-octobre-2026).
Inspecter l’existant avant installation, vérifier une version stable compatible du pilote
et les conditions de licence, puis préparer Virtual HID pour le **clavier et la souris**.
Le jeu est la version **globale Steam**. La piste est documentée, sans garantie de correction
ni validation en jeu ; aucune installation n’a encore été effectuée.

Le bureau fonctionne à distance, mais Aion 2 ignore les touches et les clics même après
retour au premier plan. Le Bloc-notes répond avec le jeu ouvert. Le résultat de l’essai
via l’entrée Steam de Moonlight reste inconnu. Ne pas recommencer l’appairage sauf demande
de Moonlight ; garder l’administration Sunshine limitée à Lovecaft.

Après intervention, tester depuis Denise le bureau, puis les commandes dans Aion 2.
Relever ensuite le son, le profil et la qualité sur 15 à 30 minutes, en précisant le réseau
utilisé. Le profil prévu reste 1080p/60/15 Mbit/s SDR. Les validations détaillées en LAN,
via partage 5G, écran éteint et après redémarrage restent à compléter selon VALIDATION.md.

## Vérifications des scripts

- Windows : analyse syntaxique PowerShell réussie et diagnostic exécuté avec succès sur Lovecaft.
- macOS : `bash -n` et exécution réelle de `scripts/macos/diagnose.sh` réussis sur Denise.
- Premier fonctionnement Moonlight confirmé par l'utilisateur ; aucun relevé détaillé de
  streaming, test 5G, écran éteint, redémarrage ou jeu validé à ce stade.
