#!/usr/bin/env bash

cd $(dirname "$0")

./off-all.sh

for other_pin in 12 8 13 25 18 8 19 25; do
  if [[ $other_pin -eq 8 || $other_pin -eq 25 ]]; then
    PIN="$other_pin" ./on-digital.sh
  else
    PIN="$other_pin" ./on-rapid.sh
  fi
  sleep 0.4
  ./off-all.sh
done
