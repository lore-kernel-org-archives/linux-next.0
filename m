From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with Linus' tree
Date: Mon, 26 Jun 2017 12:28:26 +1000
Message-ID: <20170626122826.5f84fe96@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52447 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751474AbdFZC23 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 25 Jun 2017 22:28:29 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mike Snitzer <snitzer@redhat.com>, Christoph Hellwig <hch@lst.de>

Hi Jens,

Today's linux-next merge of the block tree got a conflict in:

  drivers/md/dm-io.c

between commit:

  feb7695fe9fb ("dm io: fix duplicate bio completion due to missing ref count")

from Linus' tree and commit:

  4e4cbee93d56 ("block: switch bios to blk_status_t")

from the block tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/md/dm-io.c
index 8d5ca30f6551,81248a8a8b57..000000000000
--- a/drivers/md/dm-io.c
+++ b/drivers/md/dm-io.c
@@@ -317,9 -318,9 +318,9 @@@ static void do_region(int op, int op_fl
  	else if (op == REQ_OP_WRITE_SAME)
  		special_cmd_max_sectors = q->limits.max_write_same_sectors;
  	if ((op == REQ_OP_DISCARD || op == REQ_OP_WRITE_ZEROES ||
 -	     op == REQ_OP_WRITE_SAME)  &&
 -	    special_cmd_max_sectors == 0) {
 +	     op == REQ_OP_WRITE_SAME) && special_cmd_max_sectors == 0) {
 +		atomic_inc(&io->count);
- 		dec_count(io, region, -EOPNOTSUPP);
+ 		dec_count(io, region, BLK_STS_NOTSUPP);
  		return;
  	}
  
