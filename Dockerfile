FROM pandoc/extra:3.9

RUN apk add --no-cache \
  envsubst \
  make \
  plantuml \
  graphviz

WORKDIR /data

ENTRYPOINT ["/bin/sh"]
