ARG IMAGE_TAG=2.7.14-alpine3.7

FROM python:$IMAGE_TAG as compile

ARG OPENSLIDE_VERSION=3.4.1

RUN apk add --no-cache --update autoconf \
                                automake \
                                cairo-dev \
                                curl \
                                file \
                                gcc \
                                gdk-pixbuf \
                                gdk-pixbuf-dev \
                                glib-dev \
                                jpeg-dev \
                                libffi-dev \
                                libjpeg \
                                libpng \
                                libtool \
                                libxml2-dev \
                                make \
                                musl-dev \
                                openssl-dev \
                                openjpeg \
                                openjpeg-dev \
                                openjpeg-tools \
                                pkgconfig \
                                gdk-pixbuf \
                                sqlite-dev \
                                tiff \
                                tiff-dev \
                                zlib-dev

WORKDIR /root/openslide

RUN curl -sL https://github.com/openslide/openslide/releases/download/v3.4.1/openslide-3.4.1.tar.gz | tar zx --strip-components=1
    autoreconf -i && \
    ./configure && \
    make && \
    make install


FROM python:$IMAGE_TAG as build

COPY --from=compile /usr/local/bin/openslide-show-properties /usr/local/bin/openslide-show-properties
COPY --from=compile /usr/local/bin/openslide-quickhash1sum /usr/local/bin/openslide-quickhash1sum
COPY --from=compile /usr/local/bin/openslide-write-png /usr/local/bin/openslide-write-png
COPY --from=compile /usr/local/include/openslide /usr/local/include/openslide
COPY --from=compile /usr/local/lib/pkgconfig /usr/local/lib/pkgconfig
