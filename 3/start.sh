#!/bin/bash

# wrapper for docker cli. assumes internal and external ports
# are, by intention, the same

[[ -z "$1" ]] && { echo "Usage: $0 <port>"; exit 1; } || port=$1

docker run \
    --env PORT=${port} \
    --publish ${port}:${port} \
    --detach \
    --name mynginx \
    --rm mynginx
