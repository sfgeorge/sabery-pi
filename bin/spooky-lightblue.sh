#!/usr/bin/env bash

BLUE_PIN=${BLUE_PIN:-'12'}
WHITE_PIN=${WHITE_PIN:-'18'}

for other_pin in 12 13 18 19; do
  gpio -g pwm $other_pin 0
  gpio -g mode $other_pin out
  gpio -g write $other_pin 0
done


gpio -g mode $WHITE_PIN pwm
gpio -g write $WHITE_PIN 1023

gpio -g mode $BLUE_PIN pwm
gpio -g pwm $BLUE_PIN 400

sleep 1
echo rotating

for value in $(seq 1000 -100 100); do
  echo $value
  gpio -g pwm $WHITE_PIN $value
  sleep 0.5
done

echo
echo off
