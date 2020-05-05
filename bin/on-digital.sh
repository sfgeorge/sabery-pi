#!/usr/bin/env bash

cd $(dirname "$0")

PIN=${PIN:-'18'}

gpio -g mode $PIN out
gpio -g write $PIN 1
