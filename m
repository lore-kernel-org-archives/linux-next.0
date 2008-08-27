From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree
Date: Wed, 27 Aug 2008 15:48:33 +1000
Message-ID: <20080827154833.beba8fef.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56791 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751914AbYH0Fsh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 27 Aug 2008 01:48:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: linux-next@vger.kernel.org, Tejun Heo <tj@kernel.org>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>

Hi Jens,

Today's linux-next merge of the block tree got a conflict in
drivers/ide/ide-disk.c between commits
be86ba965ac551f6a0e22ba0867b706a52c0c4e7 ("ide-disk: move /proc handling
to ide-disk_proc.c"), 71f28011298d2aee36ab3340572bb6b1fa9868a0
("ide-disk: move all ioctl handling to ide-disk_ioctl.c") and
2c01090494d8c4d3bc02c4a578005d44df55000c ("ide: add device flags") from
the ide tree and several commits from the block tree.

I fixed it up as best I could (see below) and will carry the fix.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/ide/ide-disk.c
index 8e9191f,e6776c4..0000000
--- a/drivers/ide/ide-disk.c
+++ b/drivers/ide/ide-disk.c
@@@ -39,8 -41,20 +39,14 @@@
  #include <asm/io.h>
  #include <asm/div64.h>
  
 +#include "ide-disk.h"
 +
+ #if !defined(CONFIG_DEBUG_BLOCK_EXT_DEVT)
+ #define IDE_DISK_MINORS		(1 << PARTN_BITS)
+ #else
+ #define IDE_DISK_MINORS		0
+ #endif
+ 
 -struct ide_disk_obj {
 -	ide_drive_t	*drive;
 -	ide_driver_t	*driver;
 -	struct gendisk	*disk;
 -	struct kref	kref;
 -	unsigned int	openers;	/* protected by BKL for now */
 -};
 -
  static DEFINE_MUTEX(idedisk_ref_mutex);
  
  #define to_ide_disk(obj) container_of(obj, struct ide_disk_obj, kref)
@@@ -950,19 -1190,19 +955,20 @@@ static int ide_disk_probe(ide_drive_t *
  	drive->driver_data = idkp;
  
  	idedisk_setup(drive);
 -	if ((!drive->head || drive->head > 16) && !drive->select.b.lba) {
 +	if ((drive->dev_flags & IDE_DFLAG_LBA) == 0 &&
 +	    (drive->head == 0 || drive->head > 16)) {
  		printk(KERN_ERR "%s: INVALID GEOMETRY: %d PHYSICAL HEADS?\n",
  			drive->name, drive->head);
 -		drive->attach = 0;
 +		drive->dev_flags &= ~IDE_DFLAG_ATTACH;
  	} else
 -		drive->attach = 1;
 +		drive->dev_flags |= IDE_DFLAG_ATTACH;
  
- 	g->minors = 1 << PARTN_BITS;
+ 	g->minors = IDE_DISK_MINORS;
  	g->driverfs_dev = &drive->gendev;
+ 	g->flags |= GENHD_FL_EXT_DEVT;
 -	if (drive->removable)
 +	if (drive->dev_flags & IDE_DFLAG_REMOVABLE)
- 		g->flags = GENHD_FL_REMOVABLE;
+ 		g->flags |= GENHD_FL_REMOVABLE;
 -	set_capacity(g, idedisk_capacity(drive));
 +	set_capacity(g, ide_disk_capacity(drive));
  	g->fops = &idedisk_ops;
  	add_disk(g);
  	return 0;
