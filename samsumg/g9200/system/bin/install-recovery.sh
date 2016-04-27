#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/15570000.ufs/by-name/RECOVERY:28559360:04bdf70f7506eae3c59571e77b0ce65c1ab7e552; then
  applypatch EMMC:/dev/block/platform/15570000.ufs/by-name/BOOT:27758592:733d487f80cd00f2b5ac1608e985962aa53445fb EMMC:/dev/block/platform/15570000.ufs/by-name/RECOVERY 04bdf70f7506eae3c59571e77b0ce65c1ab7e552 28559360 733d487f80cd00f2b5ac1608e985962aa53445fb:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
