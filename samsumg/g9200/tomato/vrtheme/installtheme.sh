#!/sbin/sh
# Copyright VillainROM 2011. All Rights Reserved
# Updated for Android 5 Lollipop by Spannaa @ XDA 2014

# Allow ui_print from sh
ui_print() {
  if [ $RECOVERY_BINARY != "" ]; then
    echo "ui_print ${1} " 1>&$RECOVERY_BINARY;
    echo "ui_print " 1>&$RECOVERY_BINARY;
  else
    echo "${1}";
  fi;
}
CWM_RUN=$(ps | grep -v "grep" | grep -o -E "update_binary(.*)" | cut -d " " -f 3);
TWRP_RUN=$(ps | grep -v "grep" | grep -o -E "updater(.*)" | cut -d " " -f 3);
if [ "$CWM_RUN" ]; then
	RECOVERY_BINARY=$CWM_RUN
else
if [ "$TWRP_RUN" ]; then
	RECOVERY_BINARY=$TWRP_RUN
fi
fi

# delete old backups
[ -d /data/vrtheme-backup ] && rm -r /data/vrtheme-backup

# start with /system/app
[ -d /data/tmp/vrtheme/system/app ] && systemapps=1 || systemapps=0
if [ "$systemapps" -eq "1" ]; then
cd /data/tmp/vrtheme/system/app/
ui_print "   Processing /system/app"
for f in $(ls)
do
	ui_print "     $f.apk"
	busybox mkdir -p /data/vrtheme-backup/system/app/$f
	busybox mkdir -p /data/tmp/vrtheme/apply/system/app/$f
# get apk
  cp /system/app/$f/$f.apk /data/tmp/vrtheme/apply/system/app/$f/
# backup apk
	cp /system/app/$f/$f.apk /data/vrtheme-backup/system/app/$f/
# patch apk
	cd /data/tmp/vrtheme/system/app/$f/$f.apk/
  /data/tmp/vrtheme/zip -r /data/tmp/vrtheme/apply/system/app/$f/$f.apk *
# zipalign apk
	cd /data/tmp/vrtheme/apply/system/app/$f/
	busybox mkdir aligned
	/data/tmp/vrtheme/zipalign -f 4 $f.apk aligned/$f.apk
# move apk back
	cp aligned/$f.apk /system/app/$f/
	chmod 644 /system/app/$f/$f.apk
# delete dalvik-cache entry if it exists
	dc_file=/data/dalvik-cache/arm/system@app@$f@$f.apk@classes.dex
	if [ -f $dc_file ]; then
		rm -f $dc_file
	fi
done
fi

# repeat for /system/priv-app
[ -d /data/tmp/vrtheme/system/priv-app ] && systemprivapps=1 || systemprivapps=0
if [ "$systemprivapps" -eq "1" ]; then
cd /data/tmp/vrtheme/system/priv-app/
ui_print "   Processing /system/priv-app"
for f in $(ls)
do
	ui_print "     $f.apk"
	busybox mkdir -p /data/vrtheme-backup/system/priv-app/$f
	busybox mkdir -p /data/tmp/vrtheme/apply/system/priv-app/$f
# get apk
  cp /system/priv-app/$f/$f.apk /data/tmp/vrtheme/apply/system/priv-app/$f/
# backup apk
	cp /system/priv-app/$f/$f.apk /data/vrtheme-backup/system/priv-app/$f/
# patch apk
	cd /data/tmp/vrtheme/system/priv-app/$f/$f.apk/
  /data/tmp/vrtheme/zip -r /data/tmp/vrtheme/apply/system/priv-app/$f/$f.apk *
# zipalign apk
	cd /data/tmp/vrtheme/apply/system/priv-app/$f/
	busybox mkdir aligned
	/data/tmp/vrtheme/zipalign -f 4 $f.apk aligned/$f.apk
# move apk back
	cp aligned/$f.apk /system/priv-app/$f/
	chmod 644 /system/priv-app/$f/$f.apk
# delete dalvik-cache entry if it exists
	dc_file=/data/dalvik-cache/arm/system@priv-app@$f@$f.apk@classes.dex
	if [ -f $dc_file ]; then
		rm -f $dc_file
	fi
done
fi

# repeat for /system/framework
[ -d /data/tmp/vrtheme/system/framework ] && framework=1 || framework=0
if [ "$framework" -eq "1" ]; then
  busybox mkdir -p /data/vrtheme-backup/system/framework
  busybox mkdir -p /data/tmp/vrtheme/apply/system/framework
cd /data/tmp/vrtheme/system/framework
ui_print "   Processing /system/framework"
for f in $(ls)
do
	ui_print "     $f"
# get apk
  cp /system/framework/$f /data/tmp/vrtheme/apply/system/framework/
# backup apk
  cp /system/framework/$f /data/vrtheme-backup/system/framework/
# patch apk
  cd /data/tmp/vrtheme/system/framework/$f/
  /data/tmp/vrtheme/zip -r /data/tmp/vrtheme/apply/system/framework/$f *
# zipalign apk
	cd /data/tmp/vrtheme/apply/system/framework/
	busybox mkdir aligned
	/data/tmp/vrtheme/zipalign -f 4 $f aligned/$f
# move apk back
	cp aligned/$f /system/framework/
	chmod 644 /system/framework/$f
done
fi

# create restore zip from backup apks
ui_print "   Creating vrtheme-restore.zip"
	cd /data/vrtheme-backup/
  /data/tmp/vrtheme/zip -r /data/tmp/vrtheme/vrtheme_restore.zip *
	cp /data/tmp/vrtheme/vrtheme_restore.zip /data/vrtheme-backup/
	cp /data/tmp/vrtheme/vrtheme_restore.zip /sdcard/

# cleanup
ui_print "   Cleaning up work files"
  rm -rf /data/tmp/
	rm -rf /data/vrtheme-backup/system/
