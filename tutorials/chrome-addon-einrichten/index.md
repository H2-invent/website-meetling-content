---
title: "Chrome Addon einrichten"
description: "Anleitung zur Einrichtung der Meetling Chrome-Erweiterung per Managed Policy für Unternehmen und Bildungseinrichtungen."
date: 2025-07-08
tags: ["tutorial", "meetling"]
author: "H2 invent GmbH"
---

## 🛠 Einrichtung der Meetling Chrome-Erweiterung per Managed Policy

Um die Meetling-Erweiterung automatisch zu installieren und zu konfigurieren, kann eine **Managed Policy** verwendet werden. Diese Methode ist besonders für Unternehmen oder Bildungseinrichtungen geeignet, die zentrale Steuerung benötigen.

### 📁 1. Policy-Datei erstellen

Erstellen Sie eine Datei mit dem Namen `meetling.json` mit folgendem Inhalt:

```
{
  "3rdparty": {
    "extensions": {
      "eigjajmppcgpcghajhmbddidmdfeepce": {
        "meetlingAddonBaseUrl": "https://app.meetling.de",
        "meetlingAddonServerId": "2"
      }
    }
  },
  "ExtensionSettings": {
    "eigjajmppcgpcghajhmbddidmdfeepce": {
      "installation_mode": "force_installed",
      "toolbar_pin": "force_pinned",
      "update_url": "https://clients2.google.com/service/update2/crx"
    }
  }
}
```

### 💻 2. Datei im richtigen Verzeichnis ablegen

Je nach Betriebssystem muss die `meetling.json` in folgendem Verzeichnis abgelegt werden:

- **Windows (32-Bit):**  
  `C:\Program Files\Google\Chrome\Application\policies\managed\`
- **Windows (64-Bit):**  
  `C:\Program Files (x86)\Google\Chrome\Application\policies\managed\`
- **Linux:**  
  `/etc/opt/chrome/policies/managed/`

> **Hinweis:** Der Ordner `managed` muss ggf. manuell erstellt werden, falls er nicht existiert.

### 🔄 3. Chrome neu starten

Starten Sie Chrome neu, damit die Policy geladen wird.

### ✅ 4. Überprüfung

Rufen Sie in Chrome die Seite `chrome://policy` auf.

Dort sollten die folgenden Policies angezeigt werden:

- `meetlingAddonBaseUrl` → OK
- `meetlingAddonServerId` → OK

Auch der Eintrag unter `"ExtensionSettings"` mit Status `OK` zeigt, dass die Erweiterung korrekt installiert und konfiguriert wurde.

## 🛠 Setting up the Meetling Chrome Extension via Managed Policy

To automatically install and configure the Meetling Chrome extension, you can use a **Managed Policy**. This method is ideal for organizations or schools that require centralized deployment and configuration.

### 📁 1. Create the Policy File

Create a file named `meetling.json` with the following content:

```
{
  "3rdparty": {
    "extensions": {
      "eigjajmppcgpcghajhmbddidmdfeepce": {
        "meetlingAddonBaseUrl": "https://app.meetling.de",
        "meetlingAddonServerId": "2"
      }
    }
  },
  "ExtensionSettings": {
    "eigjajmppcgpcghajhmbddidmdfeepce": {
      "installation_mode": "force_installed",
      "toolbar_pin": "force_pinned",
      "update_url": "https://clients2.google.com/service/update2/crx"
    }
  }
}
```

### 💻 2. Place the File in the Correct Directory

Depending on your operating system, save the `meetling.json` file in one of the following locations:

- **Windows (32-bit):**  
  `C:\Program Files\Google\Chrome\Application\policies\managed\`
- **Windows (64-bit):**  
  `C:\Program Files (x86)\Google\Chrome\Application\policies\managed\`
- **Linux:**  
  `/etc/opt/chrome/policies/managed/`

> **Note:** The `managed` folder may need to be created manually if it does not exist.

### 🔄 3. Restart Chrome

Restart Chrome to apply the new policy settings.

### ✅ 4. Verify the Policy

Open the following page in Chrome:  
`chrome://policy`

You should see the following entries listed with status **OK**:

- `meetlingAddonBaseUrl`
- `meetlingAddonServerId`

Also, make sure the extension is listed under `ExtensionSettings` and marked as properly enforced.
