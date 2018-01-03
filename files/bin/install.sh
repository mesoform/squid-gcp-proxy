#!/usr/bin/env bash

# Alpine package update
apt update \
    && apt-get install -qqy  \
        squid3 \
        squidclient \
        procps \
        vim \
        man \
        curl

useradd -c "User for running Squid proxy" -M squid
# Redirect logs to stdout for the container
mkdir /var/log/squid-gcp-proxy
chown squid /var/log/squid-gcp-proxy
