#!/usr/bin/env sh

while [ 1 ]
do
    echo "Starting new test"
    ./speedtest.sh

    sleep $SPEEDTEST_FREQ
done