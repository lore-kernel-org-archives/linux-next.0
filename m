From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the block tree
Date: Mon, 19 Sep 2016 16:18:34 +1000
Message-ID: <20160919161834.08302d33@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39213 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750933AbcISGSh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 19 Sep 2016 02:18:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

Hi Jens,

After merging the block tree, today's linux-next build (powerpc
allnoconfig) failed like this:

In file included from block/blk-mq-pci.c:13:0:
include/linux/blk-mq.h:57:18: error: field 'kobj' has incomplete type
  struct kobject  kobj;
                  ^
include/linux/blk-mq.h:121:2: error: unknown type name 'softirq_done_fn'
  softirq_done_fn  *complete;
  ^
include/linux/blk-mq.h: In function 'blk_mq_rq_from_pdu':
include/linux/blk-mq.h:253:22: error: invalid application of 'sizeof' to incomplete type 'struct request'
  return pdu - sizeof(struct request);
                      ^
include/linux/blk-mq.h: In function 'blk_mq_rq_to_pdu':
include/linux/blk-mq.h:257:2: error: invalid use of undefined type 'struct request'
  return rq + 1;
  ^

Caused by commit

  973c4e372c8f ("blk-mq: provide a default queue mapping for PCI device")

include/linux/blk-mq.h does not include all the headers files that it
depends on, and building block/blk-mq-pci.c should depend on CONFIG_BLOCK.

I applied this fix patch (the block/blk-mq-pci.c may not be becessary):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 19 Sep 2016 15:50:16 +1000
Subject: [PATCH] blk_mq: linux/blk-mq.h does not include all the headers it
 depends on

and building block/blk-mq-pci.o should depend on CONFIG_BLOCK

Fixes: 973c4e372c8f ("blk-mq: provide a default queue mapping for PCI device")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 block/Kconfig      | 5 +++++
 block/Makefile     | 2 +-
 block/blk-mq-pci.c | 2 ++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/block/Kconfig b/block/Kconfig
index 5136ad4bb6d5..1d4d624492fc 100644
--- a/block/Kconfig
+++ b/block/Kconfig
@@ -125,4 +125,9 @@ config BLOCK_COMPAT
 	depends on BLOCK && COMPAT
 	default y
 
+config BLK_MQ_PCI
+	bool
+	depends on BLOCK && PCI
+	default y
+
 source block/Kconfig.iosched
diff --git a/block/Makefile b/block/Makefile
index 2447a0b1ef9c..37a0d93f97bb 100644
--- a/block/Makefile
+++ b/block/Makefile
@@ -22,4 +22,4 @@ obj-$(CONFIG_IOSCHED_CFQ)	+= cfq-iosched.o
 obj-$(CONFIG_BLOCK_COMPAT)	+= compat_ioctl.o
 obj-$(CONFIG_BLK_CMDLINE_PARSER)	+= cmdline-parser.o
 obj-$(CONFIG_BLK_DEV_INTEGRITY) += bio-integrity.o blk-integrity.o t10-pi.o
-obj-$(CONFIG_PCI)		+= blk-mq-pci.o
+obj-$(CONFIG_BLK_MQ_PCI)	+= blk-mq-pci.o
diff --git a/block/blk-mq-pci.c b/block/blk-mq-pci.c
index 33c7bd743c63..966c2169762e 100644
--- a/block/blk-mq-pci.c
+++ b/block/blk-mq-pci.c
@@ -10,6 +10,8 @@
  * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
  * more details.
  */
+#include <linux/kobject.h>
+#include <linux/blkdev.h>
 #include <linux/blk-mq.h>
 #include <linux/blk-mq-pci.h>
 #include <linux/pci.h>
-- 
2.8.1

-- 
Cheers,
Stephen Rothwell
