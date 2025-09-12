FROM pandoc/extra:3.7

RUN apk add --no-cache \
  envsubst \
  make \
  plantuml \
  graphviz

WORKDIR /data

ENTRYPOINT ["/bin/sh"]
