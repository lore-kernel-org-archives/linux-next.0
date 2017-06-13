From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the block tree
Date: Tue, 13 Jun 2017 14:10:34 +1000
Message-ID: <20170613141034.72f19b4a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44185 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751853AbdFMEKg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Jun 2017 00:10:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>, David Sterba <dsterba@suse.cz>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Liu Bo <bo.li.liu@oracle.com>

Hi Jens,

After merging the block tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

fs/btrfs/inode.c: In function 'btrfs_endio_direct_read':
fs/btrfs/inode.c:8278:7: error: 'struct bio' has no member named 'bi_error'
    bio->bi_error = 0;
       ^

Caused by commit

  4e4cbee93d56 ("block: switch bios to blk_status_t")

interacting with commit

  674d8fe747c8 ("Btrfs: tolerate errors if we have retried successfully")

from the btrfs-kdave tree.

I appled that following merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 13 Jun 2017 14:01:24 +1000
Subject: [PATCH] btrfs: merge fix for "block: switch bios to blk_status_t"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/btrfs/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index d2ec62ad4998..15af1ef31a45 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -8275,7 +8275,7 @@ static void btrfs_endio_direct_read(struct bio *bio)
 	if (dip->flags & BTRFS_DIO_ORIG_BIO_SUBMITTED) {
 		err = btrfs_subio_endio_read(inode, io_bio, err);
 		if (!err)
-			bio->bi_error = 0;
+			bio->bi_status = 0;
 	}
 
 	unlock_extent(&BTRFS_I(inode)->io_tree, dip->logical_offset,
-- 
2.11.0

-- 
Cheers,
Stephen Rothwell
