#!/usr/bin/env bash
# Régénère index.html depuis le dashboard du dépôt privé, puis publie sur GitHub Pages.
# Usage : ./deploy.sh ["message de commit"]
set -euo pipefail

HERE="$(cd "$(dirname "$0")" && pwd)"
SRC="${TJ_SOURCE:-$HERE/../Trading Journal/dashboard.html}"
MSG="${1:-Maj dashboard}"

if [ ! -f "$SRC" ]; then
  echo "Source introuvable : $SRC" >&2
  echo "Définis TJ_SOURCE=/chemin/vers/dashboard.html si besoin." >&2
  exit 1
fi

# Enveloppe le dashboard (fragment) dans un document HTML complet.
{
  printf '<!DOCTYPE html>\n<html lang="fr">\n<head>\n'
  printf '<meta charset="utf-8">\n'
  printf '<meta name="viewport" content="width=device-width, initial-scale=1">\n'
  printf '<meta name="description" content="Trading Journal - suivi de portefeuille facon FTMO">\n'
  printf '<meta name="robots" content="noindex">\n'
  printf '<title>Trading Journal</title>\n</head>\n<body>\n'
  cat "$SRC"
  printf '\n</body>\n</html>\n'
} > "$HERE/index.html"

cd "$HERE"
if git diff --quiet -- index.html; then
  echo "Aucun changement dans index.html, rien à publier."
  exit 0
fi

git add index.html
git commit -q -m "$MSG"
git push -q origin main
echo "Publié. GitHub Pages se reconstruit sous 1 à 2 minutes :"
echo "  https://rico34fr.github.io/trading-journal-live/"
