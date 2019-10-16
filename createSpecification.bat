:: create images
java -jar plantuml.jar images/images.puml -o generated

pandoc RCM-DX-Specification.md -o RCM-DX-Specification.pdf --from markdown --template sbb --listings --toc
