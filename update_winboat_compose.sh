#!/bin/bash

HOME_DIR="$HOME"
TARGET_DIR="$HOME_DIR/.winboat"
SRC_FILE="$(pwd)/docker-compose.yml"
BACKUP_FILE="docker-compose.yml.bak.$(date +%Y%m%d%H%M%S)"

echo "Starte Update…"

if [ ! -f "$SRC_FILE" ]; then
    echo "Fehler: Keine neue docker-compose.yml im aktuellen Verzeichnis:"
    echo "  $SRC_FILE"
    exit 1
fi

if [ ! -d "$TARGET_DIR" ]; then
    echo "Zielverzeichnis '$TARGET_DIR' existiert nicht"
    exit 1
fi

cd "$TARGET_DIR" || exit 1

# nur Backup machen, wenn Datei existiert
if [ -f "docker-compose.yml" ]; then
    echo "Backup der vorhandenen docker-compose.yml → $BACKUP_FILE"
    mv docker-compose.yml "$BACKUP_FILE"
fi

echo "Kopiere neue docker-compose.yml"
cp "$SRC_FILE" .

echo "Fertig!"
