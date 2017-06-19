From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the device-mapper tree
Date: Mon, 19 Jun 2017 12:27:24 +1000
Message-ID: <20170619122724.1e97be46@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40077 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753241AbdFSC12 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 18 Jun 2017 22:27:28 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>, Jens Axboe <axboe@kernel.dk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, NeilBrown <neilb@suse.com>

Hi all,

After merging the device-mapper tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/md/dm-zoned-target.c: In function 'dmz_ctr':
drivers/md/dm-zoned-target.c:779:17: error: implicit declaration of function 'bioset_create_nobvec' [-Werror=implicit-function-declaration]
  dmz->bio_set = bioset_create_nobvec(DMZ_MIN_BIOS, 0);
                 ^
drivers/md/dm-zoned-target.c:779:15: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
  dmz->bio_set = bioset_create_nobvec(DMZ_MIN_BIOS, 0);
               ^

Caused by commit

  1e6562930ed7 ("dm zoned: drive-managed zoned block device target")

interacting with commit

  011067b05668 ("blk: replace bioset_create_nobvec() with a flags arg to bioset_create()")

from the block tree.

I have applied this merge fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 19 Jun 2017 12:21:38 +1000
Subject: [PATCH] dm zoned: merge fix for "blk: replace bioset_create_nobvec()
 with a flags arg to bioset_create()"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/md/dm-zoned-target.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index d25696caa7f3..2b538fa817f4 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -776,7 +776,7 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	ti->len = (sector_t)dmz_nr_chunks(dmz->metadata) << dev->zone_nr_sectors_shift;
 
 	/* Zone BIO */
-	dmz->bio_set = bioset_create_nobvec(DMZ_MIN_BIOS, 0);
+	dmz->bio_set = bioset_create(DMZ_MIN_BIOS, 0, 0);
 	if (!dmz->bio_set) {
 		ti->error = "Create BIO set failed";
 		ret = -ENOMEM;
-- 
2.11.0

-- 
Cheers,
Stephen Rothwell
