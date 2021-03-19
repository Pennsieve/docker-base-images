FROM python:3.7-slim

RUN apt-get update && apt-get install -y wget

ARG CLOUDWRAP_VERSION=0.5.9

RUN wget -O cloudwrap_${CLOUDWRAP_VERSION}_amd64.deb \
        https://github.com/Pennsieve/cloudwrap/releases/download/${CLOUDWRAP_VERSION}/cloudwrap_${CLOUDWRAP_VERSION}_amd64.deb
RUN dpkg -i cloudwrap_${CLOUDWRAP_VERSION}_amd64.deb && \
    rm -rf /var/lib/apt/lists/* && \
    rm -f cloudwrap_${CLOUDWRAP_VERSION}_amd64.deb

RUN useradd -r -m -U -u 999 pennsieve && \
    usermod -a -G pennsieve pennsieve

USER pennsieve

ENTRYPOINT ["cloudwrap"]
CMD ["--help"]
