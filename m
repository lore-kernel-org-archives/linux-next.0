From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the block tree
Date: Thu, 1 Dec 2016 13:55:17 +1100
Message-ID: <20161201135517.273c9a4d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56007 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753431AbcLAC4C (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 30 Nov 2016 21:56:02 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>, David Chinner <david@fromorbit.com>, xfs@oss.sgi.com
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

Hi Jens,

After merging the block tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

fs/iomap.c: In function 'iomap_dio_zero':
fs/iomap.c:725:38: error: 'WRITE_ODIRECT' undeclared (first use in this function)
  bio_set_op_attrs(bio, REQ_OP_WRITE, WRITE_ODIRECT);
                                      ^
fs/iomap.c:725:38: note: each undeclared identifier is reported only once for each function it appears in
fs/iomap.c: In function 'iomap_dio_actor':
fs/iomap.c:808:40: error: 'WRITE_ODIRECT' undeclared (first use in this function)
    bio_set_op_attrs(bio, REQ_OP_WRITE, WRITE_ODIRECT);
                                        ^
fs/iomap.c: In function 'iomap_dio_rw':
fs/iomap.c:933:9: error: implicit declaration of function 'blk_poll' [-Werror=implicit-function-declaration]
        !blk_poll(dio->submit.last_queue,
         ^

Caused by commits

  70fd76140a6c ("block,fs: use REQ_* flags directly")
  bbd7bb7017d5 ("block: move poll code to blk-mq")

interacting with commit

  ff6a9292e6f6 ("iomap: implement direct I/O")

from the xfs tree.

I love APIs changing :-(

I have applied the following merge fix patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 1 Dec 2016 13:45:33 +1100
Subject: [PATCH] iomap: fix up for blk_poll and WRITE_ODIRECT change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/iomap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/iomap.c b/fs/iomap.c
index fc2446242935..c9d6c1176345 100644
--- a/fs/iomap.c
+++ b/fs/iomap.c
@@ -722,7 +722,7 @@ iomap_dio_zero(struct iomap_dio *dio, struct iomap *iomap, loff_t pos,
 	get_page(page);
 	if (bio_add_page(bio, page, len, 0) != len)
 		BUG();
-	bio_set_op_attrs(bio, REQ_OP_WRITE, WRITE_ODIRECT);
+	bio_set_op_attrs(bio, REQ_OP_WRITE, REQ_SYNC | REQ_IDLE);
 
 	atomic_inc(&dio->ref);
 	return submit_bio(bio);
@@ -805,7 +805,7 @@ iomap_dio_actor(struct inode *inode, loff_t pos, loff_t length,
 		}
 
 		if (dio->flags & IOMAP_DIO_WRITE) {
-			bio_set_op_attrs(bio, REQ_OP_WRITE, WRITE_ODIRECT);
+			bio_set_op_attrs(bio, REQ_OP_WRITE, REQ_SYNC | REQ_IDLE);
 			task_io_account_write(bio->bi_iter.bi_size);
 		} else {
 			bio_set_op_attrs(bio, REQ_OP_READ, 0);
@@ -930,7 +930,7 @@ iomap_dio_rw(struct kiocb *iocb, struct iov_iter *iter, struct iomap_ops *ops,
 
 			if (!(iocb->ki_flags & IOCB_HIPRI) ||
 			    !dio->submit.last_queue ||
-			    !blk_poll(dio->submit.last_queue,
+			    !blk_mq_poll(dio->submit.last_queue,
 					dio->submit.cookie))
 				io_schedule();
 		}
-- 
2.10.2

-- 
Cheers,
Stephen Rothwell
