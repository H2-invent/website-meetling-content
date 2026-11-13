---
title: "Teams und Outlook gestört: Warum souveräne Kommunikation wichtig ist"
description: "Was zum Microsoft-365-Ausfall am 12. und 13. November 2026 bekannt ist und wie Unternehmen mit Meetling ihre Kommunikation unabhängiger aufstellen."
date: 2026-11-13
tags: ["Microsoft-365-Ausfall", "Videokonferenz", "Digitale Souveränität", "KI-Generiert"]
related:
  - "/blog/open-source-videokonferenz-digitale-souveraenitaet"
  - "/blog/videokonferenz-selbst-hosten"
  - "/blog/office_365_stoerung_microsoft"
image: ./header.png
imageAlt: "Skizzenzeichnung eines Schreibtischs mit gestörtem Mailbildschirm, einer laufenden Videokonferenz auf einem Laptop und einem kleinen Server."
author: "Emanuel Holzmann"
---

## Wenn mit dem Postfach auch die Terminplanung hakt

Eine Besprechung lässt sich noch irgendwie verschieben. Schwieriger wird es, wenn gleichzeitig der Kalender nicht lädt und die Nachricht an die Beteiligten nicht ankommt. Dann fehlt ausgerechnet der Kommunikationsweg, über den man den Ausfall organisieren müsste.

Seit Donnerstag, dem 12. November 2026, gibt es bei Microsoft 365 weitreichende Störungen. Betroffen sind Outlook, Teile von Teams, Copilot und weitere Dienste. Zunächst meldete Microsoft Probleme beim Zugriff auf Exchange-Online-Postfächer in Amerika, später auch mögliche Auswirkungen auf Nutzer in anderen Regionen. [Über den Verlauf berichtet unter anderem BleepingComputer.](https://www.bleepingcomputer.com/news/microsoft/massive-microsoft-365-outage-disrupts-outlook-teams-copilot-worldwide/)

**Stand: 13. November 2026, 10:50 Uhr MEZ.** Microsoft meldet erste Stabilisierung, aber noch keine normale Kapazität. Die Wiederherstellung läuft. Auch die [aus Microsofts Statusschnittstelle gespeiste Übersicht des Earlham College](https://status.earlham.edu/ms/) führt die beiden zentralen Vorfälle weiterhin als Dienstbeeinträchtigung.

Für Unternehmen und Verwaltungen stellt sich damit eine sehr praktische Frage: Wie stimmen wir uns ab, wenn mehrere unserer wichtigsten Werkzeuge gleichzeitig Schwierigkeiten machen?

## Was bei Outlook, Teams und Copilot betroffen ist

Microsoft führt den Exchange-Vorfall unter **EX1550543**, den übergreifenden Vorfall unter **MO1550821**. Die von der University of Pennsylvania veröffentlichten [Microsoft-Statusmeldungen](https://mailservices.isc.upenn.edu/computing/email/penno365/alerts/ms-incidents.html) unterscheiden die Auswirkungen nach Funktionen:

| Dienst | Beschriebene Einschränkungen |
| --- | --- |
| Outlook und Exchange Online | Postfachzugriff und E-Mail-Zustellung können gestört oder verzögert sein. |
| Microsoft Teams | Kalender, Einladungen, Terminplanung und einzelne weitere Funktionen können fehlschlagen. |
| Microsoft 365 Copilot | Chat und Zugriff auf Arbeitsdaten können ausfallen. |
| Weitere Dienste | Unter anderem SharePoint, Defender, Planner und To Do sind teilweise beeinträchtigt. |

**Teams ist dabei nicht vollständig ausgefallen.** Laut Microsoft bleiben der Beitritt zu Besprechungen und wesentliche Nachrichtenfunktionen überwiegend nutzbar. Trotzdem kann schon eine gestörte Terminplanung den Arbeitsalltag erheblich behindern.

Eine belastbare Gesamtzahl betroffener Menschen lässt sich aus den ausgewerteten Quellen nicht bestimmen. Meldungen bei Störungsportalen helfen, einen Ausfall zu erkennen. Sie sind aber keine Zählung aller betroffenen Konten oder Unternehmen.

## Warum ein Exchange-Problem bis in Teams reicht

Exchange Online ist Microsofts Cloud-Dienst für E-Mail und Kalender. Teams nutzt diese Umgebung für Teile seiner Besprechungsfunktionen. Microsoft erläutert die Verbindungen in seiner [Dokumentation zum Zusammenspiel von Teams und Exchange](https://learn.microsoft.com/en-gb/microsoftteams/exchange-teams-interact).

Was im Alltag bequem ist, kann im Störungsfall mehrere Arbeitsabläufe zugleich treffen: Der Kalender gehört zur Mailumgebung, die Besprechung wird darüber geplant, weitere Anwendungen greifen auf dieselben Daten zu. Die einzelnen Programmfenster sehen getrennt aus. Ihre technischen Abhängigkeiten sind es nur zum Teil.

Deshalb wäre die Frage, ob der Videodienst selbst noch funktioniert, zu kurz gegriffen. Für eine nutzbare Besprechung müssen die Beteiligten auch an den Termin und den Zugangslink kommen. Eine Verbindung, die technisch möglich wäre, hilft wenig, wenn sie organisatorisch nicht zustande kommt.

## Was zur Ursache bekannt ist

Microsoft beschreibt ausgefallene Server und zusätzliche Last auf den übrigen Systemen. Wieder gestartete Server reagierten teilweise erneut nicht mehr, sobald Datenverkehr zurückkehrte. Das [Störungsprotokoll](https://mailservices.isc.upenn.edu/computing/email/penno365/alerts/ms-incidents.html) dokumentiert mehrere Anläufe zur Wiederherstellung.

Nach Korrekturen an einer Authentifizierungs- und Routingkomponente meldet Microsoft Fortschritte. Die endgültige Fehlerursache ist offen; Hinweise auf einen Angriff liegen Microsoft bislang nicht vor.

Das ist ein Zwischenstand. Wer jetzt schon eine einzelne Konfigurationsänderung als abschließend bewiesene Ursache nennt oder einen Cyberangriff behauptet, geht über die bestätigten Angaben hinaus.

## Auch angebundene KI-Werkzeuge spüren den Ausfall

Die Abhängigkeiten reichen über Microsofts eigene Anwendungen hinaus. [OpenAI meldet Probleme mit Microsoft-Konnektoren](https://status.openai.com/incidents/01M78GAT3AK9P9W8Z230KHFVE8), bei denen neue Verbindungen und Werkzeuge nicht wie erwartet funktionieren. Anthropic beschreibt auf seiner [Statusseite](https://status.claude.com/) ebenfalls Fehler beim Microsoft-365-Konnektor, unter anderem für E-Mail, Kalender und Suche.

Das belegt keinen vollständigen Ausfall von ChatGPT oder Claude. Es zeigt, dass ein zusätzliches Werkzeug an derselben gestörten Datenquelle hängen kann. Ein anderer Anbietername allein schafft noch keinen unabhängigen Arbeitsweg.

## Ein Ausweichweg muss schon vor der Störung stehen

Während einer Großstörung lässt sich eine zweite Kommunikationsumgebung nur schwer in Ruhe einführen. Konten, Zuständigkeiten und Zugänge sollten vorher geklärt sein. Für die Vorbereitung sind vor allem diese Punkte sinnvoll:

- **Den Zugang außerhalb des Hauptsystems bereithalten.** Konferenzadresse, Ansprechpartner und eine kurze Anleitung sollten auch ohne das geschäftliche Postfach erreichbar sein.
- **Die Anmeldung mitprüfen.** Eine andere Konferenzplattform hilft nur begrenzt, wenn ihr einziger Anmeldeweg wiederum von einem ausgefallenen Dienst abhängt. Eine eigene Störung des Identitätsdienstes wäre ein zusätzliches Szenario, das geprüft werden sollte.
- **Die Einladung mitdenken.** Wenn E-Mail und Kalender nicht zur Verfügung stehen, braucht es einen vorher vereinbarten, freigegebenen Weg, um Beteiligte zusammenzubringen.
- **Den Ablauf tatsächlich ausprobieren.** Ein Test ohne Zugriff auf Microsoft 365 zeigt, ob ein Team einen Raum erreichen und die Besprechung durchführen kann. Auch externe Teilnehmer gehören in diesen Test.

Im aktuellen Vorfall nennt Microsoft die öffentliche [Dienststatusseite](https://status.cloud.microsoft/) als Informationsweg, falls das Verwaltungsportal nicht erreichbar ist. Für die eigene Organisation lohnt sich derselbe Gedanke: Auch die Information über eine Störung braucht einen erreichbaren Ort.

## Mit Meetling mehr Kontrolle über die eigene Kommunikation behalten

Digitale Souveränität wird oft an großen Strategien festgemacht. An einem solchen Morgen geht es zunächst um etwas Kleineres: Kann die eigene IT noch handeln? Kann sie einen anderen Kommunikationsweg bereitstellen? Weiß sie, welche Abhängigkeiten dabei übrig bleiben?

[Meetling](https://meetling.de/) bietet dafür eine Grundlage: Die Videokonferenzlösung basiert auf Open Source und kann je nach Anforderung als gehosteter Dienst, in einer hybriden Umgebung oder im eigenen Rechenzentrum betrieben werden. Unternehmen und Verwaltungen können damit selbst entscheiden, wer ihre Konferenzinfrastruktur betreibt und wie sie in die übrige IT eingebunden wird.

Eine vom Microsoft-365-Verbund getrennt betriebene Meetling-Umgebung kann einen zusätzlichen Kommunikationsweg schaffen. Dafür müssen auch Anmeldung, Erreichbarkeit und die Verteilung der Konferenzzugänge passend geplant sein. Wer Meetling bequem über das [Outlook-Add-in](https://meetling.de/blog/release-version-1.6) nutzt, sollte den Zugang zur Konferenz deshalb auch ohne Outlook im Ausweichablauf vorsehen.

Auch eine eigene Plattform braucht Wartung, Überwachung und Menschen, die im Fehlerfall handeln können. Was zum Betrieb gehört, beschreibt unser Beitrag [Videokonferenz selbst hosten](https://meetling.de/blog/videokonferenz-selbst-hosten). Offener Quellcode und die Wahl des Betriebsmodells geben der eigenen Organisation mehr Möglichkeiten, diese Verantwortung zu gestalten.

Der aktuelle Ausfall ist deshalb ein guter Anlass für einen konkreten Test: Lassen sich Ihre wichtigsten Besprechungen auch ohne Zugriff auf Microsoft 365 durchführen? Wenn Sie dafür Meetling einsetzen möchten, [besprechen Sie mit uns die passende Betriebsform](https://meetling.de/). Dabei sollten die Abhängigkeiten und der Zugang im Störungsfall von Anfang an auf den Tisch. Genau dort wird digitale Souveränität im Alltag wirksam.
