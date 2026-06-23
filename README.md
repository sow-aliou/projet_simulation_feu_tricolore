# Simulation Carrefour - Projet L3

## Description
Projet de simulation de trafic routier au niveau d'un carrefour avec feux tricolores. Développé en Python avec la bibliothèque `turtle` pour l'interface graphique.

## Fonctionnalités
- **Scénarios multiples** : Normal, Heure de pointe, Nuit, Manuel.
- **Interface graphique interactive** : Contrôles (play, pause, stop, reset) et changement de scénarios.
- **Tableau de bord en temps réel** : Suivi du nombre de véhicules, du niveau de fluidité du trafic et du temps écoulé.
- **Journalisation (logging)** : Enregistrement des événements de la simulation dans une base de données SQLite (`traffic_sim.db`).

## Prérequis
- Python 3.x (La bibliothèque `turtle` est incluse de base avec Python).

## Exécution
Pour lancer la simulation, exécutez la commande suivante à la racine du projet :

```bash
python main.py
```
