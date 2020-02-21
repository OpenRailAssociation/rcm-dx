# Rail condition monitoring data exchange format (RCM-DX format)

## Motivation

Railroad companies continuously gather data of their rail, overhead line, and telecommunications networks by means of mobile and stationary measuring systems. Data flows from these systems through processing units -- which enrich, evaluate and validate the data --, to systems that display the data to subject matter experts and also to systems that automatically analyse it.

This specification defines the rail condition monitoring data exchange format (RCM-DX format) which is a data format optimised for data in the railroad context, i.e. for data points localised within a railroad network. The RCM-DX format is a file format based on the HDF5 specification and defines a structure of HDF5 groups, datasets, and attributes. The document at hands also describes the content of the elements defined. Although the format is open and can in principle be implemented right away by any railroad company, this specification contains a few non-generic elements and naming conventions that are specific to SBB (Swiss Federal Railways). The reason for this is that any file that adheres to this specification can be used with the RCM Viewer, an application available soon to the public via a website.

The RCM-DX format is developed and maintained by the SBB company. An extension of the specification is permitted, yet, it must be taken into account that the resulting data file may no longer be read or processed by other systems supporting the RCM-DX format.

The RCM-DX format is a file format detailing the HDF5 format version 2.0. HDF5 was chosen for several reasons, including that it is an open format. HDF5 is a hierarchical data storage where the data in arranged in a tree structure. The HDF5 format is described on the webpage of the HDF5-group, in particular on the site HDF5 file format specification. The HDF5 group offers tools and libraries for various programming languages and operating systems that allow to read and write HDF5 files.

## Who is the specification for

This specification is for railway companies looking for a uniform format to store their recorded measurement data in a uniform way and to process them with suitable, already existing open source software or own developments or to exchange them with others.  
SBB is working on providing further open-source solutions, for example to read, write and display files in RCM-DX format.

## Readability

The RCM-DX specification was written in the markup language "Markup language" and optimized for the program "Pandoc". Thus the specification can be opened and read with any text program or with a Markdown-Viewer or it can be converted into a PDF with some additional software. A PDF creation guide is described in the chapter "Create PDF".

## Create a PDF from this specification

### Needed Software

#### for Windows

The creation of a PDF requires the installation of [Pandoc](https://pandoc.org/installing.html) and [MiKTeX](https://miktex.org/). These two programs are free! Since the installation is already well described on their web pages, we will refrain from doing so here. It can happen that "MiKTeX" has to download and install additional packages and asks for permission, these are necessary for the PDF creation!

After the successful installation the file "createPdf.bat" can be executed. The finished PDF should then be in the subdirectory "generated-specs/pdf".

#### for Linux/Ubuntu

Some distributions come with Pandoc pre-installed. Otherwise, the installation is very well described on the [Pandoc Website](https://pandoc.org/installing.html#linux)!

## Create the pictograms

The pictograms are converted from text into images using the open source software [PlantUML](https://plantuml.com/de/). The images are written in a defined language in files with the extension "*.puml" and then converted into images.

PlantUML already exists as a JAR file in the "bin" directory.

Images can be created from the file "images.puml" as follows:

``` batch
java -jar ./bin/plantuml.jar images.puml -o images/generated
```

The images are then stored in the "images/generated" directory.
