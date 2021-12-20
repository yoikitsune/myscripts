#!/bin/bash
(
  set -e

  [ "`id -u`" = "0" ] || exit 1

  cpufreq0_dir="/sys/devices/system/cpu/cpu0/cpufreq"
  [ -d "$cpufreq0_dir" ] || exit 1
  [ -x /usr/bin/sensors ] || exit 1

  adapters="acpitz-acpi-0 coretemp-isa-0000"
  for a in $adapters; do
    echo $a
  done
  echo "Installation réussie."
)

[ $? = 0 ] || echo "Installation échouée"
