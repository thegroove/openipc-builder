#!/bin/sh
#
# Perform basic settings on a known IP camera
#
#
# Set custom upgrade url
#
fw_setenv upgrade 'https://github.com/OpenIPC/builder/releases/download/latest/t21_lite_wansview-q5-1080p-nor.tgz'
#
#
# Set custom majestic settings
#
cli -s .system.webAdmin disabled
cli -s .system.staticDir /var/www/majestic
cli -s .isp.blkCnt 1
cli -s .nightMode.enabled true
cli -s .nightMode.irCutPin1 80
cli -s .nightMode.irCutPin2 79
cli -s .nightMode.backlightPin 49
cli -s .video0.codec h264
#
#
# Set wlan device and credentials if need
#
fw_setenv wlandev rtl8188fu-generic
#fw_setenv wlanssid Router
#fw_setenv wlanpass 12345678
#
#
# Set osmem and rmem
#
fw_setenv osmem 39M
fw_setenv rmem 25M@0x2700000
#
#
# Set motor settings
#
echo "motor hmaxstep=3800 vmaxstep=1200 hst1=81 hst2=82 hst3=51 hst4=53 vst1=78 vst2=77 vst3=76 vst4=75" >> /etc/modules
#
exit 0
