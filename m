From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mmc tree with the block tree
Date: Tue, 13 Jun 2017 14:19:12 +1000
Message-ID: <20170613141912.02395531@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58557 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751981AbdFMETO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Jun 2017 00:19:14 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Jens Axboe <axboe@kernel.dk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Linus Walleij <linus.walleij@linaro.org>

Hi Ulf,

Today's linux-next merge of the mmc tree got a conflict in:

  drivers/mmc/core/block.c

between commit:

  2a842acab109 ("block: introduce new block status code type")

from the block tree and commit:

  b016f2c50d78 ("mmc: core: Allocate per-request data using the block layer core")

from the mmc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/mmc/core/block.c
index 6ff94a948a4b,3c7efbdc8591..000000000000
--- a/drivers/mmc/core/block.c
+++ b/drivers/mmc/core/block.c
@@@ -1646,8 -1686,8 +1691,8 @@@ static void mmc_blk_rw_cmd_abort(struc
  {
  	if (mmc_card_removed(card))
  		req->rq_flags |= RQF_QUIET;
 -	while (blk_end_request(req, -EIO, blk_rq_cur_bytes(req)));
 +	while (blk_end_request(req, BLK_STS_IOERR, blk_rq_cur_bytes(req)));
- 	mmc_queue_req_free(mq, mqrq);
+ 	mq->qcnt--;
  }
  
  /**
@@@ -1666,8 -1706,8 +1711,8 @@@ static void mmc_blk_rw_try_restart(stru
  	 */
  	if (mmc_card_removed(mq->card)) {
  		req->rq_flags |= RQF_QUIET;
 -		blk_end_request_all(req, -EIO);
 +		blk_end_request_all(req, BLK_STS_IOERR);
- 		mmc_queue_req_free(mq, mqrq);
+ 		mq->qcnt--; /* FIXME: just set to 0? */
  		return;
  	}
  	/* Else proceed and try to restart the current async request */
@@@ -1816,10 -1852,10 +1857,10 @@@ static void mmc_blk_issue_rw_rq(struct 
  			 * time, so we only reach here after trying to
  			 * read a single sector.
  			 */
 -			req_pending = blk_end_request(old_req, -EIO,
 +			req_pending = blk_end_request(old_req, BLK_STS_IOERR,
  						      brq->data.blksz);
  			if (!req_pending) {
- 				mmc_queue_req_free(mq, mq_rq);
+ 				mq->qcnt--;
  				mmc_blk_rw_try_restart(mq, new_req, mqrq_cur);
  				return;
  			}
