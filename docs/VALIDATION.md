# Validation de bout en bout

Renseigner les résultats réels dans STATUS.md. Un test non exécuté reste « à faire ».

## 1. Réseau domestique

- Lancer le bureau Windows dans Moonlight depuis Denise.
- Vérifier image, son, clavier, souris, disposition du clavier et touches utiles au jeu.
- Jouer au moins dix minutes à un jeu déjà disponible.
- Ouvrir les statistiques Moonlight et relever les latences et pertes d'images pertinentes.
- Vérifier l'encodage matériel côté Sunshine et le décodage matériel côté Mac.

## 2. Route Internet via la 5G

- Connecter Denise uniquement au partage de connexion de l'iPhone utilisant la 5G.
- Vérifier que Lovecaft et Denise sont en ligne dans Tailscale.
- Avec la CLI Tailscale disponible, exécuter `tailscale ping <adresse-Tailscale-du-PC>`
  depuis Denise. La CLI peut aussi être dans `/Applications/Tailscale.app/Contents/MacOS/Tailscale`
  selon la variante installée. Le diagnostic macOS indique si elle est détectée.
- Attendre l'établissement de la route : les premiers paquets peuvent utiliser un relais.
  Vérifier si la connexion finit en direct ou reste relayée via DERP.
- Lancer Moonlight avec l'adresse Tailscale du PC ; tester quinze à trente minutes.
- Noter résolution, débit, fluidité, latence ressentie, interruptions et consommation mobile.

Une liaison directe est préférable. Une liaison relayée peut fonctionner, mais sa qualité
doit être mesurée ; ne pas supposer qu'un VPN garantit automatiquement un trajet direct.
La latence réseau de Tailscale n'est pas la latence totale des commandes à l'écran.

## 3. Avant le départ

- Tester avec l'écran du PC éteint, puis après une période d'inactivité.
- Tester le redémarrage du PC avec quelqu'un sur place pour récupérer l'accès si nécessaire.
- Vérifier la disponibilité après démarrage, ouverture de session et lancement du jeu.
- Vérifier dans Tailscale l'expiration éventuelle de l'accès des appareils avant une longue absence.
- Tester Aion 2 séparément : connexion, capture, commandes et session de jeu.
  Ne pas contourner l'anti-triche si une incompatibilité apparaît.

## Ajustements

| Symptôme | Premier essai |
| --- | --- |
| Saccades ou pertes en 5G | Baisser à 10 Mbit/s, puis éventuellement à 720p60 |
| Image trop compressée, liaison stable | Monter progressivement à 20 puis 25 Mbit/s |
| Retard malgré un débit élevé | Vérifier trajet direct, fluctuations réseau et statistiques Moonlight |
| Écran noir uniquement écran PC éteint | Vérifier présence de l'affichage côté Windows |
| Bureau accessible, jeu sans commandes | Tester les droits du jeu et la compatibilité des entrées distantes |

Repères de volume vidéo à débit constant : 10 Mbit/s ≈ 4,5 Go/h ; 15 ≈ 6,8 Go/h ;
25 ≈ 11,3 Go/h. Ajouter la marge pour l'audio et les échanges réseau.
