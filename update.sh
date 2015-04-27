#!/bin/sh
set -e
set -x

# cleanup and create new rootfs dir
rm -fr rootfs/
mkdir -p rootfs/etc/ssl/certs/

# add latest ca-certificates.crt from Debian upstream
(cd rootfs/etc/ssl/certs/; \
	wget https://github.com/hypriot/rpi-swarm/raw/master/certs/ca-certificates.crt)

# add latest serf binary
SERF_ZIP="0.6.4_linux_amd64.zip"
(cd rootfs; \
	wget https://dl.bintray.com/mitchellh/serf/${SERF_ZIP}; \
    unzip ${SERF_ZIP}; \
    rm -f ${SERF_ZIP}; \
    ls -al serf)

# create complete tarball
(cd rootfs; \
	tar cvzf ../rootfs.tar.gz .)

# remove serf binary
rm -fr rootfs/serf
