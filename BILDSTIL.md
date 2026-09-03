# Verbindlicher Bildstil für Meetling-Blogbeiträge

Diese Richtlinie gilt für neue Blog-Aufmacher. Die verbindliche visuelle Referenz ist
[`blog/open-source-videokonferenz-digitale-souveraenitaet/header.png`](blog/open-source-videokonferenz-digitale-souveraenitaet/header.png).
Sie hat Vorrang vor allgemeinen Stilbegriffen oder älteren Prompts. Ihr Motiv darf
nicht kopiert werden; übertragen werden ausschließlich Gestaltung, Farben und
Kompositionsprinzipien.

## 1. Stil in einem Satz

Eine luftige, isometrische technische Illustration auf Weiß, aufgebaut aus sehr
feinen blauen Konturen, Punkt- und Pixelrastern sowie wenigen flächigen Akzenten
in Türkis und Violett.

## 2. Verbindliche visuelle Merkmale

- **Medium:** präzise isometrische Line-Art mit Pointillismus-, Halbton- und
  Pixel-Dissolve-Effekten. Kein vollflächiger, plastischer 3D-Render.
- **Hintergrund:** rein oder nahezu weiß und ohne sichtbaren Rahmen. Sehr viel
  freie Fläche gehört ausdrücklich zum Stil.
- **Perspektive:** technisch-isometrisch mit sauber konstruierten Geräten,
  Plattformen, Servern oder Verbindungspfaden.
- **Linien:** sehr dünne, klare Konturen in hellem bis mittlerem Blau. Die
  Zeichnung bleibt leicht und darf nie wie eine dunkle technische Blaupause wirken.
- **Schattierung:** Volumen entsteht durch feine Punkte, Raster, kleine Quadrate
  und transparente Pixelwolken. Flächen bleiben überwiegend weiß.
- **Auflösungseffekt:** Objekte, Verbindungen oder Übergänge dürfen kontrolliert
  in Punkte und kleine Pixel zerfallen. Dieser Effekt ist ein zentrales
  Wiedererkennungsmerkmal, aber kein dekoratives Rauschen über das ganze Bild.
- **Farbwelt:** Weiß dominiert. Türkis/Cyan und kühles Blau sind die Hauptakzente;
  Violett wird sparsam als zweiter Akzent eingesetzt. Dunkelblau nur punktuell.
- **Komposition:** ein kompaktes, sofort verständliches Hauptmotiv mit wenigen
  Nebenobjekten. Elemente dürfen über gepunktete Linien oder Pixelströme verbunden
  sein. Rundherum bleibt großzügiger Weißraum.
- **Tiefe:** nur sehr dezente hellblaue Bodenschatten. Keine dramatische
  Beleuchtung, kein Hochglanz, keine schweren Materialtexturen.
- **Stimmung:** technisch kompetent, offen, ruhig, vernetzt und innovativ.

## 3. Was ausdrücklich nicht zum Stil gehört

- keine Clay-, Knet-, Spielzeug- oder weich gerundete Corporate-3D-Optik
- keine vollflächig gerenderten, glänzenden Kunststoffobjekte
- keine Fotografie, keine Stockfoto-Ästhetik und kein Fake-Screenshot
- keine dunklen Hintergründe, Neon-Cyberpunk-Farben oder rote Alarmdramaturgie
- keine dicken Outlines, Comicfiguren, Verläufe als Hauptstil oder dichte Kulissen
- keine frei erfundenen Logos, Markenoberflächen, Wörter oder fehlerhaften Zeichen

Das Referenzbild enthält bewusst eingesetzte Markenbestandteile. Neue KI-generierte
Bilder enthalten trotzdem grundsätzlich keinen Text und kein nachgezeichnetes Logo.
Ein freigegebenes Meetling-Logo wird nur nachträglich aus einer Originaldatei
eingesetzt, wenn der konkrete Auftrag dies verlangt.

## 4. Inhalt und Komposition

Vor der Erstellung wird die Kernaussage des Beitrags in einem Satz festgehalten.
Das Bild übersetzt sie in **eine** technische Metapher. Geeignete Bausteine sind
beispielsweise Videofenster, Geräte, Server, Gebäudestrukturen, Knoten, Plattformen,
Verbindungslinien oder kontrollierte Datenströme.

Das Hauptmotiv liegt zentral oder leicht rechts/links versetzt. Alle wichtigen
Elemente bleiben in den mittleren 80 Prozent; an den Rändern bleiben mindestens
10 Prozent ruhige Fläche. Auch als kleine Blogkarte müssen Motiv und Aussage noch
erkennbar sein.

## 5. Technische Vorgaben

- **Format:** PNG oder hochwertiges WebP
- **Seitenverhältnis:** 16:9
- **Zielgröße:** 1672 × 941 px; alternativ mindestens 1200 × 675 px
- **Ablage:** im selben Ordner wie die `index.md` des Beitrags
- **Dateiname:** beschreibend, kleingeschrieben, mit Bindestrichen
- **Frontmatter:** `image: ./dateiname.png` und ein konkretes, sachliches `imageAlt`
- **Dateigröße:** möglichst unter 1,5 MB, ohne sichtbare Artefakte

## 6. Standardprompt

Nur die Angaben in eckigen Klammern werden pro Beitrag angepasst. Das Referenzbild
muss dem Bildmodell als **verbindliche Stilreferenz** übergeben werden.

```text
Use case: style-transfer
Asset type: 1672 × 941 px (16:9) hero image for a German Meetling B2B blog
Input image: binding style reference only; match its medium, line quality, palette,
point/pixel rendering, white-space ratio, isometric perspective and composition.
Do not copy its exact subject.
Primary request: Visualize this article message: [KERNAUSSAGE].
Subject: [EIN KLARES TECHNISCHES HAUPTMOTIV] with no more than three supporting elements.
Style/medium: sparse isometric technical editorial illustration on white; very fine
blue linework; dotted halftone and pixel-dissolve shading; mostly white objects with
selective turquoise/cyan and restrained violet accents. No glossy 3D render.
Composition/framing: compact focal cluster, generous white negative space, essential
content inside the central 80 percent, readable at thumbnail size.
Lighting/mood: bright, calm, trustworthy and innovative; only a very subtle pale-blue shadow.
Text: none.
Constraints: no words, letters, numbers, watermark, third-party logos, invented
Meetling logo or fake UI copy. Preserve the reference image's exact visual language.
Avoid: clay-style 3D, glossy plastic, photorealism, dark backgrounds, cyberpunk,
clutter, thick outlines, red alarm imagery and hacker clichés.
```

## 7. Abnahmecheck

1. Wurde das Referenzbild tatsächlich an das Bildmodell übergeben?
2. Sind Weißraum, dünne blaue Line-Art und Punkt-/Pixelraster klar dominant?
3. Sind Türkis und Blau gezielt und Violett nur sparsam eingesetzt?
4. Fehlen Clay-3D, Hochglanz, Fotorealismus und dunkle Flächen vollständig?
5. Vermittelt genau ein Hauptmotiv die Kernaussage auch als Thumbnail?
6. Enthält das Bild weder Text noch Wasserzeichen oder erfundene Logos?
7. Stimmen 16:9-Format, Ablage, Frontmatter und sachlicher Alternativtext?

Wenn ein Punkt nicht erfüllt ist, wird das Bild gezielt korrigiert und erneut geprüft.

## 8. Ausnahmen

Reale Produkt-Screenshots, Tutorialbilder, Architekturdiagramme, Veranstaltungsfotos
und verbindliche Partnergrafiken werden nicht künstlich in diesen Stil übertragen.
Ein zusätzliches redaktionelles Aufmacherbild für denselben Beitrag folgt hingegen
dieser Richtlinie.
