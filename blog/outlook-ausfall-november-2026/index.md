---
title: "Sichere Alternative zu Microsoft Teams: Meetling"
description: "Der Microsoft-365-Ausfall zeigt zentrale Abhängigkeiten. Wie Unternehmen Teams durch Meetling ersetzen und Videokonferenzen digital souverän betreiben."
date: 2026-11-13
tags: ["Microsoft-365-Ausfall", "Videokonferenz", "Digitale Souveränität", "KI-Generiert"]
related:
  - "/blog/open-source-videokonferenz-digitale-souveraenitaet"
  - "/funktionen"
  - "/sicherheit"
image: ./header.png
imageAlt: "Skizzenzeichnung eines Schreibtischs mit gestörtem Mailbildschirm, einer laufenden Videokonferenz auf einem Laptop und einem kleinen Server."
author: "Emanuel Holzmann"
---

## Mit Meetling Microsoft Teams im Arbeitsalltag ersetzen

[Meetling](https://meetling.de/) kann Microsoft Teams als zentrale Plattform für Videokonferenzen und digitale Zusammenarbeit vollständig ersetzen. Unternehmen und Verwaltungen können ihre Besprechungen in Meetling planen, durchführen und gemeinsam an Inhalten arbeiten. Die Open-Source-Lösung bietet dafür [Verschlüsselung, Berechtigungskontrollen und eine Lobby für den geregelten Zutritt](https://meetling.de/sicherheit).

Meetling lässt sich im eigenen Rechenzentrum, in einer hybriden Umgebung oder als gehosteter Dienst betreiben. Damit können Organisationen selbst festlegen, wer ihre Kommunikationsplattform betreibt und wo Daten verarbeitet werden. Der einsehbare Quellcode und die Wahl des Betriebsmodells unterstützen [digitale Souveränität](https://meetling.de/blog/open-source-videokonferenz-digitale-souveraenitaet): Die eigene IT kann die Plattform prüfen, gestalten und in ihre Infrastruktur einbinden.

Der Microsoft-365-Ausfall am 12. und 13. November 2026 macht diese Entscheidung greifbar. Wer seine Kommunikation dauerhaft unabhängiger aufstellen möchte, kann den Vorfall zum Anlass nehmen, Teams durch Meetling abzulösen.

## Wenn mit dem Postfach auch die Terminplanung hakt

Eine Besprechung lässt sich noch irgendwie verschieben. Schwieriger wird es, wenn gleichzeitig der Kalender nicht lädt und die Nachricht an die Beteiligten nicht ankommt. Dann geraten mehrere Arbeitsabläufe ins Stocken, obwohl die Ursache außerhalb der eigenen Organisation liegt.

Seit Donnerstag, dem 12. November 2026, gibt es bei Microsoft 365 weitreichende Störungen. Betroffen sind Outlook, Teile von Teams, Copilot und weitere Dienste. Zunächst meldete Microsoft Probleme beim Zugriff auf Exchange-Online-Postfächer in Amerika, später auch mögliche Auswirkungen auf Nutzer in anderen Regionen. [Über den Verlauf berichtet unter anderem BleepingComputer.](https://www.bleepingcomputer.com/news/microsoft/massive-microsoft-365-outage-disrupts-outlook-teams-copilot-worldwide/)

**Stand der Störungsinformationen: 13. November 2026, 10:50 Uhr MEZ.** Microsoft meldet erste Stabilisierung, aber noch keine normale Kapazität. Die Wiederherstellung läuft. Auch die [aus Microsofts Statusschnittstelle gespeiste Übersicht des Earlham College](https://status.earlham.edu/ms/) führt die beiden zentralen Vorfälle weiterhin als Dienstbeeinträchtigung.

Für Unternehmen und Verwaltungen geht es damit auch um die nächste Beschaffungsentscheidung: Welche Kommunikationsplattform wollen wir dauerhaft nutzen, und wie viel Kontrolle behalten wir über ihren Betrieb?

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

## Was Meetling für die tägliche Zusammenarbeit übernimmt

Wer Teams ablöst, braucht eine Plattform, die sich im normalen Arbeitstag bewährt: bei internen Abstimmungen, Gesprächen mit Kunden, Besprechungen mit externen Partnern und der gemeinsamen Arbeit an einem Thema. Die [Meetling-Funktionsübersicht](https://meetling.de/funktionen) zeigt die dafür verfügbaren Werkzeuge:

| Aufgabe im Arbeitsalltag | Umsetzung mit Meetling |
| --- | --- |
| Besprechungen organisieren | Terminplanung, Terminumfragen und Teilnehmerlisten |
| Online-Meetings durchführen | Videokonferenzen im Browser, Bildschirmfreigabe und Moderationswerkzeuge |
| Gemeinsam Inhalte erarbeiten | Whiteboards und Notizen während der Konferenz |
| Nachrichten im Meeting austauschen | Chat mit allen oder einzelnen Konferenzteilnehmern |
| Zugänge und Zuständigkeiten regeln | Berechtigungen, Lobby sowie Vertreter- und Vorzimmermanagement |

Für die Verbindung von Teamchat und Videokonferenz gibt es die [Matrix-Integration](https://meetling.de/funktionen/teamwork-tools/matrix-chat). Damit lassen sich Konferenzen aus einem Matrix-Raum heraus erstellen und Teilnehmer hinzufügen. Matrix übernimmt dabei den dauerhaften Teamchat, Meetling die Konferenz. Welche Funktionen und Integrationen im gewählten Angebot enthalten sind, gehört in die Planung des Umstiegs.

## Die Kommunikationsplattform selbst bestimmen

Mit der Ablösung von Teams lässt sich auch die Verantwortung für die eigene Kommunikation neu ordnen. Meetling bietet dafür unterschiedliche [Sicherheits- und Betriebsmodelle](https://meetling.de/sicherheit):

- **Gehosteter Dienst:** Meetling und die Videokonferenz werden vom Anbieter betrieben.
- **Hybrider Betrieb:** Die Konferenzverwaltung wird beim Hosting-Partner betrieben, die Videostreams werden im Rechenzentrum des Kunden verarbeitet.
- **Betrieb im eigenen Rechenzentrum:** Meetling und die Medienverarbeitung liegen in der eigenen Infrastruktur; Betreuung und Zuständigkeiten werden entsprechend vereinbart.

So kann eine Organisation das Betriebsmodell nach ihrem Schutzbedarf und ihren vorhandenen IT-Ressourcen wählen. Sie kann festlegen, wer administriert, wo Daten verarbeitet werden und wie die Plattform gewartet wird.

Auch beim Wechsel zu Meetling gehören die verbleibenden Abhängigkeiten auf den Tisch: Benutzerverwaltung, Kalender, Netzwerk und angebundene Anwendungen müssen zum gewünschten Betriebsmodell passen. Wenn etwa die bisherige Anmeldung über einen externen Dienst läuft, ist bewusst zu entscheiden, ob diese Anbindung weiter genutzt oder durch eine andere Benutzerverwaltung ersetzt wird.

## Von Teams zu Meetling wechseln

Der Umstieg beginnt bei den bisherigen Arbeitsabläufen. Für die Planung bietet sich folgende Reihenfolge an:

1. **Die heutige Nutzung aufnehmen.** Welche Besprechungen, Chats, Konferenzräume und Integrationen werden tatsächlich gebraucht? Welche Anforderungen haben interne und externe Teilnehmer?
2. **Den künftigen Betrieb festlegen.** Hosting, Benutzerverwaltung, Berechtigungen, Support und Wartung müssen klare Zuständigkeiten bekommen.
3. **Die Abläufe in Meetling einrichten und prüfen.** Dazu gehören Termine, Einladungen, Gastzugänge und die benötigten Integrationen. Eine ausgewählte Nutzergruppe sollte die typischen Arbeitsschritte im Alltag erproben.
4. **Die Nutzung auf Meetling umstellen.** Mitarbeiter und externe Partner erhalten die neuen Zugänge und eine kurze Einführung. Bestehende Serientermine werden neu geplant oder entsprechend angepasst. Anschließend wird die bisherige Teams-Nutzung für die abgelösten Abläufe beendet.

Offener Quellcode und ein eigenes Betriebsmodell schaffen Gestaltungsspielraum. Ein verlässlicher Betrieb braucht außerdem Updates, Überwachung und festgelegte Ansprechpartner. Mehr dazu erläutert unser Beitrag über [Open Source und digitale Souveränität](https://meetling.de/blog/open-source-videokonferenz-digitale-souveraenitaet).

## Teams ablösen und die Kommunikation mit Meetling gestalten

Der Microsoft-Ausfall ist ein Anlass, die bisherige Plattformwahl zu überprüfen. Für Unternehmen und Verwaltungen kann daraus eine dauerhafte Veränderung entstehen: Besprechungen und digitale Zusammenarbeit werden auf Meetling umgestellt, der Betrieb wird nach den eigenen Anforderungen organisiert.

Wenn Sie Teams durch Meetling ersetzen möchten, [besprechen Sie mit uns Ihre bisherigen Arbeitsabläufe und das passende Betriebsmodell](https://meetling.de/). Daraus wird ein konkreter Umstiegsplan für Ihre Organisation. Digitale Souveränität zeigt sich dann jeden Tag darin, wie Sie Ihre Kommunikation selbst gestalten und betreiben können.

