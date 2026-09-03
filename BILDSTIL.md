# Bildstil für Meetling-Blogbeiträge

Diese Richtlinie ist für neu erstellte Blog-Aufmacher verbindlich. Ihr Ziel ist ein wiedererkennbarer, ruhiger und professioneller Auftritt von Meetling als sichere, souveräne Videokonferenzlösung. Das bestehende Aufmacherbild `blog/open-source-videokonferenz-digitale-souveraenitaet/header.png` dient als visuelle Referenz. Bei Widersprüchen zwischen einem Prompt und diesem Dokument gilt dieses Dokument.

## 1. Grundidee

Aufmacherbilder sind hochwertige, reduzierte **3D-Editorial-Illustrationen**. Sie übersetzen genau eine Kernaussage des Artikels in eine leicht verständliche Metapher. Die Bildwelt soll technisch kompetent, vertrauenswürdig und freundlich wirken – nicht verspielt, alarmistisch oder wie generische Stockfotografie.

Typische Motive sind abstrahierte Videofenster, verbundene Geräte, Server, Schutzschilde, Schlösser, Netzwerke, Dokumente oder souveräne Infrastruktur. Menschen dürfen nur als vereinfachte, diverse 3D-Figuren erscheinen. Das Motiv muss auch als kleine Blogkarte sofort lesbar bleiben.

## 2. Verbindliche visuelle Merkmale

- **Medium:** sauberer, moderner 3D-Render mit leicht isometrischer Perspektive und abgerundeten Formen.
- **Komposition:** ein klares Hauptmotiv, zentral oder leicht aus der Mitte gesetzt; wenige unterstützende Elemente; großzügige freie Flächen.
- **Formensprache:** weich gerundete Kanten, einfache geometrische Körper, aufgeräumte Oberflächen, keine kleinteilige Dekoration.
- **Farbwelt:** helle bis sehr helle, neutrale Grundfläche; Meetling-nahe Blau-, Türkis- und Cyan-Töne als Hauptfarben; dunkles Marineblau für Kontrast; warme Akzentfarbe nur sparsam.
- **Licht:** weiches Studiolicht, dezente Schatten, sanfte räumliche Tiefe; keine harten Reflexe oder dramatische Beleuchtung.
- **Stimmung:** sicher, souverän, zugänglich, modern und optimistisch.
- **Textur:** überwiegend glatte, leicht matte Materialien; keine fotografischen Oberflächen, kein starkes Rauschen.
- **Text im Bild:** grundsätzlich keiner. Titel und Aussagen gehören in HTML und müssen nicht in das Bild gerendert werden.
- **Marken:** keine fremden Logos oder geschützten Produktoberflächen. Das Meetling-Logo nur verwenden, wenn eine freigegebene Originaldatei vorliegt; niemals von der KI nachzeichnen lassen.

## 3. Technische Vorgaben für Aufmacherbilder

- **Format:** PNG oder WebP; bevorzugt PNG, solange das Content-Repository nichts anderes vorgibt.
- **Seitenverhältnis:** 16:9.
- **Zielgröße:** 1672 × 941 px, entsprechend den aktuellen Meetling-Aufmachern. Alternativ mindestens 1200 × 675 px bei exakt gleichem Seitenverhältnis.
- **Beschnittsicherheit:** Hauptmotiv innerhalb der mittleren 80 % platzieren; an allen Seiten mindestens 10 % ruhige Randfläche lassen.
- **Dateiname:** beschreibend, kleingeschrieben und mit Bindestrichen, zum Beispiel `sichere-videokonferenz-deutschland.png`.
- **Ablage:** im selben Ordner wie die `index.md` des Beitrags.
- **Frontmatter:** Bild über `image: ./dateiname.png` einbinden und ein konkretes, sachliches `imageAlt` ergänzen. Falls `preview` gesetzt wird, gelten dieselben Stilregeln für das Vorschaubild.
- **Dateigröße:** visuell verlustfrei bzw. hochwertig optimieren; als Richtwert möglichst unter 1,5 MB bleiben, ohne sichtbare Artefakte.

## 4. Inhaltliche Leitplanken

Das Bild zeigt die Aussage des Artikels, nicht bloß das Schlagwort. Vor der Erstellung ist die Kernbotschaft in einem Satz festzuhalten. Daraus wird **eine** visuelle Metapher gewählt.

Beispiele:

- Digitale Souveränität: unabhängige, geschützte Infrastruktur statt Flaggen- oder Behördenklischees.
- Ausfallsicherheit: mehrere stabile Verbindungspfade oder redundante Server statt Katastrophenszenen.
- Datenschutz: kontrollierter Datenfluss oder geschützter Gesprächsraum statt übergroßem Vorhängeschloss.
- Technischer Vergleich: zwei klar getrennte, gleichwertig dargestellte Systeme statt Sieger-Verlierer-Inszenierung.

Sicherheitsthemen dürfen nicht mit roten Alarmflächen, Hackern in Kapuzen, Binärcode-Tunneln oder bedrohlichen Gesichtern bebildert werden. Keine Angstwerbung.

## 5. Standardprompt für die Bilderstellung

Den folgenden Prompt pro Artikel nur in den eckigen Klammern anpassen:

```text
Use case: ads-marketing
Asset type: 16:9 hero image for a German B2B blog about secure video conferencing
Primary request: Create one clear visual metaphor for: [KERNAUSSAGE DES ARTIKELS].
Subject: [HAUPTMOTIV], supported by no more than three simple secondary elements.
Style/medium: premium editorial 3D illustration, softly rounded geometric forms, subtle isometric perspective, clean and minimal, consistent with the Meetling blog image system.
Composition/framing: one immediately readable focal point, balanced wide composition, generous negative space, all important elements inside the central 80 percent, suitable for cropping to a blog card.
Lighting/mood: soft studio lighting, gentle shadows, calm depth, trustworthy, sovereign, approachable, modern and optimistic.
Color palette: very light neutral background, blue, cyan and turquoise as dominant colors, dark navy for contrast, at most one restrained warm accent.
Materials/textures: smooth, lightly matte surfaces, polished but not glossy.
Constraints: no text, no letters, no numbers, no watermark, no third-party logos, no invented Meetling logo, no photorealism. The concept must remain legible at thumbnail size.
Avoid: generic stock-photo look, clutter, tiny decorative objects, harsh gradients, neon cyberpunk, red alarm imagery, hooded hackers, fear-based security clichés, exaggerated lens effects, screenshots or fake UI.
```

Wenn ein freigegebenes Referenzbild an das Bildmodell übergeben werden kann, ist seine Rolle ausdrücklich als **Stilreferenz** zu benennen. Sein konkretes Motiv soll nicht kopiert werden.

## 6. Abnahmecheck vor dem Commit

Ein neues Aufmacherbild darf erst eingebunden werden, wenn alle Punkte erfüllt sind:

1. Vermittelt es die Kernbotschaft des Artikels innerhalb weniger Sekunden?
2. Entspricht es dem 3D-Editorial-Stil und der ruhigen Meetling-Farbwelt?
3. Hat es genau ein klares Hauptmotiv und ausreichend freie Fläche?
4. Enthält es weder Textfehler noch Text, Wasserzeichen, fremde Logos oder eine erfundene Benutzeroberfläche?
5. Funktioniert es sowohl in voller Breite als auch als kleine Blogkarte?
6. Stimmen Seitenverhältnis, Auflösung, Dateiname, Ablage und Dateigröße?
7. Beschreibt `imageAlt` den sichtbaren Inhalt knapp und sachlich, ohne „Bild von“ oder Keyword-Stuffing?

Falls einer dieser Punkte nicht erfüllt ist, wird gezielt nur dieser Mangel korrigiert und das Ergebnis erneut geprüft.

## 7. Ausnahmen

Reale Produkt-Screenshots, Schritt-für-Schritt-Tutorialbilder, Architekturdiagramme, Veranstaltungsfotos und verbindliche Partnergrafiken müssen nicht in 3D umgestaltet werden. Sie bleiben sachliche Belege und dürfen nicht durch KI-generierte Fantasieoberflächen ersetzt werden. Wird für denselben Beitrag zusätzlich ein Aufmacher erstellt, gilt für dieses Aufmacherbild wieder die vorliegende Richtlinie.

