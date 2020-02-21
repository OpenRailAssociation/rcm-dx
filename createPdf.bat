:: Set Paths
set SPEC_DIR=generated-specs
set PDF_DIR=%SPEC_DIR%\pdf
set IMAGE_DIR=%HTML_DIR%\images
set GENERATED_IMAGE_DIR=.\images\generated

:: Remove and create folder structure for generated data
rmdir /q/s %SPEC_DIR%
rmdir /q/s %GENERATED_IMAGE_DIR%
mkdir %SPEC_DIR%
mkdir %PDF_DIR%
mkdir %IMAGE_DIR%

:: create images
java -jar ./bin/plantuml.jar images.puml -o images/generated
java -jar ./bin/plantuml.jar RCM-DX-Structure.puml -o images/generated

:: Create each specification from markdown to PDF
pandoc --from markdown --data-dir=%cd% --template rcm-dx --listings --toc --number-sections --columns=5 --metadata-file=RCM-DX-Spec_Metadata_EN.yaml RCM-DX-Specification_EN.md -o %PDF_DIR%\RCM-DX-Specification_EN_V2.0.pdf