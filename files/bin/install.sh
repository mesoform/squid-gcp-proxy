#!/usr/bin/env bash

# Alpine package update
apt update \
    && apt-get install -qqy  \
        squid3 \
        procps \
        vim \
        man \
        curl