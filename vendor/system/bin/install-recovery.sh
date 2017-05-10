#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 8159232 e96cf581a191684556ea6418a1e1694b89843a4a 5625856 09d525e357a9addeaacbb362dab82442461deb74
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:8159232:e96cf581a191684556ea6418a1e1694b89843a4a; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:5625856:09d525e357a9addeaacbb362dab82442461deb74 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery e96cf581a191684556ea6418a1e1694b89843a4a 8159232 09d525e357a9addeaacbb362dab82442461deb74:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
