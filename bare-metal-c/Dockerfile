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

COPY .vimrc /tmp/
COPY drop.sh /tmp/

WORKDIR /tmp
RUN /bin/sh /tmp/drop.sh vim


