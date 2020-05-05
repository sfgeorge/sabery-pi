#!/usr/bin/env bash

cd $(dirname "$0")

./off-all.sh

PIN=18 ./on-rapid.sh

sleep 2

PIN=19 ./blinky3.sh
PIN=19 ./pulse.sh

