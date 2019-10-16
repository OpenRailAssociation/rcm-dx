:: create images
java -jar plantuml.jar images.puml -o images/generated

set SPEC_DIR=generated-specs
set PDF_DIR=%SPEC_DIR%\pdf
set HTML_DIR=%SPEC_DIR%\html
set CSS_DIR=%HTML_DIR%\css

rmdir /q/s %SPEC_DIR%
mkdir %SPEC_DIR%
mkdir %PDF_DIR%
mkdir %HTML_DIR%
mkdir %CSS_DIR%

pandoc --from markdown --data-dir=%cd% --template sbb --listings --toc RCM-DX-Specification.md -o %PDF_DIR%\RCM-DX-Specification.pdf

pandoc -s -c css/sbbTheme.css -A footer.html --toc RCM-DX-Specification.md -o %HTML_DIR%\RCM-DX-Specification.html

lessc -s templates/sbbTheme.less %CSS_DIR%\sbbTheme.css