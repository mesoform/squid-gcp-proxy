FROM mesoform/concierge-debian-base-image:devtest

# Add some labels
LABEL maintainer="Gareth Brown <gareth@mesoform.com>"
LABEL description="Proxy for forwarding HTTP requests to Google APIs"
LABEL com.mesoform.baseimage=False
LABEL com.joyent.autopilotpattern=True
LABEL com.mesoform.builddate="2018-03-04T17:58:12Z"
LABEL com.mesoform.baseimage.ver="mesoform/concierge-debian-base-image:devtest"
LABEL com.docker.img.ver="mesoform/concierge-squid-gcp-proxy:0.1.0"

# Set some environment variables
ENV DOCKER_IMG_VER="mesoform/concierge-squid-gcp-proxy:0.1.0"
RUN unset CONSUL_AGENT
ENV LOG_LEVEL="DEBUG"
ENV LOG_FORMAT="text"
ENV COMMAND="/usr/sbin/squid3 -N -f /etc/squid-gcp-proxy/squid.conf"



# If we have any install scripts, run them.
RUN chmod -R +x /usr/local/bin/install.sh && \
    sync && \
    /usr/local/bin/install.sh

# make directories
RUN mkdir -p /squid-data 
# define volumes if set
VOLUME /squid-data 

# Expose primary service port
EXPOSE 3128

HEALTHCHECK \
    --interval=10s \
    --timeout=3s \
    --retries=4 \
    CMD squidclient -g 1 http://www.google.co.uk/?
