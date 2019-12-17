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
| V0.16 | 11.07.2016 | Pascal Brem (SCS) | New Hash code attribute for the topology. |
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

| Date | Name | Function |
|---|---|------|
| - | - | - |

## Referenced Documents

| ID | Document name | Version | Date |
|--|------|--|--|
| P0402-4-350 | RCM_DX_specification_0.28.docx | V0.28 | 05.06.2019 |

## Introduction  

### Motivation  

SBB regularly checks and repairs its rail network to ensure the safety of passengers in SBB rail vehicles. In addition to manual measurements, the inspection is also carried out automatically with the aid of measuring and diagnostic vehicles. The measurements generate an enormous amount of data, which is then simply processed and archived.  
An entire ecosystem has already been established for the presentation and further processing of this data. For this reason, this RCM-DX specification is intended to describe a defined format so that surrounding systems that use this specification can process the data in a controlled manner.  
This specification is also aimed at other railway operators. For this reason, this specification is available to the public. SBB is also responsible for the coordinated further development and release of the specification.

### Hints

#### RCM-DX structure

RCM-DX defines a structure of HDF5 groups, data sets, and attributes that software solutions that use this format must adhere to.  
The extension of the specification is permitted. However, it must be taken into account that such data may no longer be read or processed by existing systems.  

#### Versioning

The RCM-DX data format is subject to changes, these are indicated by the version number in the document, see chapter [Root Group](#root-group). The version number consists of three numbers separated by dots and is composed as follows: **[Major].[Minor].[Patch]**. Example: **1.0.0**  

**Major:** Indicates large change in data format that are not backward compatible. Examples are the modification of structures or the naming of existing groups.  
**Minor:** Minor changes that represent an extension and are still backward compatible. Examples include defining new groups for datasets or new datatypes, etc.  
**Patch:** Notification of bug fixes. These can be changes to descriptions in the documentation, i.e. changes to this specification that do not affect the structure of the RCM-DX.  

#### Text Formatting

The following typographical conventions are used to simplify reading the specification:

References to another chapter look like this: [Reference to chapter "Text Formatting"](#text-formatting)  
References to a external web page look like this: [Link to a URL "sbb.ch"$\to$](http://www.sbb.ch)  
A word that receives a reference to a footnote looks like this: footnote^[footnote: footnotes are displayed at the bottom of the page.]  

> This is an important hint, please note me!

#### Diagrams

The following figure shows an example of a used diagram type and its elements:

![RCM-DX Diagram Overview](images/generated/RCM_DX_diagram_example.png)

## Sefinitions

This document defines technical restrictions as well as content descriptions. This chapter provides an overview of the data types used, types of names, and other important points.

### File names

Files following the RCM-DX specification get their own defined file extension, which is `rcmdx`.  

Example of a file name: `20201228_081522_TGMS.rcmdx`.

### Primitive and extended data types

Possible data types for channels should be taken from the HDF5 specification.  

Data types that are used in this specification and require a more detailed description are described below.  

| Name | Description | Example |
|--|------|----|
| UUID | Universally Unique Identifier as Unique ID | `550e8400-e29b-11d4-a716-4466554400` |
| Timestamp | Unique and worldwide defined format of a time, since January 1, 1970 00:00 UTC without leap seconds | `1553237099000000000` |

### (HDF5) Gruppen

If we are talking about a group in this document, we mean the groups in HDF5 format (of the type `HDF5 Group`). These contain additional groups or datasets.

If a name of a group in this document is written in capital letters (for example "TOPOLOGY"), it is exactly the same as in the RCM-DX file. If the naming of a group is not fixed, the corresponding chapter describes in more detail how the name is composed.

If a name of a group is to contain visible word separations in a form, this should be done with a period. The following example: "XPOS.DATA.LONGITUDE".  

Groups are described in this specification as follows:

| Name | Parent object | Mandatory |
|--|--|--|
| SectionInfo | "session_name" | yes |

**Name:** The name of the group.  
**Parent object:** A group can be a subgroup of a group, here the name of this group is mentioned. If the name is written in quotation marks, it can be freely chosen by the creator of the file. Without quotation marks, the name of the group is meant.  
**Mandatory:** If the group is absolutely necessary and must exist, `yes` is written here, otherwise `no`.  

### (HDF5) Attribut

In the RCM-DX, attributes, groups and data sets can be assigned. The names of the attributes are written in the UpperCamelCase-Notation^1^. Attributes are always of type `HDF5 attribute` unless otherwise specified.

Attributes are described in this specification as follows:

| Name | Data Type | Parent object | Mandatory | Description |
|--|---|---|--|-------|
| StartTime | 64 bit integer | "session_name" | yes | Start time in miliseconds, for example: "1553237099000000000" |

**Name:** The name of the attribute  
**Data Type:** Primitive data type of the attribute, this describes the type of the content in the attribute itself.  
**Parent object:** An attribute is always assigned to a group or a data set, here the name of this group or data set is mentioned.  
**Mandatory:** If the attribute is absolutely necessary and must exist as well as contain a value, `yes` is written here, otherwise `no`.  
**Description:** Description and or examples of the attribute  

^1^Upper-Camel-Case-Notation: The Upper Camel Case Notation defines the way a composite name is written. Further information can be found at the following link: [Uper Camel Case$\to$](https://en.wikipedia.org/wiki/Camel_case)

### (HDF5) Datasets

A channel and its data set can hold different types and types of data. The HDF5 group defines the way of storage, but not the names.  
A dataset is always of the HDF5 type `HDF5 Dataset`.  
Below is a list of possible ways in which data can be stored in the RCM-DX:

| Type of storage | Description |
|----|------|
| Single values | Simple array of undefined length. Results in a data set. |
| Indexed single values | Simple array of dimension 1D. Beside a dataset `timestamp` a dataset `timeindex` is created, which contains an indexing of the data and simplifies the reading of the data. The dataset `timeindex` is described in more detail in the chapter [Time Indices](#time-indices) |
| Image | An image taken at a defined time |
| Video | A video that has been streamed into several individual blocks of defined size, split and saved |

The data sets are described in the lowerCamelCase-Notation^2^. Data sets are described in this specification as follows:

| Name | Data type | Parent object | Mandatory | Storage type |
|--|---|----|---|------|
| timestamp | 64 bit integer | "datasource_name" | yes | single values |

**Name:** The name of the data set.  
**Data Type:** Primitive data type of the content in the data set, thus the data type of the contained data.  
**Parent object:** A data set is always assigned to a group, here the name of this group is mentioned.  
**Mandatory:** If the data set is absolutely necessary and must be present, `yes` is written here, otherwise `no`.  
**Storage type:** One of the storage types described in this chapter  

Descriptions of the data set are added outside the table.  

^2^lower-Camel-Case-Notation: The lower camel case notation defines the way a composite name is written. Further information can be found under the following link: [lower Camel Case$\to$](https://en.wikipedia.org/wiki/Camel_case)

#### HDF5 Compression

To save space, compression filters can be applied to data sets. Below you can see for all datasets whether this is recommended or not. The compression and which functions the HDF5 group offers is described in more detail on its website under the link: [HDF5 Compression Website$\to$](https://support.hdfgroup.org/HDF5/faq/compression.html). For a data set, for example, it says that "HDF5 compression" is allowed or not.

#### HDF5 Chunking

Besides the "HDF5 Compression" there is the "HDF5 Chunking" for data within a dataset. This means that the data is divided into blocks, which in turn can be processed independently. This also allows faster access to parts of the data. Whether a splitting is allowed and recommended can be seen with each data set, for example: "HDF5 Chunking" is allowed and recommended. The HDF5 chunking is described in more detail on the website of the HDF5 group: [HDF5 Chunking Website$\to$](https://support.hdfgroup.org/HDF5/doc/H5.user/Chunking.html)

## Data structures

### Single values

Channels which record individual measured values contain a data set with the name `data`, this data set is mandatory. Single values are stored in this dataset as a 1D array, the length of this array (or list) is not limited.

The possible data types are defined by the HDF5 Group, and can be read on the website of the HDF5 Group.

Boolean values (`true`/`false`) are represented as `8 bit integer, little endian`, zero means `false`, all values greater than zero mean `true`.

If measurement data are recorded in 3D space, three different channels must be created.

The following attributes are assigned to this type of data set:

| Name | Data Type | Parent object | Mandatory | Description |
|---|----|--|--|-----|
| Unit | string | "data_set" | yes | A physical unit or empty if the data does not correspond to a physical unit |

### Data preview

In addition to integer and floating-point datasets, special datasets with preview data can be created. For a preview value, a defined set of entries (data block) from a data set is calculated together to give, for example, an average value. This type of data set provides a quick overview of the recorded data.  
Three datasets with unique names are defined as follows to include preview values:

| Name | Contents |
|----|----|
| data.PRE.AVG.X | Calculated average of data block |
| data.PRE.MIN.X | Smallest value in data block |
| data.PRE.MAX.X | Largest value in data block |

The `X` is replaced by the block size. For example, if the block size of ten entries is defined and the average of the values is calculated, the data set would be named as follows: `data.PRE.AVG.10`.  
By specifying the block size, it is not necessary to create a data set that contains the start time stamp of the data block.  
If a dataset contains $600$ entries, the dataset `timestamp` contains the same number of entries but the dataset `data.PRE.AVG.10` contains only $60$ entries.  
Further dind the two data sets `timestamp` and `duration` within the group contain.

| Name | Data type | Parent object | Mandatory | Storage type |
|--|---|----|---|------|
| timestamp | 64 bit integer | "limit_name" | yes | single values |
| duration | 64 bit integer | "limit_name" | no | single values |

### Limits

A channel group can contain one or more limit groups. Each limit group contains its own `timestamp` dataset and can also contain a `duration` dataset. If a defined limit value of a measured value of the channel is exceeded, an entry in the `timestamp` dataset follows. Using the optional dataset `duration`, the duration of a limit value exceedance can be specified per entry in the dataset `timestamp`. If both datasets exist, they contain the same number of entries!  

The group of limit values is defined as follows:

| Name | Parent object | Mandatory |
|--|--|--|
| LIMIT | "channel_name" | no |

The group `LIMIT` now contains further groups, each with the name of the limit exceeding, e.g. `TEMP`:

| Name | Parent object | Mandatory |
|--|--|--|
| "limit_name" | `LIMIT` | yes |

It contains the following data sets:

| Name | Data type | Parent object | Mandatory | Storage type |
|--|---|----|---|------|
| timestamp | 64 bit integer | "limit_name" | yes | Single values |
| duration | 64 bit integer | "limit_name" | no | Single values |

![Structure for the recording of limit exceedances](images/generated/Limit_overview.png){width=210px}

### Coordinates

Measurement data that can be assigned to a coordinate system are given a defined name according to the following pattern: `coord.CN`.  
This type of data storage allows several entries to be recorded per measurement time. Thus there are more entries in these datasets than in the dataset `timestamp`. How many entries per timestamp belong to each other (as a group) is stored in another dataset with the name `sampleindex`.

| Element | Description |
|--|------|
| coord | Simple character string for identifying data of type Coordinates |
| . | Separators.
| C | Additional character for identifying data of type Coordinates |
| N | Index Number beginning with "0", increasing for each additional coordinate Data sets |

The data set is defined as follows:

| Name | Data type | Parent object | Mandatory | Storage type |
|--|------|--|---|---|
| coord.CN | 8, 32 or 64 bit signed integer or 64 or 32 bit floating point; (little endian in each case) | "channel_name" | yes | Single |

HDF5 chunking is allowed and recommended, HDF5 compression is allowed.  

The following attributes are assigned to this type of data set:

| Name | Data Type | Parent object | Mandatory | Description |
|---|----|--|--|-----|
| Unit | string | Data set `coord.CN` | yes | One physical unit or empty if the data does not correspond to any physical unit |

#### Sample Index

If datasets are created for coordinates, a dataset on the same level and with the name `sampleindex` must be available. The index number of an entry in `coord.CN`, `timestamp`, is entered as the start of the next group. If the data set `sampleindex` has a value of $21$ at index zero, the first $20$ entries from the data set `coord.CN` belong together.

The resulting group size in the dataset `sampleIndex` may differ.

*Example*  
The rail cross profile serves as an example here. At one point several points of a rail profile are measured and stored. A channel with the names `coord.C0` and `coord.C1` is created for both the X-axis and the Y-axis.

The data set `sampleindex` now contains the number of entries that belong together.  

Below is a picture of a rail cross section measurement with about 2000 measuring points:

![Image of a rail cross section measurement](images/rail-cross-profile.jpg)

### Pictures

Images can be saved in compressed or uncompressed form. The format of the images is stored in an attribute so that the image can be read correctly.  
Images are stored as binary data blocks, so an image results in a data set.
All images are stored in a group called `IMG`. All images in this group have the same properties that are stored in the attributes.  

| Name | Parent object | Mandatory |
|--|----|--|
| IMG | "datasource_name" | yes |

The group `IMG` gets the following attributes for the more detailed description of the images contained therein:

| Name | Data Type | Parent object | Mandatory | Description |
|---|----|---|---|-----|
| ContentType | string | `IMG` | yes | Data type of images specified as MIME^3^ type, for example `Content-Type: <image/jpeg>`|
| DataType | string | `IMG` | no | Description of data type, if no standard image, see [ContentType without Image MIME type](#contenttype-without-image-mime-type) |
| ResolutionType | string | `IMG` | yes | Information about the point density of the images (example: $ppmm = pixel per millimeter$) |
| ResolutionX | 32 bit integer | `IMG` | yes | Resolution in X direction |
| ResolutionY | 32 bit integer | `IMG` | yes | Resolution in Y-direction |

Images can have different resolutions in X and Y direction, this must be considered for a correct representation and evaluation of the images.
HDF5 chunking is recommended and HDF5 compression is allowed.  

**^3^MIME:** A list of possible MIME types can be found at the link [https://www.iana.org/assignments/media-types/media-types.xhtml$\to$](https://www.iana.org/assignments/media-types/media-types.xhtml). This is maintained by the [Internet Assigned Numbers Authority, IANA$\to$](https://www.iana.org/).

#### ContentType without Image MIME Type

If the created and saved image requires a special software to display it, the following MIME type should be added to the attribute `ContentType`: `Content-Type: <application/octet-stream>`.  
To store more information, for example which system created the data, a new attribute can be added to the group `IMG`. The attribute gets the name `DataTyp`.

#### Naming the dataset for an image

| Name | Data type | Parent object | Mandatory | Storage type |
|---|-----|--|--|--|
| IMG.NNNNNNNNN | 8, 16, 32 bit integer, depending on color depth | `IMG` | yes | picture |

The images are named according to the following pattern: `IMG.NNNNNNNNN`, hereinafter a description of the individual elements.

| Element | Description |
|--|-------|
| IMG | String for the name of an image |
| . | Separators.
| NNNNNNNNN | Picture number, beginning with 000000000 (nine characters)|

### Videos

As with the images, videos can be saved in compressed or uncompressed form. The format is stored in an attribute to make it easier to read the images.  
Videos are stored as streams in individual blocks. The blocks are single data sets with a given name.

| Name | Parent object | Mandatory |
|--|--|--|
| VID | "datasource_name" | yes |

Below is a list of the attributes assigned to the data group `VID`:

| Name | Data Type | Parent object | Mandatory | Description |
|---|---|--|--|-----|
| ContentType | string | `VID` | yes | Data type of the video stream specified as MIME^4^ type, for example `Content-Type: <video/h264>`|
| DataType | string | `VID` | no | Description of data type if no standard video format, see [ContentType without video MIME type](#contenttype-without-video-mime-type) |
| ResolutionX | 32 bit integer | `VID` | yes | Resolution in X direction in pixels |
| ResolutionY | 32 bit integer | `VID` | yes | Resolution in Y direction in pixels |
| FramesPerSecond | 16 bit integer | `VID` | yes | Number of frames per second (fps) in which the video was recorded |
| PreambleDuration | 64 bit integer | `VID` | yes | Duration of the introductory video range in nanoseconds |
| TrailerDuration | 64 bit integer | `VID` | yes | Duration of the video credits area in nanoseconds |



> TODO: Clarify:
> When will there be a preamble and a trailer?
> What is in the data set Duration?



**^4^MIME:** A list of possible MIME types can be found at the link [https://www.iana.org/assignments/media-types/media-types.xhtml$\to$](https://www.iana.org/assignments/media-types/media-types.xhtml). This is maintained by the [Internet Assigned Numbers Authority, IANA$\to$](https://www.iana.org/).

#### ContentType without Video MIME Type

If the created and saved video stream needs its own special software to display it, the following MIME type should be added to the `ContentType` attribute: `Content-Type: <application/octet-stream>`.  
To store more information, for example which system created the data, a new attribute can be added to the group `VID`. The attribute gets the name `DataTyp`.

#### Name of the dataset for a video

A video data block is named according to the following pattern: `VID.NNNNNNNNN`, hereinafter a description of the individual elements.

Element|Description|
|--|---|
| VID | String for the name of a video |
| . | Separator |
| NNNNNNNNN | Video number, starting with 000000000 (nine characters), ascending +1|

HDF5 Chunking and HDF5 Compression is not recommended.

## Time-based data structures

### Timestamp

Each entry in a data set of a channel has a reference to an entry in a data set with the name `timestamp`, which lies within the data source group. In this `timestamp` dataset, there are as many entries as there are entries in a dataset of a channel. A timestamp is entered in nanoseconds since 01.01.1970 at 00:00 UTC.  

The time stamps are always stored in ascending order and must not contain any jumps.  

| Name | Data type | Parent object | Mandatory | Storage type |
|--|---|----|---|------|
| timestamp | 64 bit integer | "datasource_name" | yes | single values |

HDF5 chunking is allowed and HDF5 compression is recommended.

These time stamps are recorded either by a defined distance travelled or by a frequency, this is described in more detail in the chapter [Common Trigger Distance or Frequence](#common-trigger-distance-or-frequence). In addition to the time stamps, the measuring devices follow this specification and also record measurement data at the same time. A central system serves as a clock generator for the data acquisition of all systems (measurement data and time stamps).

### Time Indices

For a quick finding of timestamps this dataset is created in addition to the dataset `timestamp`. The time index dataset stores an offset value of a position of timestamp groups and is located in the `Datasource Group`, at the same level as the `timestamp` dataset. A detailed description of the contents can be found in the following chapter [Data set content Time Indices](#data-set-content-time-indices). This dataset does not contain as many entries as the dataset `timestamp`.

| Name | Datatype | Parent object | Mandatory | Storage type |
|--|---|----|---|------|
| timeindex | 64 bit integer | "datasource_name" | yes | single values |

HDF5 chunking is allowed and HDF5 compression is recommended.

The following attributes are assigned to the `timeindex` dataset:

| Name | Data Type | Parent object | Mandatory | Description |
|---|---|--|--|-------|
| BlockSize | long | Data set `timeindex` | yes | Duration in nanoseconds of a time block. Time stamps within the same time block are indexed with the same value |
| LogTimeBlocks | integer | dataset `timeindex` | yes | $2^{LogTimeBlocks}$ is equal to the number of blocks used to generate the binary tree. There may be time shifts greater than $2^{LogTimeBlocks}*BlockSize$ in the timestamp data set, but these will not be indexed. |
| Depth | integer | Data set `timeindex` | yes | Height of the binary tree |

#### Data set content Time Indices

In order to understand the content in the dataset `timeindex`, it must first be explained how it was created. The following example describes the process that leads to the result and back again.

In the example we want to save and index timestamps between $10s$ and $155s$. These timestamps are contained in the `timestamp` dataset. The distances between the individual timestamps do not follow a uniform pattern.  

First we define a $Offset$, which results from the first entry in the dataset `timestamp`. In our example the first entry is $10s$, so $Offset=10s$.
With the $Offset$ of $10*10^9ns$ we have a value range from $0ns$ to $145*10^9ns$ which we index.  

If we now use a block size of $BlockSize=2x10^9ns$, we get $72$ blocks, which we index, because $10s+72*2x10^9ns$ covers the values up to $156s$ and is therefore sufficient for our range of values.
To index all $72$ blocks, we now need a sufficiently large value for LogTimeBlocks, we take a value of $LogTimeBlocks=7$, because $2^7=128$ is larger than $72$.

> Note: Possible would be a LogTimeBlocks value of $LogTimeBlocks=6 => 2^6=64$. All values between $64$ and $72$ would then not be covered in the indexing!

If we now define a depth of $Depth=4$, we get the following node numbers:

| node number | height |
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

These numbers and heights result from the binary tree, which we generate from the defined depth. To create the table, the tree is run through in "level-order". The following picture shows this tree:

![Binary tree, structure of node number](images/generated/binaryTree.png){ width=400px }

The first entry in the table has the value $2^{LogTimeBlocks-1}$, in our case $2^{7-1}=64$, this entry has a height of one.
Next, for each timestamp, we calculate the matching number of the corresponding block:

$BlockNumber=\frac{timestamp - Offset}{BlockSize}$

Each $BlockNumber$ gets an index number in ascending order, starting from zero to 40. This number is used later to determine the offset position written to the `timeindex` dataset.
Below the calculated $BlockNumber$ and the corresponding timestamp, as an overview in a table:

![Table overview 1: $BlockNumber$ for each time stamp](images/TimeIndicesExampleTable1.png)

![Table overview 2: $BlockNumber$ for each timestamp](images/TimeIndicesExampleTable2.png)

In the next step we use the previously created table of the binary tree and write for each entry, the corresponding $BlockNumber$ in the dataset `timeindex`.
The first number of the binary tree is $64$. So we look in the created table for the largest possible $BlockNumber$, which is smaller or equal to the value $64$. Thus we find the number $63$ in the table with the index $35$. So we write the number $35$ into the dataset `timeindex`. The second of the table with the binary tree has the value $32$. In the table with the $BlockNumber$ we find the number $32$, so the number $32$ is written into the dataset `timeindex`. Now follows the number $96$, for this there is no entry in the table with the $BlockNumber$, so we write the one $-1$ into the dataset `timeindex`. If we continue this way, we get the following table, which represents the dataset `timeindex`:

| NodeNumber | Contents `timeindex` |
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

#### Localization of the time stamp from data set Time Indices

This chapter describes how to calculate the position of a timestamp using the dataset `timeindex`. Relevant are the defined values from the attributes $BlockSize$, $LogTimeBlocks$ and $Depth$. With these values we can rebuild the binary tree.  

Assuming we search for the position in the `timestamp` dataset for the timestamp $86s$, we first calculate the node number with the following formula:  

$NodeNumber=(\frac{timestamp - Offset}{BlockSize})-(\frac{timestamp - Offset}{BlockSize} \bmod 8)$  

The calculation for a timestamp with the value $86s$ would look like this:  

$NodeNumber=(\frac{86s - 10s}{2s})-(\frac{86s - 10s}{2s} \bmod 8) = 38 - 6 = 32$

With the calculated $NodeNumber$ we can now find out the position using the `timeindex` dataset. Additionally we need the table of the binary tree. There we look for the index of the calculated $NodeNumber$, this would be the index $1$. Now we find in the dataset `timeindex` at the same index, the position of the block by searching our timestamp, so we search from position $18$.  

| $NodeNumber$ | Data set `timeindex` |
|:---:|:---:|
| 64 | 35 |
| **32** | **18** |
| 96 | -1 |
|**...**|**...**|

Now the search for the timestamp starts at the position $18$ and searches via the values $74, 75, 80, 81$ to $86$ at position $22$.

![Timestamp search in table](images/TimeIndicesTableSearchExample.png){width=400px}

The calculation above is always rounded down and not the next larger value (here $40$) is used. This is because the position at the value $40$ could be higher (end of the block) than the position in the block itself. So the timestamp would not be found!

### Durations

If data is recorded that is valid for a certain period of time, the data set with the name `duration` is added to the data set `timestamp`. The timestamp recorded in the `timestamp` dataset specifies the time at which the value was recorded and the `duration` dataset specifies how long this value is valid in nanoseconds. The dataset `duration` is `timestamp` within a data source group next to the dataset.  

| Name | Data type | Parent object | Mandatory | Storage type |
|--|---|-----|--|--|
| duration | 32 bit integer | "datasource_name" | yes | Single values |

HDF5 chunking is allowed and HDF5 compression is recommended.

## RCM-DX file format  

The RCM-DX consists of a file format of the [HDF5-group$\to$](http://www.hdfgroup.org/HDF5/) in version 2.0. This allows to save the data in a tree structure. This structure, or rather the naming of the groups and data sets, is not specified by the HDF5 group, but by the RCM-DX specified here. The datasets can hold different data, what exactly is contained is specified as metadata.

A change to the structure means a new version and thus a new release of this specification.

To read and write the HDF5 file format, the HDF5 group offers libraries for different languages. These can read and write the structure specified here without problems.

Further information about the structure of the HDF5 file format can be found under the following link: [HDF5 file format$\to$](https://portal.hdfgroup.org/display/HDF5/Introduction+to+HDF5)

## RCM-DX Data hierarchy  

In the RCM-DX, the individual groups and data sets as well as their names are defined. Below is an overview of the structure specified in this document:

![RCM-DX Structure Overview](images/generated/RCM_DX_Structure.png)

Separate and more detailed specifications have been written for individual structure groups. Several measuring instruments can be installed on one measuring and inspection vehicle. Each of these measuring devices generates new channels of data, which flow into the RCM-DX. Since these channels can be different for each measuring device, the specifications were separated. Another reason for this is the fact that other railway operators use different measuring and inspection equipment.

The individual groups are specified in more detail below in the subcategories.

### Root Group  

The root group contains all other subgroups. This group defines the RCM-DX and bears its name and thus refers to this specification.

| Name | Parent object | Mandatory |
|--|--|--|
| RCMDX | none (Root) | yes |

#### Attributes  

The following attributes are assigned to the group `RCMDX`:

| Name | Data Type | Parent object | Mandatory | Description |
|--|----|--|--|-----|
| Major | 16-bit integer | `RCMDX` | yes | Major Version of the RCM-DX specification that corresponds to the structure of the created file |
| Minor | 16-bit integer | `RCMDX` | yes | Minor Version of the RCM-DX specification that corresponds to the structure of the created file |
| Patch | 16-bit integer | `RCMDX` | yes | Patch Version of the RCM-DX specification that corresponds to the structure of the created file |

### Session Group  

The session group contains data that was collected during the same period. A session group contains data from different sources. A RCM-DX file can contain several of these session groups and these in turn can overlap in time. Data of one source can only be in one session group at a time, so they cannot overlap, so at any time this source is only one session that records this data.

#### Naming

Since several session groups can be contained in one RCM-DX file, they must be given a unique name. To achieve this goal, the names are assigned according to the following pattern:

| Name | Parent object | Mandatory |
|--|--|--|
| YYYYMMDD_hhmmss.SSS | `RCMDX` | yes |

Example: 20190212_231255.592

The individual elements and their meaning are described below:

| Pattern | Content |
|---|-------|
| YYYY | The year in four digit representation |
| MM | The month in the year (01 for January) |
| DD | The day in the month |
| hh | The hour in the day (0-23) |
| mm | The minute in the hour |
| ss | The seconds in the minute |
| SSS | The milliseconds in the seconds
| "_" or "." | Characters as separator

A session group contains the data of the measuring equipment. Only one session can exist for a given millisecond, this must be implemented and ensured by the creator.

#### Attributes  

| Name | Data Type | Parent object | Mandatory | Description |
|--|--|---|--|-----|
| StartTime | long | "session_name" | yes | Time stamp in nanoseconds since January 1, 1970 UTC as start time of the session |
| EndTime | long | "session_name" | no | Time stamp in nanoseconds since 1.1.1970 UTC as end time of the session. If the session has not yet been closed, this attribute is missing |
| MeasuringMode | string | "session_name" | yes | Indicates the measuring mode. Details under [Measurement mode](#measurement-mode).|
| Element | string | "session_name" | yes | Contains the type of the group, this is fix "SESSION" |

##### Measurement mode

There are three different measurement modes, which are explained individually below.

| Name | Description |
|---|------|
| PRODUCTIVE | Productive data that will be further used. |
| TEST | Test data recorded during a diagnostic run with the aim of checking and testing the measuring equipment. |
| SIMULATION | Simulated values that the measuring systems produce themselves and are no longer used. |

### Sections Group

The group `SECTIONS`, contains information about a session.

| Name | Parent object | Mandatory |
|--|--|--|
| SECTIONS | "session_name" | yes |

#### Section info

This group contains the information regarding the section itself.

| Name | Parent object | Mandatory |
|--|--|--|
| SECTIONINFO | `SECTIONS` | yes |

##### Data fields

The following data fields are contained in the group "SECTIONINFO":

| Name | Data type | Parent object | Mandatory | Storage type |
|---|----|---|--|--|
| coachDirection | 8 bit integer | `SECTIONINFO` | yes | Single values |
| firstTrackOffset | 64 bit float | `SECTIONINFO` | yes | Single values |
| lastTrackOffset | 64 bit float | `SECTIONINFO` | yes | single values |
| startTimestamp | 64 bit integer | `SECTIONINFO` | yes | Single values |
| trackInfoOffset | 64 bit float | `SECTIONINFO` | yes | Single values |

HDF5 chunking is allowed and recommended for all.  
HDF5 compression is allowed.  

###### coachDirection

Defines the direction of travel of the measuring vehicle per section. This array contains only as many entries as there are sections.

| Number | Direction of travel |
|:--:|:---:|
|0 | forward |
| 1 | Reverse |

####### firstTrackOffset

Indicates the distance in meters between the start of the track and the position at the beginning of the measurement. This array contains only as many entries as there are sections.

###### lastTrackOffset

Indicates the distance in meters between the position at the end of the measurement and the end of the rail. This array contains only as many entries as there are sections.

###### startTimestamp

Start time of the section as time stamp since 1.1.1970 at 00:00 UTC.

####### trackInfoOffset

This data set defines how many entries in the data sets of the "Track Info Group" belong to a section. One entry is created per section in a session and the number of entries is defined. A group size can be determined by calculating the specified offset value at the $x$ position minus the offset value at the $x-1$ position.

#### Track Info

This group contains the information regarding the section itself.

| Name | Parent object | Mandatory |
|--|--|--|
| TRACKINFO | `SECTIONS` | yes |

##### Data fields

> Old:

| Name | Data type | Parent object | Mandatory | Storage type |
|------|-----|----|---|---|
| trackId | 32 bit signed integer | `TRACKINFO` | yes | Single values |
| trackStartTimestamp | 64 bit signed integer | `TRACKINFO` | yes | Single values |
| trackEndTimestamp | 64 bit signed integer | `TRACKINFO` | yes | Single values |
| trackOrientation | 8 bit signed integer | `TRACKINFO` | yes | Single values |
| trackStartCoveredDistance | 64 bit float | `TRACKINFO` | yes | Single values |
| trackEndCoveredDistance | 64 bit float | `TRACKINFO` | yes | Single values |

HDF5 chunking is allowed and recommended for all.  
HDF5 compression is allowed.  








> TODO: Do I need to start the track everywhere?

> New:

| Name | Data type | Parent object | Mandatory | Storage type |
|------|-----|----|---|---|
| id | 32 bit signed integer | `TRACKINFO` | yes | Single values |
| startTimestamp | 64 bit signed integer | `TRACKINFO` | yes | Single values |
| endTimestamp | 64 bit signed integer | `TRACKINFO` | yes | Single values |
| orientation | 8 bit signed integer | `TRACKINFO` | yes | Single values |
| startCoveredDistance | 64 bit float | `TRACKINFO` | yes | Single values |
| endCoveredDistance | 64 bit float | `TRACKINFO` | yes | Single values |





















### Position Group

This group contains general information on the position.  

| Name | Parent object | Mandatory |
|--|--|--|
| POSITION | `SECTIONS` | yes |

#### Data fields

> To define, here some data are contained twice, these are also already contained in other groups!

| Name | Data type | Parent object | Mandatory | Storage type |
|------|-----|----|---|---|
| coveredDistance | 64 bit float | `POSITION` | yes | Single values |
| vehicleOrientation | 8 bit integer | `POSITION` | yes | Single values |
| vehicleSpeed | 64 bit float | `POSITION` | yes | Single values |
| trackOrientation | 8 bit integer | `POSITION` | yes | Single values |
| trackId | 32 bit integer | `POSITION` | yes | Single values |
| trackOffset | 64 bit float | `POSITION` | yes | Single values |
| lineKilometer | 64 bit float | `POSITION` | yes | Single values |
| positionAccuracy | 8 bit integer | `POSITION` | yes | Single values |
| positionQuality | 8 bit integer | `POSITION` | yes | Single values |

**CoveredDistance:** Total length of a session in meters $[m]$  
**vehicleSpeed:** Speed of the vehicle at the time of recording in $[m/h]$  
**trackId:** Defined track ID on which the vehicle is located at the time of recording  
**trackOffset:** Distance between starting point of track and current position in meters $[m]$  
**lineKilometer:** Absolute position on the line travelled at the time of recording in kilometers $[km]$  
**PositionQuality:** Quality of the position measurement between zero (0) very good to 15 very bad  
**positionAccuracy:** The position accuracy in meters $[m]$  

#### Vehicle Orientation

The data set `vehicleOrientation` contains the driving direction of the vehicle. This information influences the position of the measuring systems.  
This data set can contain the following values:  

| Value | Description |
|--|-----|
| 0 | Vehicle moving forward |
| 1 | Vehicle reversing |

#### Track Orientation

The data set `trackOrientation` contains the alignment of the track. This information serves the correct evaluation of the kilometre data of the line, see data set `trackOffset`.

This dataset can contain the following values:  

| Value | Description |
|--|-----|
| 0 | The kilometre indications of the line are **ascending**, based on the indicated vehicle orientation |
| 1 | The kilometre indications of the line are **decreasing**, based on the indicated vehicle orientation |












### Platform Group

A platform group contains information about a measuring vehicle that collects the data.  
The naming of the group is defined according to which platform produced the data. An overview of all names and the corresponding platform is specified in the chapter [Platforms at SBB](#platforms-at-the-sbb).

| Name | Parent object | Mandatory |
|--|--|--|
| Platform | "session_name" | yes |

![Overview of the platform structure](images/generated/RCM_DX_Platform_overview.png){ width=170px }

#### Attributes

The platform group contains the following attributes:

| Name | Data Type | Mandatory | Description |
|---|--|:--:|------|
| Name | string | yes | Unique name of the vehicle |
| VehicleNumber | string | yes | Unique number of the vehicle |

#### Platforms at the SBB

Below is a list of the defined unique names of the platforms and their names.

| Abbreviation | Platform Name | Vehicle Number |
|---|---|-----|
| DFZ00 | DFZ | - |
| DFZ01 | gDFZ | - |
| DFZ02 | SPZ | - |

#### Configuration

Configurations of various systems can be stored in the data sets of this group. The data sets are designed so that global and network specific configurations can be stored.

| Name | Parent object | Mandatory |
|--|--|--|
| CONFIGURATION | `PLATFORM` | yes |

Subsequent datasets are subordinate to this group:

| Name | Data type | Parent object | Mandatory | Storage type |
|--|---|----|---|------|
| global | string | `CONFIGURATION` | yes | Single values |
| network | string | `CONFIGURATION` | yes | Single values |

HDF5 chunking is allowed and recommended for all.  
HDF5 compression is allowed.  

### Environment Group

| Name | Parent object | Mandatory |
|--|--|--|
| ENVIRONMENT | "session_name" | yes |

Information about the environment can be stored in the subgroups and their data sets. Since such information applies to all measurement systems, this is the right place for it.  

As always with a data source, the dataset `timestamp` must not be forgotten.

![Overview of the Environment Structure](images/generated/RCM_DX_Environment_overview.png)

#### Vehicle Speed

| Name | Parent object | Mandatory |
|--|--|--|
| VEHICLESPEED | `ENVIRONMENT` | yes |

The data set contains a measured vehicle speed for each time stamp.

| Name | Data type | Parent object | Mandatory | Storage type |
|--|---|----|---|------|
| `data` | 64 bit integer | `VEHICLESPEED` | yes | Single values |

This data source also has a common data set `timestamp`.

#### Ambient Temperature Group

This group contains a data set containing the ambient temperatures. One temperature measurement is performed per time stamp.

| Name | Parent object | Mandatory |
|--|--|--|
| AMBIENTTEMPERATURE | `ENVIRONMENT` | yes |

For each time stamp, the ambient temperature is entered in the data set.

| Name | Data type | Parent object | Mandatory | Storage type |
|--|---|----|---|------|
| `data` | 64 bit integer | `AMBIENTTEMPERATURE` | yes | Single values |

#### Wind Speed Group

The wind speed can be stored in the data set of the group `WINDSPEED`.

| Name | Parent object | Mandatory |
|--|--|--|
| WINDSPEED | `ENVIRONMENT` | yes |

For each time stamp, the wind speed is entered in the data set.

| Name | Data type | Parent object | Mandatory | Storage type |
|--|---|----|---|------|
| `data` | 64 bit integer | `WINDSPEED` | yes | Single values |

#### Wind Direction Group

In addition to the wind speed, the wind direction is also saved, this is done in this group.

| Name | Parent object | Mandatory |
|--|--|--|
| WINDDIRECTION | `ENVIRONMENT` | yes |

For each time stamp, the wind direction is entered in the data set.

| Name | Data type | Parent object | Mandatory | Storage type |
|--|---|----|---|------|
| `data` | 64 bit integer | `WINDIRECTION` | yes | Single values |

#### Weather Conditions Group

The weather has an influence on the measurements. How the weather was at the time of the measurements is recorded in this group.

| Name | Parent object | Mandatory |
|--|--|--|
| WEATHERCONDITIONS | `ENVIRONMENT` | yes |

For each time stamp, the weather conditions are entered in the data set. This could be for example "rain, fog, snowfall".

| Name | Data type | Parent object | Mandatory | Storage type |
|--|---|----|---|------|
| `data` | 64 bit integer | `WEATHERCONDITIONS` | yes | Single values |

### Measuring System Group

Each measuring system has its own data sources, which have their own names, as well as their own channels, which in turn have their own names. Common features are described in this specification, everything else is defined in a separate specification. Since this part differs greatly from railway companies and measuring equipment, a rigid specification has been dispensed with, but a certain framework is still given.

A group is created for each system that collects data. The name of the group is unique for each system. The composition of this name is not predefined. Each system contains further subgroups, each of which contains a data source at the end.

![Overview of the measuring system structure](images/generated/RCM_DX_MS_overview.png)

#### Example

As an example, a measuring system that records environmental data is described here. This measuring system can acquire several types of data, but belongs to the measuring system group "ADDITIONAL_DATA". The data are stored in individual data source groups, this is described in the chapter [Datasource Group](#datasource-group).

#### Attributes  

The following attributes are contained in the group of the measuring system:

| Name | Data Type | Parent object | Mandatory | Description |
|--|---|----|---|------|
| Family | string | "measuringsystem_name" | yes | General name of the measuring system |
| Revision | string | "measuringsystem_name" | yes | Version of the software on the measuring system, issued by the manufacturer of the measuring equipment |
| IstanceVersion | string | "measuringsystem_name" | yes | Version of the data format created by the measuring instrument. This version can be different within different gauges of the same family |
| Element | string | "measuringsystem_name" | yes | Contains the type of the group, this is fixed "MEASURINGSYSTEM" |

### Datasource Group

A data source group can contain several channels and thus several data sources. This group combines these channels. The naming can be freely selected, but must be unique.

A time stamp is available for each individual measuring point within a data source group. There are two types of data acquisition for a data source group. One is always after a defined distance (e.g. every 250 millimeters) and the other is the recording of measurement data at a certain frequency (e.g. 4000 Hz).
The way the measurement data was recorded is shown in two attributes for each channel group. For a description see [Common Trigger Distance or Frequence](#common-trigger-distance-or-frequence).

#### Attributes

The following attribute is assigned to the group:

| Name | Data Type | Parent object | Mandatory | Description |
|--|---|----|---|------|
| Element | string | "datasource_name" | yes | Contains the type of the group, this is fix "DATASOURCE" |

#### Example

In our example the name of the data source group is assigned, which should contain our environmental measurement data, which we call `ENVIRONMENT`.  
This group now also contains the dataset `timestamp`.  

#### Timestamp dataset

Each data source group contains a data set called `timestamp`. It contains all timestamps at which a measurement was recorded. The size of this list of timestamps is the same as the size of the datasets per channel.

A more detailed description can be found in the chapter [Timestamp Array](#timestamp)!

### Channel Group

A channel group contains metadata for the actual measurement data and thus for the various channels. The naming can be freely selected, but must be unique within the data source group.

The following attributes are contained in this group:  

| Name | Data Type | Parent object | Mandatory | Description |
|--|---|----|---|------|
| PositionOffset | 32 bit float | "channel_name" | yes | [Position Offset](#position-offset) |
| TriggerMode | string | "channel_name" | yes | [Trigger Mode](#trigger-mode) |
| ChannelBasis | string | "channel_name" | yes | [Channel Base](#channel-base) |
| CommonTriggerDistance | 32 bit float | "channel_name" | yes | [Common Trigger Distance or Frequence](#common-trigger-distance-or-frequence) |
| CommonTriggerFrequence | 32 bit float | "channel_name" | yes | [Common Trigger Distance or Frequence](#common-trigger-distance-or-frequence) |
| ChannelType | string | "channel_name" | yes | [Channel Type](#channel-type) |
| Neighbor | string | "channel_name" | yes | [Neighbor](#neighbor) |
| Element | string | "channel_name" | yes | Contains the type of the group, this is fix `CHANNEL` |

#### Channel base

Description of the channel, what was measured and in which direction. Since a measuring vehicle can move on a rail in two directions and the sensor could therefore be on the other side, it should be possible to indicate this. Here is the place for it.

Possible values are:

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

The two attributes `CommonTriggerFreq` and `CommonTriggerDistance` define the type of measurement data recording and the distance at which these measurement data were recorded.

If the measurement data are recorded at a certain distance, for example every 20 millimeters, the attribute `CommonTriggerDistance` is specified and the value "0.0" is specified for `CommonTriggerFreq`. At the attribute `TriggerMode` the value `DISTANCE` is noted.

If the data is recorded at a certain frequency, the frequency is given in Herz for the attribute `CommonTriggerFreq`, for example 40000.0 for 40kHz. With `CommonTriggerDistance` the value remains "0.0". At the attribute `TriggerMode` the value `TIME` is noted.

> In a data source group there is always only one common trigger frequency or one trigger distance. A mixture within the group is not permitted!
> Both attributes have the value "0.0" if `TriggerMode` contains the value `EVENT`.

#### Channel Type

Defines how a value was created. This can be measured, calculated or taken from a previously defined data source that was read from there and inserted into the file.

The following values are possible:

| Value | Description |
|---|---------|
| MEASURED | Measured values |
| REFERENCE | A setpoint of a third source |

An example for reference values are defined target values which flow in from another source (file, database etc.) and are to be used for comparisons.

#### Neighbor

Refers to the name of an adjacent channel. This can be the right rail, for example, when measuring the track temperature of the left rail.
Thus the attribute `neighbor` of the channel "TEMP_RAIL_**L**" would contain the name "TEMP_RAIL_**R**" and vice versa.

#### Position Offset

Describes the distance between a defined zero point (position) on the measuring vehicle and a measuring system. This specification is used to convert the exact time at which the measurement was taken to a defined zero point using the speed driven and the position taken at the time.  

#### Trigger Mode

This attribute defines how the data was recorded.

Possible values are:

| Value | Description |
|---|----------|
| TIME | Time-based measurement data recording |
| DISTANCE | Distance-based measurement data acquisition |
| EVENT | Event based recording |

#### Example

All types of data that are recorded at the same time follow as the channel here. The names of the channels are freely selectable, here as an example:

| Name | Mandatory | Description |
|----|---|--------|
| TEMP | no | Temperature |
| WIND_DIR | no | Wind direction |
| WIND_SPEED | no | Wind speed |
| HUM | no | moisture |

Furthermore, all channels receive the following attributes and values:

| Attribute Name | Value (as example) |
|---|---------|
| ChannelBasis | TOTAL |
| CommonTriggerDistance | 0.0 |
| CommonTriggerFreq | 1.0 |
| MeasurementType | MEASURED_VALUE |
| Neighbor | "" |
| PositioOffset | 0.0 |
| TriggerMode | TIME |

##### Data object

Each channel group receives a data set with the actual measurement data:

| Name | HDF5 Type | Mandatory |
|--|---|--|
| data | HDF5 Dataset | yes |

> There are as many measurement data entries as there are timestamps in the dataset `timestamp` which is included in the channel group.

The dataset needs more information, this is given as attributes:

| Name | Data type | Parent object | Mandatory | Storage type |
|--|---|----|---|------|
| Unit | string | "channel_name" | yes | Single values |

**Unit:** The physical unit of the measurement data, such as "millimeter". If no physical unit can be assigned to the data, this attribute remains empty.

The data set and the possible data that can be stored are described in more detail in the chapter [Data set](#hdf5-datenset).

###### Example

The units are now added to our defined channels. Each data set now gets an attribute for this unit:

| Channel Name | Attribute Name | Unit |
|--|--|----|
| TEMP | "Unit" | DegreeCelsius |
| WIND_DIR | "Unit" | Degree |
| WIND_SPEED | "Unit" | MeterPerSecond |
| HUM | "Unit" | RelativeHumidity |

### Logging Group

The logging group contains information about the status of the measuring systems. The data is divided into two subgroups, `OUTAGES` and `MESSAGES`. These are described in separate chapters.

| Name | Parent object | Mandatory |
|--|---|--|
| LOGGING | "measuringsystem_name" | yes |

![Overview of the logging structure](images/generated/RCM_DX_Logging_overview.png){width=250px}

#### Outages Group

In this group, failures and interruptions of measurement systems are recorded in a defined structure, each as its own data set.

The following data sets are included in this group:

| Name | Data type | Parent object | Mandatory | Storage type |
|--|---|----|---|------|
| reference | string | `LOGGING` | yes | Single values |
| level | string | `LOGGING` | yes | Single values |
| message | string | `LOGGING` | yes | Single values |

HDF5 chunking is allowed and HDF5 compression is allowed.

This group receives a `timestamp` dataset as well as a `duration` dataset to indicate the time of the measurement failure.

**reference:** A reference to the measurement system affected by the failure is stored in this dataset.  
**level:** Defines the severity of the failure or interruption of a measurement system.  
**message:** This data set contains one message per entry about a failure of a measuring instrument.  

#### Messages Group

Status messages for a system or data source are stored in this group. If no messages exist, this group remains empty.

The following data sets are contained in this group:

| Name | Data type | Parent object | Mandatory | Storage type |
|--|---|----|---|------|
| message | string | `LOGGING` | yes | Single values |
| level | string | `LOGGING` | yes | Single values |
| reference | string | `LOGGING` | yes | Single values |
| timestamp | 64 bit integer | `LOGGING` | yes | Single values |

HDF5 chunking is recommended and HDF5 compression is allowed.

**reference:** A reference to the affected measurement system or the data source itself is stored in this dataset.




> **level:** TODO: Level? What are there?  




**message:** The actual message to be recorded for a measurement system.  

### Topology Group

A topology group contains all information on the route network of the respective railway company.  

| Name | HDF5 Type | Parent object | Mandatory |
|--|--|---|--|
| TOPOLOGY | HDF5 Group | "session_name" | yes |

![Overview topology structure](images/generated/RCM_DX_Topology_overview.png)

#### Attributes

The group `TOPOLOGY` contains the following attributes:

| Name | Data type | Parent object | Mandatory | Storage type |
|---|--|---|--|--|
| DfAExportTimestamp | string | `TOPOLOGY` | yes | Single values |

**DfAExportTimestamp:** Time at which the DfA was exported and therefore a link to the version

The DfA (database of fixed installations) is an SBB construct and reflects the SBB route network. The data comes from a database and is distributed as a file to the SBB measuring vehicles. They can read the information contained therein and also add it to the RCM-DX. This DfA is used for positioning and it is therefore possible to assign the measured data to an object from the route network.

### Tracks Group

This group contains information on the tracks of the railway network. The information is stored in separate data sets.

| Name | Parent object | Mandatory |
|--|--|--|
| TRACKS | TOPOLOGY | yes |

The following data sets are included in this group, some of which are described in more detail in the subchapters:

| Name | Data type | Parent object | Mandatory | Description |
|--|---|--|--|---|
| direction | 8 bit signed integer, little endian | TRACKS | yes | Single values |
| id | 32 bit integer, little endian | TRACKS | yes | Single values |
| gtgId | string | TRACKS | yes | Single values |
| length | string | TRACKS | yes | Single values |
| name | string | TRACKS | yes | Single values |
| nrLine | string | TRACKS | yes | Single values |
| pointFrom | 32 bit integer, little endian | TRACKS | yes | Single values |
| pointTo | 32 bit integer, little endian | TRACKS | yes | Single values |
| switchType | 8 bit signed integer, little endian | TRACKS | yes | Single values |
| trackType | 8 bit signed integer, little endian | TRACKS | yes | Single values |

**direction:** Will be decided in a separate chapter: [direction](#direction)  
**id:** ID of the track section.
**gtgId:** Unique GTG ID of a GTG string, this ID is stored as UUID.  
**length:** The length of the track section  
**name:** name of the track section  
**nrLine:** Number of the line for the track section  
**pointFrom:** ID of the starting point of the track section  
**pointTo:** ID of the end point of the track section  
**switchType:** Will be reviewed in a separate chapter: [switchType](#switchtype)  
**trackType:** Will be published in a separate chapter: [trackType](#tracktype)

#### direction

The direction of a switch is specified in this data set.  
If the track is of the type "switch", a value greater than zero must be selected here. Which number means what is shown in the following table:  

| Value | Description |
|--|---|
| 0 | No crossover |
| 1 | Straight line switch track |
| 2 | Left-handed switch |
| 3 | switch running to the right |

#### trackType

The number in the *trackType* dataset defines the type of track that belongs to it. Which number means what is shown in the following table:

| Value | Description |
|--|---|
| 0 | Station track |
| 1 | Track |
| 2 | Switch |

##### switchType

If the track is of the type "switch", a value greater than zero must be selected here. Which number means what is shown in the following table:

| Value | Description |
|--|---|
| 0 | Anything but a turnout |
| 1 | simple switch |
| 2 | Double switch |
| 3 | Simple crossovers |
| 4 | Double track connection |
| 5 | Double crossover |

### Lines Group

This group contains information about a line in the route network. The information is stored in separate data sets.

| Name | Parent object | Mandatory |
|--|--|--|
| LINES | TOPOLOGY | yes |

The following data sets are included in this group:

| Name | Data type | Parent object | Mandatory | Storage type |
|--|---|----|---|------|
| id | 32 bit signed integer | `LINES` | yes | Single values |
| name | string | `LINES` | yes | Single values |
| firstStation | string | `LINES` | yes | Single values |
| lastStation | string | `LINES` | yes | Single values |
| fromKilometer | string | `LINES` | yes | Single values |
| toKilometer | string | `LINES` | yes | Single values |

**id:** Defines the ID of the line, this is unique  
**name:** The name of the line  
**firstStation:** The name of the first station of this line  
**LastStation:** The name of the last station of this line.  
**km:** Start kilometre of the line, expressed in kilometres  
**toKilometer:** Final kilometer of the line, in kilometers  

### Switch Tracks Group

This group contains information about switches in the route network. The information is stored in separate data sets.

| Name | Parent object | Mandatory |
|--|--|--|
| SWITCHTRACKS | `TOPOLOGY` | yes |

The following data sets are included in this group:

| Name | Data type | Parent object | Mandatory | Description |
|--|---|----|---|------|
| track strand | 32 bit signed integer | `SWITCHTRACKS` | yes | single values |
| gleisstrangBez | string | `SWITCHTRACKS` | yes | Single values |
| soft | 32 bit signed integer | `SWITCHTRACKS` | yes | Single values |
| deflecting direction | string | `SWITCHTRACKS` | yes | single values |
| distraction | string | `SWITCHTRACKS` | yes | single values |
| operating point | string | `SWITCHTRACKS` | yes | single values |
| herzStueck | string | `SWITCHTRACKS` | yes | Single values |
| minRadius | 32 bit signed integer | `SWITCHTRACKS` | yes | Single values |
| nr | 32 bit signed integer | `SWITCHTRACKS` | yes | Single values |
| zusNr | string | `SWITCHTRACKS` | yes | Single values |
| rail profile | string | `SWITCHTRACKS` | yes | single values |
| status | string | `SWITCHTRACKS` | yes | Single values |
| rail profile | string | `SWITCHTRACKS` | yes | single values |
| thresholdArt | string | `SWITCHTRACKS` | yes | single values |
| typesPlanNr | 32 bit signed integer | `SWITCHTRACKS` | yes | single values |
| typeNraddition | string | `SWITCHTRACKS` | yes | single values |
| softArt | string | `SWITCHTRACKS` | yes | Single values |
| softType | string | `SWITCHTRACKS` | yes | single values |
| softForm | string | `SWITCHTRACKS` | yes | single values |
| soft tongue | string | `SWITCHTRACKS` | yes | single values |

**trackId:** a reference to the GTG-ID  
**trackBez:** Contains a description of the track section  
**softId:** Contains the ID's of the switches as a reference  
<!-- For subsequent datasets the descriptions are still missing. These would have to be supplemented once! 29.10.2019 Ammann Michael
**Distracting riccation:**  
**Deflection.  
**Operating point:**  
**heartPiece:**  
**minRadius:**  
**nr:**  
**toNr:**  
**rail profile:**  
**status:**  
**rail profile:**  
**ThresholdsType:**  
**TypesPlanNr:**  
**typeNradditional:**  
**SwitchType:**  
**pointsType:**  
**pointsForm:**  
**soft tongue:**  
 -->

### Track Objects Group

This group contains information about objects in the route network, for example a balise. The information is stored in separate data sets.

| Name | Parent object | Mandatory |
|--|--|--|
| TRACKOBJECTS | `TOPOLOGY` | yes |

The following data sets are included in this group:

| Name | Data type | Parent object | Mandatory | Storage type |
|--|---|----|---|------|
| trackId | 32 bit signed integer | `TRACKOBJECTS` | yes | Single values |
| type | 32 bit signed integer | `TRACKOBJECTS` | yes | Single values |
| positionStart | 32 bit signed integer | `TRACKOBJECTS` | yes | Single values |
| positionEnd | 32 bit signed integer | `TRACKOBJECTS` | yes | Single values |
| extraInfo | string | `TRACKOBJECTS` | yes | Single values |

**trackId:** Contains the ID of the track to which the track is connected.  
**type:** Type of the object  
**positionStart:** Start position of the object in meters  
**positionEnd:** End position of the object in meters  
**ExtraInfo:** Additional information about the object, for example, the ID of a balise.  

### Track Points Group

This group contains information about defined points on the route network. The information is stored in separate data sets.

| Name | Parent object | Mandatory |
|--|--|--|
| TRACKPOINTS | `TOPOLOGY` | yes |

The following data sets are included in this group:

| Name | Data type | Parent object | Mandatory | Storage type |
|--|---|----|---|------|
| trackId | 32 bit signed integer | `TRACKPOINTS` | yes | Single values |
| lineId | 32 bit signed integer | `TRACKPOINTS` | yes | Single values |
| x | 32 bit float | `TRACKPOINTS` | yes | Single values |
| y | 32 bit float | `TRACKPOINTS` | yes | Single values |
| z | 32 bit float | `TRACKPOINTS` | yes | Single values |
| radius | 32 bit float | `TRACKPOINTS` | yes | single values |
| kilometers | 32 bit float | `TRACKPOINTS` | yes | single values |
| position | 32 bit float | `TRACKPOINTS` | yes | Single values |
| cant | 32 bit float | `TRACKPOINTS` | yes | Single values |
| inclination | 32 bit float | `TRACKPOINTS` | yes | Single values |

**trackId:** Reference to the ID of the track section  
**lineId:** Reference to the ID of the line  
**x:** X-Koordiante of the point  
**y:** Y-Koordiante of the point  
**z:** Z-Koordiante of the point  
**radius:** The radius of a point, given in meters.  
**Kilometres:** Contains the line kilometre of the point in the route network, expressed in kilometres.  
**Position:** Position of the point, in meters  
**cant:** The inclination at this point, expressed in millimetres.  
**Inclination:** Gradient at this point, expressed in parts per thousand

### Properties Group

This group contains information about properties of the topology itself. The information is stored in separate data sets.

| Name | Parent object | Mandatory |
|--|--|--|
| PROPERTIES | `TOPOLOGY` | yes |

The following data sets are included in this group:

| Name | Data type | Parent object | Mandatory | Description |
|--|---|----|---|------|
| propertyId | 32 bit signed integer | `PROPERTIES` | yes | Single values |
| name | string | `PROPERTIES` | yes | Single values |
| description.ge | string | `PROPERTIES` | yes | Single values |
| description.fr | string | `PROPERTIES` | yes | Single values |
| description.it | string | `PROPERTIES` | yes | Single values |
| description.en | string | `PROPERTIES` | yes | Single values |

**propertyId:** Unique ID of the characteristic  
**name:** Name of the characteristic  
**description.ge:** Description of the characteristic in the language German  
**description.fr:** Description of the characteristic in French language  
**description.it:** Description of the characteristic in Italian language  
**description.en:** Description of the feature in English language  

### Events Group  

The Event group is used to store events that occurred during the recording of data. Events are bound to a channel, system or session and have a link to it. In addition to events, log entries can also be created, these are described in more detail in the chapter [Record Group](#record-group).
Systems can, for example, trigger an event when a limit value is exceeded. Events are always time-bound which means an event contains the exact time of occurrence and the duration of the event. The duration can also be zero, so the event occurred exactly at the specified time.  

| Name | HDF5 Type | Parent object | Mandatory |
|--|--|---|--|
| EVENTS | HDF5 Group | "session_name" | yes |

Within the group there are the following data fields:

| Name | Data type | Parent object | Mandatory | Storage type |
|--|---|----|---|------|
| reference | string | EVENTS | yes | Single values |
| data | string (XML) | `EVENTS` | yes | Single values |
| eventtype | string | `EVENTS` | yes | Single values |
| duration | 64 bit signed integer little endian | `EVENTS` | yes | Single values |
| timestamp | 64 bit signed integer little endian | `EVENTS` | yes | Single values |

For all datasets, HDF5 chunking is recommended and HDF5 compression is allowed.

Each of these datasets contains a list with information about an entry, at a certain time.
Each dataset is described in more detail in the following subchapters.

#### Event Data

| Name | Data type | Parent object | Mandatory | Storage type |
|--|---|----|---|------|
| "data" | string | `EVENTS` | yes | Single values |

HDF5 chunking is allowed and recommended, HDF5 compression is allowed.  

This data set contains the actual information about an event, this in the XML notation which is described in more detail in each chapter of the event types.  
The events are stored in this dataset as a list. A type can be stored for each event. These are explained in more detail in the chapter [Event Types](#event-types).

#### Duration

Defines for each event the duration of the event itself. This value can also be zero.

| Name | Data type | Parent object | Mandatory | Storage type |
|--|---|----|---|------|
| "duration" | 64 bit integer | `EVENTS` | yes | Single values |

HDF5 chunking is allowed and recommended, HDF5 compression is allowed.  

#### Event Types

Contains the type of an event.

| Name | Data type | Parent object | Mandatory | Storage type |
|--|---|----|---|------|
| "eventtype" | string | `EVENTS` | yes | Single values |

HDF5 chunking is allowed and recommended for all.  
HDF5 compression is allowed.  

In the list "eventtype" the type of the recorded event is shown. The different types contain different information which is shown in the following subchapters. There are corresponding XML schemas for all types that define the technical specifications.

##### Defect

A defect can be, for example, an image of a rail showing a damage of the surface. This defect is recorded by a system. However, it may happen that this error is not one (incorrectly detected), this information can be specified afterwards (attribute "PossibleValidationResults").
Defects are always channel bound and recorded or evaluated by a system.
In the following, the elements and attributes that occur in a *Defect* as XML are described in more detail.

The XML Schema can be found in the chapter [EventsDefect](#events-defect).

###### XML elements

Not all of these elements must be present, details can be taken from the XML Schema.  

| Name | Description | Parent object |
|---|-----|--|
| Defect| Root Element | none |
| PossibleDefectNames | Name of a possible error | Defect |
| PossibleClassifications | Classification of a possible error | Defect |
| PossibleValidationResults | Possible confirmations of the error | Defect |

###### XML attributes

Below are the attributes of the root element "Defect":

| Name | Description | Parent object |
|---|-----|--|
| Classification | Classification of the error | Defect |
| DefectName | Name of the error | Defect |
| Details | Further information or more detailed descriptions of the error | Defect |
| Parameter1Name | Name of the parameter 1 | Defect |
| Parameter1Value | Value of parameter 1 | Defect |
| Parameter2Name | Name of the parameter 2 | Defect |
| Parameter2Value | Value of Parameter 2 | Defect |
| Parameter3Name | Name of the parameter 3 | Defect |
| Parameter3Value | Value of parameter 3 | Defect |
| ID | Unique number for identification of the error | Defect |

##### Detected Object

These events indicate an object found during a diagrose ride. These can be, for example, detected balises or tunnels. What exactly counts as a found object is not defined in this specification, only the information for a recorded event.

The XML Schema can be found in the chapter [EventsGeneric](#events-generic).

###### XML elements

Not all of these elements must be present, details can be taken from the XML schema.

| Name | Description | Parent object |
|---|-----|--|
| DetectedObject | Root Element | none |
| object | Element with information about the found object in the element itself or in the attributes | DetectedObject |
| Reference | Reference to a list of known and uniquely assignable objects of the railway company | DetectedObject |
| ObjectAttribute | Further information about the object, the information is contained in the attributes | DetectedObject |

###### XML attributes

| Name | Description | Parent object |
|---|-----|--|
| Unique ID of the event | DetectedObject |
| Type | Type of object found | object |
| Description | further description or information about/from object | object |
| ObjectConsistency | Reference to the correctness of the specified data | object |
| ReferenceSystem | Reference to the name of the system from which the data originates | Reference |
| Key | Information about the data contained in the "ObjectAttribute" element | ObjectAttribute |

##### Limit Violation

Limit value exceedances of measured values of a channel can also be recorded as events.  
The XML schema can be found in chapter [EventsGeneric](#events-generic).  

###### XML elements

| Name | Description | Parent object |
|---|-----|--|
| LimitViolation | Root Element | none |

###### XML attributes

| Name | Description | Parent object |
|---|-----|--|
| TimestampMaxViolation | Time at which limit value was exceeded | LimitViolation |
| ViolatedLimit | Name of the defined limit | LimitViolation |
| ID | Unique ID of the event | LimitViolation |

##### Consistency

The message about the consistency of the data is triggered by a system that checks all data according to certain criteria. For example, this could be a check for black images in a video. If all frames in the video are black, something is wrong and the video is unusable. Messages are only created if a finding is present.

The XML Schema can be found in the chapter [EventsGeneric](#events-generic).  

###### XML element

| Name | Description | Parent object |
|---|-----|--|
| Consistency | Root Element | none |

###### XML attributes

| Name | Description | Parent object |
|---|-----|--|
| Type | Type or type of consistency check in response to the question "What has been checked? | Consistency |
| ProcessName | Name of the process that checked consistency | Consistency |
| Result | Result of the consistency check. | Consistency |
| ID | Unique ID of the event (UUID) | Consitimestency |

**Result:** The actual result of the consistency check. Each system that performs a consistency check has different results, which in turn must be described in more detail in its specification.

#### Reference "reference"

Contains a list of entries containing the name of the system that triggered the event.

| Name | Data Type | Parent Object | Mandatory | Storage Type |
|--|---|----|---|------|
| "reference" | string | yes | Single values |

HDF5 chunking is allowed and recommended, HDF5 compression is allowed.  

### Record Group

Unlike events, logs are only created by a user and not by a system.
For all protocol types, there are corresponding XML schemas that define the technical specifications. Metadata is defined in the respective channels.
Protocol entries can have references to systems, sessions, and channels.  

| Name | HDF5 Type | Mandatory |
|---|-----|--|
| RECORDS | HDF5 Group | yes |

Within the group there are the following data fields:

| Name | Data type | Parent object | Mandatory | Storage type |
|--|---|----|---|------|
| data | string (XML) | `RECORDS` | yes | Single values |
| duration | 64 bit signed integer little endian | `RECORDS` | yes | Single values |
| eventtype | string | `RECORDS` | yes | single values |
| reference | string | `RECORDS` | yes | Single values |
| timestamp | 64 bit signed integer little endian | `RECORDS` | yes | single values |

Each of these data sets contains a list with information about an entry at a specific time.
Each data set is described in more detail in the following subchapters.  

#### Record Data

| Name | Data type | Parent object | Mandatory | Storage type |
|--|---|----|---|------|
| "data" | string | `RECORDS` | yes | Single values |

HDF5 chunking is allowed and recommended, HDF5 compression is allowed.  

This dataset contains the actual information for a protocol entry, this in the XML notation which is described in more detail in each chapter of the protocol types.  
The protocol entries are stored in this data set as a list. A type can be stored for each entry. These are explained in more detail in the chapter [Record Types](#record-types).

#### Duration

Defines for each entry the duration of the log entry itself. This value can also be zero.

| Name | Data type | Parent object | Mandatory | Storage type |
|--|---|----|---|------|
| "duration" | 64 bit integer | `RECORDS` | yes | Single values |

HDF5 chunking is allowed and recommended, HDF5 compression is allowed.  

#### Reference "reference"

Contains a list of entries containing the name of the system that triggered it.

| Name | Data Type | Parent Object | Mandatory | Storage Type |
|--|---|----|---|------|
| "reference" | string | `RECORDS` | yes | Single values |

HDF5 chunking is allowed and recommended, HDF5 compression is allowed.  

#### Record Types

Contains the type of a log entry.

| Name | Data type | Parent object | Mandatory | Storage type |
|--|---|----|---|------|
| "recordtype" | string | `RECORDS` | yes | Single values |

HDF5 chunking is allowed and recommended, HDF5 compression is allowed.  

In the list "recordtype" the type of the recorded protocol entry is shown. The different types contain different information, which is shown in the following subchapters. Corresponding XML schemas are available for all types, which define the technical specifications.

##### Comment

Comments recorded during a diagnostic drive by the user. The content is not specified, only the XML structure.
The XML schema can be found in chapter [EventsComment](#events-comment).  

###### XML elements

| Name | Description | Parent object |
|---|-----|--|
| Comment | Root element and message, recorded by the user | none |

###### XML attributes

| Name | Description | Parent object |
|---|-----|--|
| Username | Name of the user who recorded the message | Comment |
| ID | Unique ID of this message | Comment |

##### Corrupt

Messages of the type "damaged" or "unusable" do not receive a content specification, only the XML structure is predefined and described here.
The XML schema can be found in chapter [EventsGeneric](#events-generic).  

###### XML elements

| Name | Description | Parent object |
|---|-----|--|
| Corrupt | Root element and message, recorded by the user | none |

###### XML attributes

| Name | Description | Parent object |
|---|-----|--|
| Username | Name of the user who recorded the message | Corrupt |
| ID | Unique ID of this message | Corrupt |

### Configuration Group

In the configuration group, data can be stored in any format that was used for the configuration of one or more measuring systems. Each subgroup defines a measurement system.  
This group is below that of a measurement system and thus within the group [Measuring System Group](#measuring-system-group).  

| Name | Parent object | Mandatory |
|--|--|--|
| CONFIGURATION | `MEASURINGSYSTEM` | yes |

#### Configuration Group data sets

This group contains two data sets:

| Name | Data type | Parent object | Mandatory | Storage type |
|--|---|----|---|------|
| key | string | `CONFIGURATION` | yes | Single values |
| value | string or binary | `CONFIGURATION` | yes | Single values |

**key:** This data set contains the name of the measuring system to which the stored configuration belongs.  
**value:** The actual configuration is stored in this dataset. This configuration can be stored binary or as a character string.  

### Data Processing Group

The data source group `DATAPROCESSING` contains information on data processing. This information is written by systems that make changes to the data. These changes, for example, can be a conversion from millimeters to meters.

| Name | Parent object | Mandatory |
|--|--|--|
| DATAPROCESSING | RCMDX | yes |

#### Data Processing Group data sets

The group `DATAPROCESSING` contains two data sets:

| Name | Data type | Parent object | Mandatory | Storage type |
|--|---|----|---|------|
| key | string | `DATAPROCESSING` | yes | Single values |
| value | string | `DATAPROCESSING` | yes | Single values |

**key:** This data set stores the name of the system that made the changes to the data.  
**value:** In this dataset the actual information is stored (what has been changed?).  

Further the `timestamp` dataset is necessary, as in chapter [Primitive and extended datatypes](#primitive-and-extended-data-types).

### Clearance Information Group

This group is used by SBB to record information about the data release of all parties who have processed this data. The information is stored in the form of key-value pairs in a data set.

| Name | Parent object | Mandatory |
|--|--|--|
| CLEARANCE INFORMATION | `RCMDX` | yes |

The following attributes are included in this group:

| Name | Data Type | Parent object | Mandatory | Description |
|--|---|----|---|-----|
| clearance | 8 bit integer (boolean) | CLEARANCE INFORMATION | yes | **Null (0)** for `false`, **one (1)** for `true`. With `true` the data in the whole file were released, otherwise the data are to be regarded as test data or are of lower quality. |
| clearance_date | 64 bit integer | CLEARANCEINFORMATION | yes | Timestamp at which the data was released (`clearance` on `true`). |

In the data set `timestamp` the time of the acquisition of a key-value pair is recorded.

#### Data set

The `CLEARANCEINFORMATION` group contains two data sets:

| Name | Data type | Parent object | Mandatory | Storage type |
|--|---|----|---|------|
| key | string | `CLEARANCE INFORMATION` | yes | Single values |
| value | string | `CLEARANCE INFORMATION` | yes | Single values |

**key:** The name of the system that created this entry is entered in this data set.  
**value:** The actual release information is entered in this data set.  

Further the `timestamp` dataset is necessary, as in chapter [Primitive datatypes and others](#primitive-and-extended-data-types).

## XML Schema Definitions

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
