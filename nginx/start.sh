#!/bin/bash

# Start the Nging daemon and send it to the background
nginx -g "daemon off;"&

# Install our certificates 
certbot register --noninteractive --agree-tos --email marnu@mar.nu \
    && certbot run --nginx --domain paybee.co.za --noninteractive

