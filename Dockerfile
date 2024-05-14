FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y wget libgtk-3-0 libxss1 xvfb

RUN wget https://github.com/jgraph/drawio-desktop/releases/download/v20.8.15/drawio-amd64-20.8.15.deb && \
    dpkg -i drawio-amd64-20.8.15.deb || apt-get install -y -f

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
