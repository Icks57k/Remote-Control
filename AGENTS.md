# Travail dans ce dépôt

## Objectif et contexte

Configurer le streaming de jeux de Lovecaft (Windows 11, RTX 5070, fibre)
vers Denise (MacBook Air M4, 15 pouces), en déplacement via un iPhone 17 en 5G Orange.
Respecter l'orthographe **Lovecaft**. Ces noms ne prouvent pas le nom système du poste.
Sunshine est l'hôte Windows ; Moonlight est le client Mac ; Tailscale relie les deux.

## Reprise du travail

- Lire README.md et docs/STATUS.md avant d'agir ; identifier le système courant.
- Vérifier `git status` avant de synchroniser. Ne pas écraser les changements de l'autre poste.
- Utiliser `git pull --ff-only` avec un arbre propre ; committer et pousser les changements terminés.
- Suivre le guide du poste. Inspecter l'existant avant installation pour éviter les doublons.
- Privilégier les versions stables et les sources officielles. Vérifier les procédures actuelles
  avant installation ; les liens `latest` peuvent évoluer.
- Après chaque session, mettre à jour docs/STATUS.md : faits vérifiés, changements,
  tests effectués et prochaine action. Ne pas confondre une procédure rédigée avec un test réussi.
- Documenter en français. Garder les scripts simples ; pas de dépendances ajoutées pour un diagnostic.

## Données et accès

Ce dépôt est public. Ne jamais committer de mots de passe, clés, jetons, certificats,
adresses IP personnelles, exports Tailscale, journaux bruts ou configuration Sunshine privée.
Les conserver sous `.local/` si nécessaire, puis vérifier le diff avant publication.
Ne pas versionner les associations Moonlight ni les sessions de connexion.

Ne pas désactiver le pare-feu ou l'anti-triche. Garder UPnP désactivé dans Sunshine
pour cette architecture Tailscale et ne pas exposer son interface d'administration à Internet.
Ne pas activer Tailscale SSH, un exit node ou une route de sous-réseau : inutiles ici.
L'utilisateur effectue les connexions de compte et les validations système qui exigent sa présence.

## Validation

Les diagnostics sont en lecture seule. Les exécuter sur leur système cible et contrôler
la syntaxe des scripts modifiés. Ne pas déclarer un script macOS validé sous Windows.
Le succès final nécessite une vraie session Moonlight : LAN, puis partage 5G, puis jeu.
Un service actif ou un ping réussi ne prouve pas que le streaming fonctionne.
