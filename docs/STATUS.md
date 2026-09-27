# État du projet

## Vérifié sur Lovecaft lors de l'initialisation

- Accès SSH au dépôt GitHub fonctionnel ; dépôt initialement vide et public.
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
- [ ] Installer et configurer Sunshine sur Lovecaft.
- [ ] Installer Tailscale et connecter Lovecaft au compte de l'utilisateur.
- [ ] Installer Moonlight et Tailscale sur Denise ; connecter le même réseau Tailscale.
- [ ] Associer Moonlight à Sunshine et valider une session sur le réseau local.
- [ ] Valider une liaison Tailscale directe et une session via le partage 5G.
- [ ] Valider écran éteint, veille désactivée et reprise après redémarrage.
- [ ] Tester Aion 2 quand le jeu est disponible pour l'utilisateur.

## Prochaine action

Sur Lovecaft : suivre docs/LOVECAFT.md, installer les versions stables de Sunshine et Tailscale,
puis faire effectuer les connexions et la création du mot de passe Sunshine par l'utilisateur.
Sur Denise, l'installation du client peut avancer indépendamment via docs/DENISE.md.

## Vérifications des scripts

- Windows : analyse syntaxique PowerShell réussie et diagnostic exécuté avec succès sur Lovecaft.
- macOS : syntaxe vérifiée avec `bash -n` via Git Bash ; exécution réelle non testée, nécessite Denise.
- Aucun test de streaming effectué à ce stade.
