:: collect arguments
set SPEC_VERSION=%1
set SPEC_TYPE=%2

IF ""=="%1" (
    set SPEC_VERSION=_UNKNOWN!
)
IF "draft"=="%2" (
    set IS_DRAFT=true
    set DRAFT=_draft
)

:: set defaut variables
set SPEC_LANGUAGE=EN
set SPEC_NAME=RCM-DX-Specification
set IS_DRAFT=false
set YAML_FILE_NAME=RCM-DX-Spec_Metadata_EN.yaml

:: write yaml-spec-file for pandoc
(
echo ---
echo title: "RCM-DX Specification"
echo lang: EN
echo subtitle: "Version %SPEC_VERSION%"
echo keywords: [RCM-DX, Specification]
echo logo: "logo/rgb/RCM-DX-rgb.png"
echo logo-width: 100
echo secnumdepth: 5
echo titlepage: true
echo titlepage-rule-color: "EB0000"
echo author: "Swiss federal railways SBB, Schweizerische Bundesbahnen SBB, Chemins de fer fédéraux suisses CFF, Ferrovie federali svizzere FFS"
echo numbersections: true
echo colorlinks: true
echo toc-own-page: true
echo draft: %IS_DRAFT%
echo ...
) > %YAML_FILE_NAME%

:: Set Paths
set SPEC_DIR=generated-specs
set IMAGE_DIR=%HTML_DIR%\images
set GENERATED_IMAGE_DIR=.\images\generated

:: Remove and create folder structure for generated data
rmdir /q/s %SPEC_DIR%
rmdir /q/s %GENERATED_IMAGE_DIR%
mkdir %SPEC_DIR%
mkdir %IMAGE_DIR%

:: create images
java -jar ./bin/plantuml.jar images.puml -o images/generated
java -jar ./bin/plantuml.jar RCM-DX-Structure.puml -o images/generated

:: Create each specification from markdown to PDF
pandoc --from markdown --data-dir=%cd% --template rcm-dx --listings --toc --number-sections --columns=5 --metadata-file=%YAML_FILE_NAME% %SPEC_NAME%_%SPEC_LANGUAGE%.md -o %SPEC_DIR%\%SPEC_NAME%_%SPEC_LANGUAGE%_V%SPEC_VERSION%%DRAFT%.pdf

del %YAML_FILE_NAME%