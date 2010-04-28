From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with the mtd tree
Date: Wed, 28 Apr 2010 13:24:23 +1000
Message-ID: <20100428132423.0cb8bd44.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <jens.axboe@oracle.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ben Hutchings <bhutchings@solarflare.com>, Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, David Woodhouse <dwmw2@infradead.org>, =?UTF-8?B?IkrDtnJuIEVuZ2VsIg==?= <joern@logfs.org>
List-Id: linux-next.vger.kernel.org

Hi Jens,

Today's linux-next merge of the block tree got a conflict in
drivers/mtd/mtdcore.c between commit
b520e412faaaad35641aeedd6059179f9f1b393c ("mtd: Replace static array of
devices with an idr structure") from the mtd tree and commit
a33eb6b91034c95b9b08576f68be170f995b2c7d ("Move mtd_bdi_*mappable to
mtdcore.c") from the block tree.

Just overlapping additions.  I fixed it up (see below) and can carry the
fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/mtd/mtdcore.c
index 3c48193,b177e75..0000000
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@@ -16,13 -19,39 +19,41 @@@
  #include <linux/init.h>
  #include <linux/mtd/compatmac.h>
  #include <linux/proc_fs.h>
 +#include <linux/idr.h>
 +#include <linux/gfp.h>
+ #include <linux/backing-dev.h>
  
  #include <linux/mtd/mtd.h>
- #include "internal.h"
  
  #include "mtdcore.h"
+ /*
+  * backing device capabilities for non-mappable devices (such as NAND flash)
+  * - permits private mappings, copies are taken of the data
+  */
+ struct backing_dev_info mtd_bdi_unmappable = {
+ 	.capabilities	= BDI_CAP_MAP_COPY,
+ };
+ 
+ /*
+  * backing device capabilities for R/O mappable devices (such as ROM)
+  * - permits private mappings, copies are taken of the data
+  * - permits non-writable shared mappings
+  */
+ struct backing_dev_info mtd_bdi_ro_mappable = {
+ 	.capabilities	= (BDI_CAP_MAP_COPY | BDI_CAP_MAP_DIRECT |
+ 			   BDI_CAP_EXEC_MAP | BDI_CAP_READ_MAP),
+ };
+ 
+ /*
+  * backing device capabilities for writable mappable devices (such as RAM)
+  * - permits private mappings, copies are taken of the data
+  * - permits non-writable shared mappings
+  */
+ struct backing_dev_info mtd_bdi_rw_mappable = {
+ 	.capabilities	= (BDI_CAP_MAP_COPY | BDI_CAP_MAP_DIRECT |
+ 			   BDI_CAP_EXEC_MAP | BDI_CAP_READ_MAP |
+ 			   BDI_CAP_WRITE_MAP),
+ };
  
  static int mtd_cls_suspend(struct device *dev, pm_message_t state);
  static int mtd_cls_resume(struct device *dev);
