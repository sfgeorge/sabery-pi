#!/usr/bin/env bash

# echo '* * * * * root shutdown +1' > /etc/cron.d/shutdown-every-10-minutes.cron

# time bash -c 'for value in $(seq 1 1 80); do
#   gpio -g pwm $PIN $value
# done'
# 
# real	0m1.132s
# user	0m0.251s
# sys	0m0.812s

PIN=${PIN:-'18'}

for other_pin in 12 13 18 19; do
  gpio -g pwm $other_pin 0
  gpio -g mode $other_pin out
  gpio -g write $other_pin 0
done

gpio -g mode $PIN pwm
gpio -g pwm $PIN 0

sleep 1

echo phase 1
for value in $(seq 1 1 80); do
  gpio -g pwm $PIN $value
done
echo phase 2
#for value in $(seq 100 20 1000); do
for value in $(seq 100 20 1000); do
  echo $value
  gpio -g pwm $PIN $value
  sleep 0.1
done
echo full
gpio -g pwm $PIN 1023

echo off
gpio -g pwm $PIN 0
