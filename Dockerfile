FROM alpine:latest

WORKDIR /home 

RUN apk add gcompat \
            clang \
            llvm \
            git \
            make \
            cmake \
            tree \
            ctags \
            vim

  
#ADD http://dl-cdn.alpinelinux.org/alpine/v3.14/main/x86_64/ctags-5.9.20210411.0-r0.apk /tmp
COPY .vimrc /tmp/
COPY drop.sh /tmp/

WORKDIR /tmp
#RUN apk add --allow-untrusted ctags-5.9.20210411.0-r0.apk
RUN /bin/sh /tmp/drop.sh vim


