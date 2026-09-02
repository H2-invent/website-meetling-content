#!/usr/bin/env bash
set -euo pipefail

errors=0
for file in blog/*/index.md; do
  [ -f "$file" ] || continue
  dir=${file%/index.md}; slug=${dir##*/}
  fail() { printf "FEHLER %s: %s\\n" "$file" "$1" >&2; errors=$((errors + 1)); }
  if [[ ! "$slug" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]]; then
    printf "WARNUNG %s: bestehender Legacy-Slug mit Unterstrich; vor URL-Migration nicht umbenennen\n" "$file" >&2
  fi
  for field in title description date; do rg -q "^${field}:" "$file" || fail "Pflichtfeld ${field} fehlt"; done
  rg -q '^tags:' "$file" || fail "tags fehlt"
  image=$(sed -n 's/^image: *\.\/\(.*\)$/\1/p' "$file" | head -1)
  [ -n "$image" ] || fail "image fehlt oder ist kein relativer Dateipfad"
  [ -f "$dir/$image" ] || fail "Headerbild $image fehlt"
  rg -q '^imageAlt: *[^[:space:]].*' "$file" || fail "imageAlt fehlt"
  description=$(sed -n 's/^description: *"\(.*\)"$/\1/p' "$file" | head -1)
  if [[ "$dir" == blog/* ]]; then
    [ "${#description}" -ge 140 ] && [ "${#description}" -le 160 ] || fail "description hat ${#description} statt 140–160 Zeichen"
  fi
  if rg -q '^> \*\*KI-generiert:\*\*' "$file"; then
    fail "KI-Kennzeichnung gehört in den Frontmatter-Tag KI-Generiert"
  fi
done
[ "$errors" -eq 0 ] || { printf "%s Validierungsfehler gefunden.\\n" "$errors" >&2; exit 1; }
printf 'Content-Validierung erfolgreich.\\n'
