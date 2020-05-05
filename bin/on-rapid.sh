#!/usr/bin/env bash

PIN=${PIN:-'18'}

for other_pin in 12 13 18 19; do
  gpio -g pwm $other_pin 0
  gpio -g mode $other_pin out
  gpio -g write $other_pin 0
done

gpio -g mode $PIN pwm
gpio -g pwm $PIN 0


echo phase 1
for value in $(seq 1 5 80); do
  gpio -g pwm $PIN $value
done
echo phase 2
for value in $(seq 100 50 1000); do
  gpio -g pwm $PIN $value
done
echo full
gpio -g pwm $PIN 1023
