#!/usr/bin/env bash

BLUE_PIN=${BLUE_PIN:-'12'}
WHITE_PIN=${WHITE_PIN:-'18'}

for other_pin in 12 13 18 19; do
  gpio -g pwm $other_pin 0
  gpio -g mode $other_pin out
  gpio -g write $other_pin 0
done

gpio -g mode $WHITE_PIN pwm
gpio -g pwm $WHITE_PIN 1023

gpio -g mode $BLUE_PIN pwm
gpio -g pwm $BLUE_PIN 1023

sleep 1

echo phase 1
echo
for value in $(seq 1000 -100 0); do
  echo $value
  gpio -g pwm $WHITE_PIN $value
  gpio -g pwm $BLUE_PIN $value
  sleep 0.5
done

echo
echo off
gpio -g pwm $WHITE_PIN 0
gpio -g pwm $BLUE_PIN 0
