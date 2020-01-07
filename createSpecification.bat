:: Set Paths
set SPEC_DIR=generated-specs
set PDF_DIR=%SPEC_DIR%\pdf
set HTML_DIR=%SPEC_DIR%\html
set CSS_DIR=%HTML_DIR%\css
set IMAGE_DIR=%HTML_DIR%\images
set GENERATED_IMAGE_DIR=.\images\generated

:: Remove and create folder structure for generated data
rmdir /q/s %SPEC_DIR%
rmdir /q/s %GENERATED_IMAGE_DIR%
mkdir %SPEC_DIR%
mkdir %PDF_DIR%
mkdir %HTML_DIR%
mkdir %CSS_DIR%
mkdir %IMAGE_DIR%

:: create images
java -jar plantuml.jar images.puml -o images/generated

:: Create each specification from markdown to PDF
pandoc --from markdown --data-dir=%cd% --template sbb --listings --toc --number-sections --columns=5 --metadata-file=RCM-DX-Spec_Metadata_EN.yaml RCM-DX-Specification_EN.md -o %PDF_DIR%\RCM-DX-Specification_EN.pdf 

:: Copy image folder to html folder
xcopy images %IMAGE_DIR% /s /e /h

:: Create HTML output
pandoc -s -c css/sbbTheme.css -A footer.html --toc RCM-DX-Specification_EN.md -o %HTML_DIR%\RCM-DX-Specification_EN.html

:: Create CSS theme from LESS style file for HTML output
lessc -s templates/sbbTheme.less %CSS_DIR%\sbbTheme.css
