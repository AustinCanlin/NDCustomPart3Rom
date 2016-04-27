#!/system/bin/sh
export PATH=/system/bin:$PATH

mount -o rw,remount /system

rm -rf /system/priv-app/SystemUI/

cp -p -a -R  /system/etc/tomatolei/05_battery/3mini/* /system

sleep 3

reboot

