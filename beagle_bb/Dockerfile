FROM alpine:latest

WORKDIR /home 

RUN apk add gcompat \
            git \
            make \
            cmake \
            tree \
            ctags \
            dhcp \
            tftp-hpa \
            nfs-utils \
            vim 

COPY .vimrc /tmp/
COPY drop.sh /tmp/
COPY beagle_bb/dhcpd.conf /etc/dhcp/
COPY beagle_bb/exports /etc/

WORKDIR /tmp
RUN /bin/sh /tmp/drop.sh vim

#Somehow needed by DHCPD
RUN touch /var/lib/dhcp/dhcpd.leases
RUN mkdir /srv/bbonefs
