#!/usr/bin/env bash

BLUE_PIN=${RED_PIN:-'12'}
RED_PIN=${RED_PIN:-'19'}

for other_pin in 12 13 18 19; do
  gpio -g pwm $other_pin 0
  gpio -g mode $other_pin out
  gpio -g write $other_pin 0
done

gpio -g mode $RED_PIN pwm
gpio -g pwm $RED_PIN 1023

gpio -g mode $BLUE_PIN pwm
gpio -g pwm $BLUE_PIN 1023

sleep 1

echo phase 1
echo
for value in $(seq 1000 -100 0); do
  echo $value
  gpio -g pwm $RED_PIN $value
  gpio -g pwm $BLUE_PIN $value
  sleep 0.5
done

echo
echo off
gpio -g pwm $RED_PIN 0
gpio -g pwm $BLUE_PIN 0
