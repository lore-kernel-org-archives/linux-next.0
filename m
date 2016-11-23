From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the md tree with the block tree
Date: Wed, 23 Nov 2016 13:17:23 +1100
Message-ID: <20161123131723.75a9477b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38355 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752522AbcKWCZf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 22 Nov 2016 21:25:35 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Shaohua Li <shli@kernel.org>, Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, NeilBrown <neilb@suse.com>

Hi Shaohua,

Today's linux-next merge of the md tree got a conflict in:

  drivers/md/md.c

between commit:

  70fd76140a6c ("block,fs: use REQ_* flags directly")

from the block tree and commit:

  46533ff7fefb ("md: Use REQ_FAILFAST_* on metadata writes where appropriate")

from the md tree.

I fixed it up (I think - see below) and can carry the fix as necessary.
This is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/md/md.c
index f975cd08923d,c7894fbbd8e5..000000000000
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@@ -743,7 -765,12 +765,12 @@@ void md_super_write(struct mddev *mddev
  	bio_add_page(bio, page, size, 0);
  	bio->bi_private = rdev;
  	bio->bi_end_io = super_written;
- 	bio->bi_opf = REQ_OP_WRITE | REQ_PREFLUSH | REQ_FUA;
+ 
+ 	if (test_bit(MD_FAILFAST_SUPPORTED, &mddev->flags) &&
+ 	    test_bit(FailFast, &rdev->flags) &&
+ 	    !test_bit(LastDev, &rdev->flags))
+ 		ff = MD_FAILFAST;
 -	bio_set_op_attrs(bio, REQ_OP_WRITE, WRITE_FLUSH_FUA | ff);
++	bio->bi_opf = REQ_OP_WRITE | REQ_PREFLUSH | REQ_FUA | ff;
  
  	atomic_inc(&mddev->pending_writes);
  	submit_bio(bio);
