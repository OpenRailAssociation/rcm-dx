.DEFAULT_GOAL := help

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort -k 1,1 | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: images
images: ## generate images using plantuml
	java -DPLANTUML_LIMIT_SIZE=8192 -jar /usr/share/java/plantuml.jar ./images/rcm-dx-images.puml -o generated
	mkdir -p generated-specs/html/images
	cp -r images/* generated-specs/html/images/

.PHONY: pdf
pdf: images ## generate PDF specification
	mkdir -p generated-specs/pdf
	envsubst < metadata.md > _metadata.md
ifeq ($(IS_DRAFT),true)
	pandoc --from markdown --template eisvogel --listings --include-in-header templates/is_draft.latex --metadata-file=_metadata.md RCM-DX-Specification_EN.md -o generated-specs/pdf/RCM-DX-Specification_EN.pdf --pdf-engine tectonic
else
	pandoc --from markdown --template eisvogel --listings --metadata-file=_metadata.md RCM-DX-Specification_EN.md -o generated-specs/pdf/RCM-DX-Specification_EN.pdf --pdf-engine tectonic
endif
	rm _metadata.md
