---
title: "RCM-DX Specification"
subtitle: "Version 1.0.0"
keywords: [RCM-DX, Specification]
logo: "images/SBB-Logo.png"
logo-width: 150
lang: "de-CH"
titlepage: true
titlepage-rule-color: "EB0000"
author: "Schweizerische Bundesbahnen, SBB CFF FFS"
numbersections: true
secnumdepth: 5
colorlinks: true
toc-own-page: true
...

# RCM-DX Structure

## History

| Version | Datum | Autor | Beschreibung |
|--|--|---|------|
| V0.1 | 06.03.2015 | Martin Frey (SCS) | Initial version |
| V0.2 | 20.03.2015 | Martin Frey (SCS) | Extensions |
| V0.3 | 15.04.2015 | Patrik Wernli (SCS) | Review |
| V0.4 | 20.04.2015 | Martin Frey (SCS) | Extensions and revised |
| V0.5 | 03.05.2015 | Patrik Wernli (SCS) | Formal Adaptions |
| V0.6 | 12.05.2015 | Martin Frey (SCS) | PDR Feedback: Storing of Booleans, comments allowed on all levels, format independent of video codec, flags (including simulation) on session level. Schemas for exceedances, comments and drawings added |
| V0.7 | 13.07.2015 | Patrik Wernli (SCS) | Finalized for CDR |
| V0.8 | 02.10.2015 | Martin Frey (SCS) | Event model added, reference to specification event schema added. |
| V0.9 | 30.11.2015 | Patrik Wernli (SCS) | Adaptions for Infotrans position model. Version concept removed. Event model updated. |
| V0.10 | 21.12.2015 | Martin Frey (SCS) | Review |
| V0.11 | 21.12.2015 | Patrik Wernli (SCS) | Revised after review |
| V0.12 | 16.02.2016 | Pascal Brem (SCS) | Topology model in configuration. |
| V0.13 | 17.02.2016 | Martin Frey (SCS) | Review topology model |
| V0.14 | 19.02.2016 | Pascal Brem (SCS) | Sections added to file format. |
| V0.15 | 23.02.2016 | Martin Frey (SCS) | Global configuration and settings updated |
|  V0.16 | 11.07.2016 | Pascal Brem (SCS) | New Hash code attribute for the topology. |
| V0.17 | 15.07.2016 | Pascal Brem (SCS) | New units and data types for positions |
| V0.18 | 03.01.2018 | Pascal Brem (SCS) | New GTG Track Id in the Topology. |
| V0.19 | 03.01.2018 | Pascal Brem (SCS) | Events are stored on session level. |
| V0.20 | 09.01.2018 | Pascal Brem (SCS) | Events and Sections in a group. |
| V0.21 | 09.01.2018 | Patrik Wernli (SCS) | Added chapter “HDF5 File Format Versions” |
| V0.22 | 11.04.2018 | Patrik Wernli (SCS) | Changed document template to official publishing template |
| V0.23 | 16.08.2018 | Pascal Brem (SCS) | Changes in the channel basis definition. |
| V0.24 | 16.08.2018 | Pascal Brem (SCS) | New attributes on the picture block channel. |
| V0.25 | 04.09.2018 | Pascal Brem (SCS) | New minor version. |
| V0.26 | 28.11.2018 | Pascal Brem (SCS) | New minor version for the topology attributes. |
| V0.27 | 08.01.2019 | Pascal Brem (SCS) | New availability group. |
| V0.28 | 05.06.2019 | Pascal Brem (SCS) | New switchtracks in the DfA |
| V1.0.0| 29.10.2019 | Michael Ammann (SBB) | Komplette Änderung des Designs, Anpassung der Struktur RCM-DX sowie inhaltliche Änderungen die einen Major Release der Spezifikation und des RCM-DX Formats ergeben. |

## Approval

| Datum | Name | Funktion |
|---|---|------|
| - | - | - |

## Referenzierte Dokumente

| ID | Dokumentenname | Version | Datum |
|--|------|--|--|
| P0402-4-350 | RCM_DX_specification_0.28.docx | V0.28 | 05.06.2019 |

## Introduction  

### Motivation  

Um die Sicherheit der Reisenden in den SBB Schienenfahrzeugen sicherzustellen, überprüft und repariert die SBB ihr Schienennetz regelmässig. Die Überprüfung wird neben den manuellen Messungen auch automatisch durchgeführt, dies mithilfe von Mess- und Diagnosefahrzeugen. Bei den Messungen fällt eine riesige Datenmenge an, die danach einfach verarbeitet und archiviert werden soll.  
Für die Darstellung und Weiterverarbeitung dieser Daten, wurde bereits ein ganzes Ökosystem aufgebaut. Aus diesem Grund soll mit dieser Spezifikation und somit dem RCM-DX, eine definierte Schnittstelle beschrieben werden, damit Umsysteme die sich an diese Spezifikation richten, die Daten in irgend einer Form, weiterverarbeiten können.  
Diese Spezifikation können andere Bahnbetreiber ebenfalls verwenden. Aus diesem Grund liegt diese Spezifikation der Öffentlichkeit zur Verfügung. Die Weiterentwicklung wird durch die SBB getrieben, diese ist auch für die Koordination und das Release dieser Spezifikation verantwortlich.

### Hinweis

#### RCM-DX Struktur

Die in diesem Dokument beschriebene Struktur (RCM-DX), definiert Gruppen und Datensets sowie Attribute, die für Software Lösungen, die dieses Format unterstützen, eingehalten werden muss.  
Eine Erweiterung dieser Spezifikation ist erlaubt, jedoch ist nicht garantiert, dass die Daten von bestehenden Systemen gelesen sowie verarbeitet werden können. Dies muss bei einem Datenaustausch berücksichtigt werden.  

#### Versionierung

Das RCM-DX Datenformat unterliegt Änderungen, diese sind ersichtlich durch die Versionsnummer im Dokument, siehe Kapitel [Root Group](#root-group). Die Versionsnummer besteht aus drei Zahlen die durch einen Punkt getrennt wurden und setzt sich wie folgt zusammen: **[Major].[Minor].[Patch]**. Beispiel: **1.0.0**  

**Major:** Zeigt eine Änderung die für das Datenformat grosse Umstellung bedeuten und nicht Rückwärts kompatibel sind. Zum Beispiel die Änderung der Strukturen oder Benennungen von bestehenden Gruppen usw.  
**Minor:** Kleinere Änderungen, die eine Erweiterung darstellen und immer noch Rückwärts kompatibel sind. Zum Beispiel das Definieren neuer Gruppen für Datensets oder neue Datentypen usw.  
**Patch:** Hinweis auf Fehlerbehebungen. Dies können Anpassungen von Beschreibungen in dieser Dokumentation sein, alles was in dieser Spezifikation angepasst wird, aber die Struktur des RCM-DX nicht beeinflusst.  

#### Text Formatierungen

Die einzelnen Formatierungen von Text, werden hier kurz aufgezeigt, da diese das Lesen dieser Spezifikation deutlich vereinfachen.

Verweise auf ein anderes Kapitel, sehen wie folgt aus: [Verweis auf Kapitel "Hinweis"](#hinweise)  
Verweise auf eine Webseite, sehen wie folgt aus: [Link auf eine URL "sbb.ch"$\to$](http://www.sbb.ch)  
Ein Wort das einen Verweis auf eine Fussnote erhält, sieht wie folgt aus: Fussnote^[Fussnote: Fussnoten werden am Ende der Seite dargestellt.]  

> Das hier ist ein wichtiger Hinweis, bitte beachten!

#### Diagramme

Im nachfolgenden Bild eine Übersicht eines verwendeten Diagrammtyps und dessen Elemente:

![RCM-DX Diagramm Übersicht](images/generated/RCM_DX_diagram_example.png)

## Definitionen

In diesem Dokument werden neben den inhaltlichen Beschreibungen auch Technische Restriktionen spezifiziert. Dieses Kapitel gibt eine Übersicht über die verwendeten Datentypen, Arten von Benennungen und vielen weiteren wichtigen Punkten.

### Dateibenennungen

Dateien die der RCM-DX Spezigikation folgen, sollen einheitlich benannt werden. Die Bennenung soll folgendem Muster folgen:

`yyyymmdd-hhmmss_MESSSYSTEM_[created]-yyyymmdd-hhmmss.rcmdx`

Datum und Zeit der Messung, gefolgt vom Kurzzeichen des Messsystems, danach das Wort "created" und anschliessend das Datum und die Zeit der Erstelleung der Datei. Zum Schluss die Dateiendung `rcmdx`. Die Trennzeichen sind wie oben abgebildet zu setzen.

Beschreibung der Elemente:

| Element | Beschreibung |
|--|------|
| `yyyymmdd` | Datum: Jahr vierstellig, Monat zweistellig, Tag zweistellig. |
| `hhmmss` | Zeit: Stunden zweistellig, Minuten zweistellig, Sekunden zweistellig |
| `MESSSYSTEM` | Hier folgt das eindeutige Kurzzeichen des Messsystems wie in den Spezifikationen definiert. Zum Beispiel "TGMS" |
| `[created]` | Das Wort "created" das darauf hinweist, dass danach das Datum und die Zeit der Erstellung der Datei folgt. |
| `.rcmdx` | Dateiendung des RCM-DX Dateiformats. |

> TODO: Definieren ob Endung h5 oder rcmdx!

### Primitive Datentypen und andere

Mögliche Datentypen für Kanäle sollen aus der HDF5 Spezifikation entnommen werden.  

Nachfolgend sind Datentypen beschrieben die in dieser Spezifikation verwendet wurden und eine genauere Beschreibung benötigen.  

| Name | Beschreibung | Beispiel |
|--|------|----|
| UUID | Universally Unique Identifier als Eindeutige ID | `550e8400-e29b-11d4-a716-446655440000` |
| Timestamp | Eindeutiger und Weltweit definiertes Format eines Zeitpunktes, seit dem 1. Januar 1970 00:00 Uhr UTC ohne Schaltsekunden | `1553237099000000000` |

### (HDF5) Gruppen

Ist die Rede von einer Gruppe in diesem Dokument, sind die Gruppen im HDF5 Format gemeint (vom Typ `HDF5 Group`). Diese enthalten weitere Gruppen oder Datensets.

Ist ein Name einer Gruppe in diesem Dokument, in Grossbuchstaben geschrieben (zum Beispiel "TOPOLOGY"), so ist dieser exakt so, in der RCM-DX Datei zu finden. Ist die Bennenung einer Gruppe nicht fix definiert, so wird im entsprechenden Kapitel genauer beschrieben, wie sich der Name zusammensetzt.

Soll ein Name einer Gruppe in einer Form sichtbare Wort-Trennungen enthalten, so soll dies mit einem Punkt erfolgen. Dazu folgendes Beispiel: "XPOS.DATA.LONGITUDE".  
Gruppen werden in dieser Spezifikation wie folgt beschrieben:

| Name | Parent | Mandatory |
|--|--|--|
| SectionInfo | SESSION | yes |

**Name:** Der Name der Gruppe  
**Parent:** Eine Gruppe kann eine Untergruppe einer Gruppe sein, hier wird der Name dieser Gruppe erwähnt  
**Mandatory:** Ist die Gruppe zwingend notwendig und muss vorhanden, so steht hier `yes` , ansonsten `no`  

### (HDF5) Attribute

Im RCM-DX können Attribute, den Gruppen sowie den Datensets zugewiesen werden. Die Namen der Attribute werden in der UpperCamelCase-Notation[^Upper-Camel-Case-Notation] geschrieben. Attribute sind immer vom Typ `HDF5 Attribut`, ausser es ist anders angegeben.

Attribute werden in dieser Spezifikation wie folgt beschrieben:

| Name | Data Type | Parent | Mandatory | Description |
|--|----|--|--|-------|
| StartTime | 64 bit integer | "SESSION" | yes | Startzeit in Milisekunden, zum Beispiel: "1553237099000000000"  |

**Name:** Der Name des Attribute  
**Data Type:** Primitiver Datentyp des Attributs, diese beschriebt den Typ des Inhaltes im Attribut selber  
**Parent:** Ein Attribut ist immer einer Gruppe oder einem Datenset zugeordnet, hier wird der Name dieser Gruppe oder des Datensets erwähnt  
**Mandatory:** Ist das Attribut zwingend notwendig und muss vorhanden sowie einen Wert beinhalten, so steht hier `yes` , ansonsten `no`  
**Description:** Beschreibung und oder Beispiele des Attributs  

[^Upper-Camel-Case-Notation]: Die Upper Camel Case Notation definiert die Art und Weise wie eine zusammengesetzte Bezeichnung geschrieben wird. Weitere Informationen dazu unter folgendem Link: [Uper Camel Case$\to$](https://en.wikipedia.org/wiki/Camel_case)

### (HDF5) Datenset

Ein Kanal und dessen Datenset, kann verschiedene Arten und Typen von Daten aufnehmen. Die HDF5 Gruppe definiert die Art und Weise der Ablage, nicht aber die Bennenungen.  
Ein Datenset ist immer vom HDF5-Typ `HDF5 Dataset`.  
Nachfolgend eine Auflistung der möglichen Arten, wie Daten im RCM-DX abgelegt werden können:

| Ablageart | Beschreibung |
|--|-------|
| Einzelwerte | Einfaches Array von undefinierter Länge. Ergibt ein Datenset. |
| Indexierte Einzelwerte | Einfaches Array der Dimension 1D. Neben einem Datenset `timestamp` wird ein Datenset `timeindex` erstellt, dass eine Indexierung der Daten enthält und das lesen der Daten vereinfacht. Das Datenset `timeindex` wird im Kapitel [Time Indices](#time-indices) genauer beschrieben |
| Bild | Ein Bild, das zu einem definierten Zeitpunkt aufgenommen wurde |
| Video | Ein Video das als Stream in mehrere einzelne Blöcke definierter grösse, aufgeteilt und gespeichert wurde |

Die Datenset werden in der lowerCamelCase-Notation[^lower-Camel-Case-Notation] beschrieben. Datensets werden in dieser Spezifikation wie folgt beschrieben:

| Name | Date Type | Parent | Mandatory | Ablageart |
|--|----|----|--|--|
| timestamp | 64 bit integer | Datenquellengruppe | yes | Einzelwerte |

**Name:** Der Name des Datensets  
**Data Type:** Primitiver Datentyp des Inhaltes im Datenset, somit der Datentyp der enthaltenen Daten  
**Parent:** Ein Datenset ist immer einer Gruppe zugeordnet, hier wird der Name dieser Gruppe erwähnt  
**Mandatory:** Ist das Datenset zwingend notwendig und muss vorhanden sein, so steht hier `yes` , ansonsten `no`  
**Ablageart:** Eine, der in diesem Kapitel beschriebenen Ablagearten  

Beschreibungen zum Datenset werden ausserhalb der Tabelle ergänzt.  

[^lower-Camel-Case-Notation]: Die lower Camel Case-Notation definiert die Art und Weise wie eine zusammengesetzte Bezeichnung geschrieben wird. Weitere Informationen dazu unter folgendem Link: [lower Camel Case$\to$](https://en.wikipedia.org/wiki/Camel_case)

#### HDF5 Compression

Um Platz zu sparen, können komprimierungsfilter auf Datensets angewendet werden. Nachfolgend ist bei allen Datensets ersichtlich, ob dies empfohlen wird oder nicht. Die Komprimierung und welche Funktionen die HDF5 Gruppe anbietet, wird auf deren Webseite genauer beschrieben unter dem Link: [HDF5 Compression Webseite$\to$](https://support.hdfgroup.org/HDF5/faq/compression.html). Bei einem Datenset steht dann zum Beispiel, dass das "HDF5 Compression" erlaubt ist oder nicht.

#### HDF5 Chunking

Neben dem "HDF5 Compression" gibt es das "HDF5 Chunking" für Daten innerhalb eines Datensets. Dies bedeutet, die Daten werden in Blöcke aufgeteilt, diese wiederum können eigenständig bearbeitet werden. Dies erlaubt auch einen schnelleren Zugriff auf Teile der Daten. Ob eine Aufteilung erlaubt und empfohlen wird, steht jeweils bei einem Datenset, als Beispiel: "HDF5 Chunking" ist erlaubt und empfohlen. Das HDF5 Chunking wird auf der Webseite der HDF5 Gruppe genauer beschrieben: [HDF5 Chunking Webseite$\to$](https://support.hdfgroup.org/HDF5/doc/H5.user/Chunking.html)

#### Einzelwerte

Kanäle, die einzelne Messwerte erfassen, enthalten ein Datenset mit dem Namen "data", dieses Dataset ist obligatorisch. Einzelwerte werden in diesem Datenset als 1D Array abgelegt, die Länge dieses Array`s (oder Liste), ist dabei nicht begrenzt.

Die möglichen Datentypen sind durch die HDF5 Group definiert, und können auf der Webseite der HDF5 Group nachgelesen werden.

Boolsche Werte (`true`/`false`) werden als `8 bit integer, litle endian` abgebildet, Null bedeutet `false`, alle Werte grösser Null bedeuten `true`.

Werden Messdaten aufgenommen im 3D Raum, so müssen drei verschiedene Kanäle erstellt werden.

Folgende Attribute sind dieser Art des Datenset zugewiesen:

| Name | Data Type | Parent | Mandatory | Description |
|---|----|--|--|-----|
| Unit | string | Datenset | yes | Eine physikalische Einheit oder leer, falls die Daten keiner physikalischen Einheit entsprechen|

##### Koordinaten

Messdaten die einem Koordinatensystem zugewiesen werden können, erhalten einen definierten Namen nach folgendem Muster: `cord.CN`.  
Diese Art der Datenspeicherung erlaubt es, mehrere Einträge pro Messzeitpunkt aufzunehmen.

| Element | Beschreibung |
|--|------|
| cord | Einfache Zeichenfolge zur Kennzeichnung von Daten des Typs Koordinaten |
| . | Trennzeichen |
| C | Zusatzzeichen zur Kennzeichnung von Daten des Typs Koordinaten |
| N | Index Nummer beginnend mit "0", steigend je weiteren Kanal |

Das Datenset ist wie folgt definiert:

| Name | Date Type | Parent | Mandatory | Ablageart |
|--|------|--|--|--|
| cord.CN | 8, 32 oder 64 bit signed integer oder 64 oder 32 bit floating point; (jeweils litle endian) | Datenquellengruppe | yes | Einzelwere |

HDF5 Chunking ist erlaubt und empfohlen.  
Die HDF5 Compression ist erlaubt.  

Folgende Attribute sind dieser Art des Datenset zugewiesen:

| Name | Data Type | Parent | Mandatory | Description |
|---|----|--|--|-----|
| Unit | string | Datenset | yes | Eine physikalische Einheit oder leer, falls die Daten keiner physikalischen Einheit entsprechen |

###### Sample Index

Werden Datensets für Koordinaten angelegt, so muss zwingend ein Datenset mit dem Namen "sampleindex" vorhanden sein. Dieses Datenset beinhaltet pro Messzeitpunkt (pro Eintrag im Datenset "timestamp"), die genaue Anzahl der Messeinträge in dem Datenset, mit der Bezeichnung "cord.CN". Beim lesen und interpretieren der Daten ist diese Information wichtig, da die Daten in den Datensets "cord.CN" als Array und ohne weitere Information dazu abgelegt sind.

Die im Datenset "sampleIndex" angegebene Gruppengrösse kann/darf untereinander abweichen.

**Example**  
Als Beispiel dient hier das Schienenquerprofil. Zu einem Zeitpunkt werden mehrere Punkte einem Schienenprofil gemessen und abgelegt. Es wird jeweils für die X-Achse sowie für die Y-Achse ein Kanal angelegt mit den Namen "cord.C0" und "cord.C1".

Im Datenset "sampleindex" wird nun die Anzahl der zusammengehörenden Einträge aufgenommen. Steht darin zum Beispiel die Zahl "10", so gehören die ersten zehn Einträge von "cord.C0" und "cord.C1" zusammen. Der erste Eintrag aus "cord.C0" ist der Wert auf der X-Achse und bei "cord.C1" der Wert der Y-Achse und dies gilt für die nächsten 10 Einträge. Nach den ersten zehn Einträgen folgt die nächste Gruppe mit den nächsten zehn Einträgen.

Nachfolgend ein Bild einer Schienenwuerprofilmessung mit ungefähr 2000 Messpunkten:

![Bild einer Schienenquerprofilmessung](images/SchienenquerprofilSample.jpg)

#### Bilder

Bilder können in komprimierter oder unkomprimierter Form abgespeichert werden. Das Format der Bilder wird in einem Attribut hinterlegt, damit das Bild korrekt ausgelesen werden kann.  
Bilder werden als binäre Datenblöcke abgelegt, ein Bild ergibt somit ein Datenset.  

Alle Bilder werden in einer Gruppe mir dem Namen `IMG` abgelegt. Alle Bilder in dieser Gruppe haben die gleichen Eigenschaften, die in den Attributen hinterlegt sind.  

| Name | Parent | Mandatory |
|--|----|--|
| IMG | "DatasourceGroup" | yes |

Die Gruppe `IMG` erhält folgende Attribute für die genauere Beschriebung der darin enthaltenen Bilder:

| Name | Data Type | Parent | Mandatory | Description |
|---|----|--|--|-----|
| ContentType | string | IMG | yes | Datentyp der Bilder als MIME-Typ[^MIME] angegeben, zum Beispiel `Content-Type: <image/jpeg>`|
| DataTyp | string | IMG | no | Beschreibung zum Datentyp, wenn kein Standard Bild, siehe [ContentType ohen Image MIME-Typ](#contenttype-ohne-image-mime-typ) |
| ResolutionType | string | IMG | yes | Angaben zur Punktedichte der Bilder (Beispiel: $ppmm = Pixel pro Milimeter$) |
| ResolutionInfoX | 32 bit integer | IMG | yes | Auflösung in X-Richtung |
| ResolutionInfoY | 32 bit integer | IMG | yes | Auflösung in Y-Richtung |

Bilder können in X- und Y-Richtung unterschiedliche Auflösungen haben, dies muss für eine korrekte Darstellung und Auswertung der Bilder berücksichtigt werden.

HDF5 Chunking wird empfohlen und die HDF5 Compression ist erlaubt.  

##### ContentType ohne Image MIME-Typ

Falls das erzeugte und gespeicherte Bild, eine eigene Spezialsoftware benötigt um dieses Darzustellen, so soll folgender MIME-Typ in das Attribut `ContentType` hintelegt werden: `Content-Type: <application/octet-stream>`.  
Um weitere Informationen zu hinterlegen, zum Beispiel welches System die Daten erzeugt hat, kann ein nueues Attribut der Gruppe `IMG` hinzugefügt werden. Das Attribut erhält den Namen `DataTyp`.

##### Benennung des Datenset für ein Bild

| Name | Date Type | Parent | Mandatory | Ablageart |
|---|-----|--|--|--|
| IMG.NNNNNNNNN | 8, 16, 32 bit integer, je nach Farbtiefe | IMG | yes | Bild |

Die Bilder werden nach folgendem Muster benannt: `IMG.NNNNNNNNN`, nachfolgend eine Beschreibung der einzelnen Elemente.

| Element | Beschreibung |
|--|-------|
| IMG | Zeichenkette für die Bezeichnung eines Bildes |
| . | Trennzeichen |
| NNNNNNNNN | Bildnummer, beginnend mit 000000000 (neun Zeichen)|

#### Videos

Wie bei den Bildern können Video in komprimierter oder unkomprimierter Form abgespeichert werden. Das Format wird in einem Attribut hinterlegt, um das lesen der Bilder zu vereinfachen.  
Videos werden als Stream in einzelne Blöcke abgespeichert. Die Blöcke sind jeweils einzelne Datenset mit einer vorgegebenen Benennung.

| Name | Parent | Mandatory |
|--|--|--|
| VID | Datenquellengruppe | yes |

Nachfolgend eine Auflistung der Attribute die der Datengruppe `VID` zugewiesen sind:

| Name | Data Type | Parent | Mandatory | Description |
|---|---|--|--|-----|
| ContentType | string | VID | yes | Datentyp des Videostrams als MIME-Typ[^MIME] angegeben, zum Beispiel `Content-Type: <video/h264>`|
| DataTyp | string | VID | no | Beschreibung zum Datentyp, wenn kein Standard Video Format, siehe [ContentType ohne Video MIME-Typ](#contenttype-ohne-video-mime-typ) |
| ResolutionX | 32 bit integer | VID | yes | Auflösung in X-Richtung in Pixel |
| ResolutionY | 32 bit integer | VID | yes | Auflösung in Y-Richtung in Pixel |
| FramesPerSecond | 16 bit integer | VID | yes | Anzahl Bilder Pro Sekunde (fps), in der das Video aufgenommen wurde |
| PreambleDuration | 64 bit integer | VID | yes | Zeitdauer des Einleitungsviedeo Bereichs in Nanosekunden  |
| TrailerDuration | 64 bit integer | VID | yes | Zeitdauer des Abspannvideo Bereichs in Nanosekunden |

> TODO: Abklären:
> Wann gibt es ein Preamble und ein Trailer?
> Was ist im Datenset Duration?

[^MIME]: Eine Auflistung der möglichen MIME-Typen ist unter dem Link [https://www.iana.org/assignments/media-types/media-types.xhtml$\to$](https://www.iana.org/assignments/media-types/media-types.xhtml) zu finden. Diese wird von der [Internet Assigned Numbers Authority, IANA$\to$](https://www.iana.org/) geführt.

##### ContentType ohne Video MIME-Typ

Falls der erzeugte und gespeicherte Videostream, eine eigene Spezialsoftware benötigt um diesen Anzuzeigen, soll folgender MIME-Typ in das Attribut `ContentType` hintelegt werden: `Content-Type: <application/octet-stream>`.  
Um weitere Informationen zu hinterlegen, zum Beispiel welches System die Daten erzeugt hat, kann ein nueues Attribut der Gruppe `VID` hinzugefügt werden. Das Attribut erhält den Namen `DataTyp`.

##### Bennenung des Datenset für ein Video

Ein video Datenblock wird nach folgendem Muster benannt: `VID.NNNNNNNNN`, nachfolgend eine Beschreibung der einzelnen Elemente.

Element|Beschreibung|
|--|---|
| VID | Zeichenkette für die Bezeichnung eines des Videos |
| . | Trennzeichen |
| NNNNNNNNN | Videonummer, beginnend mit 000000000 (neun Zeichen), aufsteigend +1|

HDF5 Chunking und HDF5 Compression wird nicht empfohlen.

## Datenquellen

### Timestamp

Jeder Eintrag in einem Kanal, hat eine Referenz auf ein Datenset mit dem Namen `timestamp` innerhalb der Datenquellengruppe. In diesem `timestamp` Datenset, gibt es gleichviel Einträge wie es Einträge in einem Datenset eines Kanals gibt. Eingetragen wird ein Zeitstempel in Nanosekunden seit dem 01.01.1970 um 00:00 Uhr UTC.  

Die Zeitstempel sind immer in steigender Reienfolge abgelegt und dürfen keine Sprünge enthalten.  

| Name | Date Type | Parent | Mandatory | Ablageart |
|--|----|----|--|--|
| timestamp | 64 bit integer | Datenquellengruppe | yes | Einzelwerte |

HDF5 Chunking ist erlaubt und HDF5 Compression wird empfohlen.

Diese Zeitstempel werden entweder anhand einer definierten gefahrenen Strecke oder anhand einer Frequenz aufgezeichnet, dies wird im Kapitel [Common Trigger Distance or Frequence](#common-trigger-distance-or-frequence) genauer Beschrieben. Neben den Zeitstempel folgen die Messmittel dieser Vorgabe und nehmen zum gleichen Zeitpunkt auch Messdaten auf. Ein zentrales System dient als Taktgeber für die Datenaufnahme aller Systeme (Messdaten und Zeitstempel).

### Time Indices

Für ein schnelles finden von Zeitstempeln wird dieses Datenset zusätzlich zum Datenset `timestamp` erstellt. Das Zeitindex Datenset speichert einen Offsetwert einer Position von Zeitstempel-Gruppen ab und ist in der `Datasource Group`, auf gleicher Ebene wie das Datenset `timestamp`. Eine genaue Beschreibung zum Inhalt, ist im nachfolgenden Kapitel [Inhalt Datenset Time Indices](#inhalt-datenset-time-indices) zu finden.

| Name | Date Type | Parent | Mandatory | Ablageart |
|--|----|----|--|--|
| timeindex | 64 bit integer | Datenquellengruppe | yes | Einzelwerte |

HDF5 Chunking ist erlaubt und HDF5 Compression wird empfohlen.

Folgende Attribute sind dem `timeindex` Datenset zugewiesen:

| Name | Data Type | Parent | Mandatory | Description |
|---|---|--|--|-------|
| BlockSize | long | timeindex | yes | Zeitdauer in Nanosekunden eines Zeitblocks. Zeitstempel innerhalb desselben Zeitblocks werden mit dem gleichen Wert indiziert |
| LogTimeBlocks | integer | timeindex | yes | $2^{LogTimeBlocks}$ ist gleich der Anzahl an Blöcke, die für die Generierung des binären Baumes. Es können grössere Zeitversetzungen als $2^{LogTimeBlocks}*BlockSize$ im Zeitstempel Datenset enthalten sein, diese werden dann aber nicht indexiert. |
| Depth | integer | timeindex | yes | Höhe des binären Baumes |

#### Inhalt Datenset Time Indices

Um den Inhalt im Datenset `timeindex` zu verstehen, muss zuerst erklärt werden, wie dieser entstanden ist. Im folgenden Beispiel beschreibt den Vorgang der zum Ergebnis führt und wieder zurück.

Im Beispiel wollen wir Zeitstempel zwischen $10s$ und $155s$ abspeichern sowie indexieren. Diese Zeitstempel sind im Datenset `timestamp` enthalten. Die Abstände zwischen den einzelnen Zeitstempel folgen keinem einheitlichen Muster.  

Als Erstes definieren wir einen $Offset$, dieser ergibt sich durch den ersten Eintrag im Datenset `timestamp`. In unserem Beispiel ist der erste Eintrag $10s$, somit ist $Offset=10s$.
Mit dem $Offset$ von $10*10^9ns$ haben wir somit einen Wertbereich von $0ns$ bis $145*10^9ns$ den wir indexieren.  

Verwenden wir nun eine Blockgrösse von $BlockSize=2x10^9ns$, erhalten wir $72$ Blöcke, die wir indexieren, da $10s+72*2x10^9ns$ die Werte bis $156s$ abdeckt und somit für unseren Wertbereich ausreicht.
Um alle $72$ Blöcke zu indexieren, benötigen wir nun einen genügend grossen Wert für LogTimeBlocks, wir nehmen einen Wert von $LogTimeBlocks=7$, da $2^7=128$ grösser als $72$ ist.

> Hinweis: Möglich wäre ein LogTimeBlocks Wert von $LogTimeBlocks=6 => 2^6=64$. Alle Werte zwischen $64$ und $72$ würde dann aber nicht abgedekt werden in der Indexierung!

Definieren wir nun eine Tiefe $Depth=4$, so erhalten wir folgenden Knotennummern:

| Knotennummer | Höhe |
|:--:|:--:|
| 64 | 1 |
| 32 | 2 |
| 96 | 2 |
| 16 | 3 |
| 48 | 3 |
| 80 | 3 |
| 112 | 3 |
| 8 | 4 |
| 24 | 4 |
| 40 | 4 |
| 56 | 4 |
| 72 | 4 |
| 88 | 4 |
| 104 | 4 |
| 120 | 4 |

Diese Zahlen und Höhen, ergeben sich aus dem binären Baum, den wir anhand der definierten Tiefe erzeugen. Um die Tabelle zu erzeugen, wird der Baum in "level-order" durchlaufen. Folgendes Bild zeigt diesen Baum:

![Binärer Baum, Aufbau der Knotennummer](images/generated/binaryTree.png){ width=400px }

Der erste Eintrag in der Tabelle hat den Wert $2^{LogTimeBlocks-1}$, in unserem Fall $2^{7-1}=64$, dieser Eintrag hat eine Höhe von eins.
Als Nächstes errechnen wir für jeden Zeitstempel, die passenden Nummer des entsprechenden Blocks:

$BlockNumber=\frac{timestamp - Offset}{BlockSize}$

Jede $BlockNumber$ erhält eine Indexnummer aufsteigend, beginnend mit Null bis 40. Diese dient uns später für die Bestimmung der Offset Position die in das Datenset `timeindex` geschrieben wird.
Nachfolgend die berechneten $BlockNumber$ und der dazugehörige Zeitstempel, als Übersicht in einer Tabelle:

![Tabellenübersicht 1: $BlockNumber$ zu jedem Zeitstempel](images/TimeIndicesExampleTable1.png)

![Tabellenübersicht 2: $BlockNumber$ zu jedem Zeitstempel](images/TimeIndicesExampleTable2.png)

Im nächsten Schritt verwenden wir die zuvor erstellte Tabelle des binären Baums und schreiben für jeden Eintrag, den entsprechende $BlockNummer$ in das Datenset `timeindex`.
Die erste Nummer des binären Baumes ist $64$. Somit suchen wir in der erstellten Tabelle die gröstmögliche $BlockNumber$, die kleiner oder gleich dem Wert $64$ ist. Somit finden wir die Nummer $63$ in der Tabelle mit dem Index $35$. Somit schreiben wir die Zahl $35$ in das Datenset `timeindex`. Der zweite der Tabelle mit dem binären baum, hat den Wert $32$. In der Tabelle mit den $BlockNumber$ finden wir die Nummer $32$, somit wird die Zahl $32$ in das Datenset `timeindex` geschrieben. Nun folgt die Zahl $96$, für diese gibt es keinen Eintrag in der tabelle mit den $BlockNumber$, somit schreiben wir die eine $-1$ in das Datenset `timeindex`. Führen wir dies so weiter, erhalten wir folgende Tabelle, die das Datenset `timeindex` abbildet:

| NodeNumber | Inhalt `timeindex` |
|:--:|:--:|
| 64 | 35 |
| 32 | 18 |
| 96 | -1 |
| 16 | 8 |
| 48 | 27 |
| 80 | -1 |
| 112 | -1 |
| 8 | 4 |
| 24 | 13 |
| 40 | 23 |
| 56 | 32 |
| 72 | 40 |
| 88 | -1 |
| 104 | -1 |
| 120 | -1 |

#### Lokalisierung des Zeitstempel aus Datenset Time Indices

In diesem Kapitel wird beschrieben, wie die Position eines Zeitstempels, anhand des Datenset `timeindex` berechnet werden kann. Relevant sind die definierten Werte aus den Attributen $BlockSize$, $LogTimeBlocks$ und $Depth$. Anhand dieser Werte können wir den binären Baum wieder aufbauen.  

Angenommen, wir suchen für den Zeitstempel $86s$ die Position im `timestamp` Datenset, so berechnen wir zuerst die Knotennummer mit folgender Formel:  

$NodeNumber=(\frac{timestamp - Offset}{BlockSize})-(\frac{timestamp - Offset}{BlockSize} \bmod 8)$  

Die Berechnung für einen Zeitstempel mit dem Wert $86s$, würde dies wie folgt aussehen:  

$NodeNumber=(\frac{86s - 10s}{2s})-(\frac{86s - 10s}{2s} \bmod 8) = 38 - 6 = 32$

Mit der errechneten $NodeNumber$ können wir nun die Position mit Hilfe des `timeindex` Datenset herausfinden. Zusätzlich benötigen wir nun die Tabelle des binären Baums. Darin suchen wir den Index der errechneten $NodeNumber$, dies wäre der Index $1$. Nun finden wir im Datenset `timeindex` beim selben Index, die Position des Blocks, indem wir unseren Zeitstempel suchen, somit suchen wir ab Position $18$.  

| $NodeNumber$ | Datenset `timeindex` |
|:---:|:---:|
| 64 | 35 |
| **32** | **18** |
| 96 | -1 |
|...|...|

Nun wird bei der Position $18$ mit der Suche des Zeitstempels begonnen und über die Werte $74, 75, 80, 81$ gesucht bis $86$ an Position $22$.

![Tabellenübersicht 2: $BlockNumber$ zu jedem Zeitstempel](images/TimeIndicesTableSearchExample.png){width=400px}

Bei der Berechnung weiter oben wird immer abgerundet und nicht der nächstgrössere Wert (hier $40$) verwendet. Dies aus dem Grund, dass die Position beim Wert $40$ höher sein könnte (Ende des Blocks) als die Position im gesuchten Block selber. Somit würde der gesuchte Zeitstempel nicht gefunden werden!

### Durations

Werden Daten aufgenommen die für eine bestimmte Zeitdauer gültig sind, so wird das Datenset mit dem Namen `duration` zum Datenset `timestamp` hinzugefügt. Der aufgenommene Zeitstempel im Datenset `timestamp`, gibt den Zeitpunkt an, an dem der Wert aufgenommen wurde und in dem Datenset `duration` steht, wie lange dieser Wert gültig ist in Nanosekunden. Das Datenset `duration` ist innerhalb einer Datenquellengruppe neben dem Datenset `timestamp`.  

| Name | Date Type | Parent | Mandatory | Ablageart |
|--|---|-----|--|--|
| duration | 32 bit integer | Datenquellengruppe | yes | Einzelwerte |

HDF5 Chunking ist erlaubt und HDF5 Compression wird empfohlen.

## RCM-DX file format  

Das RCM-DX besteht aus einem Dateiformat der [HDF5-Gruppe$\to$](http://www.hdfgroup.org/HDF5/) in der Version 2.0. Dieses erlaubt das Speichern der Daten in einer Baumstruktur. Diese Struktur, besser gesagt die Benennung der Gruppen und Datensets, wird nicht durch die HDF5-Gruppe vorgegeben, jedoch durch das hier spezifizierte RCM-DX. Die Datensets können unterschiedliche Daten aufnehmen, was genau enthalten ist, wird als Metadaten angegeben.

Eine Änderung an der Struktur bedeutet eine neue Version und somit ein neues Release dieser Spezifikation.

Um das HDF5 Dateiformat zu lesen und schreiben, bietet die HDF5 Gruppe für verschiedene Sprachen Bibliotheken an. Diese können die hier spezifizierte Struktur ohne Probleme lesen und schreiben.

Weitere Informationen zum Aufbau des HDF5-Dateiformats sind unter folgendem Link zu finden: [HDF5 Dateiformat$\to$](https://portal.hdfgroup.org/display/HDF5/Introduction+to+HDF5)

## RCM-DX Data hierarchy  

Im RCM-DX werden die einzelnen Gruppen und Datensets sowie deren Benennung definiert. Nachfolgend eine Übersicht über die in diesem Dokument spezifizierte Struktur:

![RCM-DX Übersicht](images/generated/RCM_DX_Structure.png)

Für einzelne Strukturgruppen wurden eigene, separate und detailliertere Spezifikation geschrieben. An einem Mess- und Inspektionsfahrzeug können mehrere Messmittel verbaut sein. Jedes dieser Messmittel erzeugt neue Kanäle an Daten, welche in das RCM-DX einfliessen. Da diese Kanäle für jedes Messmittel unterschiedlich sein können, wurden die Spezifikationen getrennt. Ein weiterer Grund dafür, ist die Tatsache, dass andere Bahnbetreiber wiederum andere Mess- und Inspektionsmittel einsetzen.

Nachfolgend in den Unterkategorien werden die einzelnen Gruppen genauer spezifiziert.

### Root Group  

Die Root-Gruppe beinhaltet alle weiteren Untergruppen. Diese Gruppe definiert das RCM-DX und trägt dessen Namen und bezieht dich damit auf diese Spezifikation.

| Name | Parent | Mandatory |
|--|--|--|
| RCMDX | none (Root) | yes |

#### Attributes  

Nachfolgende Attribute sind der Gruppe `RCMDX` zugeordnet:

| Name | Data Type | Parent | Mandatory | Description |
|--|----|--|--|-----|
| Major | 16-bit integer | RCMDX | yes | Major Version der RCM-DX Spezifikation, die der Struktur der erstellten Datei entspricht |
| Minor | 16-bit integer | RCMDX | yes | Minor Version der RCM-DX Spezifikation, die der Struktur der erstellten Datei entspricht |
| Patch | 16-bit integer | RCMDX | yes | Patch Version der RCM-DX Spezifikation, die der Struktur der erstellten Datei entspricht |

### Session Group  

Die Session Gruppe enthält Daten, die im gleichen Zeitraum erhoben wurden. In einer Session Gruppe sind Daten von unterschiedlicher Herkunft. In einem RCM-DX File können mehrere dieser Session Gruppen enthalten sein und diese wiederum können sich zeitlich überlappen. Daten einer Quelle kann nur in einer Session Gruppe auf einmal sein, somit können sich diese nicht überlappen, somit ist zu jedem Zeitpunkt dieser Quelle, nur eine Session die diese Daten aufnimmt.

#### Namensgebung

Da mehrere Session-Gruppen in einer RCM-DX Datei enthalten sein können, müssen diese einen eindeutigen Namen erhalten. Um dieses Ziel zu erreichen, werden die Namen nach folgendem Muster vergeben:

| Name | Parent | Mandatory |
|--|--|--|
| YYYY-MM-ddTHH:mm:ss.SSSZ | RCMDX | yes |

Nachfolgend sind die einzelnen Elemente und deren Bedeutung beschrieben:

| Pattern | Content |
|---|-------|
| YYYY | The year in four digit representation |
| MM | The month in the year (01 for January) |
| dd | The day in the month |
| "T" | "T" as date marking |
| HH | The hour in the day (0-23) |
| mm | The minute in the hour |
| ss | The second in the minute |
| SSS | The the millisecond |
| "Z" | "Z" as marking of the time |
| "-" or ":" or "." | Charagters as separator |

In einer Session Gruppe sind die Daten der Messmittel enthalten. Für eine gegebene Millisekunde kann nur eine Session vorhanden sein, dies muss der Ersteller implementieren und sicherstellen.

#### Attributes  

| Name | Data Type | Parent | Mandatory | Description |
|--|---|--|--|-----|
| StartTime | long | Session Gruppe | yes | Zeitstempel in Nanosekunden seit dem 1.1.1970 UTC als Startzeit der Session |
| EndTime | long | Session Gruppe | no | Zeitstempel in Nanosekunden seit dem 1.1.1970 UTC als Endzeit der Session. Falls die Session noch nicht geschlossen wurde, fehlt dieses Attribut |
| MeasuringMode | string | Session Gruppe | yes | Gibt Aufschluss auf den Messmodus. Details unter [Messmodus](#messmodus).|
| Element | string | Session Gruppe | yes | Enthält den Typ der Gruppe, dieser ist fix "SESSION" |

##### Messmodus

Es gibt drei verschiedene Messmodi, die nachfolgend einzeln erklärt werden:

| Name | Beschreibung |
|---|------|
| PRODUCTIVE | Produktive Daten die weiter verwendet werden. |
| TEST | Testdaten die auf einer Messfahrt aufgenommen wurden, mit dem Ziel der Kontrolle und dem Testen der Messmittel. |
| SIMULATION | Simulierte Werte, die die Messsysteme selber produzieren und nicht weiter verwendet werden. |

### Sections Group

Die Gruppe `SECTIONS`, beinhaltet Informationen zu einer Session.

| Name | Parent | Mandatory |
|--|--|--|
| SECTIONS | Session Gruppe | yes |

#### Section Info

In dieser Gruppe sind die Informationen bezüglich der Section selber enthalten.

| Name | Parent | Mandatory |
|--|--|--|
| SECTIONINFO | SECTIONS | yes |

##### Datenfelder

Nachfolgende Datenfelder sind in der Gruppe "SECTIONINFO" enthalten:

| Name | Date Type | Parent | Mandatory | Ablageart |
|---|----|---|--|--|
| coachDirection | 8 bit integer | SECTIONINFO | yes | Einzelwerte |
| firstTrackOffset | 64 bit float | SECTIONINFO | yes | Einzelwerte |
| lastTrackOffset | 64 bit float | SECTIONINFO | yes | Einzelwerte |
| startTimestamp | 64 bit integer | SECTIONINFO | yes | Einzelwerte |
| trackInfoOffset | 64 bit float | SECTIONINFO | yes | Einzelwerte |

HDF5 Chunking ist bei allen erlaubt und empfohlen.  
Die HDF5 Compression ist erlaubt.  

###### coachDirection

Definiert die Fahrtrichtung des Messfahrzeugs pro Abschnitts. Dieses Array enthält nur so viele Einträge, wie es Abschnitte gibt.

| Nummer | Fahrtrichtung |
|:--:|:---:|
|0|Vorwärtsfahrt|
|1|Rückwärtsfahrt|

###### firstTrackOffset

Gibt die Distanz zwischen dem Start der Schiene und der Position zu Beginn der Messung, in Meter an. Dieses Array enthält nur so viele Einträge, wie es Abschnitte gibt.

###### lastTrackOffset

Gibt die Distanz zwischen der Position am Ende der Messung bis zum Ende der Schiene, in Metern an. Dieses Array enthält nur so viele Einträge, wie es Abschnitte gibt.

###### startTimestamp

Startzeitpunkt des Abschnitts als Zeitstempel seit dem 1.1.1970 um 00:00 Uhr UTC.

###### trackInfoOffset

In diesem Datenset wird definiert, wie viele Einträge in den Datensets der "Track Info Gruppe", zu einem Abschnitt gehören. Pro Abschnitt in einer Session wird hier ein Eintrag erstellt und die Anzahl Einträge definiert. Eine Gruppengrösse kann bestimmt werden, indem der angegebene Offset Wert, an der Position $x$ minus der Offset Wert an der Position $x-1$ verrechnet wird.

#### Track Info

In dieser Gruppe sind die Informationen bezüglich der Section selber enthalten.

| Name | Parent | Mandatory |
|--|--|--|
| TRACKINFO | SECTIONS | yes |

##### Datenfelder

| Name | Date Type | Parent | Mandatory | Ablageart |
|------|-----|----|---|---|
| trackId | 32 bit signed integer | TRACKINFO | yes | Einzelwerte |
| trackStartTimestamp | 64 bit signed integer | TRACKINFO | yes | Einzelwerte |
| trackEndTimestamp | 64 bit signed integer | TRACKINFO | yes | Einzelwerte |
| trackOrientation | 8 bit signed integer | TRACKINFO | yes | Einzelwerte |
| trackStartCoveredDistance | 64 bit float | TRACKINFO | yes | Einzelwerte |
| trackEndCoveredDistance | 64 bit float | TRACKINFO | yes | Einzelwerte |

HDF5 Chunking ist bei allen erlaubt und empfohlen.  
Die HDF5 Compression ist erlaubt.  

### Plattform Group

Eine Plattform Gruppe beinhaltet Informationen zu einem Messfahrzeug das die Daten sammelt.  
Die Namensgebung der Gruppe ist definiert, jenachdem welche Platform die Daten produziert hat. Eine Übersicht aller Namen und der Entsprechenden Plattform, ist im Kapitel [Platformen bei der SBB](#platformen-bei-der-sbb) genau Spezifiziert.

| Name | Parent | Mandatory |
|--|--|--|
| Plattform | SESSION | yes |

![Übersicht der Platform Struktur](images/generated/RCM_DX_Platform_overview.png){ width=110px }

#### Attribute

Die Platform Gruppe enthält folgende Attribute:

| Name | Data Type | Mandatory | Description |
|---|--|:--:|------|
| Name | string | yes | Eindeutiger Name des Fahrzeugs |
| VehicleNumber | string | yes | Eindeutige Nummer des Fahrzeugs |

#### Platformen bei der SBB

Nachfolgend eine Liste der definierten eindeutigen Bezeichnungen der Plattformen sowie deren deren Namen.

| Kurzzeichen | Plattform Name |
|--|---|
| DFZ00 | DFZ |
| DFZ01 | gDFZ |
| DFZ02 | SPZ |

#### Configuration

In den Datensets dieser Gruppe können Konfigurationen von diversen Systemen abgelegt werden. Die Datensets sind so angelegt, dass globale und Netzwerk spezifische Konfigurationen abgelegt werden können.

| Name | Parent | Mandatory |
|--|--|--|
| CONFIGURATION |PLATFORM | yes |

Nachfolgende Datensets sind dieser Gruppe untergeordnet:

| Name | Date Type | Parent | Mandatory | Ablageart |
|--|----|----|--|--|
| global | string | CONFIGURATION | yes | Einzelwerte |
| network | string | CONFIGURATION | yes | Einzelwerte |

HDF5 Chunking ist erlaubt und HDF5 Compression ist erlaubt.

### Environment Group

| Name | Parent | Mandatory |
|--|--|--|
| ENVIRONMENT | Session Gruppe | yes |

Informationen über die Umgebung, können in den Untergruppen und deren Datensets abgespeichert werden. Da solche Informationen für alle Messysteme gelten, ist dies der richtige Platz dafür.  

Wie immer bei einer Datenquelle, darf das Datenset `timestamp` nicht vergessen gehen.

![Übersicht der Environment Struktur](images/generated/RCM_DX_Environment_overview.png)

#### Vehicle Speed

| Name | Parent | Mandatory |
|--|--|--|
| VEHICLESPEED | ENVIRONMENT | yes |

Das Datenset enthält zu jedem Zeitstempel eine gemessene Fahrzeuggeschwindigkeit.

| Name | Date Type | Parent | Mandatory | Ablageart |
|--|----|----|--|--|
| `data` | 64 bit integer | VEHICLESPEED | yes | Einzelwerte |

Auch diese Datenquelle hat ein gemeinsames Datenset `timestamp`.

#### Ambient Temperature Group

Diese Gruppe beinhaltet ein Datenset in dem die Umgebungstemperaturen enthalten sind. Pro Zeitstempel wird eine Temperatur Messung durchgeführt.

| Name | Parent | Mandatory |
|--|--|--|
| AMBIENTTEMPERATURE | ENVIRONMENT | yes |

Pro Zeitstempel, wird im Datenset die Umgebungstemperatur eingetragen.

| Name | Date Type | Parent | Mandatory | Ablageart |
|--|----|----|--|--|
| `data` | 64 bit integer | AMBIENTTEMPERATURE | yes | Einzelwerte |

#### Wind Speed Group

Die Windgeschwindigkeit kann im Datenset der Gruppe `WINDSPEED` abgelegt werden.

| Name | Parent | Mandatory |
|--|--|--|
| WINDSPEED | ENVIRONMENT | yes |

Pro Zeitstempel, wird im Datenset die Windgeschwindigkeit eingetragen.

| Name | Date Type | Parent | Mandatory | Ablageart |
|--|----|----|--|--|
| `data` | 64 bit integer | WINDSPEED | yes | Einzelwerte |

#### Wind Direction Group

Neben der Windgeschwindigkeit wird auch die Windrichtung abgespeichert, dies wird in dieser Gruppe erledigt.

| Name | Parent | Mandatory |
|--|--|--|
| WINDDIRECTION | ENVIRONMENT | yes |

Pro Zeitstempel, wird im Datenset die Windrichtung eingetragen.

| Name | Date Type | Parent | Mandatory | Ablageart |
|--|----|----|--|--|
| `data` | 64 bit integer | WINDDIRECTION | yes | Einzelwerte |

#### Weather Conditions Group

Das Wetter hat Einflüsse auf die Messungen. Wie das Wetter zum Zeitpunkt der Messungen war, wird in dieser Gruppe festgehalten.

| Name | Parent | Mandatory |
|--|--|--|
| WEATHERCONDITIONS | ENVIRONMENT | yes |

Pro Zeitstempel, wird im Datenset die Wetterbedingungen eingetragen. Dies könnte zum Beispiel sein "Regen, Nebel, Schneefall".

| Name | Date Type | Parent | Mandatory | Ablageart |
|--|----|----|--|--|
| `data` | 64 bit integer | WEATHERCONDITIONS | yes | Einzelwerte |

### Measuring System Group

Jedes Messsystem hat seine eigenen Datenquellen, die einen eigenen Namen haben, sowie eigenen Kanälen die wiederum eigene Namen haben. Gemeinsamkeiten werden in dieser Spezifikation beschrieben, alles andere ist jeweils in einer eigenen Spezifikation definiert. Da dieser Teil sich stark von Bahnbetrieben und Messmitteln unterscheidet, wurde auf eine starre Spezifizierung verzichtet, dennoch wird ein gewisser Rahmen vorgegeben.

Für jedes System, das Daten erfasst, wird eine Gruppe erstellt. Der Name der Gruppe ist pro System eindeutig. Wie sich dieser Name zusammenstellt, ist nicht vorgegeben. Jedes System enthält weitere Untergruppen die am Ende jeweils eine Datenquelle beinhaltet.

![Übersicht der Messystem Struktur](images/generated/RCM_DX_MS_overview.png){ width=400px }

#### Exapmle

Als Beispiel soll hier ein Messsystem beschrieben werden, dass Umgebungsdaten aufnimmt. Dieses Messsystem kann mehrere Typen von Daten erfassen, gehört aber der Messsystemgruppe "ADDITIONAL_DATA". Die Daten werden in einzelnen Datenquellen Gruppen abgelegt, dies ist im Kapitel [Datasource Group](#datasource-group) beschrieben.

#### Attributes  

Folgende Attribute sind in der Gruppe des Messystems enthalten:

| Name | Data Type | Parent | Mandatory | Description |
|--|----|--|--|------|
| Family | string | Measuring System Group | yes | Allgemeiner Name des Messystems |
| Revision | string | Measuring System Group | yes | Versionstand der Software auf dem Messystem, vergeben durch den Messmittelhersteller |
| IstanceVersion | string | Measuring System Group | yes | Version des Datenformat das vom Messmittel erstellt wird. Diese Version kann unterschiedlich sein innerhalb verschiedener Messmittel der gleichen Familie |
| Element | string | Measuring System Group | yes | Enthält den Typ der Gruppe, dieser ist fix "MEASURINGSYSTEM" |

### Datasource Group

Eine Datenquellengruppe kann mehrere Kanäle und somit mehrere Datenquellen enthalten. Diese Gruppe fasst diese Kanäle zusammen. Die Benennung kann frei gewählt werden, muss aber eindeutig sein.

Für jeden einzelnen Messpunkt, innerhalb einer Datenquellengruppe, ist ein Zeitstempel vorhanden. Für eine Datenquellengruppe gibt es zwei Arten der Datenerfassung. Die eine ist immer nach einer definierten Distanz (zum Beispiel alle 25 Zentimeter) und die andere ist die Messdatenaufnahme in einer bestimmten Frequenz (zum Beispiel 4000 Hz).
Die Art wie die Messdaten erfasst wurden, steht in zwei Attributen bei jeder Kanal Gruppe. Eine Beschreibung ist unter [Common Trigger Distance or Frequence](#common-trigger-distance-or-frequence).

#### Attributes

Folgendes Attribut erhält die Gruppe:

| Name | Data Type | Parent | Mandatory | Description |
|--|----|--|--|------|
| Element | string | Datenquellengruppe | yes | Enthält den Typ der Gruppe, dieser ist fix "DATASOURCE" |

#### Example

In unserem Beispiel wird nun der Name der Datenquellengruppe vergeben, die unsere Umgebungsmessdaten enthalten soll, diese nennen wir `ENVIRONMENT`.  
In dieser Gruppe befindet sich nun auch das Dataset `timestamp`.  

#### Timestamp Dataset

In jeder Datenquellengruppe befindet sich ein Datenset mit dem Namen `timestamp`. Darin sind alle Zeitstempel, an dem eine Messung aufgenommen wurde. Die Grösse dieser Liste an Zeitstempeln, ist gleich gross wie die der Datensets pro Kanal.

Eine genauere Beschreibung dazu ist im Kapitel [Timestamp Array](#timestamp) zu finden!

### Channel Group

Eine Kanalgruppe enthält Metadaten zu den eigentlichen Messdaten und somit zu den verschiedenen Kanälen. Die Benennung kann frei gewählt werden, muss aber innerhalb der Datenquellengruppe eindeutig sein.

Folgende Attribute sind in dieser Gruppe enthalten:  

| Name | Data Type | Parent | Mandatory | Description |
|----|--|---|--|------|
| PositionOffset | 32 bit float | Kanalgruppe | yes | [Position Offset](#position-offset) |
| TriggerMode | string | Kanalgruppe | yes | [Trigger Mode](#trigger-mode) |
| ChannelBasis | string | Kanalgruppe | yes | [Channel Basis](#channel-basis) |
| CommonTriggerDistance | 32 bit float | Kanalgruppe | yes | [Common Trigger Distance or Frequence](#common-trigger-distance-or-frequence) |
| CommonTriggerFrequence | 32 bit float | Kanalgruppe | yes | [Common Trigger Distance or Frequence](#common-trigger-distance-or-frequence) |
| ChannelTyp | string | Kanalgruppe | yes | [Channel Type](#channel-type) |
| Neighbor | string | Kanalgruppe | yes | [Neighbor](#neighbor) |
| Element | string | Kanalgruppe | yes | Enthält den Typ der Gruppe, dieser ist fix "CHANNEL" |

#### Channel Basis

Beschreibung des Kanals, was und in welcher Richtung gemessen wurde. Da sich ein Messfahrzeug auf einer Schiene in zwei Richtungen bewegen kann und sich der Sensor somit auf der jeweils anderen Seite befinden könnte, sollte dies angegeben werden können. Hier ist der Platz dafür.

Mögliche Werte sind:

| Value |
|---|
| SENSOR_VERTICAL_LEFT |
| SENSOR_VERTICAL_RIGHT |
| MOVE_DIRECTION_VERTICAL_LEFT |
| MOVE_DIRECTION_VERTICAL_RIGHT |
| SENSOR_VERTICAL_TOTAL |
| MOVE_DIRECTION_VERTICAL_TOTAL |
| TOTAL |

#### Common Trigger Distance or Frequence

Die beiden Attribute `CommonTriggerFreq` und `CommonTriggerDistance` definieren einmal die Art der Messdatenaufnahme und einmal in welchem Abstand diese Messdaten aufgenommen wurden.

Werden die Messdaten in einem bestimmten Abstand aufgenommen, zum Beispiel alle 20 Millimeter, so wird das Attribut `CommonTriggerDistance` angegeben und bei `CommonTriggerFreq` wird der Wert "0.0" angegeben. Beim Attribut `TriggerMode` wird der Wert `DISTANCE` vermerkt.

Werden die Daten in einer gewissen Frequenz aufgenommen, so wir beim Attribut `CommonTriggerFreq` die Frequenz in Herz angegeben, zum Beispiel 40000.0 für 4kHz. Bei `CommonTriggerDistance` bleibt der Wert "0.0". Beim Attribut `TriggerMode` wird der Wert `TIME` vermerkt.

> In einer Datenquellengruppe ist immer nur eine gemeinsame Auslösefrequenz oder eine Auslösedistanz. Eine Mischung innerhalb der Gruppe ist nicht zulässig!
> Beide Attribute haben den Wert "0.0", wenn bei `TriggerMode` der Wert `EVENT` enthalten ist.

#### Channel Type

Definiert wie ein Wert entstanden ist. Dieser kann gemessen, errechnet oder aus einer zuvor definierten Datenquelle stammen, die von da ausgelesen und in die Datei eingefügt wurde.

Folgende Werte sind möglich:

| Value | Beschreibung |
|---|---------|
| MEASURED | Gemessene Werte |
| REFERENCE | Ein Sollwert einer dritten Quelle |

Ein Beispiel für Referenzwerte, sind definierte Sollwerte die aus einer anderen Quelle (Datei, Datenbank usw.) einfliessen und für Vergleiche verwendet werden sollen.

#### Neighbor

Verweist auf den Namen eines benachbarten Kanals. Dies kann zum Beispiel bei der Messung der Gleistemperatur der linken Schiene, die rechte Schiene sein.
Somit würde im Attribut `neighbor` des Kanals "TEMP_RAIL_**L**" der Name "TEMP_RAIL_**R**" stehen und umgekehrt.

#### Position Offset

Beschreibt die Distanz zwischen einem definierten Nullpunkt (Position) am Messfahrzeug, zu einem Messsystem. Diese Angabe dient dem Umrechnen der genauen Zeit, an dem die Messung aufgenommen wurde, zu einem definierten Nullpunkt mithilfe der gefahrenen Geschwindigkeit und der zum Zeitpunkt aufgenommenen Position.  

#### Trigger Mode

Dieses Attribut definiert, in welcher Art die Daten aufgenommen wurden.

Mögliche Werte sind:

| Value | Beschreibung |
|---|---------|
| TIME | Zeitbasierte Messdatenaufnahme |
| DISTANCE | Distanzbasierte Messdatenaufnahme |
| EVENT | Event basierte Aufnahme |

#### Example

Als Kanal folgen hier alle Arten von Daten, die zum gleichen Zeitpunkt aufgenommen werden. Die Namen der Kanäle sind frei wählbar, hier als Beispiel:

| Name | Mandatory | Description |
|--|--|--------|
| TEMP | no | Temperatur |
| WIND_DIR | no | Windrichtung |
| WIND_SPEED | no | Windgeschwindigkeit |
| HUM | no | Feuchtigkeit |

Weiter erhalten alle Kanäle die folgenden Attribute und Werte:

| Attribut Name | Wert (als Beispiel) |
|---|---------|
| ChannelBasis | TOTAL |
| CommonTriggerDistance | 0.0 |
| CommonTriggerFreq | 1.0 |
| MeasurementType | MEASURED_VALUE |
| Neighbor | "" |
| PositioOffset | 0.0 |
| TriggerMode | TIME |

##### Data object

Jede Kanalgruppe erhält ein Datenset mit den eigentlichen Messdaten:

| Name | HDF5 Type | Mandatory |
|--|---|--|
| data | HDF5 Dataset | yes |

> Es gibt genau so viele Messdateneinträge wie es Zeitstempel im Dataset `timestamp` gibt, das der Kanalgruppe beiliegt.

Das Datenset benötigt weitere Informationen, diese werden als Attribute angegeben:

| Name | Date Type | Parent | Mandatory | Ablageart |
|--|----|----|--|--|
| Unit | string | Kanalgruppe | yes | Einzelwerte |

**Unit:** Die physikalische Einheit der Messdaten, wie zum Beispiel "Millimeter". Falls keine physikalische Einheit den Daten zugewiesen werden kann, bleibt dieses Attribut leer.

Das Datenset und die möglichen Daten die abgespeichert werden können, wird in einem eigenen Kapitel genauer beschrieben: [Datenset](#hdf5-datenset)

###### Example

Zu unseren definierten Kanälen kommen nun die Einheiten hinzu. Jedes Datenset erhält nun noch ein Attribut für diese Einheit:

| Kanalname | Attribut Name | Einheit |
|--|--|----|
| TEMP | "Unit" | DegreeCelsius |
| WIND_DIR | "Unit" | Degree |
| WIND_SPEED | "Unit" | MeterPerSecond |
| HUM | "Unit" | RelativeHumidity |

### Logging Group

Die Logging Gruppe enthält Informationen über Zustände der Messsysteme. Die Daten werden in zwei Untergruppen aufgeteilt, einmal *Outages* und *Messages*. Diese werden in eigenen Kapitel beschrieben.

| Name | Parent | Mandatory |
|--|---|--|
| LOGGING | Measuring System Group | yes |

![Übersicht der Environment Struktur](images/generated/RCM_DX_Logging_overview.png)

#### Outages Group

In dieser Gruppe werden Ausfälle und Unterbrüche von Messsystemen in definierter Struktur festgehalten, jeweils als eigenes Datenset. Das Elternobjekt ist `MESSAGES`.

Folgende Datensets sind in dieser Gruppe enthalten:

| Name | Date Type | Parent | Mandatory | Ablageart |
|--|----|----|--|--|
| reference | string | LOGGING | yes | Einzelwerte |
| level | string | LOGGING | yes | Einzelwerte |
| message | string | LOGGING | yes | Einzelwerte |

HDF5 Chunking ist erlaubt und HDF5 Compression ist erlaubt.

Diese Gruppe erhält neben einem `timestamp` Datenset auch eines für die Zeitdauer `duration`, um die Zeit des Messmittelausfalls anzugeben.

##### Reference Datenset

Eine Referenz auf das vom Ausfall betroffene Messsystem, wird in diesem Datenset hinterlegt.

##### Level Reference

Definiert den Schweregrad des Ausfalls oder des Unterbruchs eines Messystems.

##### Message

Dieses Datenset enthält pro Eintrag eine Meldung zu einem Ausfall eines Messmittels.

#### Messages Group

Statusmeldungen zu einem System oder einer Datenquelle, werden in dieser Gruppe gespeichert. Falls keine Meldungen vorhanden sind, bleibt diese Gruppe leer.

Folgende Datensets sind in dieser Gruppe enthalten:

| Name | Date Type | Parent | Mandatory | Ablageart |
|--|----|----|--|---|
| message | string | LOGGING | yes | Einzelwerte |
| level | string | LOGGING | yes | Einzelwerte |
| reference | string | LOGGING | yes | Einzelwerte |
| timestamp | 64 bit integer | LOGGING | yes | Einzelwerte |

HDF5 Chunking ist empfohlen und HDF5 Compression ist erlaubt.

**reference:** Eine Referenz auf das betroffene Messsystem oder der Datenquelle selber, wird in diesem Datenset hinterlegt.  
> **level:** TODO: Level? Was für welche gibt es?  

**message:** Die eigentliche Nachricht die aufgenommen werden soll für ein Messsystem.  

### Topology Group

In einer Topologie Gruppe befinden sich alle Informationen zum Streckennetz der jeweiligen Bahngesellschaft.  

| Name | HDF5 Type | Parent | Mandatory |
|--|--|---|--|
| TOPOLOGY | HDF5 Group | SESSION | yes |

![Übersicht Topology Struktur](images/generated/RCM_DX_Topology_overview.png)

#### Attribute

Die Gruppe `TOPOLOGY` enthält folgende Attribute:

| Name | Date Type | Parent | Mandatory | Ablageart |
|---|--|---|--|--|
| DfAExportTimestamp | string | TOPOLOGY | yes | Einzelwerte |

**DfAExportTimestamp:**Zeitpunkt, an dem die DfA exportiert wurde und somit ein Verweis auf die Version

Die DfA (Datenbank feste Anlagen) ist ein SBB Konstrukt und wiederspiegelt das Streckennetz der SBB. Die Daten stammen aus einer Datenbank und werden als Datei an die Messfahrzeuge der SBB verteilt. Diese können die darin enthaltenen Informationen lesen und fügen diese auch dem RCM-DX hinzu. Für die Positionierung wird diese DfA verwendet und es ist somit möglich, die gemessenen Daten einem Objekt aus dem Streckennetz zuzuordnen.

### Tracks Group

Diese Gruppe enthält Informationen zu den Gleissträngen des Streckennetze. Die Informationen sind jeweils in eigenen Datensets abgelegt.

| Name | Parent | Mandatory |
|--|--|--|
| TRACKS | TOPOLOGY | yes |

Folgende Datensets sind in dieser Gruppe enthalten, davon werden einige in den Unterkapiteln genauer beschrieben:

| Name | Date Type | Parent | Mandatory | Beschreibung |
|--|---|--|--|---|
| direction | 8 bit signed integer, little endian | TRACKS | yes | Einzelwerte |
| id | 32 bit integer, little endian | TRACKS | yes | Einzelwerte |
| gtgId | string | TRACKS | yes | Einzelwerte |
| length | string | TRACKS | yes | Einzelwerte |
| name | string | TRACKS | yes | Einzelwerte |
| nrLine | string | TRACKS | yes | Einzelwerte |
| pointFrom | 32 bit integer, little endian | TRACKS | yes | Einzelwerte |
| pointTo | 32 bit integer, little endian | TRACKS | yes | Einzelwerte |
| switchType | 8 bit signed integer, little endian | TRACKS | yes | Einzelwerte |
| trackType | 8 bit signed integer, little endian | TRACKS | yes | Einzelwerte |

**direction:** Wird in einem eigenen Kapitel bescheieben: [direction](#direction)  
**id:** Eindeutige ID des Gleisstrangs. 
**gtgId:** Eindeutige GTG-ID eines GTG-Strang, diese ID ist als UUID abgelegt  
**length:** Die länge des Gleisstrangs  
**name:** Name des Gleisstrangs  
**nrLine:** Nummer der Linie für den Gleisstrangs  
**pointFrom:** ID des Startpunktes des Gleisstrangs  
**pointTo:** ID des Endpunktes des Gleisstrangs  
**switchType:** Wird in einem eigenen Kapitel bescheieben: [switchType](#switchtype)  
**trackType:** Wird in einem eigenen Kapitel bescheieben: [trackType](#tracktype)  

#### direction

In diesem Datenset wird die Richtung einer Weiche angegeben.  
Ist der Gleisstrang vom Typ "Weiche", so ist hier ein Wert grösser als Null zu wählen. Welche Nummer was bedeutet, ist in folgender Tabelle ersichtlich:  

| Wert | Beschreibung |
|--|---|
| 0 | keine Weiche |
| 1 | Geradliniges Weichengleis |
| 2 | Nach links laufende Weiche |
| 3 | Nach rechts laufende Weiche |

#### trackType

Die Zahl im Datenset *trackType*, definiert die Art des dazugehörenden Gleisstrangs. Welche Nummer was bedeutet, ist in folgender Tabelle ersichtlich:

| Wert | Beschreibung |
|--|---|
| 0 | Bahnhofsgleis |
| 1 | Strecke |
| 2 | Weiche |

##### switchType

Ist der Gleisstrang vom Typ "Weiche", so ist hier ein Wert grösser als Null zu wählen. Welche Nummer was bedeutet, ist in folgender Tabelle ersichtlich:

| Wert | Beschreibung |
|--|---|
| 0 | Alles andere als eine Weiche |
| 1 | einfache Weiche |
| 2 | Doppelweiche |
| 3 | einfache Kreuzweiche |
| 4 | doppelte Gleisverbindung |
| 5 | Doppelkreuzungsweiche |

### Lines Group

Diese Gruppe enthält Informationen zu einer Linie im Streckennetz. Die Informationen sind jeweils in eigenen Datensets abgelegt.

| Name | Parent | Mandatory |
|--|--|--|
| LINES | TOPOLOGY | yes |

Folgende Datensets sind in dieser Gruppe enthalten:

| Name | Date Type | Parent | Mandatory | Ablageart |
|--|----|----|--|--|
| id | 32 bit signed integer, little endian | LINES | yes | Einzelwerte |
| name | string | LINES | yes | Einzelwerte |
| firstStation | string | LINES | yes | Einzelwerte |
| lastStation | string | LINES | yes | Einzelwerte |
| fromKilometer | string | LINES | yes | Einzelwerte |
| toKilometer | string | LINES | yes | Einzelwerte |

**id:** Definiert die ID der Linie, diese ist Eindeutig  
**name:** Der Name der Linie  
**firstStation:** Der Name der ersten Station dieser Linie  
**lastStation:** Der Name der letzten Station dieser Linie  
**fromKilometer:** Startkilometer der Linie, in Kilometer angegeben  
**toKilometer:** Endkilometer der Linie, in Kilometer angegeben  

### Switch Tracks Group

Diese Gruppe enthält Informationen über Weichen im Streckennetz. Die Informationen sind jeweils in eigenen Datensets abgelegt.

| Name | Parent | Mandatory |
|--|--|--|
| SWITCHTRACKS | TOPOLOGY | yes |

Folgende Datensets sind in dieser Gruppe enthalten:

| Name | Date Type | Parent | Mandatory | Beschreibung |
|---|---|---|--|---|
| gleisstrangId | 32 bit signed integer | SWITCHTRACKS | yes | Einzelwerte |
| gleisstrangBez | string | SWITCHTRACKS | yes | Einzelwerte |
| weicheId | 32 bit signed integer | SWITCHTRACKS | yes | Einzelwerte |
| ablenkRichtung | string | SWITCHTRACKS | yes | Einzelwerte |
| ablenkung | string | SWITCHTRACKS | yes | Einzelwerte |
| betriebspunkt | string | SWITCHTRACKS | yes | Einzelwerte |
| herzStueck | string | SWITCHTRACKS | yes | Einzelwerte |
| minRadius | 32 bit signed integer | SWITCHTRACKS | yes | Einzelwerte |
| nr | 32 bit signed integer | SWITCHTRACKS | yes | Einzelwerte |
| zusNr | string | SWITCHTRACKS | yes | Einzelwerte |
| schienenProfil | string | SWITCHTRACKS | yes | Einzelwerte |
| status | string | SWITCHTRACKS | yes | Einzelwerte |
| schienenProfil | string | SWITCHTRACKS | yes | Einzelwerte |
| schwellenArt | string | SWITCHTRACKS | yes | Einzelwerte |
| typenPlanNr | 32 bit signed integer | SWITCHTRACKS | yes | Einzelwerte |
| typNrZusatz | string | SWITCHTRACKS | yes | Einzelwerte |
| weichenArt | string | SWITCHTRACKS | yes | Einzelwerte |
| weichenTyp | string | SWITCHTRACKS | yes | Einzelwerte |
| weichenForm | string | SWITCHTRACKS | yes | Einzelwerte |
| weichenZunge | string | SWITCHTRACKS | yes | Einzelwerte |

**gleisstrangId:** Eine referenz auf die GTG-ID  
**gleisstrangBez:** Enthält eine Beschreibung zum Gleisabschnitt  
**weicheId:** Enthält die ID's der Weichen als Referenz  
<!-- Für Nachfolgende Datensets fehlen noch die Bezeichungen. Diese müssten einmal ergänzt werden! 29.10.2019 Ammann Michael
**ablenkRictung:**  
**ablenkung:**  
**betriebspunkt:**  
**herzStueck:**  
**minRadius:**  
**nr:**  
**zusNr:**  
**schienenProfil:**  
**status:**  
**schienenProfil:**  
**schwellenArt:**  
**typenPlanNr:**  
**typNrZusatz:**  
**weichenArt:**  
**weichenTyp:**  
**weichenForm:**  
**weichenZunge:**  
 -->

### Track Objects Group

Diese Gruppe enthält Informationen über Objekte im Streckennetz, dies kann zum Beispiel eine Balise sein. Die Informationen sind jeweils in eigenen Datensets abgelegt.

| Name | Parent | Mandatory |
|--|--|--|
| TRACKOBJECTS | TOPOLOGY | yes |

Folgende Datensets sind in dieser Gruppe enthalten:

| Name | Date Type | Parent | Mandatory | Ablageart |
|--|----|----|--|--|
| trackId | 32 bit signed integer | TRACKOBJECTS | yes | Einzelwerte |
| type | 32 bit signed integer | TRACKOBJECTS | yes | Einzelwerte |
| positionStart | 32 bit signed integer | TRACKOBJECTS | yes | Einzelwerte |
| positionEnd | 32 bit signed integer | TRACKOBJECTS | yes | Einzelwerte |
| extraInfo | string | TRACKOBJECTS | yes | Einzelwerte |

**trackId:** Enthält die ID des auf einen Gleisstrang
**type:** Typ des Objekts  
**positionStart:** Startposition des Objekts in Meter  
**positionEnd:** Endposition des Objekts in Meter  
**extraInfo:** Zusätzliche Information zum Objekt, zum Beispiel die ID einer Balise  

### Track Points Group

Diese Gruppe enthält Informationen über definierte Punkte auf dem Streckennetz. Die Informationen sind jeweils in eigenen Datensets abgelegt.

| Name | Parent | Mandatory |
|--|--|--|
| TRACKPOINTS | TOPOLOGY | yes |

Folgende Datensets sind in dieser Gruppe enthalten:

| Name | Date Type | Parent | Mandatory | Ablageart |
|--|----|----|--|--|
| trackId | 32 bit signed integer | TRACKPOINTS | yes | Einzelwerte |
| lineId | 32 bit signed integer | TRACKPOINTS | yes | Einzelwerte |
| x | 32 bit float | TRACKPOINTS | yes | Einzelwerte |
| y | 32 bit float | TRACKPOINTS | yes | Einzelwerte |
| z | 32 bit float | TRACKPOINTS | yes | Einzelwerte |
| radius | 32 bit float | TRACKPOINTS | yes | Einzelwerte |
| kilometer | 32 bit float | TRACKPOINTS | yes | Einzelwerte |
| position | 32 bit float | TRACKPOINTS | yes | Einzelwerte |
| cant | 32 bit float | TRACKPOINTS | yes | Einzelwerte |
| inclination | 32 bit float | TRACKPOINTS | yes | Einzelwerte |

**trackId:** Referenz auf die ID des Gleisstrangs  
**lineId:** Referenz auf die ID der Linie  
**x:** X-Koordiante des Punktes  
**y:** Y-Koordiante des Punktes  
**z:** Z-Koordiante des Punktes  
**radius:** Der Radius eines Punktes, in Metern angegeben  
**kilometer:** Enthält den Linienkilometer des Punktes im Streckennetz, in kilometern angegeben  
**position:** Position des Punktes, in Metern angegeben  
**cant:** Die Neigung an diesem Punkt, in Milimetern angegeben  
**inclination:** Steigung an diesem Punkt, in Promille angegeben $[‰]$  

### Properties Group

Diese Gruppe enthält Informationen über Eigenschaften der Topologie selber. Die Informationen sind jeweils in eigenen Datensets abgelegt.

| Name | Parent | Mandatory |
|--|--|--|
| PROPERTIES | TOPOLOGY | yes |

Folgende Datensets sind in dieser Gruppe enthalten:

| Name | Date Type | Parent | Mandatory | Beschreibung |
|---|--|--|--|--|---|
| propertyId | 32 bit signed integer | PROPERTIES | yes | Einzelwerte |
| name | string | PROPERTIES | yes | Einzelwerte |
| description.ge | string | PROPERTIES | yes | Einzelwerte |
| description.fr | string | PROPERTIES | yes | Einzelwerte |
| description.it | string | PROPERTIES | yes | Einzelwerte |
| description.en | string | PROPERTIES | yes | Einzelwerte |

**propertyId:** Eindeutige ID des Merkmals  
**name:** Name des Merkmals  
**description.ge:** Beschreibugn des Merkmals in der Sprache Deutsch  
**description.fr:** Beschreibugn des Merkmals in der Sprache Französisch  
**description.it:** Beschreibugn des Merkmals in der Sprache Italienisch  
**description.en:** Beschreibugn des Merkmals in der Sprache Englisch  

### Events Group  

Die Event-Gruppe dient der Ablage von Ereignissen, die während der Aufnahme von Daten geschehen sind. Ereignisse sind Kanal-, System- oder Session gebunden und haben einen Link auf darauf. Neben Ereignissen können auch Protokolleinträge erstellt werden, diese werden im Kapitel [Record Group](#record-group) genauer beschrieben.
Systeme können zum Beispiel ein Ereignis bei einer Grenzwertüberschreitung auslösen. Ereignisse sind immer zeitgebunden was bedeutet, ein Ereignis beinhaltet den genauen Zeitpunkt des Auftretens sowie die Zeitdauer des Ereignisses. Die Dauer kann auch Null sein, somit ist das Ereignis genau zum angegebenen Zeitpunkt aufgetreten.  

| Name | HDF5 Type | Parent | Mandatory |
|--|--|---|--|
| EVENTS | HDF5 Group | Session Group | yes |

Innerhalb der Gruppe gibt es nachfolgende Datenfelder:

| Name | Date Type | Parent | Mandatory | Ablageart |
|--|----|---|--|---|
| reference | string | EVENTS | yes | Einzelwerte |
| data | string (XML) | EVENTS | yes | Einzelwerte |
| eventtype | string | EVENTS | yes | Einzelwerte |
| duration | 64 bit signed integer litle endian | EVENTS | yes | Einzelwerte |
| timestamp | 64 bit signed integer litle endian | EVENTS | yes | Einzelwerte |

Bei allesn Datenset wird HDF5 Chunking empfohlen und HDF5 Compression ist erlaubt.

Jedes dieser Datensets enthält eine Liste mit Informationen zu einem Eintrag, zu einem bestimmten Zeitpunkt.
Jedes Datenset wird nachfolgend in den jeweiligen Unterkapiteln, genauer beschrieben.

#### Event Data

| Name | Date Type | Parent | Mandatory | Ablageart |
|--|----|----|--|--|
| "data" | string | EVENTS | yes | Einzelwerte |

HDF5 Chunking ist erlaubt und empfohlen.  
Die HDF5 Compression ist erlaubt.  

In diesem Datenset sind die eigentlichen Informationen zu einem Ereignis enthalten, dies in der XML-Notation die in jedem Kapitel der Ereignistypen genauer beschrieben wird.  
Die Ereignisse werden in diesem Datenset als Liste abgespeichert. Für jedes Ereignis kann ein Typ hinterlegt werden. Diese werden im Kapitel [Event Types](#event-types) genauer erklärt.

#### Duration

Definiert pro Ereignis die Zeitdauer des Ereignisses selber. Dieser Wert kann auch Null sein.

| Name | Date Type | Parent | Mandatory | Ablageart |
|--|----|----|--|--|
| "duration" | 64 bit integer | EVENTS | yes | Einzelwerte |

HDF5 Chunking ist erlaubt und empfohlen.  
Die HDF5 Compression ist erlaubt.  

#### Event Types

Beinhaltet den Typ eines Ereignisses.

| Name | Date Type | Parent | Mandatory | Ablageart |
|--|----|----|--|--|
| "eventtype" | string | EVENTS | yes | Einzelwerte |

HDF5 Chunking ist bei allen erlaubt und empfohlen.  
Die HDF5 Compression ist erlaubt.  

In der Liste "eventtype" wird der Typ, des zu diesem Zeitpunkt aufgenommenen Ereignisses, aufgezeigt. Die verschiedenen Typen enthalten unterschiedliche Informationen die in folgenden Unterkapiteln aufgezeigt werden. Für alle Typen liegen entsprechende XML-Schemas vor die, die technischen Vorgaben definieren.

##### Defect

Ein Defekt kann zum Beispiel, ein Bild einer Schiene sein, das eine Beschädigung der Oberfläche aufzeigt. Dieser Fehler wird von einem System aufgenommen. Es kann vorkommen, dass dieser Fehler jedoch keiner ist (falsch erkannt), diese Information kann im Nachhinein angegeben werden (Attribut "PossibleValidationResults").
Defekte sind immer Kanal gebunden und von einem System aufgenommen oder ausgewertet.
Nachfolgend werden die Elemente und Attribute, die in einem *Defect* als XML vorkommen, genauer beschrieben.

Das XML-Schema ist in der Datei [EventsDefect](#events-defect) definiert, das dieser Spezifikation beiliegt.

###### XML-Elements

Nicht alle dieser Elemente müssen vorhanden sein, Details dazu, kann aus dem XML-Schema entnommen werden.  

| Name | Beschreibung | Elternobjekt |
|---|-----|--|
| Defect| Root Element | none |
| PossibleDefectNames | Name eines möglichen Fehlers | Defect |
| PossibleClassifications | Klassifizierung eines möglichen Fehlers | Defect |
| PossibleValidationResults | Mögliche Bestätigungen des Fehlers | Defect |

###### XML-Attribute

Nachfolgend die Attribute des Root-Elements "Defect":

| Name | Beschreibung | Elternobjekt |
|---|-----|--|
| Classification | Klassifizierung des Fehlers | Defect |
| DefectName | Name des Fehlers | Defect |
| Details | Weitere Informationen oder genauere Beschreibungen zum Fehler | Defect |
| Parameter1Name | Name des Parameters 1 | Defect |
| Parameter1Value | Wert des Parameters 1 | Defect |
| Parameter2Name | Name des Parameters 2 | Defect |
| Parameter2Value | Wert des Parameters 2 | Defect |
| Parameter3Name | Name des Parameters 3 | Defect |
| Parameter3Value | Wert des Parameters 3 | Defect |
| ID | Einmalige Nummer zur Identifikation des Fehlers | Defect |

##### Detected Object

Diese Ereignisse weisen auf ein gefundenes Objekt während einer Messfahrt hin. Dies können zum Beispiel erkannte Balisen oder auch Tunnel sein. Was genau als gefundenes Objekt gilt, wird in dieser Spezifikation nicht definiert, nur die Informationen zu einem aufgenommenen Ereignis.

Das XML-Schema ist in der Datei [EventsGeneric](#events-generic) definiert, das dieser Spezifikation beiliegt.

###### XML-Elements

Nicht alle dieser Elemente müssen vorhanden sein, detaisl dazu kann aus dem XML-Schema entnommen werden.

| Name | Beschreibung | Elternobjekt |
|---|-----|--|
| DetectedObject | Root Element | none |
| object | Element mit Informationen zum gefundenen Objekt im Element selber oder in den Attributen | DetectedObject |
| Reference | Referenz auf eine Liste von bekannten und eindeutig zuweisbaren Objekten der Bahngesellschaft | DetectedObject |
| ObjectAttribute | Weitere Informationen zum Objekt, die Informationen sind in den Attributen enthalten | DetectedObject |

###### XML-Attribute

| Name | Beschreibung | Elternobjekt |
|---|-----|--|
| ID | Eindeutige ID des Ereignisses | DetectedObject |
| Type | Typ des gefundenne Objekts | object |
| Description | weitere Beschreibung oder Informationen zum/vom Objekt | object |
| ObjectConsistency | Hinweis auf die Korrektheit der angegebenen Daten | object |
| ReferenceSystem | Verweis auf den Namen des Systems von dem die Daten stammen | Reference |
| Key | Informationen zu den Daten die im Element "ObjectAttribute" enthalten sind | ObjectAttribute |

##### Limit Violation

Grenzüberschreitungen von Messwerten eines Kanals, können auch als Ereignis aufgenommen werden.  
Das XML-Schema ist in der Datei [EventsGeneric](#events-generic) definiert, das dieser Spezifikation beiliegt.  

###### XML-Elements

| Name | Beschreibung | Elternobjekt |
|---|-----|--|
| LimitViolation | Root-Element | none |

###### XML-Attribute

| Name | Beschreibung | Elternobjekt |
|---|-----|--|
| TimestampMaxViolation | Zeitpunkt der Grenzwertüberschreitung | LimitViolation |
| ViolatedLimit | Name der definierten Grenze | LimitViolation |
| ID | Eindeutige ID des Ereignisses | LimitViolation |

##### Consistency

Die Nachricht über die Konsistenz der Daten, wird von einem System ausgelöst, das alle Daten nach bestimmten Kriterien überprüft. Dies kann zum Beispiel eine Prüfung auf schwarze Bilder in einem Video sein. Sind alle Einzelbilder im Video schwarz, stimmt etwas nicht und das Video ist unbrauchbar. Es werden nur Meldungen erstellt, wenn ein Befund vorliegt.

Das XML-Schema ist in der Datei [EventsGeneric](#events-generic) definiert, das dieser Spezifikation beiliegt.  

###### XML-Elements

| Name | Beschreibung | Elternobjekt |
|---|-----|--|
| Consistency | Root-Element | none |

###### XML-Attribute

| Name | Beschreibung | Elternobjekt |
|---|-----|--|
| Type | Art oder Typ der Konsistenzprüfung als Antwort auf die Frage "Was wurde geprüft?" | Consistency |
| ProcessName | Name des Prozesses der die Konsistenz geprüft hat | Consistency |
| Result | Resultat der Konsistenzprüfung. | Consistency |
| ID | Eindeutige ID des Ereignisses (UUID) | Consistency |

**Result:** Das eigentliche Ergebnis der Konsistenzprüfung. Jedes System das eine Konsistenzprüfung durchführt, hat unterschiedliche Resultate, die wiederum in deren Spezifikation genauer beschrieben werden müssen.

#### Reference "reference"

Beinhaltet eine Liste mit Einträgen, die den Namen des Systems beinhalten, welches das Ereignis ausgelöst hat.

| Name | Date Type | Parent | Mandatory | Ablageart |
|--|----|----|--|--|
| "reference" | string | yes | Einzelwerte |

HDF5 Chunking ist erlaubt und empfohlen.  
Die HDF5 Compression ist erlaubt.  

### Record Group

Anders als Ereignisse werden Protokolle nur von einem Benutzer und nicht von einem System erstellt.
Für alle Protokoll Typen, liegen entsprechende XML-Schemas vor, die die technischen Vorgaben definieren. Metadaten sind in den jeweiligen Kanälen definiert.
Protokolleinträge können Referenzen zu Systeme, Sessions und Kanäle haben.  

| Name | HDF5 Type | Mandatory |
|---|-----|--|
| RECORDS | HDF5 Group | yes |

Innerhalb der Gruppe gibt es nachfolgende Datenfelder:

| Name | Date Type | Parent | Mandatory | Ablageart |
|--|----|----|--|--|
| data | string (XML) | RECORDS | yes | Einzelwerte |
| duration | 64 bit signed integer litle endian | RECORDS | yes | Einzelwerte |
| eventtype | string | RECORDS | yes | Einzelwerte |
| reference | string  | RECORDS | yes | Einzelwerte |
| timestamp | 64 bit signed integer litle endian | RECORDS | yes | Einzelwerte |

Jedes dieser Datensets enthält eine Liste mit Informationen zu einem Eintrag, zu einem bestimmten Zeitpunkt.
Jedes Datenset wird nachfolgend in den jeweiligen Unterkapiteln, genauer beschrieben.  

#### Record Data

| Name | Date Type | Parent | Mandatory | Ablageart |
|--|----|----|--|--|
| "data" | string | RECORDS | yes | Einzelwerte |

HDF5 Chunking ist erlaubt und empfohlen.  
Die HDF5 Compression ist erlaubt.  

In diesem Datenset sind die eigentlichen Informationen zu einem Protokolleintrag enthalten, dies in der XML-Notation die in jedem Kapitel der Protokolltypen genauer beschrieben wird.  
Die Protokolleinträge werden in diesem Datenset als Liste abgespeichert. Für jeden Eintrag kann ein Typ hinterlegt werden. Diese werden im Kapitel [Record Types](#record-types) genauer erklärt.

#### Duration

Definiert pro Eintrag die Zeitdauer des Protokolleintrags selber. Dieser Wert kann auch Null sein.

| Name | Date Type | Parent | Mandatory | Ablageart |
|--|----|----|--|--|
| "duration" | 64 bit integer | RECORDS | yes | Einzelwerte |

HDF5 Chunking ist erlaubt und empfohlen.  
Die HDF5 Compression ist erlaubt.  

#### Reference "reference"

Beinhaltet eine Liste mit Einträgen, die den Namen des Systems beinhalten, welches diesen ausgelöst hat.

| Name | Date Type | Parent | Mandatory | Ablageart |
|--|----|----|--|--|
| "reference" | string | RECORDS | yes | Einzelwerte |

HDF5 Chunking ist erlaubt und empfohlen.  
Die HDF5 Compression ist erlaubt.  

#### Record Types

Beinhaltet den Typ eines Protokolleintrag.

| Name | Date Type | Parent | Mandatory | Ablageart |
|--|----|----|--|--|
| "recordtype" | string | RECORDS | yes | Einzelwerte |

HDF5 Chunking ist erlaubt und empfohlen.  
Die HDF5 Compression ist erlaubt.  

In der Liste "recordtype" wird der Typ, des zu diesem Zeitpunkt aufgenommenen Protokolleintrag, aufgezeigt. Die verschiedenen Typen enthalten unterschiedliche Informationen, die in folgenden Unterkapiteln aufgezeigt werden. Für alle Typen liegen entsprechende XML-Schemas vor die, die technischen Vorgaben definieren.

##### Comment

Kommentare die während einer Messfahrt durch den Benutzer aufgenommen wurden. Der Inhalt ist nicht spezifiziert, nur die XML-Struktur.
Das XML-Schema ist in der Datei [EventsComment](#events-comment) definiert, das dieser Spezifikation beiliegt.  

###### XML-Elements

| Name | Beschreibung | Elternobjekt |
|---|-----|--|
| Comment | Root Element und Meldung, aufgenommen durch den Benutzer | none |

###### XML-Attributes

| Name | Beschreibung | Elternobjekt |
|---|-----|--|
| Username | Name des Benutzers der die Meldung aufgenommen hat | Comment |
| ID | Eindeutige ID dieser Meldung | Comment |

##### Corrupt

Meldungen vom Typ "beschädigt" oder "unbrauchbar" erhalten keine inhaltliche Spezifikation, nur die XML-Struktur ist vorgegeben und hier beschrieben.
Das XML-Schema ist in der Datei [EventsGeneric](#events-generic) definiert, das dieser Spezifikation beiliegt.  

###### XML-Elements

| Name | Beschreibung | Elternobjekt |
|---|-----|--|
| Corrupt | Root Element und Meldung, aufgenommen durch den Benutzer | none |

###### XML-Attributes

| Name | Beschreibung | Elternobjekt |
|---|-----|--|
| Username | Name des Benutzers der die Meldung aufgenommen hat | Corrupt |
| ID | Eindeutige ID dieser Meldung | Corrupt |

### Configuration Group

In der Konfigurationsgruppe können Daten in beliebigem Format abgelegt werden, die für die Konfiguration eines oder mehrerer Messsysteme verwendet wurden. Jede Untergruppe definiert ein Messystem.  
Diese Gruppe ist unterhalb der eines Messsystems und somit innerhalb der Gruppe [Measuring System Group](#measuring-system-group).  

| Name | Parent | Mandatory |
|--|--|--|
| CONFIGURATION | MEASURINGSYSTEM | yes |

#### Configuration Group Datensets

In dieser Gruppe gibt es zwei Datensets enthalten:

| Name | Date Type | Parent | Mandatory | Ablageart |
|--|----|----|--|--|
| key | string | CONFIGURATION | yes | Einzelwerte |
| value | string or binary | CONFIGURATION | yes | Einzelwerte |

**key:** In diesem Datenset wird der Name des Messystems angegeben, zu dem die abgelegte Konfiguration gehört.  
**value:** In diesem Datentset wird die eigentliche Konfiguration abgelegt. Diese Konfigutation kann Binär oder als Zeichenkette abgelegt werden.  

### Data Processing Group

Die Datenquellengruppe `DATAPROCESSING` enthält Informationen zur Datenverarbeitung. Diese Informationen werden von Systemen geschrieben, die Änderungen an den Daten vornehmen. Diese Änderungen, können zum Beispiel Umrechnungen von Milimetern in Meter sein.

| Name | Parent | Mandatory |
|--|--|--|
| DATAPROCESSING | RCMDX | yes |

#### Data Processing Group Datensets

Die Gruppe `DATAPROCESSING` enthält zwei Datenset:

| Name | Date Type | Parent | Mandatory | Ablageart |
|--|----|----|--|--|
| key | string | DATAPROCESSING | yes | Einzelwerte |
| value | string | DATAPROCESSING | yes | Einzelwerte |

**key:** In diesem Datenset wird der Name des Systems gespeichert, die Änderungen an den Daten vorgenommen hat.  
**value:** In diesem Datentset wird die eigentliche Information abgelegt (was wurde geändert?).  

Weiter ist ein `timestamp` Datenset notwendig. Darin der Erstellungszeitpunkt der Information in das Datenset.

### Clearance Information Group

Diese Gruppe dient der SBB für das Festhalten von Informationen über die Datenfreigabe aller Parteien die diese Daten verarbeitet haben. Die Informationen werden in Form von Key-Value Paaren, in einem Datenset abgespeichert.

| Name | Parent | Mandatory |
|--|--|--|
| CLEARANCEINFORMATION | RCMDX | yes |

Folgende Attribute sind in dieser Gruppe enthalten:

| Name | Data Type | Parent | Mandatory | Description |
|--|--|---|--|----|
| clearance | 8 bit integer (boolean) | CLEARANCEINFORMATION | yes | Null für `false`, eins für `true` Bei `true` wurden die Daten in der gesammten Datei freigegeben, ansonsten sind die Daten als Testdaten zu betrachten oder sind von geringerer Qualität. |
| clearance_date | 64 bit integer | CLEARANCEINFORMATION | yes | Zeitstempel an dem die Daten freigegeben wurden (`clearance` auf `true`). |

Im Datenset `timestamp` wird der Zeitpunkt der Erfassung eines Key-Value Paares festgehalten.

#### Datenset

Die Gruppe `CLEARANCEINFORMATION` enthält zwei Datenset:

| Name | Date Type | Parent | Mandatory | Ablageart |
|--|----|----|--|--|
| key | string | CLEARANCEINFORMATION | yes | Einzelwerte |
| value | string | CLEARANCEINFORMATION | yes | Einzelwerte |

**key:** In diesem Datenset wird der Name des Systems eingetragen, der diesen Eintrag erstellt hat.  
**value:** In diesem Datenset, wird die eigentliche Freigabeinformation eingetragen.  

Weiter ist ein `timestamp` Datenset notwendig. Darin der Erstellungszeitpunkt der Information in das Datenset.

## XML Schema Definitionen

### Events Comment

```xml
<?xml version="1.0" encoding="UTF-8"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:tns="http://www.sbb.ch/RCMDX/Events/Comment"
  targetNamespace="http://www.sbb.ch/RCMDX/Events/Comment"
  elementFormDefault="qualified">

  <xs:include schemaLocation="../RcmDxDataTypes.xsd" />

  <xs:element name="Comment">
    <xs:complexType>
      <xs:simpleContent>
        <xs:extension base="xs:string">
          <xs:attribute name="Username" type="xs:string" use="required" />
          <xs:attribute name="ID" type="tns:UUID" use="required" />
        </xs:extension>
      </xs:simpleContent>
    </xs:complexType>
  </xs:element>

</xs:schema>
```

### Events Defect

```xml
<?xml version="1.0" encoding="UTF-8"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:tns="http://www.sbb.ch/RCMDX/Events/Defect"
  targetNamespace="http://www.sbb.ch/RCMDX/Events/Defect"
  elementFormDefault="qualified">

  <xs:include schemaLocation="../RcmDxDataTypes.xsd" />

  <xs:element name="Defect">
    <xs:complexType>
      <xs:sequence>
        <xs:element name="PossibleDefectNames" type="xs:string" minOccurs="0" maxOccurs="unbounded" />
        <xs:element name="PossibleClassifications" type="xs:string" minOccurs="0" maxOccurs="unbounded" />
        <xs:element name="PossibleValidationResults" type="xs:string" minOccurs="0" maxOccurs="unbounded" />
      </xs:sequence>
      <xs:attribute name="Classification" type="xs:string" use="required" />
      <xs:attribute name="DefectName" type="xs:string" use="required" />
      <xs:attribute name="Details" type="xs:string" use="required" />
      <xs:attribute name="Parameter1Name" type="xs:string" />
      <xs:attribute name="Parameter1Value" type="xs:string" />
      <xs:attribute name="Parameter2Name" type="xs:string" />
      <xs:attribute name="Parameter2Value" type="xs:string" />
      <xs:attribute name="Parameter3Name" type="xs:string" />
      <xs:attribute name="Parameter3Value" type="xs:string" />
      <xs:attribute name="ID" type="tns:UUID" use="required" />
    </xs:complexType>
  </xs:element>
</xs:schema>
```

### Events Generic

```xml
<?xml version="1.0" encoding="UTF-8"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:tns="http://www.sbb.ch/RCMDX/Events/Generic"
  targetNamespace="http://www.sbb.ch/RCMDX/Events/Generic"
  elementFormDefault="qualified">

  <xs:include schemaLocation="../RcmDxDataTypes.xsd" />

  <xs:element name="Corrupt">
    <xs:complexType>
      <xs:simpleContent>
        <xs:extension base="xs:string">
          <xs:attribute name="Username" type="xs:string" use="required" />
          <xs:attribute name="ID" type="tns:UUID" use="required" />
        </xs:extension>
      </xs:simpleContent>
    </xs:complexType>
  </xs:element>

  <xs:simpleType name="ObjectConsistencyXml">
    <xs:restriction base="xs:string">
      <xs:enumeration value="Ok" />
      <xs:enumeration value="OnlyInReal" />
      <xs:enumeration value="OnlyInData" />
      <xs:enumeration value="Measured" />
    </xs:restriction>
  </xs:simpleType>

  <xs:element name="DetectedObject">
    <xs:complexType>
      <xs:sequence>
        <xs:element name="object" minOccurs="1" maxOccurs="1">
          <xs:complexType>
            <xs:simpleContent>
              <xs:extension base="xs:string">
                <xs:attribute name="Type" type="xs:string" use="required" />
                <xs:attribute name="Description" type="xs:string" use="required" />
                <xs:attribute name="ObjectConsistency" type="tns:ObjectConsistencyXml" use="required" />
              </xs:extension>
            </xs:simpleContent>
          </xs:complexType>
        </xs:element>
        <xs:element name="Reference" minOccurs="0" maxOccurs="unbounded">
          <xs:complexType>
            <xs:simpleContent>
              <xs:extension base="xs:string">
                <xs:attribute name="ReferenceSystem" type="xs:string" use="required" />
              </xs:extension>
            </xs:simpleContent>
          </xs:complexType>
        </xs:element>
        <xs:element name="ObjectAttribute" minOccurs="0" maxOccurs="unbounded">
          <xs:complexType>
            <xs:simpleContent>
              <xs:extension base="xs:string">
                <xs:attribute name="Key" type="xs:string" use="required" />
              </xs:extension>
            </xs:simpleContent>
          </xs:complexType>
        </xs:element>
      </xs:sequence>
      <xs:attribute name="ID" type="tns:UUID" use="required" />
    </xs:complexType>
  </xs:element>

  <xs:element name="LimitViolation">
    <xs:complexType>
      <xs:attribute name="TimestampMaxViolation" type="xs:long" use="required" />
      <xs:attribute name="ViolatedLimit" type="xs:string" use="required" />
      <xs:attribute name="ID" type="tns:UUID" use="required" />
    </xs:complexType>
  </xs:element>

  <xs:element name="Consistency">
    <xs:complexType>
      <xs:attribute name="Type" type="xs:string" use="required" />
      <xs:attribute name="ProcessName" type="xs:string" use="required" />
      <xs:attribute name="Result" type="xs:string" use="required" />
      <xs:attribute name="ID" type="tns:UUID" use="required" />
    </xs:complexType>
  </xs:element>

</xs:schema>
```

### RCM-DX Data Types

```xml
<?xml version="1.0" encoding="UTF-8"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema" elementFormDefault="qualified">
  <xs:simpleType name="restrictedString">
    <xs:restriction base="xs:string">
      <xs:minLength value="1" />
      <xs:maxLength value="512" />
      <xs:pattern value="[a-zA-Z0-9_\-\.]+" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="restrictedStringWithColon">
    <xs:restriction base="xs:string">
      <xs:minLength value="1" />
      <xs:maxLength value="512" />
      <xs:pattern value="[a-zA-Z0-9_\-\.:]+" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="restrictedID">
    <xs:restriction base="xs:ID">
      <xs:minLength value="1" />
      <xs:maxLength value="512" />
      <xs:pattern value="[a-zA-Z0-9_\-\.]+" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="restrictedIDREF">
    <xs:restriction base="xs:IDREF">
      <xs:minLength value="1" />
      <xs:maxLength value="512" />
      <xs:pattern value="[a-zA-Z0-9_\-\.]+" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="versionString">
    <xs:restriction base="xs:string">
      <xs:minLength value="1" />
      <xs:maxLength value="32" />
      <xs:pattern value="[a-zA-Z0-9_\-\.]+" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="portNumber">
    <xs:restriction base="xs:int">
      <xs:minExclusive value="0" />
      <xs:maxInclusive value="65535" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="ipAddress">
    <xs:restriction base="xs:string">
      <xs:pattern value="(([0-9]{1,3}\.){3}[0-9]{1,3})" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="network">
    <xs:restriction base="xs:string">
      <xs:pattern value="(([0-9]{1,3}\.){3}[0-9]{1,3})/[0-9]{1,2}" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="hostName">
    <xs:restriction base="xs:string">
      <xs:pattern value="(([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\-]*[a-zA-Z0-9])\.)*([A-Za-z0-9]|[A-Za-z0-9][A-Za-z0-9\-]*[A-Za-z0-9])" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="ipAddressOrHostName">
    <xs:union memberTypes="ipAddress hostName" />
  </xs:simpleType>
  <xs:simpleType name="nonNegativeInt">
    <xs:restriction base="xs:int">
      <xs:minInclusive value="0" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="positiveInt">
    <xs:restriction base="xs:int">
      <xs:minInclusive value="1" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="positiveFloat">
    <xs:restriction base="xs:float">
      <xs:minExclusive value="0" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="positiveIntOrMinus1">
    <xs:restriction base="xs:int">
      <xs:minInclusive value="-1" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="positiveLong">
    <xs:restriction base="xs:long">
      <xs:minExclusive value="0" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="nonNegativeLong">
    <xs:restriction base="xs:long">
      <xs:minInclusive value="0" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="compressionLevel">
    <xs:restriction base="xs:integer">
      <xs:minInclusive value="0" />
      <xs:maxInclusive value="9" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="mimeType">
    <xs:restriction base="xs:string">
      <xs:pattern value="[!#$%'*+\-0-9A-Z\^_'a-z{|}~]+/[!#$%'*+\-0-9A-Z\^_'a-z{|}~]+(; *[^;]+)*" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="nonEmptyString">
    <xs:restriction base="xs:string">
      <xs:minLength value="1" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="UUID">
    <xs:restriction base="xs:string">
      <xs:pattern
        value="(urn:uuid:)?[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}|\{[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}\}" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="vehicleNumber">
    <xs:restriction base="xs:string">
      <xs:pattern value="[0-9]{2} [0-9]{2} [0-9]{4} [0-9]{3}-[0-9]" />
    </xs:restriction>
  </xs:simpleType>
  <xs:simpleType name="httpUrl">
    <xs:restriction base="xs:anyURI">
      <xs:pattern value="https?://.+" />
    </xs:restriction>
  </xs:simpleType>
</xs:schema>
```
