# Rail condition monitoring data exchange format (RCM-DX format)

[![Contributor Covenant](https://img.shields.io/badge/code_of_conduct-contributor_covenant-14cc21)](CODE_OF_CONDUCT.md) ![RCM-DX](https://img.shields.io/badge/RCM--DX-V2.0-green) ![RCM-DX](https://img.shields.io/badge/document-V0.29-blue) [![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

## RCM-DX specification

The specification is available in two formats:

- Markdown: [RCM-DX-Specification_EN.md](RCM-DX-Specification_EN.md)
- PDF: [RCM-DX-Specification_EN.pdf](https://github.com/OpenRailAssociation/rcm-dx/releases/latest/download/RCM-DX-Specification_EN.pdf)

## Motivation

Railroad companies continuously gather data of their rail, overhead line, and telecommunications networks by means of mobile and stationary measuring systems. Data flows from these systems through processing units (which enrich, evaluate and validate the data), to systems that display the data to subject matter experts and also to systems that automatically analyse it.

This specification defines the rail condition monitoring data exchange format (RCM-DX format) which is a data format optimised for data in the railroad context, i.e. for data points localised within a railroad network. The RCM-DX format is a file format based on the [HDF5 specification](https://www.hdfgroup.org/solutions/hdf5/) and defines a structure of HDF5 groups, datasets, and attributes. The document at hand also describes the content of the elements defined. Although the format is open and can in principle be implemented right away by any railroad company, this specification contains a few non-generic elements and naming conventions that are specific to SBB (Swiss Federal Railways). The reason for this is that any file that adheres to this specification can be used with the RCM Viewer (see below).

The RCM-DX format is developed and maintained by the SBB company. An extension of the specification is permitted, yet, it must be taken into account that the resulting data file may no longer be read or processed by other systems supporting the RCM-DX format.

The RCM-DX format is a file format detailing the HDF5 format version 2.0. HDF5 was chosen for several reasons, including that it is an open format. HDF5 is a hierarchical data storage format where the data is arranged in a tree structure. The HDF5 format is described on the webpage of the HDF5-group, in particular on the site [HDF5 file format specification](https://support.hdfgroup.org/documentation/hdf5/latest/_s_p_e_c.html). The HDF5 group offers tools and libraries for various programming languages and operating systems that allow to read and write HDF5 files.

The specification was developed within SBB and published as an open source standard in 2022, which allowed for easier collaboration with other railway companies, as well as suppliers of measurement systems.
With the formation of the OpenRail Association it was decided to donate the standard to the association, to put the project under independent stewardship.

## Who is the specification for

This specification is for railway companies looking for a uniform format to store their recorded measurement data and to process them with suitable, already existing open source software or own developments or to exchange them with others. Suppliers of measurement systems can use this specification to deliver their data in an open format.
SBB is working on providing further open-source solutions, for example to read, write and display files in RCM-DX format.

## Readability

The RCM-DX specification was written in the markup language "Markdown" and optimized for the program "Pandoc". Thus the specification can be opened and read with any text program or with a Markdown-Viewer or it can be converted into a PDF with some additional software. A PDF creation guide is described in the chapter below.

## Create a PDF from this specification

### Using Docker

You can easily compile a modified version of the specification using Docker. The following options can be passed as environment variables:

- `SPEC_VERSION` (string): The version number which can be seen in the file name and in the specification.
- `IS_DRAFT` (`true`/`false`): If true, a "DRAFT" watermark is added to every page of the PDF.

```sh
docker build . -t rcm-dx-specification
docker run --rm --env SPEC_VERSION=<version> --env IS_DRAFT=<true/false> --volume "$(pwd):/data" rcm-dx-specification
```

After this, you'll find the generated specification in the folder `generated-specs`.

### Locally (using Windows)

The creation of a PDF requires the installation of [Pandoc](https://pandoc.org/installing.html) and [MiKTeX](https://miktex.org/). These two programs are free! Since the installation is already well described on their web pages, we will refrain from doing so here. It can happen that "MiKTeX" has to download and install additional packages and asks for permission, these are necessary for the PDF creation!

For generating the images, we use [PlantUML](https://plantuml.com/de/) which comes as a JAR-File. PlantUML uses the free software [Graphviz](https://www.graphviz.org/) which must be installed on the host system. Please follow the instructions on the Graphviz website to instal it correctly.

After the successful installation, the file `createPdf.bat 'version' 'draft'` can be executed. The finished PDF should then be in the subdirectory "generated-specs/\*".

By `version` is meant the version number, which can be seen in the file name and in the specification.

If "draft" is given as the second argument, the word "DRAFT" appears on the background of the PDF over the entire page as a hint.

**For example**  
`createPdf.bat 0.3 draft` Creates a specification in version 0.3 as a draft.  
`createPdf.bat 1.0` Creates a specification in version 1.0 as a final release version.

#### Create the pictograms

The pictograms are converted from text to images using [PlantUML](https://plantuml.com/).
The images are written in a defined language in textfiles with the extension `.puml` and then converted into images.

Images can be created from the file "rcm-dx-images.puml" as follows:

```shell
plantuml images/rcm-dx-images.puml -o generated
```

The images are then stored in the "images/generated" directory.

## RCM-DX Viewer

The RCM-DX Viewer is a powerful and versatile application for viewing RCM files. While the release of the source code as Open Source Software is still in the works, you can find the latest binary distribution (.msi) on the releases page of the rcm-dx-viewer repository: <https://github.com/SchweizerischeBundesbahnen/rcm-dx-viewer/releases>

## License

This project is licensed under [Eclipse Public License 2.0](LICENSE).
