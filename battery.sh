#!/usr/bin/zsh

to_try=("AC1" "BAT1")

for bat in $to_try; do
    if [[ -a "/sys/class/power_supply/$bat/capacity" ]]; then
        echo " ♥ $(cat /sys/class/power_supply/$bat/capacity)%  "
        break
    fi
done
