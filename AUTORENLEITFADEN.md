# Autorenleitfaden

Für alle, die Beiträge und Tutorials für meetling.de schreiben. Der technische Vertrag steht in der [README](./README.md) — hier geht es darum, was einen Beitrag auffindbar und nützlich macht.

## Der Kern in fünf Punkten

1. **Eine Primärphrase pro Beitrag.** Überlegen Sie vor dem Schreiben, wonach jemand sucht, der diesen Beitrag finden soll. Diese Phrase gehört in `title`, in `description`, in die erste Überschrift und in die ersten beiden Absätze — und dann nicht mehr erzwungen wiederholt.
2. **Keine zwei Beiträge auf dieselbe Phrase.** Zwei Texte zur gleichen Suchanfrage nehmen sich gegenseitig die Sichtbarkeit. Gibt es den Beitrag schon, ergänzen Sie ihn, statt einen zweiten zu schreiben.
3. **„Sichere Videokonferenz" ist reserviert.** Diese Phrase gehört exklusiv der geplanten Pillar-Page `/sichere-videokonferenz`. In Beiträgen also nicht als `title` oder als erste Überschrift verwenden. Im Fließtext ist sie selbstverständlich erlaubt — gern mit einem Link auf die Seite, sobald es sie gibt.
4. **`description` mit 140–160 Zeichen.** Das ist der Text, den Google unter dem Titel anzeigt. Er soll den Beitrag beschreiben, nicht anteasern: ein vollständiger Satz, der die Frage benennt, die der Beitrag beantwortet.
5. **Mit Namen zeichnen.** `author: "Vorname Nachname"` — erkennbare Autorenschaft wird von Suchmaschinen positiv bewertet und von Lesern auch.
- **KI-Texte kennzeichnen.** Wenn ein Beitrag mit Unterstützung künstlicher Intelligenz erstellt wurde, ergänzen Sie im Frontmatter exakt den Tag `KI-Generiert`, zum Beispiel `tags: ["Meetling", "KI-Generiert"]`. Menschlich verfasste Beiträge erhalten diesen Tag nicht. Eine zusätzliche Kennzeichnung im Fließtext ist nicht vorgesehen.

## Slugs

Der Ordnername ist die URL. Er sollte auch ohne den Titel verständlich sein:

```
✓ blog/livekit-update-2-4-0/
✓ tutorials/konferenz-planen/
✗ blog/beitrag-final-2/
✗ tutorials/anleitung1/
```

Kleinbuchstaben, Bindestriche, keine Umlaute, keine Datumspräfixe. **Slugs ändert man nicht mehr**, sobald ein Beitrag veröffentlicht ist — die alte URL wäre danach tot. Muss es doch sein, sagen Sie vorher Bescheid, damit eine Weiterleitung eingerichtet wird.

Bei migrierten Tutorials gilt zusätzlich: den Pfad von `tutorial.meetling.de` als Slug übernehmen, damit die Weiterleitung 1:1 funktioniert.

## Reihenfolge

Übersichtsseiten zeigen die neuesten Beiträge zuerst. Für Tutorials ist das selten die richtige Reihenfolge — dort gehört der Einstieg nach oben und nicht die zuletzt überarbeitete Anleitung. Dafür gibt es `order`:

```yaml
order: 20
```

- **In Zehnerschritten nummerieren** (10, 20, 30 …). Dann lässt sich später etwas dazwischenschieben, ohne alle anderen Dateien anzufassen.
- **Nur ganze Zahlen.** Ein Komma im Wert oder Anführungszeichen darum brechen den Build ab.
- **Beiträge ohne `order` rutschen dahinter** und bleiben dort nach Datum sortiert, neueste zuerst. Man kann also die ersten fünf Tutorials festlegen und den Rest laufen lassen.
- **Im Blog ist `order` normalerweise falsch.** Dort ist chronologisch richtig — sinnvoll höchstens, um einen Beitrag dauerhaft oben zu halten.

## Interne Links

Jeder Beitrag sollte auf mindestens zwei Seiten der Website verweisen — im Fließtext, wo es inhaltlich passt:

```markdown
Die [Lobby](/funktionen/konferenz-experience/lobby) hält Teilnehmende zurück, …
```

Was thematisch verwandt, aber im Text nicht unterzubringen ist, kommt ins Frontmatter:

```yaml
related: ["/loesungen/behoerden", "/funktionen/teilnehmer-management/terminplaner"]
```

Immer als Pfad (`/loesungen/behoerden`), nie als vollständige URL.

## Aufbau eines Beitrags

- **Erster Absatz**: worum es geht und für wen — ohne Anlauf.
- **Zwischenüberschriften** (`##`) alle drei bis vier Absätze. Sie sind Orientierung für Lesende und Struktur für Suchmaschinen.
- **Kurze Absätze.** Drei bis vier Zeilen.
- **Tabellen** für Vergleiche, Listen für Aufzählungen — beides wird sauber gerendert.
- **Tutorials** nummerieren ihre Schritte (`## 1. Termin anlegen`) und sagen im ersten Absatz, wie lange es dauert und was vorausgesetzt wird.

## Bilder

Bilder liegen im selben Ordner wie der Text und werden relativ referenziert:

```markdown
![Die Konferenzübersicht mit dem Dialog für eine neue Konferenz](./schritt-1.png)
```

- **Alternativtext ist Pflicht** — der Text in den eckigen Klammern. Er beschreibt, was zu sehen ist, für Menschen, die das Bild nicht sehen können. Nicht „Screenshot" und nicht der Dateiname.
- **Das `image` im Frontmatter** ist das Aufmacherbild über dem Text. Querformat, mindestens 1200 Pixel breit.
- **`preview` ist das Vorschaubild**: die Karte in der Übersicht und die Vorschau beim Teilen in sozialen Netzwerken. Ohne `preview` wird dafür `image` genommen — das ist der Normalfall. Ein eigenes Vorschaubild lohnt sich, wenn das Aufmacherbild dafür ungeeignet ist: ein animiertes GIF etwa zeigen soziale Netzwerke bestenfalls als erstes Standbild. Der Alternativtext `previewAlt` ist dann Pflicht.
- **Dateigröße im Blick behalten** — die Bilder werden unverändert ausgeliefert. Unter 300 KB je Bild ist eine gute Richtschnur.
- **Keine Personen ohne Einwilligung**, keine fremden Screenshots mit sichtbaren Daten Dritter.

## Aussagen über Sicherheit

Hier ist Genauigkeit wichtiger als Wirkung. Formulierungen, die über den tatsächlichen Stand hinausgehen, sind ein rechtliches Risiko:

- **„VS-NfD-fähige Architektur"** bzw. **„VS-NfD-Readiness"** — nie so, dass eine BSI-Zulassung impliziert wird.
- **Ende-zu-Ende-Verschlüsselung** immer mit dem Geltungsbereich nennen, in dem sie greift.
- **Keine Zertifizierungen erfinden** und keine Bewertungen oder Kundenzahlen behaupten, die sich nicht belegen lassen.

Im Zweifel die Aussage weglassen oder vorher rückfragen.

## Veröffentlichen

Entwurf als Branch, dann Pull Request. Veröffentlicht wird durch **Merge** — einen gesonderten Entwurfsstatus gibt es nicht, und ein Datum in der Zukunft hält nichts zurück.

Nach dem Merge baut die Website sich neu; nach wenigen Minuten ist der Beitrag live. Schlägt der Build fehl, steht in der GitHub Action, welche Datei und welches Feld das Problem sind — der Beitrag geht dann nicht halbfertig online, sondern gar nicht.

Bei einer inhaltlichen Überarbeitung `updated` setzen. Das Datum erscheint auf der Seite und als Aktualisierungssignal in der Sitemap. Für Tippfehler lohnt es nicht.


## Veröffentlichungs-Checkliste

Vor dem Pull Request für jeden Beitrag prüfen:

- [ ] Der Ordnername ist der unveränderte öffentliche Slug (`blog/<slug>`).
- [ ] `index.md` enthält `title`, `description` (140–160 Zeichen), `date`, `image` und `imageAlt`.
- [ ] Das Headerbild liegt im Beitragsordner und wird über das Frontmatter eingebunden.
- [ ] `tags` ist vorhanden; bei KI-generierten Beiträgen enthält die Liste exakt `KI-Generiert`, bei menschlich verfassten Beiträgen nicht.

Die technische Kurzprüfung läuft mit `scripts/validate-content.sh` und kann vor dem Commit ausgeführt werden.
