#!/usr/bin/env bash

# Alpine package update
apt update \
    && apt-get install -qqy  \
        squid3 \
        squidclient \
        procps \
        vim \
        man \
        curl \
        sudo \
        busybox-syslogd

useradd -c "User for running Squid proxy" -M squid
# Redirect logs to stdout for the container
mkdir /var/log/squid-gcp-proxy
chown squid /var/log/squid-gcp-proxy
echo -e "Defaults:squid !requiretty" > /etc/sudoers.d/squid
echo -e "squid ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/squid
