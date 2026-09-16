---
title: "LiveKit-Firewall konfigurieren: Ports, TURN und typische Fehler"
description: "So konfigurieren Sie die LiveKit-Firewall für Self-Hosting: benötigte Ports, NAT und TURN/TLS sowie eine Diagnose für typische Verbindungsfehler."
date: 2026-09-16
updated: 2026-09-16
author: "Meetling Redaktion"
tags:
  - LiveKit
  - WebRTC
  - KI-Generiert
image: "./livekit-firewall-ports-turn-r2.png"
imageAlt: "Abstrakte Netzwerkdarstellung mit Endgeräten, Firewall, selbst gehostetem WebRTC-Server und optionalem Relay-Pfad"
preview: "./livekit-firewall-ports-turn-r2.png"
previewAlt: "Abstrakte Netzwerkdarstellung mit Endgeräten, Firewall, selbst gehostetem WebRTC-Server und optionalem Relay-Pfad"
related:
  - "/tutorials/firewall-fuer-livekit-cluster-einrichten"
---

# LiveKit-Firewall konfigurieren: Ports, TURN und typische Fehler

Eine LiveKit-Firewall für Self-Hosting korrekt zu konfigurieren, heißt mehr als HTTPS freizugeben. Für WebRTC müssen Signalisierung, ICE-Medienpfade, NAT-Erreichbarkeit und bei Bedarf TURN zusammenpassen. Dieser Leitfaden ordnet die dokumentierten Standardports ein, erklärt die Wahl zwischen UDP-Portbereich und UDP-Mux und zeigt, wie sich typische Verbindungsprobleme strukturiert eingrenzen lassen.

Der Beitrag bezieht sich auf einen selbst gehosteten LiveKit-Server. Die Freigaben für Clients zu einem betriebenen Meetling-Cluster sind ein anderer Anwendungsfall: Dafür gibt es die separate Anleitung [Firewall für LiveKit Cluster einrichten](https://meetling.de/tutorials/firewall-fuer-livekit-cluster-einrichten).

## Zuerst den Datenpfad verstehen

Ein Client verbindet sich für Signalisierung und API üblicherweise über einen HTTPS- beziehungsweise WebSocket-Endpunkt. Die eigentlichen Audio- und Videodaten suchen anschließend über ICE einen passenden Weg. Dieser Weg ist häufig UDP direkt zum LiveKit-Server; wenn das Clientnetz UDP verhindert, kann ICE/TCP helfen. Ist ein direkter Pfad nicht möglich, kommt je nach Konfiguration TURN als Relay ins Spiel.

Ein erfolgreicher Aufruf der Meeting-Seite oder ein erfolgreicher WebSocket-Join beweist deshalb nicht, dass der Medienpfad funktioniert. Fehlt nach dem Join Audio oder Video, ist die Ursachenanalyse bei UDP, TCP-Fallback, TURN oder NAT sinnvoller als bei der Weboberfläche.

LiveKit beschreibt die bevorzugte Reihenfolge als ICE/UDP, TURN/UDP, ICE/TCP und TURN/TLS. Das ist eine Reihenfolge für Erreichbarkeit, keine Qualitätszusage: TURN/TLS erweitert den Zugang in restriktiven Netzen, ersetzt aber nicht die Vorteile eines funktionierenden direkten UDP-Pfads.

## Welche Ports müssen am selbst gehosteten Server offen sein?

Die folgende Übersicht fasst die in der LiveKit-Dokumentation beschriebenen Standardwerte zusammen. Entscheidend sind immer die Werte, die tatsächlich in Ihrer Serverkonfiguration gesetzt sind. Die Regeln beziehen sich auf eingehenden Verkehr am selbst gehosteten Server; im Clientnetz müssen die passenden ausgehenden Verbindungen ebenfalls erlaubt sein.

| Zweck | Standardport oder Bereich | Protokoll | Wann erforderlich? |
| --- | --- | --- | --- |
| API und WebSocket | `7880` | TCP | Intern hinter einem TLS-terminierenden Reverse Proxy oder Load Balancer; nicht als öffentlicher WebRTC-Medienport einplanen. |
| ICE-Medienpfad | `50000–60000` | UDP | Standardvariante, wenn kein UDP-Mux konfiguriert ist. |
| ICE über TCP | `7881` | TCP | Fallback für Clientnetze, in denen UDP nicht nutzbar ist. |
| ICE-UDP-Mux | `7882` | UDP | Alternative zum UDP-Portbereich, wenn `rtc.udp_port` gesetzt ist. |
| TURN über UDP | `3478` | UDP | Optional, wenn eingebettetes TURN aktiviert ist; dient dabei auch als STUN-Server. |
| TURN über TLS | `5349` | TCP/TLS | Optional für restriktive Clientnetze; in der konkreten Load-Balancer-Konfiguration prüfen. |

Für ein VM-Referenzsetup nennt LiveKit außerdem `443` für HTTPS und TURN/TLS sowie `80` für die Zertifikatsausstellung. Das ist kein Ersatz für die Konfigurationsprüfung: Ein abweichender Port in `rtc` oder `turn` muss sich in der Firewall und gegebenenfalls im Load Balancer wiederfinden.

### UDP-Portbereich oder UDP-Mux: genau eine Variante

Die beiden UDP-Optionen werden oft versehentlich zusammen als Pflichtliste übernommen. Das ist falsch. LiveKit verwendet den Bereich `rtc.port_range_start` bis `rtc.port_range_end` für ICE/UDP. Wird stattdessen `rtc.udp_port` gesetzt, nutzt LiveKit den Portbereich nicht; der UDP-Mux bündelt dann die ICE-Verbindungen auf dem konfigurierten einzelnen UDP-Port.

Prüfen Sie daher vor einer Regeländerung die Serverkonfiguration:

1. Ohne `rtc.udp_port`: den konfigurierten UDP-Portbereich freigeben.
2. Mit `rtc.udp_port`: den konfigurierten UDP-Mux-Port freigeben, nicht zusätzlich pauschal den Bereich.
3. Bei geändertem Standardwert: nur den tatsächlich gesetzten Wert dokumentieren und testen.

Diese Entscheidung reduziert unnötige Freigaben und verhindert, dass eine passende Regel am falschen Port gesucht wird.

## TURN und TURN/TLS richtig einordnen

TURN ist kein dauerhaft bevorzugter Medienweg, sondern ein Relay-Fallback. Embedded TURN ist bei LiveKit optional. Für TURN über UDP ist standardmäßig `3478/UDP` vorgesehen. TURN/TLS verwendet standardmäßig `5349` und hilft vor allem dort, wo ein Clientnetz nur ausgehendes TLS zulässt.

Für TURN/TLS braucht es eine eigene TURN-Domain sowie ein Zertifikat einer vertrauenswürdigen Zertifizierungsstelle. LiveKit terminiert TLS für TURN selbst; Zertifikat und privater Schlüssel gehören deshalb in die TURN-Konfiguration. Ein selbstsigniertes Zertifikat ist für diesen sicheren Endpunkt nicht geeignet.

Besondere Aufmerksamkeit erfordert der beworbene Port: Ohne Load Balancer soll `turn.tls_port` laut LiveKit auf `443` gesetzt werden, damit Clients den passenden Port erhalten. Mit Load Balancer ist eine L4-Weiterleitung für TURN/TLS Teil des Datenpfads. TCP/TLS auf `443` und UDP auf `443` sind unterschiedliche Protokollpfade und dürfen nicht als eine einzige Freigabe behandelt werden.

## NAT und öffentliche Adresse prüfen

Ein WebRTC-Server muss Kandidaten mit einer für Clients erreichbaren öffentlichen Adresse anbieten. In vielen Cloud- und NAT-Szenarien ist dafür `rtc.use_external_ip: true` vorgesehen, damit LiveKit die externe Adresse ermittelt und bewirbt. Eine private Adresse, eine falsche öffentliche Adresse oder zusätzliche NAT-Schichten können zu Kandidaten führen, die nur von einem Teil der Clients erreichbar sind.

Das betrifft besonders komplexe Deployments. Für LiveKit in Kubernetes dokumentiert der Hersteller direkten Netzwerkzugang beziehungsweise Host-Networking für Pods. Private oder serverlose Cluster mit zusätzlichen NAT-Schichten sind keine unterstützte Zielarchitektur. Das ist keine allgemeine Aussage gegen Kubernetes, sondern eine spezifische Betriebsgrenze von LiveKit.

## Typische Fehler: Symptom, Ursache, nächster Test

| Symptom | Wahrscheinliche Ursache | Nächster sinnvoller Test |
| --- | --- | --- |
| Meeting öffnet sich, aber Audio/Video verbindet nicht | Signalisierung funktioniert, der WebRTC-Medienpfad nicht. | Konfigurierte UDP-Variante, danach `7881/TCP` und anschließend TURN getrennt prüfen. |
| Außerhalb des Unternehmensnetzes funktioniert es, hinter VPN oder Proxy nicht | UDP oder nicht-HTTPS-TCP wird im Clientnetz gefiltert. | Mit dem Netzwerkteam ausgehende Ziele und Protokolle prüfen; TURN/TLS gezielt aus diesem Netz testen. |
| TURN/TLS wird nicht verwendet oder bricht ab | TURN-Domain, DNS, Zertifikat, `turn.enabled`, beworbener Port oder L4-Weiterleitung passen nicht zusammen. | Namensauflösung, Zertifikatskette, `turn.domain`, `turn.tls_port` und die Weiterleitung am Load Balancer abgleichen. |
| Clients erhalten private oder falsche Kandidaten | NAT beziehungsweise öffentliche Adresse ist falsch konfiguriert. | Öffentliche Erreichbarkeit und `rtc.use_external_ip` prüfen; zusätzliche NAT-Schichten erfassen. |
| Eine Freigabe wurde gesetzt, der Fehler bleibt | Regel passt nicht zur aktiven Portvariante oder zur Richtung des Datenverkehrs. | Konfigurationswerte, Firewall, Load Balancer und Testnetz als vollständigen Pfad dokumentieren. |

Ein TLS-inspektierender Webproxy ist dabei nicht automatisch transparent für Echtzeitmedien. Ebenso genügt Port `443` allein nicht als pauschale Lösung: Er kann Webzugriff und je nach Konfiguration TURN/TLS ermöglichen, ersetzt aber keinen erforderlichen ICE-UDP-Pfad, TCP-Fallback oder korrekt beworbene NAT-Adresse.

## Checkliste vor dem Produktionstest

- [ ] Deployment einordnen: selbst gehostet, nicht LiveKit Cloud oder eine vom Anbieter betriebene Instanz.
- [ ] Tatsächliche Werte für `rtc` und gegebenenfalls `turn` aus der aktiven Konfiguration festhalten.
- [ ] Entweder UDP-Portbereich oder UDP-Mux wählen und die passende Serverregel setzen.
- [ ] `7881/TCP` als ICE-Fallback prüfen, wenn restriktive Clientnetze unterstützt werden sollen.
- [ ] TURN nur aktivieren und freigeben, wenn ein Relay-Fallback benötigt wird; TURN/TLS mit separater Domain, vertrauenswürdigem Zertifikat und dem korrekten beworbenen Port testen.
- [ ] Öffentliche Adresse, NAT und gegebenenfalls die L4-Weiterleitung des Load Balancers nachvollziehen.
- [ ] Aus einem Zielnetz testen, das die späteren Einschränkungen tatsächlich abbildet, etwa Unternehmensnetz oder VPN.

Für eine LiveKit-Cloud-Umgebung gelten separate, vom Self-Hosting abweichende Regeln. Prüfen Sie dafür die aktuelle [LiveKit-Cloud-Firewall-Dokumentation](https://docs.livekit.io/deploy/admin/firewall/) und vermischen Sie deren Client-Outbound-Vorgaben nicht mit den eingehenden Serverports dieses Beitrags.

## Fazit: Konfiguration vor Portliste

Eine belastbare LiveKit-Firewall entsteht aus dem tatsächlichen Datenpfad: ICE-UDP als bevorzugte Variante, ein klar abgegrenzter TCP-Fallback, optionales TURN und eine korrekte öffentliche Adresse hinter NAT. Statt eine generische Portliste zu kopieren, sollten Teams die aktive LiveKit-Konfiguration, Firewall-Richtung, Load Balancer und das Zielnetz gemeinsam prüfen. So lässt sich nachvollziehbar unterscheiden, ob ein Fehler im Signalisierungspfad, im Medienpfad oder in der NAT-/TURN-Konfiguration liegt.

## Quellen

- [LiveKit: Ports and firewall](https://docs.livekit.io/transport/self-hosting/ports-firewall/)
- [LiveKit: Self-hosting deployment](https://docs.livekit.io/transport/self-hosting/deployment/)
- [LiveKit: Connecting](https://docs.livekit.io/intro/basics/connect/)
- [LiveKit: Virtual machines](https://docs.livekit.io/transport/self-hosting/vm/)
- [LiveKit: Kubernetes](https://docs.livekit.io/transport/self-hosting/kubernetes/)
