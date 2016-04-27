#!/sbin/sh

bp="/system/build.prop"
sed -i "/#_Wifi_fix_for_other_regions_code/d" $bp
sed -i "/ro.securestorage.support/d" $bp
echo "#_Wifi_fix_for_other_regions_code" >> $bp
echo "ro.securestorage.support=false" >> $bp
echo " " >> $bp

sed -i "/#_Fastboot_and_Shutdown_speed/d" $bp
sed -i "/boot.fps/d" $bp
sed -i "/shutdown.fps/d" $bp
echo "#_Fastboot_and_Shutdown_speed" >> $bp
echo "boot.fps=20" >> $bp
echo "shutdown.fps=20" >> $bp
echo " " >> $bp

sed -i "/#_Remove_ring_delay/d" $bp
sed -i "/ro.telephony.call_ring.delay/d" $bp
sed -i "/ring.delay/d" $bp
echo "#_Remove_ring_delay" >> $bp
echo "ro.telephony.call_ring.delay=0" >> $bp
echo "ring.delay=0" >> $bp
echo " " >> $bp

sed -i "/#_Power_saving/d" $bp
sed -i "/pm.sleep_mode/d" $bp
sed -i "/wifi.supplicant_scan_interval/d" $bp
sed -i "/ro.ril.disable.power.collapse/d" $bp
echo "#_Power_saving" >> $bp
echo "pm.sleep_mode=1" >> $bp
echo "wifi.supplicant_scan_interval=180" >> $bp
echo "ro.ril.disable.power.collapse=0" >> $bp
echo " " >> $bp

sed -i "/#_Remove_Knox/d" $bp
sed -i "/ro.config.knox/d" $bp
sed -i "/security.knox_kap_mode/d" $bp
sed -i "/ro.securestorage.knox/d" $bp
echo "#_Remove_Knox" >> $bp
echo "ro.config.knox=0" >> $bp
echo "security.knox_kap_mode=false" >> $bp
echo "ro.securestorage.knox=false" >> $bp
echo " " >> $bp

sed -i "/#_Fix_black_screen_after_call/d" $bp
sed -i "/mot.proximity.delay/d" $bp
sed -i "/ro.lge.proximity.delay/d" $bp
echo "#_Fix_black_screen_after_call" >> $bp
echo "mot.proximity.delay=15" >> $bp
echo "ro.lge.proximity.delay=15" >> $bp
echo " " >> $bp

sed -i "/#_Fix_app_issues/d" $bp
sed -i "/ro.kernel.android.checkjni/d" $bp
sed -i "/ro.kernel.checkjni/d" $bp
echo "#_Fix_app_issues" >> $bp
echo "ro.kernel.android.checkjni=0" >> $bp
echo "ro.kernel.checkjni=0" >> $bp
echo " " >> $bp

sed -i "/#_Disable_Android_Device_Check_in/d" $bp
sed -i "/ro.config.nocheckin/d" $bp
echo "#_Disable_Android_Device_Check_in" >> $bp
echo "ro.config.nocheckin=1" >> $bp
echo " " >> $bp

sed -i "/#_Faster_scrolling/d" $bp
sed -i "/ro.max.fling_velocity/d" $bp
sed -i "/ro.min.fling_velocity/d" $bp
echo "#_Faster_scrolling" >> $bp
echo "ro.max.fling_velocity=12000" >> $bp
echo "ro.min.fling_velocity=8000" >> $bp
echo " " >> $bp



chmod 0644 $bp
