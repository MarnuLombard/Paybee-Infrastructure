#!/bin/bash

# 1. Register with certbot
# 2. Install our nginx files we include from our default.conf
# 3. Obtain a new certificate, use the standalone plugin as no nginx is running
certbot register --noninteractive --agree-tos --email marnu@mar.nu \
  && certbot install --nginx \
  && certbot certonly --standalone --domain paybee.co.za --noninteractive

# Run default nginx container process
nginx -g "daemon off;"
