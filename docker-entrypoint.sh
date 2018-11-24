#!/bin/bash

mkdir -p /var/spool/apt-mirror/mirror/archive.ubuntu.com/

update-rc.d proftpd enable

apt-mirror

proftpd -n

