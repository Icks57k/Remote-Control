# Remote-Control

Jouer sur **Lovecaft**, le PC Windows à domicile, depuis **Denise**, le MacBook en déplacement.
Le jeu s'exécute sur le PC ; le Mac reçoit l'image et le son et transmet les commandes.

| Machine | Matériel et connexion | Rôle |
| --- | --- | --- |
| Lovecaft | Windows 11 Famille, RTX 5070, fibre | Sunshine : héberge le streaming |
| Denise | MacBook Air 15 pouces, puce M4 | Moonlight : reçoit le streaming |
| Téléphone | iPhone 17, 5G Orange | Partage de connexion pour Denise |

Lovecaft et Denise sont les noms utilisés dans ce projet, pas nécessairement les noms système.

**Architecture retenue : Sunshine + Moonlight + Tailscale.**
Tailscale relie le PC et le Mac via un réseau privé. Il s'installe sur ces deux machines ;
l'iPhone sert uniquement de connexion Internet. On vise une liaison Tailscale directe.

## Reprendre sur une machine

Premier accès :

```sh
git clone git@github.com:Icks57k/Remote-Control.git
cd Remote-Control
```

Accès suivants, après avoir vérifié et enregistré les changements locaux :

```sh
git pull --ff-only
```

Lire [l'état du projet](docs/STATUS.md), puis le guide de la machine :

- [Lovecaft : installation Windows](docs/LOVECAFT.md)
- [Denise : installation macOS](docs/DENISE.md)
- [Validation à domicile puis en 5G](docs/VALIDATION.md)

Pour reprendre avec un assistant sur le Mac :

> Nous sommes sur Denise. Lis AGENTS.md et docs/STATUS.md, puis poursuis
> l'installation décrite dans docs/DENISE.md. Mets à jour le suivi avec les résultats réels.

## Premier profil de streaming

1080p, 60 images/s, 15 Mbit/s, SDR, codec automatique. Ajuster après un essai réel.
À 15 Mbit/s constants, la vidéo représente environ 6,8 Go par heure, hors audio et surdébit réseau.
Le PC doit rester allumé, accessible et sans mise en veille pendant l'utilisation.
Le comportement avec l'écran éteint et après redémarrage doit être testé avant de partir.

## Ce que contient Git

Documentation, procédures et diagnostics reproductibles. **Cloner le dépôt n'installe pas les applications.**
Les comptes, clés, certificats, associations Moonlight et réglages privés restent sur chaque machine.
Utiliser `.local/` pour les notes et sorties locales ; ce dossier est ignoré par Git.
Le dépôt est public : vérifier les fichiers avant chaque commit.

## Sources officielles

- [Sunshine : installation](https://docs.lizardbyte.dev/projects/sunshine/latest/md_docs_2getting__started.html)
- [Moonlight : site et téléchargements](https://moonlight-stream.org/)
- [Moonlight : configuration et Tailscale](https://github.com/moonlight-stream/moonlight-docs/wiki/Setup-Guide)
- [Tailscale Windows](https://tailscale.com/download/windows) et [macOS](https://tailscale.com/download/mac)
- [Tailscale : connexion directe ou relais](https://tailscale.com/docs/reference/connection-types)

La compatibilité d'Aion 2 avec la capture et les entrées distantes reste à valider en jeu.
