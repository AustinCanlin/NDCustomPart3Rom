#!/sbin/sh
# /sbin/mount -a
busybox mount -o rw,remount /system

rm -rf /system/etc/init.d/96toggles
rm -rf /system/etc/init.d/97toggles

rm -rf /system/etc/tools

busybox mount -o ro,remount /system
