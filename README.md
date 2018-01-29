# Example Concierge managed Squid as a proxy

## Introduction
In the principle of [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself), hop on over to the [Apache as a Proxy 
introduction](https://github.com/mesoform/apache-fwdproxy#introduction) because it the same.

## How we got set up 
Likewise, setting up our repository for Squid was pretty much the same as [setting up 
Apache](https://github.com/mesoform/apache-fwdproxy#how-we-got-set-up). We only use one [install 
script](https://github.com/mesoform/squid-gcp-proxy/blob/master/files/bin/install.sh), just a [script to reload 
Squid](https://github.com/mesoform/squid-gcp-proxy/blob/master/files/bin/reload) but still have a set of [Jinja 
templates](https://github.com/mesoform/squid-gcp-proxy/tree/master/templates/app) for automating the configuring of our application at 
build time. In particular, the [consul-template 
template](https://github.com/mesoform/squid-gcp-proxy/blob/master/templates/app/apache-fwdproxy-servers.conf.ctmpl.j2) which is used 
when we discover what Apache servers are in our environment.  It obviously isn't normal to be discovering clients but we wanted to
demonstrate how we can use active discovery to configure our Squid ACLs. When used with secure key system, this could be used to 
configure Squid as a basic identity aware proxy.


## Noteworthy configuration 
So much is covered in the Apache repo that there isn't a great deal to write about here (well, consistent and repeatable builds is what
a lot of this is about). However, there are still a few interesting points:
* Discovering our clients is done by having a [list of downstream 
services](https://github.com/mesoform/squid-gcp-proxy/blob/master/vars/main.yml#L43) to tell [Containerpilot to 
watch](https://github.com/mesoform/squid-gcp-proxy/blob/master/files/etc/containerpilot.json5#L129-L136), then [reload 
Squid](https://github.com/mesoform/squid-gcp-proxy/blob/master/files/bin/reload) on change.
* To get Squid to log to stdout, we had to run syslogd as a coprocess in the container. So we took the opportunity to demonstrate
template precedence. By dropping our own [custom Containerpilot.json5 
template](https://github.com/mesoform/squid-gcp-proxy/blob/master/templates/orchestration/containerpilot.json5.j2) into our local
orchestration templates directory, we were able to overwrite the playbook's default one and add in [a job to run 
syslog](https://github.com/mesoform/squid-gcp-proxy/blob/master/templates/orchestration/containerpilot.json5.j2#L188-L192).
* We found a strange Squid behaviour where if the CIDR (/32) range was missed off an [IP address used for an 
ACL](https://github.com/mesoform/squid-gcp-proxy/blob/master/files/etc/squid-gcp-proxy/apache-fwdproxy-servers.conf.ctmpl#L4), Squid
would not [log requests to access_log](https://github.com/mesoform/squid-gcp-proxy/blob/master/files/etc/squid-gcp-proxy/squid.conf#L77-L80) 
even though debugging and testing found the requests to succeed.
* Our downstream server addresses are [updated in their own 
file](https://github.com/mesoform/squid-gcp-proxy/blob/master/files/etc/squid-gcp-proxy/squid.conf#L19)
* Just like Apache, we also added some [configuration for reverse 
proxying](https://github.com/mesoform/squid-gcp-proxy/blob/master/files/etc/squid-gcp-proxy/squid.conf#L51-L60)

###-------------------------------------------------------------------------------------------------------------------------
Template by [Mesoform Limited](http://www.mesoform.com)