#!/usr/bin/env bash

# Alpine package update
apt update \
    && apt-get install -y  \
        squid3