---
title: "Ende-zu-Ende-Verschlüsselung in Meetling: Mehr Schutz für vertrauliche Gespräche"
description: "Meetling unterstützt jetzt E2EE. Planen Sie die Verschlüsselung bei der Raumerstellung ein und erfahren Sie, warum Telefoneinwahl, Aufnahme und Transkription dann entfallen."
date: 2026-10-05
tags: ["e2ee", "sicherheit", "datenschutz", "videokonferenz", "KI-Generiert"]
image: ./header-e2ee-meetling.png
imageAlt: "Illustration zweier durch Ende-zu-Ende-Verschlüsselung geschützter Videokonferenz-Endgeräte mit Meetling-E2EE-Einstellung und Symbolen für nicht verfügbare Telefoneinwahl, Aufnahme und Transkription"
author: "Emanuel Holzmann"
---

## Manche Gespräche brauchen besonderen Schutz

Eine noch unveröffentlichte Unternehmensstrategie. Eine vertrauliche Personalentscheidung. Ein Gespräch über sensible Entwicklungsprojekte. Wenn solche Themen in einer Videokonferenz besprochen werden, geht es um mehr als eine stabile Verbindung: Es geht um das Vertrauen, dass Gesprächsinhalte nur bei den vorgesehenen Teilnehmern ankommen.

Mit der neuesten Version unterstützt Meetling die **Ende-zu-Ende-Verschlüsselung, kurz E2EE**. Damit erhalten vertrauliche Audio- und Videogespräche eine zusätzliche Schutzschicht: Die Inhalte werden auf den Endgeräten verschlüsselt und erst auf den Endgeräten der empfangenden Teilnehmer wieder entschlüsselt. Der dazwischenliegende Medienserver transportiert die verschlüsselten Daten, ohne die Gesprächsinhalte entschlüsseln zu können.

Für die Organisation Ihrer Konferenz ist dabei entscheidend: **E2EE muss bereits bei der Raumerstellung eingeplant werden.** Außerdem stehen bei aktiver E2EE bestimmte Funktionen nicht zur Verfügung, weil sie Zugriff auf die Gesprächsinhalte benötigen.

## E2EE bei der Raumerstellung vorbereiten

Die Entscheidung für eine vertrauliche Konferenz beginnt beim Anlegen des Raums. Im Dialog zur Raumerstellung finden Sie die Option **„Ende-zu-Ende-Verschlüsselung (E2EE) aktivieren“**.

![Meetling-Raumerstellung mit der E2EE-Option am unteren Ende des Dialogs](./e2ee-einstellungen.png)

Die Einrichtung erfolgt in zwei Schritten:

1. **Bei der Raumerstellung E2EE vorsehen:** Setzen Sie in den Einstellungen den Haken bei „Ende-zu-Ende-Verschlüsselung (E2EE) aktivieren“ und erstellen Sie den Raum.
2. **Anschließend über „Bearbeiten“ aktivieren:** Bei einem entsprechend vorbereiteten Raum lässt sich die Ende-zu-Ende-Verschlüsselung danach über „Bearbeiten“ einschalten.

Die Vorbereitung bei der Raumerstellung und die anschließende Aktivierung gehören zusammen. Berücksichtigen Sie E2EE deshalb bereits bei der Planung und informieren Sie Ihre Teilnehmer darüber, welche Zugangswege und Funktionen für die Konferenz verfügbar sind.

## Warum mit E2EE keine Telefoneinwahl möglich ist

Die Telefoneinwahl verbindet eine Videokonferenz mit dem Telefonnetz. Dafür muss die Telefonanbindung den Audiostream verarbeiten und in einer für den Telefonteilnehmer nutzbaren Form weitergeben können.

**Bei aktiver E2EE ist die Telefoneinwahl in Meetling nicht verfügbar.** Die Telefonanbindung kann die verschlüsselten Gesprächsinhalte nicht entschlüsseln und für das Telefonnetz aufbereiten. Ein Telefonteilnehmer kann deshalb nicht über diesen Weg an der Konferenz teilnehmen.

Der Medienserver übernimmt weiterhin die Weiterleitung verschlüsselter Daten zwischen den Konferenzteilnehmern. Für die Übertragung ins Telefonnetz wäre jedoch Zugriff auf den Audioinhalt erforderlich – und genau dieser Zugriff ist bei aktiver E2EE ausgeschlossen.

Wenn jemand auf die Telefoneinwahl angewiesen ist, sollte das vor der Einrichtung des Raums geklärt werden.

## Warum Aufnahme und Transkription ebenfalls entfallen

Eine Aufnahme und eine Transkription brauchen ebenfalls Zugriff auf die Medieninhalte. Ein Aufnahmedienst muss Audio und Video verarbeiten können, um daraus eine abspielbare Aufzeichnung zu erstellen. Eine Transkription muss die gesprochenen Worte aus dem Audiosignal erkennen können.

Deshalb stehen bei aktiver E2EE in Meetling auch **keine Aufnahme und keine Transkription** zur Verfügung. Die entsprechenden Dienste erhalten keinen entschlüsselbaren Medieninhalt, den sie aufzeichnen oder in Text umwandeln könnten.

Für Ihre Konferenzplanung bedeutet das:

| Funktion in Meetling | Bei aktiver E2EE | Grund |
| --- | --- | --- |
| Telefoneinwahl | Nicht verfügbar | Die Telefonanbindung kann den verschlüsselten Audiostream nicht für das Telefonnetz aufbereiten. |
| Aufnahme | Nicht verfügbar | Der Aufnahmedienst kann die verschlüsselten Medieninhalte nicht zu einer abspielbaren Aufzeichnung verarbeiten. |
| Transkription | Nicht verfügbar | Der Transkriptionsdienst kann die gesprochenen Inhalte im verschlüsselten Audiosignal nicht erkennen. |

## Vertraulichkeit bereits bei der Einladung mitdenken

Für IT-Verantwortliche und Organisatoren lohnt sich eine klare Entscheidung vor der Einladung: Welche Inhalte sollen besprochen werden? Benötigt jemand einen Zugang per Telefon? Muss das Gespräch aufgezeichnet oder transkribiert werden?

Bei einer vertraulichen Besprechung ohne diese Zusatzfunktionen können Sie E2EE gezielt einplanen. Sind Telefoneinwahl, Aufnahme oder Transkription erforderlich, müssen Sie diese Anforderungen mit dem vorgesehenen Schutz der Gesprächsinhalte abstimmen.

E2EE schützt die übertragenen Medieninhalte zwischen den Endgeräten. Der Schutz der Endgeräte und die Auswahl der berechtigten Teilnehmer bleiben dabei wichtig. Auch Verbindungs- und Steuerungsinformationen sind von den verschlüsselten Gesprächsinhalten zu unterscheiden; E2EE bedeutet keine vollständige Unsichtbarkeit einer Konferenz.

Technischen Hintergrund zur Medienverschlüsselung und ihrer Abgrenzung zu Steuerungsinformationen bietet die [offizielle LiveKit-Dokumentation zu E2EE](https://docs.livekit.io/transport/encryption/). Die hier beschriebenen Einrichtungsschritte und Funktionseinschränkungen beziehen sich auf die aktuelle Meetling-Umsetzung.

## Gemeinsam den passenden Rahmen schaffen

Vertrauliche Zusammenarbeit braucht Entscheidungen, die zum Gespräch passen. Mit E2EE bietet Meetling eine zusätzliche Möglichkeit, sensible Audio- und Videoinhalte zu schützen. Wer die Verschlüsselung und die benötigten Funktionen frühzeitig berücksichtigt, schafft dafür einen klaren Rahmen – bevor die erste Person den Raum betritt.

Sie möchten E2EE in Ihrer Organisation einsetzen und klären, wie sich vertrauliche Konferenzen in Ihre bestehenden Abläufe integrieren lassen? **Sprechen Sie mit uns. Wir beraten Sie zur Nutzung von Meetling und zur passenden Konfiguration für Ihre Besprechungen.**
