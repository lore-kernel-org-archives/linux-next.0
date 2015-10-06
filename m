From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the block tree
Date: Tue, 6 Oct 2015 12:43:22 +1100
Message-ID: <20151006124322.2a50698e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54363 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751441AbbJFBnY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 5 Oct 2015 21:43:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Ming Lei <ming.lei@canonical.com>

Hi Jens,

After merging the block tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/block/loop.c: In function 'lo_rw_aio_complete':
drivers/block/loop.c:474:2: error: too few arguments to function 'blk_mq_complete_request'
  blk_mq_complete_request(rq);
  ^
In file included from drivers/block/loop.h:14:0,
                 from drivers/block/loop.c:79:
include/linux/blk-mq.h:217:6: note: declared here
 void blk_mq_complete_request(struct request *rq, int error);
      ^

Caused by commit

  f4829a9b7a61 ("blk-mq: fix racy updates of rq->errors")

from Linus' tree interacting with commit

  bc07c10a3603 ("block: loop: support DIO & AIO")

from the block tree.

I added the this merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 6 Oct 2015 12:39:41 +1100
Subject: [PATCH] blk-mq: merge fix for "fix racy updates of rq->errors"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/block/loop.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index c692a3d812e4..9be61ad3163d 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -470,8 +470,7 @@ static void lo_rw_aio_complete(struct kiocb *iocb, long ret, long ret2)
 	else if (ret < 0)
 		ret = -EIO;
 
-	rq->errors = ret;
-	blk_mq_complete_request(rq);
+	blk_mq_complete_request(rq, ret);
 }
 
 static int lo_rw_aio(struct loop_device *lo, struct loop_cmd *cmd,
-- 
2.5.1

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
