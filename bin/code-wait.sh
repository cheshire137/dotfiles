#!/bin/bash
OPTS=""
if [[ "$1" == /tmp/* ]]; then
    OPTS="-w"
fi

/usr/local/bin/code ${OPTS:-} -a "$@"
