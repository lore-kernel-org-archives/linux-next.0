From: Tejun Heo <tj@kernel.org>
Subject: [PATCHSET linux-next] update gfp/slab.h includes
Date: Tue, 30 Mar 2010 02:52:28 +0900
Message-ID: <1269885165-18617-1-git-send-email-tj@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Mainline is scheduled to be updated not to include slab.h implicitly
from percpu.h which means that each .c file which uses gfp or slab API
should include respective header file directly.

This patchset contains include updates for trees which are in
linux-next but not in mainline yet.  These patches are on top of
next-20100329 which already include Stephen's fixup patches.  Please
apply both Stephen's patches and these to subsystem trees.

One good news is that all the problems Stephen discovered by build
testing and discovered by running slabh-sweep.py script on linux-next
are confined to codes which are not in mainline yet, so it looks like
the original conversion is fairly comprehensive.

This patchset contains the following patches.

 0001-sound-update-gfp-slab.h-includes.patch
 0002-kdb-update-gfp-slab.h-includes.patch
 0003-fsnotify-update-gfp-slab.h-includes.patch
 0004-ocfs2-update-gfp-slab.h-includes.patch
 0005-staging-update-gfp-slab.h-includes.patch
 0006-vbus-update-gfp-slab.h-includes.patch
 0007-usb-update-gfp-slab.h-includes.patch
 0008-davinci-update-gfp-slab.h-includes.patch
 0009-pcmcia-update-gfp-slab.h-includes.patch
 0010-wireless-update-gfp-slab.h-includes.patch
 0011-mtd-update-gfp-slab.h-includes.patch
 0012-mfd-update-gfp-slab.h-includes.patch
 0013-hid-update-gfp-slab.h-includes.patch
 0014-input-update-gfp-slab.h-includes.patch
 0015-libata-update-gfp-slab.h-includes.patch
 0016-acpi-update-gfp-slab.h-includes.patch
 0017-arm-update-gfp-slab.h-includes.patch

and contains the following changes.

 arch/arm/mach-vexpress/ct-ca9x4.c                |    1 +
 drivers/acpi/apei/apei-base.c                    |    1 +
 drivers/acpi/atomicio.c                          |    1 +
 drivers/ata/ahci_platform.c                      |    1 +
 drivers/ata/libahci.c                            |    1 +
 drivers/char/sysrq.c                             |    2 +-
 drivers/gpio/rdc321x-gpio.c                      |    1 +
 drivers/hid/hid-roccat-kone.c                    |    1 +
 drivers/isdn/hardware/avm/avm_cs.c               |    1 -
 drivers/mfd/davinci_voicecodec.c                 |    1 +
 drivers/mtd/mtdcore.c                            |    1 +
 drivers/mtd/nand/mpc5121_nfc.c                   |    1 +
 drivers/mtd/nand/r852.c                          |    1 +
 drivers/net/wireless/ath/ath9k/htc.h             |    1 +
 drivers/net/wireless/iwlwifi/iwl-agn-ict.c       |    1 +
 drivers/pcmcia/pcmcia_cis.c                      |    1 +
 drivers/pcmcia/rsrc_iodyn.c                      |    1 +
 drivers/rtc/rtc-davinci.c                        |    1 +
 drivers/staging/comedi/drivers/quatech_daqp_cs.c |    1 +
 drivers/staging/otus/usbdrv.h                    |    1 +
 drivers/staging/tm6000/tm6000-alsa.c             |    1 +
 drivers/staging/tm6000/tm6000-cards.c            |    1 +
 drivers/staging/tm6000/tm6000-core.c             |    1 +
 drivers/staging/tm6000/tm6000-dvb.c              |    1 +
 drivers/usb/musb/musb_debugfs.c                  |    1 -
 drivers/vbus/pci-bridge.c                        |    1 +
 fs/notify/fanotify/fanotify_user.c               |    1 +
 fs/notify/mark.c                                 |    1 -
 fs/notify/vfsmount_mark.c                        |    1 -
 fs/ocfs2/reservations.c                          |    1 -
 kernel/debug/kdb/kdb_main.c                      |    1 +
 sound/soc/codecs/cq93vc.c                        |    1 +
 sound/soc/davinci/davinci-vcif.c                 |    1 +
 sound/usb/caiaq/input.c                          |    1 +
 sound/usb/urb.c                                  |    1 +
 35 files changed, 30 insertions(+), 6 deletions(-)

Thanks.

--
tejun
