FROM texlive/texlive:latest

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get update && apt-get install -y --no-install-recommends \
  pandoc \
  graphviz \
  gettext

WORKDIR /data

CMD make pdf
