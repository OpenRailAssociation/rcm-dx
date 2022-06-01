FROM texlive/texlive:latest

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get update && apt-get install -y --no-install-recommends \
  pandoc \
  nodejs \
  graphviz

RUN npm install -g less

WORKDIR /data

CMD make pdf html
