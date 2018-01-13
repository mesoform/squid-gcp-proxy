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
        busybox-syslogd

useradd -c "User for running Squid proxy" -M squid