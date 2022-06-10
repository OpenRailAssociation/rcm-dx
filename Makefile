.DEFAULT_GOAL := help

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort -k 1,1 | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: images
images:  ## generate images using plantuml
	java -DPLANTUML_LIMIT_SIZE=8192 -jar ./bin/plantuml.jar ./images/rcm-dx-images.puml -o images/generated
	mkdir -p generated-specs/html/images
	cp -r images/* generated-specs/html/images

.PHONY: pdf
pdf: images ## generate PDF specification
	mkdir -p generated-specs/pdf
	envsubst < metadata.md > _metadata.md
	pandoc --from markdown --data-dir=. --template rcm-dx --listings --toc --number-sections --metadata-file=_metadata.md RCM-DX-Specification_EN.md -o generated-specs/pdf/RCM-DX-Specification_EN.pdf
	rm _metadata.md

.PHONY: html
html: images  ## generate HTML specification
	mkdir -p generated-specs/html/css
	lessc -s templates/sbbTheme.less generated-specs/html/css/sbbTheme.css
	pandoc -s -c css/sbbTheme.css -A footer.html --toc RCM-DX-Specification.md -o generated-specs/html/RCM-DX-Specification.html
