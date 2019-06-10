FROM php:fpm
MAINTAINER Marnu Lombard <marnu@mar.nu>

# Add RSA sources for debian packages for faster builds
ADD ./sources.list /etc/apt/sources.list
# Script to automate installing composer
ADD ./install_composer.sh /tmp/install_composer.sh
# Startup Script
ADD ./start.sh /usr/local/bin/start.sh

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
# Composer
    && apt-get install -y wget \
    && chmod +x /tmp/install_composer.sh \ 
# Mysql extension
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-enable pdo_mysql\
# Make startup script executable
    && chmod +x /usr/local/bin/start.sh \
# Allow for copy paste `sudo ...` commands
    && echo 'function sudo { true && "$@"; }' >> ~/.bashrc \
# Clean
    && docker-php-source delete \
    && apt-get autoremove -qy \
    && apt-get autoclean -qy

CMD ["/usr/local/bin/start.sh"]