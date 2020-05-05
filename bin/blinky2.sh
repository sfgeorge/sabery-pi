#!/usr/bin/env bash

PIN=${PIN:-'18'}

for other_pin in 12 13 18 19; do
  gpio -g pwm $other_pin 0
  gpio -g mode $other_pin out
  gpio -g write $other_pin 0
done

gpio -g mode $PIN pwm
gpio -g pwm $PIN 0

sleep 1

#for value in $(seq 1 1 80); do
#  gpio -g pwm $PIN $value
#done
#echo 2
#sleep 2
echo 2 go
for value in $(seq 100 20 1000); do
  gpio -g pwm $PIN $value
done

gpio -g pwm $PIN 1023

sleep 5
gpio -g pwm $PIN 0
