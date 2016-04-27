#!/sbin/sh
# Script by ALEXNDR to enable init.d in Samsung Qualcomm devices

echo "Mounting system as rewritable..."
mount /system
mount -o rw,remount /system

if [ -z "`cat /system/etc/init.sec.boot.sh | grep "run-parts"`" ] ; then
    echo "" >> /system/etc/init.sec.boot.sh
    echo "mount -t rootfs -o remount,rw rootfs" >> /system/etc/init.sec.boot.sh
    echo "" >> /system/etc/init.sec.boot.sh
    echo "if [ -d /system/etc/init.d ]; then" >> /system/etc/init.sec.boot.sh
    echo "  run-parts /system/etc/init.d" >> /system/etc/init.sec.boot.sh
    echo "fi" >> /system/etc/init.sec.boot.sh
    echo "" >> /system/etc/init.sec.boot.sh
    echo "mount -t rootfs -o remount,ro rootfs" >> /system/etc/init.sec.boot.sh
    echo "" >> /system/etc/init.sec.boot.sh
fi

if [ -d /system/etc/init.d ]; then
	echo "init.d folder found..."
else 
	echo "init.d folder not found, creating the folder..."
	mkdir /system/etc/init.d
fi

echo "#!/system/bin/sh" > /system/etc/init.d/08setperm
echo "# Set correct permissions to init.d scripts" >> /system/etc/init.d/08setperm
echo "" >> /system/etc/init.d/08setperm
echo "mount -o remount,rw /system" >> /system/etc/init.d/08setperm
echo "chmod 755 /system/etc/init.d/*" >> /system/etc/init.d/08setperm
echo "mount -o remount,ro /system" >> /system/etc/init.d/08setperm
echo "" >> /system/etc/init.d/08setperm

echo "#!/system/bin/sh" > /system/etc/init.d/99SuperSUDaemon
echo "# Additional way of loading SuperSU daemon" >> /system/etc/init.d/99SuperSUDaemon
echo "" >> /system/etc/init.d/99SuperSUDaemon
echo "/system/xbin/daemonsu --auto-daemon &" >> /system/etc/init.d/99SuperSUDaemon
echo "" >> /system/etc/init.d/99SuperSUDaemon

chown 0:0 /system/etc/init.d
chmod 755 /system/etc/init.d
chcon u:object_r:system_file:s0 /system/etc/init.d

chown 0:0 /system/etc/init.d/*
chmod 755 /system/etc/init.d/*
chcon u:object_r:system_file:s0 /system/etc/init.d/*

chown 0:0 /system/etc/init.sec.boot.sh
chmod 550 /system/etc/init.sec.boot.sh
chcon u:object_r:system_file:s0 /system/etc/init.sec.boot.sh

umount /system

sync
