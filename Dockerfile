FROM pandoc/extra:3.14

RUN apk add --no-cache \
  envsubst \
  make \
  plantuml \
  graphviz

WORKDIR /data

ENTRYPOINT ["make", "pdf"]
