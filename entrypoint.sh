#!/bin/sh

set -e

chown -R list:list /var/lib/quickml

exec "$@"
