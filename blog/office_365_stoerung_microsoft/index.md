---
title: "Microsoft-365-Störung: Videokonferenzen resilient und unabhängig betreiben"
description: "Die Microsoft-365-Störung zeigt, warum Unternehmen Kommunikation resilient aufstellen und selbst gehostete Videokonferenzen einsetzen können."
date: 2026-09-01
tags: ["digitale-resilienz", "videokonferenz", "on-premises", "hybrid-cloud", "KI-Generiert"]
image: ./microsoft-365-ausfall-digitale-resilienz.png
imageAlt: "Getrennte interne und externe Meetling-Infrastruktur als resiliente Alternative zu zentralen Videokonferenz-Clouds"
author: "Emanuel Holzmann"
---

> **KI-generiert:** Dieser Beitrag wurde mit Unterstützung künstlicher Intelligenz erstellt und redaktionell geprüft.

## Wenn zentrale Cloud-Dienste ausfallen, wird Abhängigkeit sichtbar

Am 31. August 2026 kam es zu einer mehrstündigen, weltweiten Störung bei Microsoft 365. Nach Angaben von Microsoft lag die Ursache in der Cloud-Infrastruktur von Exchange Online: Eine zentrale Authentifizierungs- und Verbindungskomponente verhinderte bei vielen Nutzerinnen und Nutzern den Zugriff auf ihre Postfächer. Am Morgen des 1. September liefen die Systeme schrittweise wieder an, während Rückstaus und Synchronisationsprobleme noch nicht überall behoben waren. Darüber berichtete unter anderem die [Tagesschau](https://www.tagesschau.de/wirtschaft/technologie/microsoft-stoerung-100.html).

Der Vorfall betraf nach den bisher verfügbaren Informationen vor allem Exchange Online und Outlook. Ein vollständiger Ausfall von Microsoft Teams ist durch die herangezogenen Quellen nicht bestätigt. Trotzdem ist die Lehre für die Unternehmenskommunikation eindeutig: Wenn E-Mail, Identitätsverwaltung, Kalender, Dateien und Videokonferenzen eng an denselben Cloud- und Plattformverbund gekoppelt sind, können technische Störungen mehrere geschäftskritische Prozesse gleichzeitig beeinträchtigen.

Selbst eine weltweit redundant aufgebaute Plattform ist nicht ausfallsicher. Microsoft beschreibt Teams als georedundanten Dienst, der in einer Region mindestens zwei räumlich getrennte Azure-Regionen nutzt. Dennoch bleiben gemeinsame Abhängigkeiten bestehen – etwa zentrale Identitäts-, Verbindungs-, Konfigurations- und Verwaltungsdienste. Redundanz innerhalb einer Anbieterplattform reduziert viele technische Risiken, beseitigt aber nicht das Konzentrationsrisiko auf diesen Anbieter.

## Digitale Resilienz braucht eine unabhängige Kommunikationslinie

Videokonferenzen gehören heute zur betrieblichen Basisinfrastruktur. Darüber werden Störungen koordiniert, Entscheidungen getroffen, externe Dienstleister eingebunden und Krisenstäbe zusammengebracht. Genau deshalb sollte die dafür notwendige Plattform nicht ausschließlich von derselben Cloud abhängen, deren Störung gerade bewältigt werden muss.

Eine unabhängige Konferenzlösung schafft einen zusätzlichen Kommunikationsweg. Sie hilft nicht nur bei einem Ausfall des eigentlichen Videodienstes. Sie bleibt auch dann wertvoll, wenn ein vorgelagerter Identitätsdienst, ein zentraler Mandant, eine Schnittstelle oder ein anderer Bestandteil einer großen Cloud-Suite gestört ist.

Für regulierte Unternehmen ist dieses Thema besonders relevant. Die europäische DORA-Verordnung verlangt von betroffenen Finanzunternehmen, IKT-Drittrisiken und Konzentrationsrisiken zu bewerten sowie dokumentierte und regelmäßig geprüfte Exit-Strategien für kritische oder wichtige Funktionen vorzuhalten. Auch das BSI empfiehlt für kritische Cloud-Dienste, eine kurzfristige Übernahme in eine Private Cloud oder den Wechsel zu einem anderen Anbieter vorzubereiten. Ein Ausweichsystem, das nur auf dem Papier existiert, ist keine belastbare Resilienzmaßnahme.

## Meetling: Open Source und in der eigenen Infrastruktur betreibbar

[Meetling](https://meetling.de/) basiert auf einem offenen Software-Stack und kann als SaaS-, Hybrid-Cloud- oder hochsichere On-Premises-Lösung betrieben werden. Unternehmen können die Plattform dadurch in ihrem eigenen Rechenzentrum oder auf dedizierten Ressourcen bereitstellen und selbst festlegen, wo zentrale Komponenten und Kommunikationsdaten verarbeitet werden.

Technisch trennt eine Videokonferenzlösung mehrere Aufgaben voneinander:

- Das Webfrontend und die Konferenzverwaltung steuern Räume, Einladungen, Rollen und Zugriffsrechte.
- Die Anbindung an Keycloak, OpenID Connect, SAML oder LDAP integriert Meetling in bestehende Identitäts- und Berechtigungsstrukturen.
- LiveKit stellt als Open-Source-SFU die Echtzeitübertragung von Audio, Video und Daten bereit. Der Medienserver verteilt die Streams gezielt an die Teilnehmenden, anstatt jede Verbindung über einen geschlossenen Plattformdienst zu führen.
- TURN-Server schaffen einen kontrollierten Ausweichweg für Netze, in denen direkte WebRTC-Verbindungen nicht möglich sind.
- Docker- und Kubernetes-Bereitstellungen ermöglichen je nach Schutzbedarf kompakte Installationen oder hochverfügbare Cluster mit mehreren Knoten.

Weil Quellcode und Betriebsmodell zugänglich sind, bleibt das Unternehmen bei Betrieb, Prüfung und Weiterentwicklung handlungsfähig. Open Source allein garantiert weder Sicherheit noch Verfügbarkeit. Es schafft aber die technische Voraussetzung, die Lösung unabhängig zu prüfen, selbst zu betreiben, Dienstleister zu wechseln und ein eigenes Wiederanlaufkonzept umzusetzen.

## Zwei getrennte Zonen statt einer neuen Abhängigkeit

Für viele Unternehmen ist weder „alles intern“ noch „alles extern“ die beste Lösung. Eine hybride Meetling-Architektur verbindet die Kontrolle einer internen Installation mit der Elastizität einer externen Umgebung.

### Interne Zone für schützenswerte Kommunikation

Die interne Meetling-Umgebung wird im eigenen Rechenzentrum oder in einer kontrollierten Private Cloud betrieben. Webanwendung, Identitätsanbindung und LiveKit-Medienserver können vollständig innerhalb der eigenen Sicherheitszone liegen. Für interne Besprechungen verlassen Signalisierung und Medienströme diese kontrollierte Infrastruktur dann nicht. Zugänge lassen sich an das interne IAM, bestehende Netzwerkzonen und unternehmenseigene Protokollierungs- und Monitoring-Systeme anbinden.

Diese Zone eignet sich besonders für Krisenstäbe, Forschungs- und Entwicklungsbesprechungen, Vorstands- und Aufsichtsratssitzungen, Kommunikation mit Berufsgeheimnisträgern sowie Gespräche in regulierten oder sicherheitskritischen Bereichen. Das [BSI-Kompendium für Videokonferenzsysteme](https://www.bsi.bund.de/SharedDocs/Downloads/DE/BSI/Cyber-Sicherheit/Themen/Kompendium-Videokonferenzsysteme.pdf?__blob=publicationFile&v=4) beschreibt On-Premises-Szenarien ausdrücklich als mögliche Architektur für Kommunikation mit hohem bis sehr hohem Schutzbedarf.

### Externe Zone für Gäste und Lastspitzen

Eine zweite, technisch getrennte Meetling-Umgebung kann in einem deutschen Rechenzentrum oder einer unabhängigen Cloud betrieben werden. Sie übernimmt Konferenzen mit vielen externen Teilnehmenden, öffentliche Veranstaltungen oder kurzfristige Lastspitzen. Die dafür erforderlichen Internetzugänge und Medienkapazitäten müssen so nicht pauschal in der internen Infrastruktur vorgehalten werden.

Die Zuordnung sollte regelbasiert auf Ebene der Konferenz erfolgen: Schutzbedarf, Teilnehmerkreis und erwartete Größe entscheiden darüber, ob ein Raum intern oder extern bereitgestellt wird. Vertrauliche interne Räume dürfen nicht automatisch in die externe Zone verschoben werden, nur weil dort mehr Kapazität verfügbar ist.

| Anforderung | Interne Meetling-Zone | Externe Meetling-Zone |
| --- | --- | --- |
| Vertrauliche interne Besprechungen | Bevorzugter Betriebsort | Nur nach bewusster Freigabe |
| Externe Gäste | Kontrolliert und bei Bedarf | Einfach skalierbar |
| Daten- und Medienpfad | Eigene Infrastruktur | Getrenntes deutsches Rechenzentrum |
| Kapazität | Für kritische Grundlast ausgelegt | Für Spitzen flexibel erweiterbar |
| Fehlerdomäne | Unabhängig von externer Plattform | Unabhängig vom internen Rechenzentrum |

Damit daraus echte Resilienz entsteht, dürfen beide Zonen nicht unbemerkt dieselben kritischen Abhängigkeiten teilen. Wenn beispielsweise beide Installationen ausschließlich denselben externen Identity Provider, dieselbe DNS-Zone oder denselben Internet-Uplink benötigen, bleibt dort ein gemeinsamer Ausfallpunkt bestehen.

## Was Unternehmen für einen belastbaren Notbetrieb benötigen

Eine zweite Installation allein reicht nicht. Entscheidend ist, ob sie während einer Störung tatsächlich genutzt werden kann. Ein belastbares Konzept sollte deshalb mindestens folgende Punkte umfassen:

1. **Kommunikationsklassen definieren:** Welche Besprechungen müssen bei einem Ausfall weiterlaufen und welche Schutzanforderungen gelten dafür?
2. **Fehlerdomänen trennen:** Interne und externe Instanz sollten nicht vollständig von denselben Rechenzentren, Identitätsdiensten, DNS-Komponenten und Administrationszugängen abhängen.
3. **Notfallzugänge vorbereiten:** Für einen Ausfall des zentralen Identity Providers werden kontrollierte, besonders geschützte Break-Glass-Konten benötigt.
4. **Kapazität planen:** Die interne Umgebung muss die kritische Grundlast tragen können; die externe Umgebung übernimmt definierte Spitzen und externe Formate.
5. **Umschaltung dokumentieren:** Verantwortlichkeiten, alternative Einladungswege, erreichbare URLs und Entscheidungskriterien müssen vor dem Vorfall feststehen.
6. **Regelmäßig testen:** Notfallräume, Zugänge, Firewall-Regeln, TURN-Erreichbarkeit und Wiederanlaufzeiten sollten in Übungen überprüft werden.
7. **Monitoring trennen:** Der Zustand der Ausweichlösung muss auch dann sichtbar sein, wenn zentrale Monitoring- oder Benachrichtigungsdienste gestört sind.

Digitale Resilienz bedeutet dabei nicht, jede Hardware- und Softwarekomponente selbst herzustellen. Server, Netzwerkkomponenten, Betriebssysteme und Rechenzentren bleiben Teil komplexer Lieferketten. Entscheidend ist, Abhängigkeiten bewusst zu reduzieren, austauschbare Komponenten zu verwenden und für geschäftskritische Kommunikation eine realistisch betreibbare Alternative vorzuhalten.

## Unabhängigkeit beginnt vor dem nächsten Ausfall

Die aktuelle Microsoft-365-Störung ist kein Beweis dafür, dass Cloud-Plattformen grundsätzlich ungeeignet sind. Sie zeigt aber, dass selbst sehr große Anbieter und hochredundante Systeme zeitweise ausfallen können. Wer seine gesamte Kommunikation in einer Plattform bündelt, übernimmt damit auch deren gemeinsame technische und organisatorische Risiken.

Meetling ermöglicht einen anderen Ansatz: vertrauliche Kommunikation auf einer kontrollierten internen Infrastruktur, zusätzliche externe Kapazität für Gäste und Lastspitzen sowie ein offener Software-Stack ohne erzwungene Bindung an einen einzelnen Plattformanbieter.

Wir unterstützen Sie dabei, Schutzbedarf, Kapazität und bestehende Abhängigkeiten zu analysieren und daraus eine passende On-Premises- oder Hybrid-Architektur zu entwickeln. [Sprechen Sie mit uns](https://meetling.de/#contact-card), bevor aus einer technische Störung eine Kommunikationskrise wird.

## Quellen

- [Tagesschau: Microsoft-Systeme laufen nach weltweiter Störung wieder an](https://www.tagesschau.de/wirtschaft/technologie/microsoft-stoerung-100.html), Stand 1. September 2026
- [Microsoft: Service resilience in Microsoft Teams](https://learn.microsoft.com/en-us/compliance/assurance/assurance-service-resilience-microsoft-teams)
- [BSI: Kompendium Videokonferenzsysteme](https://www.bsi.bund.de/SharedDocs/Downloads/DE/BSI/Cyber-Sicherheit/Themen/Kompendium-Videokonferenzsysteme.pdf?__blob=publicationFile&v=4)
- [BSI: Empfehlungen zur Vorbereitung einer Exit-Strategie bei Nutzung von Cloud-Dienstleistungen](https://www.bsi.bund.de/SharedDocs/Downloads/DE/BSI/KRITIS/UPK/upk-exit-strategie-cloud-dienstleistungen.pdf?__blob=publicationFile&v=8)
- [EUR-Lex: Verordnung (EU) 2022/2554 über die digitale operationale Resilienz im Finanzsektor (DORA)](https://eur-lex.europa.eu/legal-content/DE/TXT/?uri=CELEX:32022R2554)
- [Meetling: Sicherheits- und Hostingmodelle](https://meetling.de/)
- [GitHub: Jitsi Admin und LiveKit-Integration](https://github.com/H2-invent/jitsi-admin)

