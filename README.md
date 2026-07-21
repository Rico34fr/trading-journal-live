# Trading Journal · site live

Version déployée (GitHub Pages) du dashboard de suivi de portefeuille de trading.
Page HTML autonome, sans dépendance externe.

**Lien live :** https://rico34fr.github.io/trading-journal-live/

Ce dépôt public ne contient que le dashboard (`index.html`). Les données sources
(exports CSV), la base SQLite et les scripts d'analyse vivent dans un dépôt privé
séparé. Les trades affichés ici sont des données de paper trading.

## Mettre à jour la page

Le dashboard est généré depuis `dashboard.html` du dépôt privé, enveloppé dans un
document HTML complet. Pour publier une nouvelle version, régénérer `index.html`
puis `git push` : GitHub Pages se met à jour automatiquement.
