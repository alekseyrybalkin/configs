#!/bin/sh

echo 0 > /sys/devices/platform/thinkpad_acpi/leds/platform\:\:mute/brightness
echo 0 > /sys/devices/platform/thinkpad_acpi/leds/platform\:\:micmute/brightness
