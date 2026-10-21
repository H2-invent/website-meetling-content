---
title: "PHP-Sicherheitslücken: Meetling-Team stellt schnell Update bereit"
description: "Dank Vorbereitung, Automatisierung und Kubernetes konnte unser Team schnell auf die PHP-Patches reagieren. Die vorsorgliche Abschaltung von Meetling war nicht nötig."
date: 2026-10-21
tags: ["PHP-Sicherheitslücken", "Betriebssicherheit", "On-Premises", "KI-Generiert"]
related:
  - "/blog/videokonferenz-selbst-hosten"
  - "/blog/sichere-videokonferenz-10-pruefkriterien"
  - "/sicherheit"
image: ./header-php-updates.png
imageAlt: "Drei Szenen zeigen eine symbolische PHP-Sicherheitslücke, das Einsetzen eines Updates für eine neue Meetling-Version und eine weiterlaufende Videokonferenz mit vier Personen."
author: "Emanuel Holzmann"
---

## Unser Team hat schnell ein Sicherheitsupdate bereitgestellt

Die aktuellen PHP-Sicherheitslücken haben auch uns bei Meetling beschäftigt. PHP gehört zur technischen Grundlage unserer Software. Deshalb mussten wir kurzfristig handeln.

**Unser Team hat die veröffentlichten PHP-Korrekturen in kurzer Zeit in neue Meetling-Versionen übernommen und ein Sicherheitsupdate bereitgestellt, damit unsere Nutzerinnen und Nutzer weiterhin sicher kommunizieren können. Dadurch mussten wir unseren gehosteten Dienst nicht herunterfahren.** Die zunächst erwogene vorsorgliche Abschaltung war nicht mehr nötig.

## Warum unser Team so schnell reagieren konnte

Unsere Abläufe für neue Softwareversionen waren vorbereitet und automatisiert. Als die offiziellen PHP-Patches vorlagen, konnte unser Team direkt darauf reagieren: die Korrekturen übernehmen, neue Meetling-Versionen erstellen und die aktualisierten Softwarepakete bereitstellen.

Dabei hat uns auch Kubernetes geholfen. Mit dieser Plattform betreiben und verwalten wir unsere Anwendungen in Softwarecontainern. Zusammen mit der Vorbereitung und Automatisierung gab uns diese Betriebsumgebung die Möglichkeit, das Sicherheitsupdate kurzfristig bereitzustellen.

Die Korrekturen für PHP stammen vom PHP-Team. Dass daraus so schnell ein verfügbares Update für Meetling wurde, lag an der Arbeit unseres Teams und den vorbereiteten Abläufen. Unser gehosteter Dienst, auch Software as a Service oder kurz SaaS genannt, musste deshalb nicht vorsorglich abgeschaltet werden. Aktuelle Betriebsinformationen finden Sie auf unserer [Statusseite](https://status.h2-invent.com/).

## Bei unseren On-Premises-Kunden lief die interne Kommunikation weiter

Bei Kunden, die Meetling im eigenen Rechenzentrum betreiben, konnten wir die Zugriffe von außen beschränken. **Bei allen von uns in dieser Situation betreuten On-Premises-Kunden blieb die interne Kommunikation ohne Ausfall stabil.** Es gab Einschränkungen bei der Bedienbarkeit und beim Zugang von außen. Intern konnten die Kunden weiter miteinander arbeiten.

Hier hat sich ein großer Vorteil einer eigenen Installation gezeigt: Wir konnten die externe Erreichbarkeit einschränken, ohne die interne Kommunikation stillzulegen. Interne Besprechungen konnten weiter stattfinden.

Das funktioniert, wenn die Installation so aufgebaut ist, dass die benötigten Dienste auch intern erreichbar bleiben. Eine Installation im eigenen Rechenzentrum bietet dafür Gestaltungsspielraum. Sie braucht aber ebenso Sicherheitsupdates wie ein gehosteter Dienst. Die beschränkten Zugriffe waren eine vorübergehende Schutzmaßnahme und ersetzen den Patch nicht.

Mehr zu den Voraussetzungen finden Sie in unserem Beitrag [Videokonferenz selbst hosten: Voraussetzungen und Verantwortung](https://meetling.de/blog/videokonferenz-selbst-hosten).

## Was hinter der PHP-Sicherheitsmeldung steckt

Am 21. Oktober 2026 hat das PHP-Team Updates gegen zwei kritische Schwachstellen veröffentlicht. Sie können Angreifern ermöglichen, ohne vorherige Anmeldung eigenen Programmcode auf einem betroffenen Server auszuführen. Die technischen Berichte führen sie als [CVE-2026-109618](https://github.com/php/php-src/security/advisories/GHSA-w8hw-w9fx-j79w) und [CVE-2026-109619](https://github.com/php/php-src/security/advisories/GHSA-6wmf-4rv5-p3rp).

Laut [PHP-Sicherheitsmeldung](https://www.php.net/) sind ungepatchte PHP-Installationen gefährdet, die Webanfragen verarbeiten. Das betrifft unterschiedliche Betriebsarten, darunter PHP-FPM und Apache mit mod_php. Ein Wechsel einzelner Einstellungen bietet keinen vollständigen Ersatz für ein Update.

Diese PHP-Versionen enthalten die Korrekturen:

| PHP-Versionszweig | Veröffentlichtes Sicherheitsupdate |
| --- | --- |
| PHP 8.5 | PHP 8.5.12 |
| PHP 8.4 | PHP 8.4.27 |
| PHP 8.3 | PHP 8.3.36 |
| PHP 8.2 | PHP 8.2.35 |

Bei Paketen einer Linux-Distribution oder eines Anbieters mit Langzeitunterstützung kann die Korrektur auch in eine bestehende Versionsbasis zurückübernommen worden sein. Maßgeblich ist dann die Sicherheitsmeldung des jeweiligen Paketlieferanten.

## Wenn Sie Meetling selbst betreiben

Stimmen Sie die Aktualisierung mit Ihrem Betriebsteam ab. Prüfen Sie dabei auch die verwendete PHP-Laufzeit und gegebenenfalls die Container-Images. Entscheidend ist, dass die korrigierte Software in den laufenden Instanzen ankommt. Kontrollieren Sie anschließend Anmeldung, Konferenzbeitritt und die benötigten Kommunikationswege, bevor Sie vorübergehende Zugriffsbeschränkungen aufheben.

Wenn Sie Unterstützung beim Update benötigen oder den internen Weiterbetrieb für Ihre Installation vorbereiten möchten, [sprechen Sie uns an](https://meetling.de/). Wir schauen mit Ihnen auf die konkrete Umgebung und darauf, welche Kommunikationswege bei einer solchen Sicherheitsmeldung verfügbar bleiben müssen.
