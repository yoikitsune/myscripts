#!/bin/bash
set -e

if [ "`id -u`" != "0" ]; then
  echo "Must be root"
  exit 1
fi

cpufreq0_dir="/sys/devices/system/cpu/cpu0/cpufreq"
if [ ! -d "$cpufreq0_dir" ]; then
  echo "Cannot find cpufreq"
  exit 1
fi

if [ ! -x /usr/bin/sensors ]; then
  echo "Cannot find sensors"
  exit 1
fi

sensors
adapters="acpitz-acpi-0 coretemp-isa-0000"
for a in $adapters; do
  echo $a
done

echo "Installation réussie."
