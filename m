From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the nvdimm tree
Date: Fri, 22 Jul 2016 16:13:20 +1000
Message-ID: <20160722161320.144b7514@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42080 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751334AbcGVGN0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 22 Jul 2016 02:13:26 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dan Williams <dan.j.williams@intel.com>, Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Toshi Kani <toshi.kani@hpe.com>

Hi Dan,

After merging the nvdimm tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from drivers/md/dm.h:14:0,
                 from drivers/md/dm-uevent.c:27:
include/linux/device-mapper.h:134:22: error: expected ';', ',' or ')' before '*' token
          void __pmem **kaddr, pfn_t *pfn, long size);
                      ^
include/linux/device-mapper.h:182:2: error: unknown type name 'dm_direct_access_fn'
  dm_direct_access_fn direct_access;
  ^

Caused by commit

  7a9eb2066631 ("pmem: kill __pmem address space")

interacting with commit

  545ed20e6df6 ("dm: add infrastructure for DAX support")

from the device-mapper tree.

I applied the following merge fix patch for today.  Someone needs to
tell Linus about this when he merges the trees.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 22 Jul 2016 16:01:02 +1000
Subject: [PATCH] dm: merge fix for "pmem: kill __pmem address space"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/md/dm-linear.c        | 2 +-
 drivers/md/dm-snap.c          | 2 +-
 drivers/md/dm-stripe.c        | 2 +-
 drivers/md/dm-target.c        | 2 +-
 drivers/md/dm.c               | 2 +-
 include/linux/device-mapper.h | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/md/dm-linear.c b/drivers/md/dm-linear.c
index 6d35dd4e9efb..4788b0b989a9 100644
--- a/drivers/md/dm-linear.c
+++ b/drivers/md/dm-linear.c
@@ -142,7 +142,7 @@ static int linear_iterate_devices(struct dm_target *ti,
 }
 
 static long linear_direct_access(struct dm_target *ti, sector_t sector,
-				 void __pmem **kaddr, pfn_t *pfn, long size)
+				 void **kaddr, pfn_t *pfn, long size)
 {
 	struct linear_c *lc = ti->private;
 	struct block_device *bdev = lc->dev->bdev;
diff --git a/drivers/md/dm-snap.c b/drivers/md/dm-snap.c
index 731e1f5bd895..ce2a910709f7 100644
--- a/drivers/md/dm-snap.c
+++ b/drivers/md/dm-snap.c
@@ -2303,7 +2303,7 @@ static int origin_map(struct dm_target *ti, struct bio *bio)
 }
 
 static long origin_direct_access(struct dm_target *ti, sector_t sector,
-		void __pmem **kaddr, pfn_t *pfn, long size)
+		void **kaddr, pfn_t *pfn, long size)
 {
 	DMWARN("device does not support dax.");
 	return -EIO;
diff --git a/drivers/md/dm-stripe.c b/drivers/md/dm-stripe.c
index 01bb9cf2a8c2..83f1d4667195 100644
--- a/drivers/md/dm-stripe.c
+++ b/drivers/md/dm-stripe.c
@@ -309,7 +309,7 @@ static int stripe_map(struct dm_target *ti, struct bio *bio)
 }
 
 static long stripe_direct_access(struct dm_target *ti, sector_t sector,
-				 void __pmem **kaddr, pfn_t *pfn, long size)
+				 void **kaddr, pfn_t *pfn, long size)
 {
 	struct stripe_c *sc = ti->private;
 	uint32_t stripe;
diff --git a/drivers/md/dm-target.c b/drivers/md/dm-target.c
index 6eecd6b36f76..710ae28fd618 100644
--- a/drivers/md/dm-target.c
+++ b/drivers/md/dm-target.c
@@ -149,7 +149,7 @@ static void io_err_release_clone_rq(struct request *clone)
 }
 
 static long io_err_direct_access(struct dm_target *ti, sector_t sector,
-				 void __pmem **kaddr, pfn_t *pfn, long size)
+				 void **kaddr, pfn_t *pfn, long size)
 {
 	return -EIO;
 }
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index ceb69fc0b10b..25d1d97154a8 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -906,7 +906,7 @@ int dm_set_target_max_io_len(struct dm_target *ti, sector_t len)
 EXPORT_SYMBOL_GPL(dm_set_target_max_io_len);
 
 static long dm_blk_direct_access(struct block_device *bdev, sector_t sector,
-				 void __pmem **kaddr, pfn_t *pfn, long size)
+				 void **kaddr, pfn_t *pfn, long size)
 {
 	struct mapped_device *md = bdev->bd_disk->private_data;
 	struct dm_table *map;
diff --git a/include/linux/device-mapper.h b/include/linux/device-mapper.h
index b0db857f334b..91acfce74a22 100644
--- a/include/linux/device-mapper.h
+++ b/include/linux/device-mapper.h
@@ -131,7 +131,7 @@ typedef int (*dm_busy_fn) (struct dm_target *ti);
  * >= 0 : the number of bytes accessible at the address
  */
 typedef long (*dm_direct_access_fn) (struct dm_target *ti, sector_t sector,
-				     void __pmem **kaddr, pfn_t *pfn, long size);
+				     void **kaddr, pfn_t *pfn, long size);
 
 void dm_error(const char *message);
 
-- 
2.8.1

-- 
Cheers,
Stephen Rothwell
