FROM openjdk:10-jre-slim

ARG CLOUDWRAP_VERSION
ARG DEBIAN_FRONTEND=noninteractive
ARG LIBSSL_VERSION=1.1_1.1.0l-1~deb9u1

RUN apt-get update && apt-get install -y --no-install-recommends dialog wget && \
    wget http://ftp.us.debian.org/debian/pool/main/o/openssl/libssl${LIBSSL_VERSION}_amd64.deb && \
    wget -O cloudwrap_${CLOUDWRAP_VERSION}_amd64.deb \
      https://github.com/Pennsieve/cloudwrap/releases/download/${CLOUDWRAP_VERSION}/cloudwrap_${CLOUDWRAP_VERSION}_amd64.deb && \
    dpkg -i cloudwrap_${CLOUDWRAP_VERSION}_amd64.deb \
      libssl${LIBSSL_VERSION}_amd64.deb && \
    rm -rf /var/lib/apt/lists/* && \
    rm -f *.deb

RUN useradd -r -m -U -u 999 pennsieve && \
    usermod -a -G pennsieve pennsieve

USER pennsieve 

ENTRYPOINT ["cloudwrap"]
CMD ["--help"]
