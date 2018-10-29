#!/bin/bash

sudo mkdir -p /var/spool/apt-mirror/mirror/archive.ubuntu.com/

sudo mount --bind /var/spool/apt-mirror/mirror/archive.ubuntu.com/  /srv/ftp/

sudo update-rc.d proftpd enable

sudo apt-mirror