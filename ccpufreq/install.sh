#!/bin/bash
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


adapters="coretemp-isa-0000 acpitz-acpi-0"
for a in $adapters; do
  temp=`sensors -uA $a | grep temp1_input`
  if [[ $temp =~ [0-9]{2} ]]; then
    echo "${BASH_REMATCH[0]}"
    echo $a
    echo "Installation réussie."
    exit
  fi
done
echo "Echec de l'installation"
