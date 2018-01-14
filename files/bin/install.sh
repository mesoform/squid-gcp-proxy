#!/usr/bin/env bash

# Install squid, required packages and syslog so we can log to stdout
apt update \
    && apt-get install -qqy  \
        squid3 \
        squidclient \
        procps \
        vim \
        man \
        curl \
        busybox-syslogd

useradd -c "User for running Squid proxy" -M squid

# Remove default config directory
rm -Rf /etc/squid3
