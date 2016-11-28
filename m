From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mmc tree with the block tree
Date: Mon, 28 Nov 2016 13:12:11 +1100
Message-ID: <20161128131211.55f096b8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-next.vger.kernel.org

Hi Ulf,

Today's linux-next merge of the mmc tree got a conflict in:

  drivers/mmc/card/block.c

between commit:

  e806402130c9 ("block: split out request-only flags into a new namespace")

from the block tree and commit:

  95105fc9ffbb ("mmc: block: delete packed command support")

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

diff --cc drivers/mmc/card/block.c
index ae9cbe6101be,86ff28f84698..000000000000
--- a/drivers/mmc/card/block.c
+++ b/drivers/mmc/card/block.c
@@@ -2114,28 -1728,18 +1728,18 @@@ static int mmc_blk_issue_rw_rq(struct m
  	return 1;
  
   cmd_abort:
- 	if (mmc_packed_cmd(mq_rq->cmd_type)) {
- 		mmc_blk_abort_packed_req(mq_rq);
- 	} else {
- 		if (mmc_card_removed(card))
- 			req->rq_flags |= RQF_QUIET;
- 		while (ret)
- 			ret = blk_end_request(req, -EIO,
- 					blk_rq_cur_bytes(req));
- 	}
+ 	if (mmc_card_removed(card))
 -		req->cmd_flags |= REQ_QUIET;
++		req->rq_flags |= RQF_QUIET;
+ 	while (ret)
+ 		ret = blk_end_request(req, -EIO,
+ 				blk_rq_cur_bytes(req));
  
   start_new_req:
  	if (rqc) {
  		if (mmc_card_removed(card)) {
 -			rqc->cmd_flags |= REQ_QUIET;
 +			rqc->rq_flags |= RQF_QUIET;
  			blk_end_request_all(rqc, -EIO);
  		} else {
- 			/*
- 			 * If current request is packed, it needs to put back.
- 			 */
- 			if (mmc_packed_cmd(mq->mqrq_cur->cmd_type))
- 				mmc_blk_revert_packed_req(mq, mq->mqrq_cur);
- 
  			mmc_blk_rw_rq_prep(mq->mqrq_cur, card, 0, mq);
  			mmc_start_req(card->host,
  				      &mq->mqrq_cur->mmc_active, NULL);
