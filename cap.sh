#!/bin/bash

WORKDIR=$(pwd)

if [ $(command -v selinuxenabled >/dev/null 2>&1) -a $(selinuxenabled) ]; then
    chcon -Rt svirt_sandbox_file_t $WORKDIR
fi

docker run \
    --rm \
    -i \
    -t \
    -v $WORKDIR:/root/workdir \
    trindade/capistrano-symfony-docker \
    $@
