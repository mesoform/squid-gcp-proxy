FROM mesoform/concierge-debian-base-image:concierge-0.1.17

# Add some labels
LABEL maintainer="Gareth Brown <gareth@mesoform.com>"
LABEL description="Proxy for forwarding HTTP requests to Google APIs"
LABEL com.mesoform.baseimage=False
LABEL com.joyent.autopilotpattern=True
LABEL com.mesoform.builddate="2017-11-29T20:13:04Z"
LABEL com.mesoform.baseimage.ver="mesoform/concierge-debian-base-image:concierge-0.1.17"
LABEL com.docker.img.ver="mesoform/concierge-squid-gcp-proxy:0.1.0"

# Set some environment variables
ENV DOCKER_IMG_VER="mesoform/concierge-squid-gcp-proxy:0.1.0"
ENV DNS_DOMAIN=squid-gcp-proxy.gcp.mesoform.com
RUN unset CONSUL_AGENT
ENV LOG_LEVEL="DEBUG"
ENV LOG_FORMAT="text"
ENV CHANGE_ME=2

# Set some build arguments
ARG CHANGE_ME=1


# If we have any install scripts, run them.
RUN chmod -R +x /usr/local/bin/install.sh && \
    /usr/local/bin/install.sh

# make directories
RUN mkdir -p squid-data 
# define volumes if set
VOLUME [ "squid-data"  ]


# Expose primary service port
EXPOSE 3128
# Expose additional container ports
EXPOSE 8301/UDP 8301/TCP 8300/tcp 8400 8302/UDP 8302/TCP 8500 10050 
# The command we pass to Containerpilot to start the application
RUN chmod ug+x /usr/sbin/squid3
CMD [ "/usr/sbin/squid3 -f /etc/squid-gcp-proxy/squid.conf" ]
