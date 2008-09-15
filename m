From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: block tree build failure
Date: Mon, 15 Sep 2008 15:18:44 +1000
Message-ID: <20080915151844.16569141.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57803 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750721AbYIOFSw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Sep 2008 01:18:52 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: linux-next@vger.kernel.org, Alex Dubov <oakad@yahoo.com>, Tejun Heo <tj@kernel.org>

Hi Jens,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/memstick/core/mspro_block.c: In function 'mspro_block_disk_release':
drivers/memstick/core/mspro_block.c:200: error: 'MEMSTICK_PART_SHIFT' undeclared (first use in this function)

Caused by the interaction of commit
1f773dd9deada2ad7efdd71577beb59fae80cdef ("block: don't depend on
consecutive minor space") from the block tree with commit
8e82f8c34b1759ae0d80fe96101746ec51fb1ba4 ("memstick: fix MSProHG 8-bit
interface mode support") form Linus' tree.

The latter removed the definition of MEMSTICK_PART_SHIFT while the former
added a reference.  I added the following patch.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 15 Sep 2008 15:13:07 +1000
Subject: [PATCH] block: fix build of mspro_block

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/memstick/core/mspro_block.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/memstick/core/mspro_block.c b/drivers/memstick/core/mspro_block.c
index 055c5f9..82bf649 100644
--- a/drivers/memstick/core/mspro_block.c
+++ b/drivers/memstick/core/mspro_block.c
@@ -197,7 +197,7 @@ static int mspro_block_bd_open(struct inode *inode, struct file *filp)
 static int mspro_block_disk_release(struct gendisk *disk)
 {
 	struct mspro_block_data *msb = disk->private_data;
-	int disk_id = MINOR(disk_devt(disk)) >> MEMSTICK_PART_SHIFT;
+	int disk_id = MINOR(disk_devt(disk)) >> MSPRO_BLOCK_PART_SHIFT;
 
 	mutex_lock(&mspro_block_disk_lock);
 
-- 
1.5.6.5
