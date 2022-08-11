#!/bin/bash

envsubst < /tmp/nginx.tmpl > /tmp/nginx.conf

#exec "$@"
nginx -c /tmp/nginx.conf -g 'daemon off;'
