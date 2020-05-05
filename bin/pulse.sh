#!/usr/bin/env bash

PIN=${PIN:-'18'}
SEC=${SEC:-'7'}

start_time=$(date +%s)
end_time=$(($start_time + "$SEC"))

gpio -g mode $PIN pwm
gpio -g pwm $PIN 1023

current=$start_time
while [ $current -lt $end_time ]; do
  echo $time -lt $end_time
  for value in $(seq 1023 -10 603); do
    gpio -g pwm $PIN $value
  done
  for value in $(seq 603 10 1013); do
    gpio -g pwm $PIN $value
  done

  current=$(date +%s)
done
