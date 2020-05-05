#!/usr/bin/env bash

gpio -g mode 18 pwm

gpio -g pwm 18 0

sleep 1

for value in $(seq 1 1 80); do
  gpio -g pwm 18 $value
done
echo 2
sleep 2
echo 2 go
for value in $(seq 100 20 1000); do
  gpio -g pwm 18 $value
done

gpio -g pwm 18 1023
