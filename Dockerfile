FROM pandoc/extra:3.6.4.0

RUN apk add --no-cache \
  envsubst \
  make \
  plantuml \
  graphviz

WORKDIR /data

ENTRYPOINT /bin/sh
