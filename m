From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the bkl-trivial tree with the mmc tree
Date: Mon, 20 Sep 2010 14:58:17 +1000
Message-ID: <20100920145817.71fa0c35.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>, Chris Ball <cjb@laptop.org>
List-Id: linux-next.vger.kernel.org

Hi Arnd,

Today's linux-next merge of the bkl-trivial tree got a conflict in
drivers/mmc/card/block.c between commit
28280d210bacf6788a5e4b12c5a9430bd50860b4 ("mmc: make number of mmcblk
minors configurable") from the mmc tree and commit
5778067afcfd8b718ffc3744c25fdd194fc886a1 ("block: autoconvert trivial BKL
users to private mutex") from the bkl-trivial tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/mmc/card/block.c
index 5568044,00073b7..0000000
--- a/drivers/mmc/card/block.c
+++ b/drivers/mmc/card/block.c
@@@ -44,26 -43,15 +43,27 @@@
  #include "queue.h"
  
  MODULE_ALIAS("mmc:block");
 +#ifdef MODULE_PARAM_PREFIX
 +#undef MODULE_PARAM_PREFIX
 +#endif
 +#define MODULE_PARAM_PREFIX "mmcblk."
 +
 +
 +/*
 + * The defaults come from config options but can be overriden by module
 + * or bootarg options.
 + */
 +static int perdev_minors = CONFIG_MMC_BLOCK_MINORS;
  
  /*
 - * max 8 partitions per card
 + * We've only got one major, so number of mmcblk devices is
 + * limited to 256 / number of minors per device.
   */
 -#define MMC_SHIFT	3
 -#define MMC_NUM_MINORS	(256 >> MMC_SHIFT)
 +static int max_devices;
  
+ static DEFINE_MUTEX(block_mutex);
 -static DECLARE_BITMAP(dev_use, MMC_NUM_MINORS);
 +/* 256 minors, so at most 256 separate devices */
 +static DECLARE_BITMAP(dev_use, 256);
  
  /*
   * There is one mmc_blk_data per slot.
