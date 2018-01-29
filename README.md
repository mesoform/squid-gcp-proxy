# Example Concierge managed Squid as a proxy

## Introduction
In the principle of [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself), hop on over to the [Apache as a Proxy 
introduction](https://github.com/mesoform/apache-fwdproxy#introduction) because it the same.

## How we got set up 
Likewise, setting up our repository for Squid was pretty much the same as [setting up 
Apache](https://github.com/mesoform/apache-fwdproxy#how-we-got-set-up). We only use one [install 
script](https://github.com/mesoform/squid-gcp-proxy/blob/master/files/bin/install.sh), just a [script to reload 
Squid](https://github.com/mesoform/squid-gcp-proxy/blob/master/files/bin/reload) but still have a set of [Jinja 
templates](https://github.com/mesoform/squid-gcp-proxy/tree/master/templates/app).

###-------------------------------------------------------------------------------------------------------------------------
Template by [Mesoform Limited](http://www.mesoform.com)