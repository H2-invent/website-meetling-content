---
title: "Videokonferenz selbst hosten: Voraussetzungen und Verantwortung"
description: "Videokonferenz selbst hosten: Welche Infrastruktur, Betriebsprozesse und Zuständigkeiten nötig sind – mit einer praxisnahen Make-or-Buy-Matrix."
date: 2026-09-03
tags: ["Open Source", "Eigenbetrieb", "KI-Generiert"]
image: ./videokonferenz-selbst-hosten-infrastruktur.webp
imageAlt: "Technische Komponenten und Betriebsaufgaben einer selbst gehosteten Videokonferenz"
author: "Meetling Team"
related: ["/sicherheit", "/blog/saas-oder-on-premise-videokonferenz", "/preise"]
---

## Videokonferenz selbst hosten: Was bedeutet das?

Eine Open-Source-Videokonferenz selbst zu hosten heißt nicht nur, Software auf einem Server zu installieren. Die Organisation übernimmt auch den laufenden Betrieb: Netzwerk und Domain, Verschlüsselung, Medienverkehr, Updates, Überwachung, Datensicherung und die Reaktion auf Störungen.

Das kann sinnvoll sein, wenn Kontrolle über Infrastruktur, Datenflüsse oder Integrationen besonders wichtig ist. Es ist aber eine Betriebsentscheidung. Vor dem Start sollten Verantwortliche klären, welche Verfügbarkeit erwartet wird, wer im Störungsfall handelt und ob das Team diese Aufgaben dauerhaft abdecken kann.

Dieser Beitrag beschreibt die Voraussetzungen und Verantwortlichkeiten auf Architektur- und Prozessebene. Er ist keine Installationsanleitung und ersetzt keine Prüfung der konkreten Open-Source-Lösung.

## Die technische Grundlage

Für einen belastbaren Betrieb braucht es mindestens fünf Bausteine:

- einen Server oder eine geeignete Plattform mit planbaren Ressourcen,
- eine Domain mit kontrollierbarer DNS-Konfiguration,
- eine verschlüsselte Webverbindung per TLS,
- erreichbare Medienpfade einschließlich eines TURN-Dienstes für schwierige Netzwerke,
- Monitoring, Backups und einen geregelten Update- und Bereitschaftsprozess.

Die Dimensionierung hängt nicht allein von der Zahl der registrierten Nutzer ab. Relevant sind unter anderem gleichzeitige Meetings, Teilnehmendenzahl, Kamera- und Bildschirmfreigaben, Aufzeichnungen, Codec- und Transcoding-Last sowie der Anteil der Verbindungen, die über TURN laufen.

### Domain und DNS

Die Konferenz sollte unter einem klar definierten Hostnamen erreichbar sein, etwa `meet.beispiel.de`. Dafür müssen DNS-Einträge auf die öffentliche Adresse beziehungsweise den vorgeschalteten Dienst zeigen. Zu dokumentieren sind mindestens:

1. die verantwortliche Domain und ihre Zugriffsberechtigungen,
2. A- oder AAAA-Einträge und gegebenenfalls Reverse Proxy oder Load Balancer,
3. die benötigten Hostnamen für Web-, Signalisierungs- und Medienkomponenten,
4. TTLs und ein Verfahren für geplante Änderungen.

DNS ist kein einmaliger Einrichtungsschritt: Änderungen, abgelaufene Delegationen oder falsch gesetzte IPv6-Einträge können den Zugang unterbrechen. Eine Änderung sollte deshalb nachvollziehbar dokumentiert und nach der Umstellung von außerhalb des eigenen Netzes getestet werden.

### TLS-Zertifikate

Browser erwarten für Kamera, Mikrofon und sichere Sitzungen eine verschlüsselte Verbindung. Für jeden öffentlich erreichbaren Hostnamen muss das passende TLS-Zertifikat ausgestellt, überwacht und rechtzeitig erneuert werden. Automatisierte Erneuerung reduziert manuellen Aufwand, ersetzt aber nicht die Kontrolle, ob Erneuerung und Auslieferung tatsächlich funktioniert haben.

Zum Betriebsprozess gehören daher eine Ablaufwarnung, ein Test der Zertifikatskette und eine dokumentierte Zuständigkeit für DNS- beziehungsweise ACME-Zugriffe. Ein abgelaufenes Zertifikat ist oft kein subtiler Fehler, sondern ein sofort sichtbarer Ausfall für Nutzerinnen und Nutzer.

### TURN und Medienverkehr

WebRTC versucht, eine direkte Verbindung zwischen Endgeräten aufzubauen. Das ist wegen NAT, Firewalls und restriktiven Unternehmensnetzen nicht immer möglich. Ein TURN-Server kann den Medienverkehr in solchen Fällen weiterleiten; WebRTC nennt TURN deshalb einen wesentlichen Baustein für viele Anwendungen. Der Dienst braucht eigene Kapazitäts- und Sicherheitsüberwachung.

Bei der Planung sollte das Team klären:

- Welche Netze und Protokolle müssen erreichbar sein?
- Wie viel zusätzlicher Datenverkehr entsteht bei einer Weiterleitung?
- Werden TURN-Zugangsdaten zeitlich begrenzt und geschützt?
- Was passiert, wenn der TURN-Dienst ausfällt oder seine Bandbreite erreicht?

Die Zahl der Meetings allein sagt also wenig über die nötige Bandbreite aus. Medienverkehr muss mit realistischen Szenarien getestet und während des Betriebs beobachtet werden.

## Betrieb ist Teil der Lösung

### Monitoring und Bereitschaft

Monitoring sollte nicht nur prüfen, ob eine Webseite antwortet. Sinnvolle Signale sind beispielsweise erfolgreiche Anmeldungen und Testkonferenzen, Zertifikatslaufzeiten, CPU- und Speicherauslastung, Festplattenplatz, Bandbreite, TURN-Auslastung, Fehlerquoten und die Erreichbarkeit abhängiger Dienste.

Zu jedem Alarm gehören eine Schwelle, eine zuständige Person, eine Priorität und eine Reaktionszeit. Ohne Bereitschaftsregelung bleibt Monitoring eine Sammlung von Meldungen. Für kritische Meetings braucht es außerdem eine Kommunikationsvorlage und einen getesteten Ausweich- oder Wiederanlaufplan.

### Backups und Wiederherstellung

Zu sichern sind nicht nur Datenbanken. Je nach Lösung gehören Konfigurationen, Identitäten, Schlüssel, Aufzeichnungsdaten und die Dokumentation der Infrastruktur dazu. Backups sollten getrennt vom produktiven System geschützt, regelmäßig erstellt und gegen unbefugten Zugriff abgesichert werden.

Entscheidend ist der Wiederherstellungstest: Ein Backup, das noch nie zurückgespielt wurde, ist nur eine Annahme. Vorab sollten Recovery Point Objective (wie viel Datenverlust akzeptabel ist) und Recovery Time Objective (wie schnell der Dienst wieder verfügbar sein muss) festgelegt werden. Änderungen an der Plattform sollten einen erneuten Test auslösen.

### Updates und Sicherheitsbetrieb

Open-Source-Komponenten benötigen ebenso wie Betriebssystem, Datenbank, Proxy und TURN-Dienst regelmäßige Sicherheitsupdates. Verantwortliche sollten eine Inventarliste, eine Quellenbeobachtung, ein Testfenster, ein Rollback-Verfahren und eine Frist für sicherheitskritische Updates definieren.

Zum Sicherheitsbetrieb gehören außerdem minimale Berechtigungen, geschützte Administrationszugänge, Protokollierung, Geheimnisverwaltung und eine Regelung zur Aufbewahrung von Logs. Vor jedem Update ist zu prüfen, ob ein aktuelles, rückspielbares Backup vorhanden ist. Nach dem Update sollten Kernfunktionen und Medienverbindungen mit einem kurzen Abnahmetest geprüft werden.

## Kapazität planen statt nur Servergröße wählen

Kapazität sollte anhand eines Lastmodells geplant werden. Dafür werden mindestens folgende Szenarien benötigt:

| Szenario | Zu erfassende Größen |
| --- | --- |
| Normalbetrieb | gleichzeitige Meetings, Teilnehmende, Audio/Video, Spitzenzeiten |
| Spitzenlast | erwartete Parallelität, zusätzliche Bildschirmfreigaben, Bandbreite |
| TURN-lastiger Betrieb | weitergeleitete Medienströme, Egress-Bandbreite, Latenz |
| Ausfall | Wiederanlauf, Ersatzkapazität, Wiederherstellungszeit |

Nach einem realistischen Test werden Reserven festgelegt. Die Annahmen sollten regelmäßig mit Messwerten verglichen werden. Übersteigt die Last die Reserve, muss vor dem Engpass skaliert oder die Betriebsentscheidung neu bewertet werden.

## Make-or-Buy: Selbst hosten oder Betrieb auslagern?

Die Entscheidung sollte nicht auf Lizenzkosten reduziert werden. Eine einfache Bewertungsmatrix hilft:

| Kriterium | Selbst hosten | Betrieb einkaufen/auslagern |
| --- | --- | --- |
| Kontrolle über Infrastruktur | hoch, eigene Gestaltung möglich | abhängig vom Anbieter und Vertrag |
| Interner Betriebsaufwand | dauerhaft für Updates, Monitoring und Bereitschaft einplanen | geringer intern, aber Anbietersteuerung bleibt |
| Anpassbarkeit | meist größer, abhängig von Team und Lösung | abhängig von Schnittstellen und Leistungsumfang |
| Verfügbarkeit | selbst zu entwerfen, zu messen und abzusichern | vertraglich zu prüfen, nicht nur zu vermuten |
| Daten- und Compliance-Anforderungen | selbst dokumentieren und kontrollieren | Verantwortlichkeiten und Speicherorte vertraglich prüfen |
| Skalierung | eigene Kapazitätsplanung und Kostensteuerung | Leistungsgrenzen, Abhängigkeiten und Kostenmodell prüfen |

Die passende Option hängt von Anforderungen und Kompetenzen ab. Wer maximale Kontrolle braucht, aber keine 24/7-Bereitschaft organisieren kann, sollte den Betriebsumfang realistisch begrenzen oder externe Unterstützung einplanen. Wer auslagert, gibt Verantwortung nicht vollständig ab: Datenschutz, Rollen, Notfallkommunikation und Anbieterüberwachung bleiben eigene Managementaufgaben.

## Checkliste vor der Entscheidung

- Sind parallele Meetings und Spitzenzeiten quantifiziert?
- Sind Domain, DNS, Zertifikate und Administrationsrechte dokumentiert?
- Ist der TURN-Bedarf getestet und die Bandbreite budgetiert?
- Gibt es Monitoring mit klaren Alarmwegen und Bereitschaft?
- Werden Konfigurationen und relevante Daten gesichert und wiederhergestellt getestet?
- Sind Sicherheitsupdates, Wartungsfenster und Rollback geregelt?
- Sind RPO, RTO und ein Ausweichplan festgelegt?
- Ist geklärt, wer Datenschutz, Incident Response und Nutzerkommunikation verantwortet?
- Ist die Make-or-Buy-Entscheidung mit dem tatsächlichen Betriebsaufwand begründet?

## Fazit

Eine Videokonferenz selbst zu hosten ist technisch machbar, aber kein reines Softwareprojekt. DNS, TLS, TURN, Kapazitätsplanung und Sicherheitsbetrieb bilden eine zusammenhängende Verantwortung. Wer diese Aufgaben mit Zuständigkeiten, Messwerten und Wiederherstellungstests absichert, kann fundiert entscheiden, ob der Eigenbetrieb zum Unternehmen passt.

Mehr zum Schutz von Meetings: [Sicherheit](/sicherheit). Für die grundsätzliche Modellentscheidung siehe [SaaS oder On-Premise](/blog/saas-oder-on-premise-videokonferenz). Die Kosten- und Leistungsfrage gehört auf die [Preise](/preise)-Seite.

## Quellen und Faktenprüfung

- WebRTC: [TURN server](https://webrtc.org/getting-started/turn-server) und [Peer connections](https://webrtc.org/getting-started/peer-connections) – Rolle von TURN bei NAT und Medienweiterleitung, abgerufen 03.09.2026.
- NIST: [SP 800-40 Rev. 4 – Enterprise Patch Management](https://csrc.nist.gov/pubs/sp/800/40/r4/final) – Patch-Management als planbarer Sicherheitsprozess, abgerufen 03.09.2026.
- NIST: [Ransomware and Data Loss – Backup Files](https://csrc.nist.gov/pubs/other/2020/04/24/protecting-data-from-ransomware-and-other-data-los/final) – Backups durchführen, pflegen und testen, abgerufen 03.09.2026.

