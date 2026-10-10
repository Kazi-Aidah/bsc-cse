#!/usr/bin/env bash
# One-way sync: BSC-CSE Obsidian vault -> Quartz publish copy (content/).
# Edit your notes in BSC-CSE; run this to publish. Never edit content/ directly.
set -euo pipefail

SRC="/home/aidah/Documents/Aidah's Stuff/Education/BSC-CSE"
DST="$(cd "$(dirname "$0")" && pwd)/content"

mkdir -p "$DST"
rsync -av --delete \
  --exclude 'PERSONAL/' \
  --exclude '.obsidian/' \
  --exclude '.trash/' \
  --exclude '.stfolder/' \
  --exclude '.git/' \
  "$SRC"/ "$DST"/

echo "Synced $SRC -> $DST (PERSONAL excluded)"
