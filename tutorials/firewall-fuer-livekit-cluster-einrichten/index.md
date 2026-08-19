---
title: "Firewall für Livekit Cluster einrichten"
description: "Für eine optimale Video- und Audioqualität in der Videokonferenz empfehlen wir, die hier aufgeführten Firewalleinstellungen bei Ihnen vorzunehmen, um mit unserem Livekit Cluster zu arbeiten."
date: 2026-08-10
tags: ["tutorial", "meetling"]
order: 320
author: "H2 invent GmbH"
---

Für eine optimale Video- und Audioqualität in der Videokonferenz empfehlen wir, die hier aufgeführten Firewalleinstellungen bei Ihnen vorzunehmen, um mit unserem Livekit Cluster zu arbeiten.

## Ausgehende Firewall Regeln

Richten Sie folgende ausgehende Firewall Regeln bei Ihnen ein, damit alle Computer zu optimal mit unseren Livekit Servern kommunizieren können:

|  |  |  |  |
| --- | --- | --- | --- |
| **Verwendung** | **Protokoll** | **Port** | **Ziel IP** |
| Video- und Audioübertragung über WebRTC | UDP | 443 7882-7894 50000-60000 | - 89.58.42.137 - 89.58.4.74 - 152.53.245.242 - 152.53.246.45 |
| Video- und Audioübertragung über Coturn | TCP | 443 7881 | - 89.58.42.137 - 89.58.4.74 - 152.53.245.242 - 152.53.246.45 |
| Webfrontend und API (Über Webproxy möglich) isp.h2-invent.com und colo01.h2-invent.de (dig TXT colo01.h2-invent.de) | TCP | HTTP/HTTPS | - 188.68.62.69 - 152.53.131.90 - 93.177.67.164 |

## Domains, die für den Meetling Server verwendet werden:

Eine vielzahl dieser Domains wird für Websocket verwendet. Daher müssen in der Firewall diese Domains für Websocketverbindungen freigegeben werden. Alle Domains sind CNAMES und werden zu der Domain isp.h2-invent.com oder colo01.h2-invent.de zusammengefasst.

- app.meetling.de
- websocket.meetling.de
- collector.meetling.de
- livekit.meetling.de
- livekit-rtc.meetling.de
- app1.meetling.de
- app2.meetling.de
- sds.meetling.de
- sds-backend.meetling.de

Stand: 02.04.2025

## Hinweis

- Deaktivieren Sie mögliche Webproxies für folgende Domains, damit der Datentransfer auf den TCP-Ports 80,443 zum Livekit Cluster nicht weiter verarbeitert wird und somit eine zusätzliche Latenz entsteht:
  - \*.jitsi-admin.de
  - \*.meetling.de
  - \*.de.meetling.de
