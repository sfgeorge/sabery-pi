#!/usr/bin/env bash

BLUE_PIN=${RED_PIN:-'12'}
RED_PIN=${RED_PIN:-'19'}

for other_pin in 12 13 18 19; do
  gpio -g pwm $other_pin 0
  gpio -g mode $other_pin out
  gpio -g write $other_pin 0
done

gpio -g write $BLUE_PIN 1

gpio -g mode $RED_PIN pwm
gpio -g pwm $RED_PIN 1023

sleep 1

echo phase 1
echo
for value in $(seq 1023 -1 1); do
  echo $value
  gpio -g pwm $RED_PIN $value
done

echo
echo off
gpio -g pwm $RED_PIN 0
