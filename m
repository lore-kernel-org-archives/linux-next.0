From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with Linus' tree
Date: Fri, 30 Jun 2017 12:08:06 +1000
Message-ID: <20170630120806.78d8af49@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35679 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751886AbdF3CIK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 29 Jun 2017 22:08:10 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>

Hi Jens,

Today's linux-next merge of the block tree got a conflict in:

  fs/block_dev.c

between commit:

  9ae3b3f52c62 ("block: provide bio_uninit() free freeing integrity/task associations")

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

diff --cc fs/block_dev.c
index 9e9f25dc69bc,2c5f08696fff..000000000000
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@@ -262,11 -263,8 +263,11 @@@ __blkdev_direct_IO_simple(struct kiocb 
  	if (vecs != inline_vecs)
  		kfree(vecs);
  
- 	if (unlikely(bio.bi_error))
- 		ret = bio.bi_error;
+ 	if (unlikely(bio.bi_status))
 -		return blk_status_to_errno(bio.bi_status);
++		ret = blk_status_to_errno(bio.bi_status);
 +
 +	bio_uninit(&bio);
 +
  	return ret;
  }
  
