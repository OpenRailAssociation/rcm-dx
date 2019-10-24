---
title: "Schreiben von Spezifikationen mit Markdown"
subtitle: "Version 0.10"
keywords: [Spezifikationen, Markdown]
logo: "images/SBB-Logo.png"
logo-width: 150
lang: "de-CH"
titlepage: true
titlepage-rule-color: "EB0000"
author: "Ammann Michael, 24.10.2019"
...

# Schreiben von Spezifikationen mit Markdown

## Einleitung

Die in diesem Verzeichnis geschriebenen Dokumentationen wurden in der Sprache **Markdown** geschrieben. Diese bietet die Möglichkeit den Inhalt vom Aussehen des Dokuments zu trennen. Auch dieses Dokument ist in der Markup-Sprache "Markdown" geschrieben.
Damit dieses Dokument sowie die jeweiligen Spezifikationen in ein PDF und HTML umgewandelt werden können, müssen gewisse Vorgaben der Markdown-Sprache berücksichtigt werden.
Wie eine Spezifikation geschrieben wird und welche Tools dazu verwendet werden müssen, wird in dieser Hilfe beschrieben. Zusätzlich wird beschrieben, wie die Spezifikationen von **Markdown** in ein PDF umgewandelt werden können.

Weiter wird beschrieben, wie Bilder aus einer textbasierten Beschreibung erstellt werden können. Dies im Kapitel [PlantUml](#plantuml-bilder-aus-text)

## Markdown

Was ist **Markdown**? Diese Frage wird auf folgender Webseite super beantwortet: [Markdown cheat-sheat](https://www.markdownguide.org/cheat-sheet/)
**Markdown** kann im einfachsten Text-Editor bearbeitet werden (Windows Editor, Notepad++, Visual Studio Code, usw.). Die Dateien haben immer eine Endung mit ".md", dies müsste aber nicht so sein, es ist aber Hilfreicher um auf einen Blick den Typ zu erkennen.

Als Editor wird "Visual Studio Code" empfohlen, dieser ist kostenlos und ein Leichtgewicht. Zudem können Plugins für "Visual Studio Code" das Arbeiten mit **Markdown** erheblich vereinfachen. Für Software Entwickler bietet sich IntelliJ, Eclipse mit Plugins, Android Studio und/oder Visual Studio an.

### Unterschiede zu 0815 Markdown

Für die Umwandlung in ein PDF wird das Tool [Pandoc](https://pandoc.org/) verwendet. Dieses ist kostenlos und kann noch viele weitere Ausgabeformate als nur PDF.
Pandoc versteht einige weitere Befehle im **Markdown**, diese werden in den Unterkapiteln genauer beschrieben!

#### Neue Zeile

Eine neue Zeile kann durch zwei Leerschläge am Ende der Zeile erreicht werden oder durch eine separate leere Zeile.

#### Bildgrösse

Bilder werden immer in grösstmöglicher Grösse im PDF dargestellt. Ausschlaggebend ist die Breite der Seite, die die Bildgrösse definiert. Soll ein Bild kleiner dargestellt werden, so kann die Bildbreite, nach der Bildangabe, in Pixel angegeben werden. Das Beispiel soll dies aufzeigen:

\![Binärer Baum, Aufbau der Knotennummer](images/generated/binaryTree.png){ width=400px }

#### Fussnoten

Fussnoten werden am Ende der Seite dargestellt, falls Platz vorhanden ist, ansonsten auf der Folgeseite.  
Sie dienen zum Beispiel der genaueren Beschreibung eines Wortes. Eine Fussnote wird wie folgt erstellt:

Fussnote\^[Fussnote: Fussnoten werden am Ende der Seite dargestellt.]
**Ergibt:**
Fussnote^[Fussnote: Fussnoten werden am Ende der Seite dargestellt.]

#### Interne Links

Referenzen und Links auf Kapitelüberschriften im Dokument selber, können wie ein externer Link erstellt werden, jedoch ist die URL anders:

\[Bezeichnung](#titel-der-überschrift)  
**Ergibt:**  
[Bezeichnung](#interne-links)  

#### Tabellengrösse

Die Breite der Tabellen hängt von der Menge des Inhalts ab, sowie der Definition der Anzahl an Trennzeichen. Eine Tabelle besteht aus Header-Angaben sowie den Trennzeichen und den Inhaltlichen Tabellen. Nachfolgend eine Tabelle:

| Name | Notwendig | Beschreibung |
|-|--|----|
| RCM-DX | ja | Die Bezeichnung eines definierten Datenformates |

Anhand er Trennzeichen "-", kann die Breite der Spalte definiert werden. Die erste Spalte hat die Grösse ein, die zweite ist zweimal so gross wie die erste und die dritte ist viermal so gross wie die erste. Eine Angabe in Prozent oder in Pixel ist nicht möglich!

#### Mathematische Formeln

Soll eine mathematische Formel dargestellt werden kann dies wie folgt gelöst werden: Ein Dollar-Zeichen zu Beginn und am Ende der Formel ergibt die gewünschte Darstellung.

**Beispiel:** \$a*b=ab\$
**Ergibt:** $a*b=ab$

#### Titelblatt

Zu Beginn einer Seite können mithilfe von YAML^[YAML: Eine Auszeichnungssprache [YAML](https://de.wikipedia.org/wiki/YAML)] Angaben für die Titelseite definiert werden. Das Layout und die möglichen Felder sind für diese Spezifikationen definiert. Nachfolgend eine Auflistung und Beschreibung der möglichen Felder:

| Feld | Beschreibung |
|--|----|
| title | der Titel auf dem Titelblatt |
| subtitle | Untertitel oder in unserem Fall für die Versionsnummer |
| keywords | Schlüsselwörter (diese werden vor allem für die HTML-Generierung verwendet)|
| logo | definiert den Ort und Namen des Logos das in der Kopfzeile angezeigt wird |
| logo-width | die Breite des Logos in der Kopfzeile |
| lang | die Sprache in der das Dokument geschrieben ist |
| titlepage | Titelseite erstellen, ja oder nein |
| author | Name des Autors oder ein Subtitel |

## Verwendete Tools und deren Installation

### Pandoc

Link zur Webseite von Pandoc: [https://pandoc.org](https://pandoc.org)

Download Seite für Pandoc: [Pandoc Version 2.7.3](https://github.com/jgm/pandoc/releases/tag/2.7.3)
Der Windows Installer ist am Ende der Seite zu finden. Nach der Ausführung muss [MiKTeX](#miktex) installiert werden, damit die Umwandlung von **Markdown** in ein PDF funktioniert.

### MiKTeX

MiKTeX wird für die Erstellung von PDF's benötigt. Das Tool kann auf folgender Seite heruntergeladen werden: [MiKTex Download](https://miktex.org/download)  
Die Installation ist einfach und es benötigt keine Anpassungen an den Konfigurationen.  

## PlantUml, UML-Diagramme aus Text

Link zur Webseite von PlantUml: [http://plantuml.com/de/](http://plantuml.com/de/)

Mit PlantUml ist es möglich, Bilder aus Text zu erzeugen. Natürlich muss der Text in einer definierten weise geschrieben sein, damit dies funktioniert. Die Webseite von PlantUml beschreibt die verschiedenen UML-Diagramme und deren Syntax gut, die Beispiele auf der Seite helfen zum Starten.

Für die Spezifikationen wurde ein Verzeichnis 'images' angelegt. In diesem Verzeichnis sind die von den Spezifikationen verwendeten Bilder abgelegt. Im Unterverzeichnis 'generated', sind die von PlantUml erzeugten Bilder enthalten. Die UML-Diagramme werden in der Datei "images.puml" beschrieben. PlantUml wurde mit Java geschrieben und die JAR-Datei kann für die Umwandlung verwendet werden. Weiter Informationen sind auf der Webseite zu finden!
