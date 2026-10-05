---
title: "Telefoneinwahl mit voller Lobby-Integration: Mehr Sicherheit für Ihre Konferenzen"
description: "Telefonteilnehmer warten bei aktiver Lobby ab sofort ebenfalls in der Lobby und werden vom Organisator oder Lobby-Moderator freigeschaltet. Optional mit persönlicher PIN."
date: 2026-10-05
tags: ["telefoneinwahl", "lobby", "sicherheit", "asterisk", "videokonferenz", "KI-Generiert"]
image: ./header-telefoneinwahl-lobby.png
imageAlt: "Telefonteilnehmer wartet in der Lobby einer Meetling-Videokonferenz auf die Freischaltung durch den Moderator"
author: "Emanuel Holzmann"
---

## Vertrauliche Gespräche brauchen Kontrolle darüber, wer zuhört

Stellen Sie sich vor, Sie besprechen gerade ein sensibles Personalthema, einen Vertragsentwurf oder die nächsten Schritte eines noch unveröffentlichten Projekts. Ein weiterer Teilnehmer wählt sich per Telefon ein und gelangt direkt in die Konferenz. Sie müssen das Gespräch unterbrechen und klären, wer hinzugekommen ist. Was bereits gesagt wurde, lässt sich jedoch nicht zurückholen.

Wer zu einer vertraulichen Besprechung einlädt, trägt Verantwortung für die Menschen und Informationen in diesem Raum. Dafür braucht es die Möglichkeit, über den Zutritt zu entscheiden, bevor jemand zuhört. Eine Lobby muss deshalb auch den telefonischen Zugang einbeziehen.

Genau diese Lücke schließen wir mit der vollständig erneuerten Telefoneinwahl in Meetling.

## Die Lobby schützt jetzt auch den telefonischen Zugang

Ist die Lobby eines Raums aktiv, warten Telefonteilnehmer dort jetzt genauso wie Teilnehmer im Browser. Erst wenn der Organisator oder ein Lobby-Moderator sie freischaltet, gelangen sie in die Konferenz.

Das gibt den Verantwortlichen Zeit, einen wartenden Anrufer zuzuordnen und bewusst über seine Teilnahme zu entscheiden. Auch unbekannte Anrufer müssen diesen Freigabeprozess durchlaufen. Der telefonische Zugang führt damit bei aktiver Lobby nicht mehr an der Zugangskontrolle vorbei.

Für Ihre Besprechungen bedeutet das: Sie können sich auf das Gespräch konzentrieren und selbst bestimmen, wann Sie weitere Teilnehmer hereinlassen. Gerade wenn es um Mitarbeitende, Kunden oder vertrauliche Unternehmensentscheidungen geht, schafft diese Kontrolle eine wichtige Voraussetzung für einen offenen Austausch.

## So funktioniert die Einwahl

Das Verhalten der Telefoneinwahl richtet sich nach den Raumeinstellungen:

- **Lobby inaktiv:** Telefonteilnehmer gelangen wie bisher direkt in die Konferenz.
- **Lobby aktiv, Teilnehmerliste aktiv:** Jeder Teilnehmer erhält eine persönliche PIN, die bei der Einwahl abgefragt wird. Über diese PIN lässt sich der Anrufer dem entsprechenden Eintrag in der Teilnehmerliste zuordnen. Anschließend wartet er in der Lobby auf die Freischaltung.
- **Lobby aktiv, Teilnehmerliste deaktiviert:** Telefonteilnehmer wählen sich ohne persönliche PIN ein. Sie warten trotzdem in der Lobby und werden dort mit ihrer Telefonnummer angezeigt.

Die persönliche PIN unterstützt die Zuordnung zu einem vorgesehenen Teilnehmer. Die Entscheidung über den Zutritt bleibt bei aktiver Lobby beim Organisator oder einem Lobby-Moderator.

## Persönliche PIN: weniger Unklarheit beim Einlass

Eine Telefonnummer hilft nicht immer dabei, einen wartenden Anrufer einem eingeladenen Teilnehmer zuzuordnen. Mit aktivierter Teilnehmerliste erhält deshalb jeder Teilnehmer eine persönliche PIN, die bei der Einwahl abgefragt wird.

So haben die Verantwortlichen beim Freischalten einen Bezug zur Teilnehmerliste. Die PIN unterstützt die Zuordnung; die Lobby gibt ihnen die Möglichkeit, über den Zutritt zu entscheiden. Auch eine Einwahl mit persönlicher PIN führt bei aktiver Lobby erst nach Freischaltung in die Besprechung.

## Technische Grundlage und Aktivierung

Für die neue Funktion haben wir die Integration der Telefoneinwahl auf Basis von Asterisk und AGI vollständig neu umgesetzt. Sie verbindet den telefonischen Zugang mit der Lobby-Verwaltung in Meetling.

Zur Aktivierung muss folgende Einstellung in den Umgebungsvariablen oder im Theme gesetzt werden:

```dotenv
SIP_CALLER_IN_FRONTEND=1
```

Die Lobby und die Teilnehmerliste werden weiterhin über die jeweiligen Raumeinstellungen gesteuert. Daraus ergibt sich, ob Telefonteilnehmer direkt beitreten, mit persönlicher PIN in der Lobby warten oder dort anhand ihrer Telefonnummer angezeigt werden.

## Betrieb in eigener Infrastruktur oder als Cloud Service

Die Asterisk-Installation kann auf zwei Wegen bereitgestellt werden:

- **In eigener Infrastruktur:** Bereitstellung in Kubernetes per Helm.
- **Als Cloud Service:** Betrieb durch H2 invent.

Damit können Sie die Telefoneinwahl passend zu Ihrem Betriebskonzept einrichten und den Zugang zur Konferenz über die Lobby steuern.

## Machen Sie den Einlass zum bewussten Schritt

Eine vertrauliche Besprechung sollte erst dann für einen weiteren Teilnehmer zugänglich sein, wenn Sie ihn hereinlassen möchten. Mit der neuen Lobby-Integration gilt dieser Grundsatz in Meetling auch für die Telefoneinwahl.

Sie möchten diese Kontrolle auch für Ihre Konferenzen nutzen? [Sprechen Sie mit uns](https://meetling.de/). Wir unterstützen Sie bei der Einrichtung der Telefoneinwahl in Ihrer eigenen Infrastruktur oder beim Betrieb als Cloud Service durch H2 invent und klären gemeinsam, welche Lobby-Einstellungen zu Ihren Abläufen passen.
