FROM alpine:latest

WORKDIR /home 

RUN apk add gcompat \
            git \
            buid-base \
            make \
            cmake \
            tree \
            python3 \
            python3-dev
            vim

COPY .vimrc /tmp/
COPY drop.sh /tmp/
ADD http://dl-cdn.alpinelinux.org/alpine/v3.14/main/x86_64/dtc-1.6.1-r0.apk /tmp/dtc-1.6.1-ro.apk

WORKDIR /tmp
RUN /bin/sh /tmp/drop.sh vim
RUN apk add /tmp/dtc-1.6.1-ro.apk

