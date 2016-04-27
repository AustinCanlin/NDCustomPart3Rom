#!/system/bin/sh
export PATH=/system/bin:$PATH

mount -o rw,remount /system

rm -rf /system/priv-app/SystemUI/

rm -rf /system/app/3MinitBatterySettings/

rm -rf /system/framework/MinitBatteryResources.apk

cp -p -a -R  /system/etc/tomatolei/05_battery/official/* /system

sleep 3

reboot

