#!/bin/bash
#
# Regression test for https://github.com/spotify/docker-gc/issues/201

set -euxo pipefail

REMOVE_VOLUMES=1 ./docker-gc
