#!/bin/bash
#
# Regression test for https://github.com/spotify/docker-gc/issues/201

set -euxo pipefail

# when no volume exists then docker-gc should exit with status 0
REMOVE_VOLUMES=1 ./docker-gc

# when a volume exists it should be removed
docker volume create
if [[ $(docker volume ls --format "{{.Name}}" | wc -l) != 1 ]] ; then echo "Volume count is not 1" && exit 1 ; fi
REMOVE_VOLUMES=1 ./docker-gc
if [[ $(docker volume ls --format "{{.Name}}" | wc -l) != 0 ]] ; then echo "Volume has not been removed" && exit 1 ; fi
