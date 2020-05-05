#!/usr/bin/env bash

for other_pin in 8 25 12 13 18 19; do
  gpio -g mode $other_pin out
  gpio -g write $other_pin 0
done
