---
title: "Telefoneinwahl mit Lobby in Meetling: Sie entscheiden, wer zuhört"
description: "Meetling integriert Telefonteilnehmer in die Lobby. Erfahren Sie, wie Freigabe und persönliche PIN funktionieren und welche Voraussetzungen gelten."
date: 2026-10-05
tags: ["telefoneinwahl", "lobby", "sicherheit", "KI-Generiert"]
related:
  - "/tutorials/lobby-aktivieren"
  - "/tutorials/lobby-moderator-ernennen"
  - "/blog/e2ee-ende-zu-ende-verschluesselung-in-videkonferenzen"
image: ./header-telefoneinwahl-lobby.png
imageAlt: "Isometrische Illustration eines Telefonhörers mit wartender Person und Uhr links, einer Zugangsschranke mit Schloss und Moderator am Freigabepult in der Mitte sowie eines Videokonferenzbildschirms rechts."
author: "Emanuel Holzmann"
---

## Telefonteilnehmer warten jetzt auf Ihre Freigabe

Stellen Sie sich vor, Sie besprechen einen vertraulichen Vertragsentwurf und ein unbekannter Anrufer tritt direkt bei. Sie müssen erst klären, wer gerade zuhört. **Mit der erneuerten Telefoneinwahl in Meetling warten Telefonteilnehmer bei aktiver Lobby auf die Freigabe durch den Organisator oder einen Lobby-Moderator.** Sie entscheiden über den Zutritt, bevor der Anrufer an der Besprechung teilnimmt.

Die Lobby ist der virtuelle Warteraum vor einer Konferenz. Durch die neue Integration gilt ihr Freigabeprozess auch für den telefonischen Zugang. Voraussetzung ist eine Installation mit eingerichteter und aktivierter neuer Telefoneinwahl sowie eine aktive Lobby im jeweiligen Raum.

## Die Lücke zwischen Warteraum und Telefonzugang schließen

Bei einer vertraulichen Besprechung zählt jeder Zugangsweg. Wenn Browserteilnehmer auf ihre Freigabe warten, Telefonteilnehmer aber direkt beitreten können, bleibt die Zugangskontrolle unvollständig. Genau dieses Problem löst die neue Lobby-Integration in Meetling.

Auch unbekannte Anrufer warten bei aktiver Lobby zunächst außerhalb der Konferenz. Das gibt den Verantwortlichen Zeit, den wartenden Teilnehmer zuzuordnen und bewusst über seine Teilnahme zu entscheiden.

Für Organisatoren von Personalgesprächen, Mandantenterminen oder internen Projektbesprechungen bedeutet das mehr Kontrolle in einem entscheidenden Moment: beim Einlass. Sie können den Gesprächsrahmen festlegen, bevor sensible Informationen geteilt werden.

## So wirken Lobby und persönliche PIN zusammen

Eine PIN ist eine persönliche Identifikationsnummer. Bei aktiver Lobby und aktivierter Teilnehmerliste wird sie bei der Telefoneinwahl abgefragt und ordnet den Anrufer dem entsprechenden Eintrag in der Teilnehmerliste zu.

Die folgenden Varianten gelten für Konferenzen mit verfügbarer Telefoneinwahl:

| Raumeinstellungen | Ablauf für Telefonteilnehmer |
| --- | --- |
| Lobby inaktiv | Direkter Zugang zur Konferenz wie bisher. |
| Lobby aktiv, Teilnehmerliste aktiv | Einwahl mit persönlicher PIN und Zuordnung zur Teilnehmerliste. Anschließend Warten in der Lobby bis zur Freigabe. |
| Lobby aktiv, Teilnehmerliste deaktiviert | Einwahl ohne persönliche PIN. Anzeige mit Telefonnummer in der Lobby und Warten bis zur Freigabe. |

**Eine persönliche PIN ersetzt bei aktiver Lobby nicht die Freigabe.** Über den Zutritt entscheidet weiterhin der Organisator oder ein Lobby-Moderator. Welche Person diese Aufgabe übernimmt, sollten Sie vor Beginn einer vertraulichen Besprechung festlegen. Die Anleitung zum [Ernennen eines Lobby-Moderators](https://meetling.de/tutorials/lobby-moderator-ernennen) erläutert die Vergabe dieser Berechtigung.

## Voraussetzungen und Aktivierung der Telefoneinwahl

Die Telefonanbindung wurde auf Basis der Telefonie-Software Asterisk und AGI neu umgesetzt. AGI steht für *Asterisk Gateway Interface*: Diese Schnittstelle ermöglicht externen Programmen, Telefonanrufe in Asterisk zu steuern. Den technischen Hintergrund beschreibt die [offizielle Asterisk-Dokumentation zu AGI](https://docs.asterisk.org/Configuration/Interfaces/Asterisk-Gateway-Interface-AGI/).

### Telefonanbindung konfigurieren

Bei eingerichteter neuer Telefonanbindung setzen IT-Verantwortliche folgende Einstellung in den Umgebungsvariablen oder im Theme:

```dotenv
SIP_CALLER_IN_FRONTEND=1
```

Diese Einstellung aktiviert die neue Integration. Die Bereitstellung und Anbindung von Asterisk müssen bereits erfolgt sein.

### Lobby im Raum aktivieren und den Ablauf prüfen

Die Lobby und die Teilnehmerliste werden über die Raumeinstellungen gesteuert. Die Anleitung zum [Aktivieren der Lobby](https://meetling.de/tutorials/lobby-aktivieren) beschreibt die Einrichtung bei der Konferenzplanung.

Wir empfehlen vor dem ersten produktiven Einsatz einen Testanruf: Prüfen Sie, ob der Anrufer bei aktiver Lobby zunächst dort angezeigt wird und erst nach Ihrer Freigabe in die Konferenz gelangt. Bei aktiver Teilnehmerliste gehört die Abfrage der persönlichen PIN zu diesem Test.

### Einschränkung bei Ende-zu-Ende-Verschlüsselung

**Bei aktiver Ende-zu-Ende-Verschlüsselung (E2EE) ist die Telefoneinwahl in Meetling nicht verfügbar.** E2EE verschlüsselt die Gesprächsinhalte auf den Endgeräten; die Telefonanbindung kann den verschlüsselten Audiostream dann nicht für das Telefonnetz aufbereiten. Klären Sie deshalb bereits bei der Raumplanung, ob jemand telefonisch teilnehmen soll. Weitere Einzelheiten erläutert der Beitrag zur [Ende-zu-Ende-Verschlüsselung in Meetling](https://meetling.de/blog/e2ee-ende-zu-ende-verschluesselung-in-videkonferenzen).

## Betrieb in eigener Infrastruktur oder als Cloud Service

Die Asterisk-Installation kann auf zwei Wegen bereitgestellt werden:

- **In eigener Infrastruktur:** Bereitstellung in einem Kubernetes-Cluster über Helm, ein Werkzeug zur Paketverwaltung für Kubernetes.
- **Als Cloud Service:** Betrieb durch H2 invent.

Die Wahl des Betriebsmodells und die Freigabe im Konferenzraum sind getrennte Entscheidungen: Auch beim Cloud Service steuern die Raumeinstellungen, ob ein Anrufer zunächst in der Lobby wartet.

## Den Einlass vor dem nächsten vertraulichen Gespräch klären

Legen Sie für Ihre nächste Besprechung fest, ob die Telefoneinwahl benötigt wird, ob eine persönliche PIN zur Zuordnung sinnvoll ist und wer die Lobby betreut. So steht der Ablauf fest, bevor das Gespräch beginnt.

Für die Einrichtung der neuen Asterisk-Anbindung oder den Betrieb als Cloud Service können Sie [Kontakt mit Meetling aufnehmen](https://meetling.de/). Wir klären mit Ihnen, wie sich die Telefoneinwahl und die Lobby-Freigabe in Ihre bestehenden Konferenzabläufe integrieren lassen.
