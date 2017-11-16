From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the nvdimm
 tree
Date: Thu, 16 Nov 2017 14:16:27 +1100
Message-ID: <20171116141627.65df4240@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Dan Williams <dan.j.williams@intel.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Minchan Kim <minchan@kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  drivers/block/brd.c

between commit:

  7a862fbbdec6 ("brd: remove dax support")

from the nvdimm tree and commit:

  f8ace3501d00 ("bdi: introduce BDI_CAP_SYNCHRONOUS_IO")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/block/brd.c
index 3d8e29ad0159,16965964873e..000000000000
--- a/drivers/block/brd.c
+++ b/drivers/block/brd.c
@@@ -20,6 -20,12 +20,7 @@@
  #include <linux/radix-tree.h>
  #include <linux/fs.h>
  #include <linux/slab.h>
+ #include <linux/backing-dev.h>
 -#ifdef CONFIG_BLK_DEV_RAM_DAX
 -#include <linux/pfn_t.h>
 -#include <linux/dax.h>
 -#include <linux/uio.h>
 -#endif
  
  #include <linux/uaccess.h>
  
@@@ -400,9 -450,23 +401,10 @@@ static struct brd_device *brd_alloc(in
  	disk->flags		= GENHD_FL_EXT_DEVT;
  	sprintf(disk->disk_name, "ram%d", i);
  	set_capacity(disk, rd_size * 2);
+ 	disk->queue->backing_dev_info->capabilities |= BDI_CAP_SYNCHRONOUS_IO;
  
 -#ifdef CONFIG_BLK_DEV_RAM_DAX
 -	queue_flag_set_unlocked(QUEUE_FLAG_DAX, brd->brd_queue);
 -	brd->dax_dev = alloc_dax(brd, disk->disk_name, &brd_dax_ops);
 -	if (!brd->dax_dev)
 -		goto out_free_inode;
 -#endif
 -
 -
  	return brd;
  
 -#ifdef CONFIG_BLK_DEV_RAM_DAX
 -out_free_inode:
 -	kill_dax(brd->dax_dev);
 -	put_dax(brd->dax_dev);
 -#endif
  out_free_queue:
  	blk_cleanup_queue(brd->brd_queue);
  out_free_dev:
