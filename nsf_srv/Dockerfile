FROM alpine:latest

WORKDIR /home 

RUN apk add openrc \
            dhcp \
            tftp-hpa \
            nfs-utils 

COPY nsf_srv/dhcpd.conf /etc/dhcp/
COPY nsf_srv/exports /etc/
COPY nsf_srv/startup.sh /home/
RUN chmod +x /home/startup.sh
WORKDIR /srv

#Somehow needed by DHCPD
RUN touch /var/lib/dhcp/dhcpd.leases
#needed for openrc to run in container
RUN mkdir -p /run/openrc/
RUN touch /run/openrc/softlevel
RUN mkdir /srv/bbonefs
