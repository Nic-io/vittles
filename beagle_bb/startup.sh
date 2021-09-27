#!/bin/sh

#start needed services for TFTP boot and NFS server
dhcpd &
in.tftpd -s -L /srv/boot &
rc
rc-service nfs start


