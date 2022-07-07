#!/bin/bash
# Script to merely rebuild the image form the mnt directory when adding/changing 
# stuff there
. conf/busybear.config
genext2fs --squash -b $((1024 * ${IMAGE_SIZE})) -d mnt ${IMAGE_FILE}
sync
/sbin/e2fsck -y -f ${IMAGE_FILE}
