FROM nginx:latest
MAINTAINER Marnu Lombard <marnu@mar.nu>

# Add RSA sources for debian packages for faster builds
ADD ./sources.list /etc/apt/sources.list
# Add our nginx site config
ADD ./nginx.conf /etc/nginx/nginx.conf
ADD ./sites-enabled/ /etc/nginx/sites-enabled/

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
# Set empty base site
    && mkdir -p /var/www/html/public \
    && echo "<?php exit();" > /var/www/html/public/index.php \
# Allow for copy paste `sudo ...` commands
    && echo 'function sudo { true && "$@"; }' >> ~/.bashrc \
# Clean
    && apt-get autoremove -qy \
    && apt-get autoclean -qy
