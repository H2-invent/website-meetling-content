---
title: "PHP2Shell: Wie Meetling mit WAF und schnellen Updates reagiert hat"
description: "Vorbereitete Coraza-Regeln für den Übergang, neue Softwareversionen für die Behebung: So reagierte das Meetling-Team auf PHP2Shell."
date: 2026-10-21
tags: ["PHP2Shell", "PHP-Sicherheitslücken", "Coraza", "WAF", "KI-Generiert"]
related:
  - "/blog/videokonferenz-selbst-hosten"
  - "/blog/sichere-videokonferenz-10-pruefkriterien"
  - "/sicherheit"
image: ./header-php-updates.png
imageAlt: "Drei Szenen zeigen eine symbolische PHP-Sicherheitslücke, das Einsetzen eines Updates für eine neue Meetling-Version und eine weiterlaufende Videokonferenz mit vier Personen."
author: "Emanuel Holzmann"
---

## Schnell reagieren, ohne die Kommunikation stillzulegen

Die kritischen PHP-Sicherheitslücken haben auch uns bei Meetling unmittelbar betroffen: PHP gehört zur technischen Grundlage unserer Software. Eine vorsorgliche Abschaltung unseres gehosteten Dienstes stand deshalb zunächst im Raum.

**Unser Team konnte die Abschaltung vermeiden. Zuerst haben vorbereitete WAF-Regeln den Betrieb zusätzlich geschützt. Anschließend haben wir die offiziellen PHP-Patches in kurzer Zeit in neue Meetling-Versionen übernommen und das Sicherheitsupdate bereitgestellt.** So konnten unsere Nutzerinnen und Nutzer weiter kommunizieren.

Diese beiden Schritte hatten unterschiedliche Aufgaben: Die WAF half uns, die Übergangszeit zu überbrücken. Die neuen Softwareversionen enthalten die Patches, die die Schwachstellen in PHP beheben.

## 1. Sofortmaßnahme: Den Übergang mit Coraza absichern

Vor unserem Dienst steht die Web Application Firewall [OWASP Coraza](https://www.coraza.io/). Sie prüft Webanfragen, bevor diese Meetling erreichen.

Unsere Regeln waren bereits anhand der vorliegenden PHP2Shell-PoC-Informationen vorbereitet. Solche Proofs of Concept zeigen, wie sich eine Sicherheitslücke ausnutzen lässt. Wir konnten die daraus bekannten Anfragemuster deshalb schon am vorgeschalteten Filter berücksichtigen.

Damit hatten wir zusätzlichen Schutz für die Zeit zwischen der Freigabe der offiziellen PHP-Patches und der Bereitstellung unserer neuen Versionen. Während die WAF diese Muster filterte, konnte unser Team die aktualisierte Software erstellen.

Die WAF war dabei eine Übergangsmaßnahme. Sie filtert bestimmte Anfragen, beseitigt aber keinen Fehler in PHP. Für die dauerhafte Behebung brauchten wir die offiziellen Patches.

### Im eigenen Rechenzentrum lief die interne Kommunikation weiter

Bei unseren On-Premises-Kunden, die Meetling im eigenen Rechenzentrum betreiben, konnten wir zusätzlich die Zugriffe von außen beschränken. **Bei allen von uns in dieser Situation betreuten Kunden blieb die interne Kommunikation ohne Ausfall stabil.** Einschränkungen gab es bei der Bedienbarkeit und beim externen Zugang.

Hier hat sich der Vorteil einer eigenen Installation gezeigt: Die externe Erreichbarkeit ließ sich begrenzen, während interne Besprechungen weiterliefen. Voraussetzung ist, dass die dafür benötigten Dienste auch intern erreichbar bleiben. Auch diese Installationen benötigen anschließend das Sicherheitsupdate.

Mehr dazu finden Sie unter [Videokonferenz selbst hosten: Voraussetzungen und Verantwortung](https://meetling.de/blog/videokonferenz-selbst-hosten).

## 2. Dauerhafte Lösung: Die offiziellen Patches in Meetling übernehmen

Als die PHP-Patches vorlagen, konnte unser Team direkt reagieren. Wir haben die Korrekturen in neue Meetling-Versionen übernommen, die Softwarepakete gebaut und das Sicherheitsupdate kurzfristig bereitgestellt.

Dass das so schnell ging, lag an der Vorbereitung. Unsere Abläufe für neue Softwareversionen waren vorbereitet und automatisiert. Dazu kommt Kubernetes als Plattform für den Betrieb unserer Softwarecontainer. Diese Grundlage hat unserem Team ermöglicht, die offiziellen Korrekturen zügig in eine verfügbare Meetling-Version zu bringen.

**Die eigentliche Behebung steckt in den aktualisierten Softwareversionen.** Die WAF bleibt eine zusätzliche Schutzschicht. Unser gehosteter Dienst – Software as a Service, kurz SaaS – musste nicht vorsorglich heruntergefahren werden. Aktuelle Betriebsinformationen finden Sie auf unserer [Statusseite](https://status.h2-invent.com/).

### Welche PHP-Versionen die Schwachstellen beheben

Das PHP-Team hat am 21. Oktober 2026 Updates für [CVE-2026-109618](https://github.com/php/php-src/security/advisories/GHSA-w8hw-w9fx-j79w) und [CVE-2026-109619](https://github.com/php/php-src/security/advisories/GHSA-6wmf-4rv5-p3rp) veröffentlicht. Die Schwachstellen können Codeausführung aus der Ferne ohne vorherige Anmeldung ermöglichen.

Die [PHP-Sicherheitsmeldung](https://www.php.net/) nennt diese korrigierten Versionen:

| PHP-Versionszweig | Sicherheitsupdate |
| --- | --- |
| PHP 8.5 | PHP 8.5.12 |
| PHP 8.4 | PHP 8.4.27 |
| PHP 8.3 | PHP 8.3.36 |
| PHP 8.2 | PHP 8.2.35 |

Bei Distributionspaketen oder einem Anbieter mit Langzeitunterstützung kann der Patch in eine bestehende Versionsbasis zurückübernommen worden sein. Prüfen Sie deshalb die Sicherheitsmeldung Ihres Paketlieferanten und den tatsächlich laufenden Stand.

## Coraza-Regeln für die PHP2Shell-Übergangsmaßnahme

Für andere Betreiber teilen wir hier den Regelauszug zu unseren Upload-Progress-Filtern. Er zielt auf `PHP_SESSION_UPLOAD_PROGRESS`, den Standardnamen für die [PHP-Upload-Fortschrittsfunktion](https://www.php.net/manual/en/session.upload-progress.php). Dieser Funktionsbereich ist einer der im Bericht zu CVE-2026-109619 beschriebenen Angriffspfade.

Die Regeln sind in der von Coraza verwendeten SecLang-Syntax geschrieben:

```apache
SecRule REQUEST_HEADERS:Content-Type "@rx (?i)^multipart/" \
    "id:10090,phase:1,pass,nolog,t:none,\
    ctl:forceRequestBodyVariable=On,\
    tag:'h2invent-php2shell',\
    tag:'h2invent-global-deny',\
    tag:'cve/CVE-2026-109618',\
    severity:'CRITICAL'"

SecRule ARGS_GET_NAMES|ARGS_POST_NAMES "@rx (?i)^php_session_upload_progress$" \
    "id:10091,phase:2,deny,status:403,log,t:none,\
    msg:'PHP2Shell-Mitigation: session.upload_progress-Feld',\
    tag:'h2invent-php2shell',\
    tag:'h2invent-global-deny',\
    tag:'cve/CVE-2026-109619',\
    severity:'CRITICAL'"

SecRule REQUEST_BODY "@rx (?i)name\s*=\s*\"?php_session_upload_progress" \
    "id:10092,phase:2,deny,status:403,log,t:none,\
    msg:'PHP2Shell-Mitigation: upload_progress im Rohbody',\
    tag:'h2invent-php2shell',\
    tag:'h2invent-global-deny',\
    tag:'cve/CVE-2026-109619',\
    severity:'CRITICAL'"
```


### Was die Regeln prüfen

| Regel | Aufgabe |
| --- | --- |
| **10090** | Erkennt den angegebenen Multipart-Content-Type und setzt `ctl:forceRequestBodyVariable=On`. Die Aktion `pass` blockiert selbst nichts. |
| **10091** | Prüft erkannte GET- und POST-Parameternamen auf `PHP_SESSION_UPLOAD_PROGRESS` und sieht bei einem Treffer HTTP 403 mit Logeintrag vor. |
| **10092** | Prüft den verfügbaren `REQUEST_BODY` auf das angegebene `name=…`-Muster und sieht ebenfalls HTTP 403 vor. |

Die Sperre erfolgt durch `deny`; die Tags dienen der Zuordnung. Einzelheiten beschreibt die [Coraza-Aktionsreferenz](https://www.coraza.io/docs/seclang/actions/).

### Worauf es bei der Übernahme ankommt

Im wirksamen Coraza-Kontext müssen `SecRuleEngine On` und `SecRequestBodyAccess On` gesetzt sein. Im Modus `DetectionOnly` wird nicht blockiert. Prüfen Sie die Einbindung, freie Regel-IDs, Body-Limits und den Umgang mit Parserfehlern anhand der [Coraza-Direktiven](https://www.coraza.io/docs/seclang/directives/).

Für die Rohbody-Regel ist der Parser entscheidend: Laut [Coraza-Variablenreferenz](https://www.coraza.io/docs/seclang/variables/) befüllen `URLENCODED` und `RAW` die Variable `REQUEST_BODY`. Der normale Multipart-Prozessor tut das nicht. `forceRequestBodyVariable` kann die Variable erzeugen lassen, wenn sonst kein Prozessor ausgewählt würde; die Option garantiert keinen Rohzugriff auf reguläre Multipart-Uploads. Dort ist die Prüfung der erkannten Feldnamen durch Regel 10091 relevant.

Testen Sie die Regeln mit Ihrer Coraza-Version und Anwendung. Kontrollieren Sie die erwarteten HTTP-403-Antworten und Regel-IDs sowie gewöhnliche Formulare und Uploads. Die Filter können legitime Upload-Fortschrittsfunktionen oder harmlose Inhalte mit derselben Zeichenfolge treffen. Berücksichtigen Sie außerdem einen abweichenden Wert für `session.upload_progress.name` und Unterschiede bei der Auswertung von Parameternamen.

**Dieser Auszug filtert bestimmte Muster. Er ist keine vollständige Absicherung gegen beide PHP2Shell-Schwachstellen und ersetzt nicht das Update.**

## Unterstützung beim Update oder beim eigenen Betrieb

Wenn Sie Meetling selbst betreiben, prüfen Sie auch die PHP-Laufzeit und die eingesetzten Container-Images. Entscheidend ist, dass die korrigierte Software in den laufenden Instanzen ankommt. Kontrollieren Sie anschließend Anmeldung, Konferenzbeitritt und die benötigten Kommunikationswege, bevor Sie vorübergehende Zugriffsbeschränkungen aufheben.

Sie brauchen Unterstützung beim Update oder möchten Ihre interne Kommunikation auch während einer solchen Sicherheitslage aufrechterhalten? [Sprechen Sie uns an](https://meetling.de/). Wir klären mit Ihnen, wie sich kurzfristiger Schutz und ein schneller Updateprozess in Ihrer Umgebung umsetzen lassen.
