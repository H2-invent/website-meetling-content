---
title: "AWS Bahrain als Resilienz-Lektion: Warum Multi-AZ allein keinen Regionsausfall abdeckt"
description: "Der AWS-Fall Bahrain zeigt, warum Multi-AZ keinen gesamten Regionsausfall abdeckt und welche Prüfungen Videokonferenz-Teams für Resilienz brauchen."
date: 2026-09-17
updated: 2026-09-17
author: "Meetling Redaktion"
tags:
  - Cloud-Resilienz
  - Videokonferenz
  - KI-Generiert
image: "./aws-bahrain-resilienz-r1.png"
imageAlt: "Zwei getrennte Cloud-Regionen mit eigenen Datenbeständen, Replikationspfad und angebundenen Video-, Audio- und Chat-Endgeräten"
preview: "./aws-bahrain-resilienz-r1.png"
previewAlt: "Abstrakte Darstellung zweier separater Cloud-Regionen für einen ausfallsicheren Videokonferenzbetrieb"
related:
  - "/blog/open-source-videokonferenz-digitale-souveraenitaet"
  - "/tutorials/vergangene-videokonferenzen"
---

# AWS Bahrain als Resilienz-Lektion: Warum Multi-AZ allein keinen Regionsausfall abdeckt

Der AWS-Fall in Bahrain zeigt eine seltene, aber entscheidende Grenze von Redundanz: Eine Multi-AZ-Architektur mindert das Risiko eines Ausfalls einzelner Availability Zones, sichert jedoch nicht automatisch gegen den Ausfall einer ganzen Region ab. Für Teams, die Videokonferenzen betreiben oder beschaffen, ist das ein Anlass, Wiederherstellbarkeit und Datenwege konkret zu prüfen – nicht ein Anlass für pauschale Aussagen über Clouds oder Anbieter.

Stand 15. September 2026 teilte AWS mit, dass der Zugriff auf Ressourcen und Daten nicht wiederhergestellt werden kann, sofern diese ausschließlich in der Region `me-south-1` (Bahrain) gehostet waren. Die Meldung bezieht sich auf ein Ereignis, das mehrere Availability Zones betraf und den für regionale sowie Multi-AZ-Dienste vorgesehenen Resilienzrahmen überschritt. Der [öffentlich wiedergegebene AWS-Health-Status](https://internetmon.ai/status/aws) und die [AWS-Mitteilung zur anhaltenden Störung](https://www.aboutamazon.com/news/aws-bahrain-region-middle-east-conflict) beschreiben zugleich Migration in andere Regionen sowie Backups, soweit vorhanden, als Wege für betroffene Kunden.

Das bedeutet ausdrücklich nicht, dass alle Daten in Bahrain verloren sind oder dass eine Region endgültig geschlossen wird. Daten mit einer funktionsfähigen Kopie außerhalb der Region, etwa durch Replikation, Cross-Region-Backups oder eine bereits erfolgte Migration, fallen nicht unter „ausschließlich in dieser Region gehostet“. Auch der [unabhängige Reuters-Bericht](https://www.insurancejournal.com/news/international/2026/09/16/885283.htm) ordnet die AWS-Statusaussage in diesen konkreten Kontext ein.

## Was Multi-AZ leistet – und was nicht

Availability Zones sind voneinander getrennte Standorte innerhalb einer AWS-Region. Multi-AZ verteilt eine Anwendung oder einen Dienst über solche Zonen. Fällt eine einzelne Zone aus, kann die Architektur – abhängig von Dienst und Konfiguration – weiterarbeiten oder in eine andere Zone wechseln. Genau für diese Fehlerdomäne ist Multi-AZ gedacht.

Bei einem regionsweiten, korrelierten Ereignis ändert sich die Annahme: Die Zonen derselben Region und ihre regionalen Abhängigkeiten können zugleich betroffen sein. AWS beschreibt für solche Szenarien Multi-Region-Architekturen mit getrennten Datenkopien, Replikation und Recovery-Planung als Teil von Business Continuity und Disaster Recovery. Die [AWS-Prescriptive-Guidance zu Multi-Region-Architekturen](https://docs.aws.amazon.com/prescriptive-guidance/latest/security-reference-architecture/multi-region-architecture.html) macht diese Trennung der Fehlerdomänen deutlich.

Die passende Schlussfolgerung lautet daher nicht „Multi-AZ ist nutzlos“. Sie lautet: Wer den Verlust einer gesamten Region als Szenario abdecken muss, benötigt zusätzlich zu Multi-AZ eine bewusst vorbereitete zweite Region und einen getesteten Wiederanlauf.

| Schutzfrage | Multi-AZ in einer Region | Multi-Region mit getrennten Kopien |
| --- | --- | --- |
| Ausfall einer einzelnen Availability Zone | Dafür konzipiert | Kann zusätzlich schützen, ist aber nicht zwingend die erste Maßnahme |
| Ausfall oder Nichtverfügbarkeit einer ganzen Region | Reicht allein nicht aus | Kann dieses Szenario adressieren, wenn Anwendung, Daten und Failover vorbereitet sind |
| Datenwiederherstellung | Hängt von Dienst und Konfiguration ab | Benötigt eigenständige, nutzbare Kopien und getestete Wiederherstellung |
| Betriebswechsel | Regionaler Failover möglich | Verkehr, Identität, Kapazität und Abhängigkeiten müssen in der Zielregion bereitstehen |

## Drei Bausteine für einen belastbaren Regions-Notfallplan

### 1. Datenkopien müssen getrennt und wiederherstellbar sein

Ein Backup ist nicht automatisch regionsübergreifend. AWS Backup kann Sicherungen in eine andere Region kopieren; welche Ressourcen unterstützt werden und wie eine Kopie wiederhergestellt wird, hängt jedoch von Service, Region, Verschlüsselung, Berechtigungen und Aufbewahrung ab. Die [AWS-Dokumentation zu Cross-Region-Backups](https://docs.aws.amazon.com/aws-backup/latest/devguide/cross-region-backup.html) nennt diese Voraussetzungen.

Entscheidend ist nicht allein, ob ein Backup-Job „grün“ ist, sondern ob die benötigten Daten, Schlüssel, Berechtigungen und Abhängigkeiten am Wiederanlaufort tatsächlich verfügbar sind. Für jede relevante Datenklasse sollte klar sein, wo die unabhängige Kopie liegt und wie sie wiederhergestellt wird.

### 2. RPO und RTO sind Architekturentscheidungen

Das Recovery Point Objective (RPO) legt fest, wie viel Datenstand im schlimmsten Fall fehlen darf. Das Recovery Time Objective (RTO) beschreibt, wie lange eine Wiederherstellung dauern darf. Beide Werte sind keine Eigenschaften eines Cloud-Labels, sondern Anforderungen an Datenreplikation, Kapazität, Betriebsabläufe und Entscheidungswege.

Ein sehr niedriges RPO kann beispielsweise kontinuierliche oder häufige Replikation erfordern. Ein kurzes RTO setzt voraus, dass Infrastruktur, Konfiguration, Identitäten und der Weg für Nutzerinnen und Nutzer bereits vorbereitet sind. AWS erläutert im [Well-Architected-Framework für Disaster Recovery](https://docs.aws.amazon.com/wellarchitected/2024-06-27/framework/rel_planning_for_recovery_disaster_recovery.html), dass beim Backup-and-Restore auch Infrastruktur, Code und Verkehrsumleitung Teil des Wiederanlaufs sind.

### 3. Failover muss getestet werden

Ein dokumentierter Plan ist noch kein funktionierender Failover. Ein Test zeigt, ob DNS- oder Traffic-Umschaltung, Kapazität in der Zielregion, Identitätsdienste, Verschlüsselungsschlüssel, Monitoring und Betriebsbereitschaft zusammenpassen. Er deckt auch versteckte Abhängigkeiten auf, etwa einen regional gebundenen Dienst oder fehlende Zugriffsrechte für das Wiederherstellungsteam.

Ein sinnvolles Testziel lautet nicht nur „Anwendung startet“. Es lautet: Der vereinbarte Dienst funktioniert im Zielstandort innerhalb des RTO, mit einem Datenstand innerhalb des RPO, und die verantwortlichen Personen können ihn nachweisbar bedienen.

## Was das für Videokonferenzen konkret bedeutet

Videokonferenzsysteme verarbeiten häufig mehr als einen laufenden Audio- und Videostrom. Je nach Produkt und Konfiguration gehören dazu Chat, Aufzeichnungen, Transkripte, Teilnehmer- und Nutzungsdaten, Metadaten, Einladungsdaten, Identitätsinformationen, Protokolle und Supportdaten. Diese Datenklassen können unterschiedliche Speicher-, Backup- und Verarbeitungsorte haben.

Deshalb reicht die Frage „Läuft die Videokonferenz in Europa?“ für eine Resilienz- oder Souveränitätsbewertung nicht aus. Bei einer [Open-Source-Videokonferenz und digitaler Souveränität](/blog/open-source-videokonferenz-digitale-souveraenitaet) geht es ebenso um nachvollziehbare Datenwege und betriebliche Wahlmöglichkeiten. Für eine konkrete Lösung sollten Verantwortliche mindestens diese Punkte belegen lassen:

1. In welchen Regionen werden Medien, Chat, Aufzeichnungen, Transkripte, Metadaten und Logs verarbeitet und gespeichert?
2. Wo liegen Backups und Replikate, wie sind sie verschlüsselt, und ist ihre Wiederherstellung getestet?
3. Welche Identitäts-, Schlüssel- und Supportzugriffe bleiben beim Ausfall der primären Region verfügbar?
4. Welche Subprozessoren und externen Dienste sind in Datenfluss, Betrieb und Recovery beteiligt?
5. Welches RPO und RTO gelten je Datenklasse und welche Failover-Übung belegt sie?

Auch der Umgang mit abgeschlossenen Besprechungen ist ein Datenprozess: Wer [vergangene Videokonferenzen einsehen](/tutorials/vergangene-videokonferenzen) kann, sollte für zugehörige Informationen ebenfalls Speicherort, Aufbewahrung, Export und Wiederherstellung klären.

## Europäisch und souverän: konkrete Nachweise statt Etiketten

„Europäisch“, „souverän“ oder „DSGVO-konform“ sind keine automatischen Garantien für eine Videokonferenzlösung. Datenresidenz betrifft Speicher- und Verarbeitungsorte; Datensouveränität umfasst darüber hinaus Rechtsraum, Zugriffsrechte und Governance. AWS unterscheidet diese Begriffe in seiner [Digital Sovereignty Lens](https://docs.aws.amazon.com/wellarchitected/latest/digital-sovereignty-lens/digital-sovereignty-lens.pdf). Die [Europäische Kommission](https://digital-strategy.ec.europa.eu/en/policies/cloud-and-ai-development-act) beschreibt Souveränität ebenfalls als abgestuftes, an Anforderungen gebundenes Konzept.

Für die Beschaffung zählt daher die überprüfbare Ausgestaltung: Vertrags- und Verarbeitungsrollen, Speicher- und Backup-Orte, Zugriff auf Schlüssel und Identitäten, Supportwege, Subprozessoren, Exportmöglichkeiten sowie Notfalltests. Eine europäische Betriebsoption kann dafür eine relevante Voraussetzung sein. Ob sie die eigenen Anforderungen erfüllt, lässt sich aber nur anhand des konkreten Datenflusses und Betriebsmodells beurteilen.

## Fazit: Resilienz beginnt mit überprüfbaren Annahmen

Der Fall Bahrain ist keine Absage an Multi-AZ. Er macht sichtbar, dass die Fehlerdomäne einer Region größer sein kann als die einer einzelnen Availability Zone. Für Videokonferenzen bedeutet das: Resilienz entsteht aus bewusst getrennten Regionen und Datenkopien, klaren RPO/RTO-Zielen sowie geübtem Failover.

Wer europäische oder souveräne Cloud-Optionen bewertet, sollte dieselbe Disziplin anwenden. Nicht das Etikett entscheidet, sondern der belegte Datenfluss – einschließlich Speicher, Backups, Identität, Schlüssel, Support, Subprozessoren und Wiederherstellung.

## Quellen

- [AWS-Statusereignis Bahrain, öffentlich wiedergegeben](https://internetmon.ai/status/aws)
- [AWS: Bahrain disrupted by ongoing conflict](https://www.aboutamazon.com/news/aws-bahrain-region-middle-east-conflict)
- [Reuters-Bericht via Insurance Journal](https://www.insurancejournal.com/news/international/2026/09/16/885283.htm)
- [AWS Prescriptive Guidance: Multi-Region Architecture](https://docs.aws.amazon.com/prescriptive-guidance/latest/security-reference-architecture/multi-region-architecture.html)
- [AWS Backup: Cross-Region backup](https://docs.aws.amazon.com/aws-backup/latest/devguide/cross-region-backup.html)
- [AWS Well-Architected: Disaster Recovery](https://docs.aws.amazon.com/wellarchitected/2024-06-27/framework/rel_planning_for_recovery_disaster_recovery.html)
- [AWS Digital Sovereignty Lens](https://docs.aws.amazon.com/wellarchitected/latest/digital-sovereignty-lens/digital-sovereignty-lens.pdf)
- [Europäische Kommission: Cloud and AI Development Act](https://digital-strategy.ec.europa.eu/en/policies/cloud-and-ai-development-act)

