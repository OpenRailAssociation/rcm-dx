---
title: "Vorlage für Spezifikationen"
subtitle: "Version 0.1"
keywords: [Spezifikationen, Markdown, RCM-DX]
logo: "images/SBB-Logo.png"
logo-width: 150
lang: "de-CH"
titlepage: true
titlepage-rule-color: "EB0000"
author: "Ammann Michael, 24.10.2019"
...

# Vorlage

Dies ist eine Vorlage für weitere Spezifikationen für Messmittel innerhalb dem RCM-DX Ökosystem.

## History

| Version | Datum | Autor | Beschreibung |
|-|-|--|----|
| V0.1 | 24.10.2019 | Michael Ammann (SBB) | Erstellung der Vorlage. Diese Seile ersetzen! |

## Approval

| Datum | Name | Funktion |
|---|---|------|
| Noch | zu | ergänzen! |

## Referenzierte Dokumente

| ID | Dokumentenname | Version | Datum |
|:-:|------|-|-|
| 0000 | Name | zu | definieren! |

## Introduction  

Einleitung in das Dokument und dessen Inhalt. Wie ein management Summary.

### Motivation

Grund für dieses Dokument...

## Überschrift 2

[Link auf eine Seite](https://www.sbb.ch/de/home.html)

![Bildbeschreibung](https://media.giphy.com/media/1AfIms1kZLGNinEvOI/giphy.gif)

### Überschrift 3

```xml
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xml type="xml">
    XML, mehrzeilig im Text
</xml>
```

Geht auch für andere Sprachen!

```java
class main{
    private static String getVersion(){
        return "V0.1";
    }
}
```

Oder eine inline `Source Code` definition.

#### Überschrift 4

| Linksbündig | Mittig ausgerichtet | Rechtsbündig |
|--|:--:|--:|
| Links | Mitte | Rechts |

##### Überschrift 5

[Link auf Hauptüberschrift "Vorlage"](#vorlage)

###### Überschrift 6

Mathematische Darstellung:

$BlockNumber=\frac{timestamp - Offset}{BlockSize}$
