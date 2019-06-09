FROM nginx:latest
MAINTAINER Marnu Lombard <marnu@mar.nu>

# Add RSA sources for debian packages for faster builds
ADD ./sources.list /etc/apt/sources.list
# Add our nginx site config
ADD ./nginx.conf /etc/nginx/
ADD ./sites-enabled /etc/nginx/
# Add the startup script
ADD ./start.sh /

RUN set -x \ 
    && apt-get update  \
    && apt-get install apt-utils -qy  \
    && apt-get install -y locales lsb-release \
# Locales
    && locale-gen en_GB en_GB.UTF-8 \
    && dpkg-reconfigure locales -f noninteractive \
    && update-locale en_GB.UTF-8 \
# Timezone
    && ln -sf /usr/share/zoneinfo/Africa/Johannesburg /etc/localtime \
    && dpkg-reconfigure tzdata -f noninteractive \ 
    && apt-get install -y \
# Install Certbot
        certbot python-certbot-nginx -t stretch-backports \
# Set empty base site
    && mkdir -p /var/www/html \
    && echo "<?php exit();" > /var/www/html/index.php 

CMD ["/start.sh"]