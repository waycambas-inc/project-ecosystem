#!/bin/bash

/app/workspace/run.sh

if [ ! -d "/var/log/supervisor" ]; then
    mkdir /var/log/supervisor
fi

/usr/bin/supervisord -n -c /etc/supervisord.conf
