#!/usr/bin/env bash

cd $(dirname "$0")

for other_pin in 8 25 12 13 18 19; do
  gpio -g mode $other_pin out
  gpio -g write $other_pin 0
done

for delay in 0.5 0.2 0.05 0.05 0.05 0.05 0.05 0.05 0.05 0.05 0.05; do
  for other_pin in 12 8 13 25 18 8 19 25; do
    gpio -g write $other_pin 1
    sleep $delay
    gpio -g write $other_pin 0
  done
done

./off-all.sh
