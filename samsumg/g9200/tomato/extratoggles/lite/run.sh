#!/sbin/sh
# /sbin/mount -a
busybox mount -o rw,remount /system
#add extra toggles on boot

if [ -e /data/data/com.android.providers.settings/databases/settings.db ]; 
 	then
 	/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "update system set value='Wifi;SilentMode;MobileData;DefaultData;Location;Tomato;Bluetooth;AutoRotate;TorchLight;AirplaneMode;PowerSaving;ScreenCapture;DormantMode;WiFiHotspot;UltraPowerSaving;PersonalMode;AllShareCast;Nfc;Sync;SmartStay;MultiWindow;' where name='notification_panel_active_app_list'";
fi
if [ -e /data/data/com.android.providers.settings/databases/settings.db ]; 
	then
	/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "update system set value='Wifi;SilentMode;MobileData;DefaultData;Location;Tomato;Bluetooth;AutoRotate;TorchLight;AirplaneMode;PowerSaving;ScreenCapture;DormantMode;WiFiHotspot;UltraPowerSaving;PersonalMode;AllShareCast;Nfc;Sync;SmartStay;MultiWindow;' where name='notification_panel_active_app_list_for_reset'";
fi
if [ -e /data/data/com.android.providers.settings/databases/settings.db ]; 
 	then
	/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "update system set value='Wifi;SilentMode;MobileData;DefaultData;Location;Tomato;Bluetooth;AutoRotate;TorchLight;AirplaneMode;PowerSaving;ScreenCapture;DormantMode;WiFiHotspot;UltraPowerSaving;PersonalMode;AllShareCast;Nfc;Sync;SmartStay;MultiWindow;' where name='notification_panel_default_active_app_list'";
fi
if [ -e /data/data/com.android.providers.settings/databases/settings.db ]; 
	then
	/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "update system set value='40' where name='notification_panel_active_number_of_apps'";
fi
if [ -e /data/data/com.android.providers.settings/databases/settings.db ]; 
	then
	/system/xbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db "update system set value='40' where name='notification_panel_active_number_of_apps_for_reset'";
fi;

echo "#!/system/bin/sh" > /system/etc/init.d/97toggles
echo "" >> /system/etc/init.d/97toggles
echo "sh /system/etc/tools/runremove.sh" >> /system/etc/init.d/97toggles
echo "" >> /system/etc/init.d/97toggles

chown 0:0 /system/etc/init.d/*
chmod 755 /system/etc/init.d/*
chcon u:object_r:system_file:s0 /system/etc/init.d/*

#setcorrectpermissionsforsu
chown 0:2000 /system/bin/ddexe_real
chmod 755 /system/bin/ddexe_real
chcon u:object_r:system_file:s0 /system/bin/ddexe_real

busybox mount -o ro,remount /system
