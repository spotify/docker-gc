#!/bin/bash

for i in $(dirname $0)/test-*.sh ; do
    echo "Running ${i}..."
    ${i}
done
