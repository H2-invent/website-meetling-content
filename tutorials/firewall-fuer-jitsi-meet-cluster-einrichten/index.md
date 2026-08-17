---
title: "Firewall für Jitsi Meet Cluster einrichten"
description: "Für eine optimale Video- und Audioqualität in der Videokonferenz empfehlen wir, die hier aufgeführten Firewalleinstellungen bei Ihnen vorzunehmen, um mit unserem Jitsi Meet Cluster zu arbeiten."
date: 2024-10-21
tags: ["tutorial", "meetling"]
author: "H2 invent GmbH"
---

Für eine optimale Video- und Audioqualität in der Videokonferenz empfehlen wir, die hier aufgeführten Firewalleinstellungen bei Ihnen vorzunehmen, um mit unserem Jitsi Meet Cluster zu arbeiten.

## Ausgehende Firewall Regeln

Richten Sie folgende ausgehende Firewall Regeln bei Ihnen ein.

|  |  |  |  |
| --- | --- | --- | --- |
| **Verwendung** | **Protokoll** | **Port** | **Ziel IP** |
| Video und Audioübertragung | UDP | 10000 | 45.132.245.39 89.58.4.74 |
| Alternative Coturn | TCP | 443 | 194.13.82.142 |
| Webfrontend (Auch mit Webproxy möglich) | TCP | 80,443 | 194.13.82.142 188.68.62.69 |

## Hinweis

- Deaktivieren Sie mögliche Webproxies für folgende Domains, damit der Datentransfer auf den TCP-Ports 80,443 zum Jitsi Cluster nicht verarbeitert wird und somit eine zusätzliche Latenz entsteht:
  - \*.jitsi-admin.de
  - \*.meetling.de
  - \*.de.meetling.de
