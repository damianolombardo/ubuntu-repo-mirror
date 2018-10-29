#!/bin/bash

mkdir -p /var/spool/apt-mirror/mirror/archive.ubuntu.com/

mount --bind /var/spool/apt-mirror/mirror/archive.ubuntu.com/  /srv/ftp/

update-rc.d proftpd enable

apt-mirror