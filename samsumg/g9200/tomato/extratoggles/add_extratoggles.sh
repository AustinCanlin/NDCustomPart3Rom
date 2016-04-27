#!/sbin/sh
# Script by ALEXNDR to enable init.d in Samsung Qualcomm devices
# running KitKat stock kernel (thanks to shazzl & Ryuinferno @ XDA)

echo "#!/system/bin/sh" > /system/etc/init.d/96toggles
echo "" >> /system/etc/init.d/96toggles
echo "sh /system/etc/tools/run.sh" >> /system/etc/init.d/96toggles
echo "" >> /system/etc/init.d/96toggles

sync
