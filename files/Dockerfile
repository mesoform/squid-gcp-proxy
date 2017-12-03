FROM mesoform/concierge-debian-base-image:concierge-0.1.17

# Add some labels
LABEL maintainer="Gareth Brown <gareth@mesoform.com>"
LABEL description="Proxy for forwarding HTTP requests to Google APIs"
LABEL com.mesoform.baseimage=False
LABEL com.joyent.autopilotpattern=True
LABEL com.mesoform.builddate="2017-12-03T19:30:49Z"
LABEL com.mesoform.baseimage.ver="mesoform/concierge-debian-base-image:concierge-0.1.17"
LABEL com.docker.img.ver="mesoform/concierge-squid-gcp-proxy:0.1.0"

# Set some environment variables
ENV DOCKER_IMG_VER="mesoform/concierge-squid-gcp-proxy:0.1.0"
ENV DNS_DOMAIN=squid-gcp-proxy.gcp.mesoform.com
RUN unset CONSUL_AGENT
ENV LOG_LEVEL="DEBUG"
ENV LOG_FORMAT="text"
ENV CONTAINER_VAR=TRUE

# Set some build arguments
ARG BUILD_VAR=TRUE


# If we have any install scripts, run them.
RUN chmod -R +x /usr/local/bin/install.sh && \
    /usr/local/bin/install.sh

# make directories
RUN mkdir -p squid-data 
# define volumes if set
VOLUME [ "squid-data"  ]


# Expose primary service port
EXPOSE 3128

# The command we pass to Containerpilot to start the application
RUN chmod ug+x /usr/sbin/squid3
CMD [ "/usr/sbin/squid3 -f /etc/squid-gcp-proxy/squid.conf" ]
