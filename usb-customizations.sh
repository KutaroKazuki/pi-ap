#!/bin/bash
 
# pi-ap:	These scripts configure a Raspberry Pi into a wireless Access Point
# Source:	https://github.com/f1linux/pi-ap
# Version:	01.05.01
# License:	GPL 3.0

# Script Author:        Terrence Houlahan Linux & Network Engineer
# Contact:              houlahan@F1Linux.com
# Linkedin:				www.linkedin.com/in/terrencehoulahan


# Do not edit below sources
source "${BASH_SOURCE%/*}/variables.sh"
source "${BASH_SOURCE%/*}/functions.sh"

# USB Autosuspend is a power management feature to preserve battery life.
# This host has no battery and further Autosuspend only works where the devices driver supports the feature.
# So only a downside to retaining default preference of "enable":

cat <<EOF> $PATHSCRIPTSROOT/usb-autosuspend-disable.sh

#set -x

# Version 18.04.01

# Script Author:        Terrence Houlahan
# Contact:              houlahan@F1Linux.com

# USB autosuspend:
# This feature is targeted towards extending battery-life by powering-down interfaces not in active use.
# However unless the devices driver supports this functionality it can cause problems.
# Default value for autosuspend is "2" (enabled).
#
# Since this device is NOT battery powered there is only a down-side to keeping autosuspend enabled. We will disable it:

# WARNING #1: Do NOT delete the trailing space after the "1" before the closing encasing forward slash in sed expression!!!!!
# WARNING #2: Only a single DOUBLE-QUOTE mark is used in below SED expression- THIS IS NOT AN ERROR OR OMMISSION
sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="/&usbcore.autosuspend=-1 /' /etc/default/grub

update-grub
EOF

chmod 700 $PATHSCRIPTSROOT/usb-autosuspend-disable.sh

echo
echo "USB Autosuspend Disabled:"
echo
