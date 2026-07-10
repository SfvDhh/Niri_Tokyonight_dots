#!/usr/bin/env bash

set -euo pipefail

bat=$(cat /sys/class/power_supply/BAT0/capacity)
time=$(date +"%H:%M")
vol=$(wpctl get-volume @DEFAULT_SINK@ | awk '{print $2 * 100}')
lang=$(niri msg keyboard-layouts | grep '\*' | awk '{print $3}')
net=$(nmcli -t -f NAME connection show --active | head -n 1)

if [ -z "$net" ]; then
    net="No"
fi

# printf -v body "| %-5.5s | %-3.3s | %-10.10s |" "${vol}%" "${lang}" "${net}"
body="Bat: ${bat}% | Vol: ${vol}%
  Lang: ${lang} | Net: ${net:0:10}..."

notify-send "Система  [ $time ]" "$body" -h string:x-dunst-stack-tag:sysinfo
