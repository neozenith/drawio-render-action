FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y wget libgtk-3-0 libxss1 xvfb nodejs npm

RUN wget https://github.com/jgraph/drawio-desktop/releases/download/v24.4.0/drawio-amd64-24.4.0.deb && \
    dpkg -i drawio-amd64-24.4.0.deb || apt-get install -y -f

RUN npm install -g draw.io-desktop

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
