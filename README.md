# meetling-content

Die Inhalte von [meetling.de](https://meetling.de): Blogbeiträge und Tutorials als Markdown. Dieses Repository enthält **keinen Code** — die Website liegt getrennt davon. Wer hier etwas merged, veröffentlicht es.

## Wie Inhalte auf die Website kommen

```
Content-Repository (dieses)             Website-Repository
├─ blog/                                ├─ content/         ← Checkout der CI, gitignored
└─ tutorials/                           └─ content-sample/  ← Beispieldaten für die Entwicklung
```

Die CI des Website-Repositories checkt dieses Repository vor dem Docker-Build nach `content/` aus. Ein Merge nach `main` stößt Build und Release der Website an; nach wenigen Minuten ist die Änderung live.

Solange dieses Repository nicht ausgecheckt ist, greift die Website auf ihr eigenes `content-sample/` zurück. Diese zwei Beispieleinträge sind der ausführbare Vertrag, gegen den `lib/markdown-content.ts` prüft — Änderungen am Frontmatter-Schema sind dort zu sehen.

## Struktur

```
<sektion>/<slug>/
├─ index.md      ← Pflicht; Ordnername = URL-Slug
└─ *.png|jpg|…   ← Bilder liegen beim Text, referenziert als ./bild.png
```

Es gibt zwei Sektionen:

| Ordner | URL | Inhalt |
|---|---|---|
| `blog/` | `/blog/<slug>` | Beiträge, Einordnungen, Release-Notes |
| `tutorials/` | `/tutorials/<slug>` | Schritt-für-Schritt-Anleitungen |

Ein Beitrag ist immer ein **Ordner** mit einer `index.md`, nie eine lose Markdown-Datei. Der Ordnername wird zur URL und ist nach der Veröffentlichung nicht mehr änderbar — Näheres dazu im [Autorenleitfaden](./AUTORENLEITFADEN.md).

## Frontmatter

| Feld | Pflicht | Bedeutung |
|---|---|---|
| `title` | ja | Überschrift, Seitentitel, Kartentitel |
| `description` | ja | Suchsnippet und Kartentext, 140–160 Zeichen |
| `date` | ja | Veröffentlichungsdatum, `JJJJ-MM-TT` |
| `updated` | nein | Datum der letzten Überarbeitung, `JJJJ-MM-TT` |
| `tags` | nein | Liste; der erste Tag wird als Label auf der Karte angezeigt |
| `image` | nein | Datei im selben Ordner; Kartenbild und Social-Media-Vorschau |
| `imageAlt` | wenn `image` gesetzt | Bildbeschreibung für Screenreader |
| `author` | nein | „Vorname Nachname"; benannte Autoren werden empfohlen |
| `related` | nein | Liste interner Pfade; erscheint als Empfehlungsbox unter dem Text |

Beispiel:

```yaml
---
title: "Konferenz planen und einladen"
description: "Wie Sie in Meetling einen Termin anlegen, Teilnehmende einladen und die Lobby richtig konfigurieren — in fünf Schritten erklärt."
date: 2026-08-11
tags: ["Tutorial", "Terminplanung"]
author: "Vorname Nachname"
related: ["/funktionen/teilnehmer-management/terminplaner"]
---
```

Fehlt ein Pflichtfeld oder ist ein Datum unlesbar, **bricht der Build ab** und nennt Datei und Feld. Ein unvollständiger Beitrag geht nicht halbfertig online, sondern gar nicht.

## Arbeitsweise

1. Branch anlegen — ein Branch je Beitrag, benannt wie der Slug.
2. Ordner unter `blog/` oder `tutorials/` anlegen, `index.md` schreiben, Bilder danebenlegen.
3. Pull Request öffnen. Der Build der Website läuft mit und meldet Frontmatter-Fehler; den Text selbst liest man in der Markdown-Vorschau des Pull Requests gegen. Layout, Kartenbild und Related-Box sieht man dort allerdings nicht — dafür braucht es die lokale Vorschau, die im Website-Repository beschrieben ist.
4. Nach Review mergen. **Merge = Veröffentlichung.** Einen gesonderten Entwurfsstatus gibt es nicht, und ein Datum in der Zukunft hält nichts zurück.

Bei einer inhaltlichen Überarbeitung `updated` setzen; für Tippfehler lohnt es nicht.

## Bevor Sie schreiben

Der [Autorenleitfaden](./AUTORENLEITFADEN.md) klärt, was einen Beitrag auffindbar und nützlich macht: Primärphrase, Slugs, interne Verlinkung, Bilder und — wichtig — welche Aussagen über Sicherheit und Zertifizierungen zulässig sind.
