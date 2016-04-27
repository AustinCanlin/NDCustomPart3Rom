#!/tmp/bash
# Remove content of /data partition excluding data/media files

#Navigate to /data folder
cd /data

#Regular expression, FILES==Everything in the current folder
FILES=(*)

#For loop, for files in FILES, do...
for i in *; do

#If file isn't in the media folder
if [ "$i" != "media" ]

#Then delete it
then rm -R "$i"

#Finish when there are no more files that aren't in the media folder
fi
done

rm -fR /data/media/0/.*
rm -fR /data/media/0/Android
rm -fR /data/media/0/data
rm -fR /data/media/0/com.facebook.orca
rm -fR /data/media/0/com.facebook.katana
rm -fR /data/media/0/ViPER4Android
rm -fR /data/media/0/hackerkernel
rm -fR /data/media/0/Synapse
rm -fR /data/media/0/3Minit*
rm -fR /data/media/obb/*

echo -n "2" > /data/.layout_version

sync
