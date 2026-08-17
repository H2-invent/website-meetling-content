---
title: "Squid Webproxy für Livekit einrichten"
description: ""
date: 2026-01-16
tags: ["tutorial", "meetling"]
author: "H2 invent GmbH"
---

Bei der Verwendung eines Squid Webporoxy zusammen mit Coturn und Livekit muss mindestens folgendes eingerichtet sein um die maximal mögliche Anzahl an Benutzern und Bestmögliche Qualität zu erreichen:

### 1. File Descriptors zu niedrig

```
# /etc/systemd/system/squid.service.d/limits.conf
[Service]
LimitNOFILE=200000
```

```
# /etc/sysctl.conf
fs.file-max = 500000
```

### 2. Squid Connection Limits

```
# squid.conf

max_filedescriptors 200000

client_lifetime 1h
request_timeout 1h
persistent_request_timeout 1h
read_timeout 1h
shutdown_lifetime 5s
half_closed_clients off
```

### 3. TCP-Timeouts

```
sysctl -w net.ipv4.tcp_keepalive_time=600
sysctl -w net.ipv4.tcp_keepalive_intvl=30
sysctl -w net.ipv4.tcp_keepalive_probes=10
```

### 4. conntrack / NAT voll

```
sysctl -w net.netfilter.nf_conntrack_max=1048576
```

### HINWEIS / HAFTUNGSAUSSCHLUSS

Die in diesem Dokument genannten Konfigurationswerte wurden auf einem neu eingerichteten Squid Server getestet und validiert. Sie stellen allgemeine Empfehlungen dar und können je nach Systemumgebung, vorhandenen Einstellungen, Hardware-Ressourcen oder anderen Software-Komponenten zu unerwartetem Verhalten führen.

Jegliche Umsetzung erfolgt auf eigenes Risiko. Für Schäden, Ausfälle oder sonstige Probleme, die aus der Verwendung dieser Werte resultieren, übernehmen weder der Autor noch das Unternehmen eine Haftung. Vor Änderungen sollte stets ein Backup der aktuellen Konfiguration erstellt und die Auswirkungen in einer sicheren Testumgebung geprüft werden.
