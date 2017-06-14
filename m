From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the md tree
Date: Wed, 14 Jun 2017 11:58:21 +1000
Message-ID: <20170614115821.636bee1d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40721 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753448AbdFNB6Y (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Jun 2017 21:58:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Shaohua Li <shli@kernel.org>, Jens Axboe <axboe@kernel.dk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>

Hi Shaohua,

After merging the md tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

drivers/md/raid1.c: In function 'raid1_write_request':
drivers/md/raid1.c:1359:7: error: 'struct bio' has no member named 'bi_error'
    bio->bi_error = -ETIMEDOUT;
       ^
drivers/md/raid5.c: In function 'raid5_make_request':
drivers/md/raid5.c:5712:8: error: 'struct bio' has no member named 'bi_error'
      bi->bi_error = -ETIMEDOUT;
        ^

Caused by commit

  261eb8c4c5a8 ("md: make suspend range wait timed out")

interacting with commit

  4e4cbee93d56 ("block: switch bios to blk_status_t")

from the block tree.

I applied the following merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 14 Jun 2017 11:54:37 +1000
Subject: [PATCH] md: fixup for "block: switch bios to blk_status_t"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/md/raid1.c | 2 +-
 drivers/md/raid5.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
index e320138916cc..db2ad0eeef22 100644
--- a/drivers/md/raid1.c
+++ b/drivers/md/raid1.c
@@ -1356,7 +1356,7 @@ static void raid1_write_request(struct mddev *mddev, struct bio *bio,
 		if (remaining == 0) {
 			pr_err("md/raid1:%s: suspend range is locked\n",
 				mdname(mddev));
-			bio->bi_error = -ETIMEDOUT;
+			bio->bi_status = BLK_STS_TIMEOUT;
 			bio_endio(bio);
 			return;
 		}
diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
index 2a6634b7357b..3b3005c87b4b 100644
--- a/drivers/md/raid5.c
+++ b/drivers/md/raid5.c
@@ -5709,7 +5709,7 @@ static bool raid5_make_request(struct mddev *mddev, struct bio * bi)
 				if (remaining == 0) {
 					pr_err("md/raid5:%s: suspend range is locked\n",
 						mdname(mddev));
-					bi->bi_error = -ETIMEDOUT;
+					bi->bi_status = BLK_STS_TIMEOUT;
 					break;
 				}
 				goto retry;


-- 
Cheers,
Stephen Rothwell
