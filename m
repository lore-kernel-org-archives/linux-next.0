From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with Linus' tree
Date: Thu, 21 Jul 2016 13:08:50 +1000
Message-ID: <20160721130850.48bd1ae6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58937 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751207AbcGUDIw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 20 Jul 2016 23:08:52 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Shaun Tancheff <shaun@tancheff.com>, Mike Christie <mchristi@redhat.com>

Hi Jens,

Today's linux-next merge of the block tree got a conflict in:

  block/blk-lib.c

between commit:

  05bd92dddc59 ("block: missing bio_put following submit_bio_wait")

from Linus' tree and commit:

  4e49ea4a3d27 ("block/fs/drivers: remove rw argument from submit_bio")

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

diff --cc block/blk-lib.c
index 9e29dc351695,e371f83a3186..000000000000
--- a/block/blk-lib.c
+++ b/block/blk-lib.c
@@@ -103,17 -116,13 +116,14 @@@ int blkdev_issue_discard(struct block_d
  	struct blk_plug plug;
  	int ret;
  
- 	if (flags & BLKDEV_DISCARD_SECURE)
- 		type |= REQ_SECURE;
- 
  	blk_start_plug(&plug);
- 	ret = __blkdev_issue_discard(bdev, sector, nr_sects, gfp_mask, type,
+ 	ret = __blkdev_issue_discard(bdev, sector, nr_sects, gfp_mask, flags,
  			&bio);
  	if (!ret && bio) {
- 		ret = submit_bio_wait(type, bio);
- 		if (ret == -EOPNOTSUPP)
+ 		ret = submit_bio_wait(bio);
+ 		if (ret == -EOPNOTSUPP && !(flags & BLKDEV_DISCARD_ZERO))
  			ret = 0;
 +		bio_put(bio);
  	}
  	blk_finish_plug(&plug);
  
@@@ -166,11 -176,9 +177,11 @@@ int blkdev_issue_write_same(struct bloc
  		}
  	}
  
 -	if (bio)
 +	if (bio) {
- 		ret = submit_bio_wait(REQ_WRITE | REQ_WRITE_SAME, bio);
+ 		ret = submit_bio_wait(bio);
 +		bio_put(bio);
 +	}
- 	return ret != -EOPNOTSUPP ? ret : 0;
+ 	return ret;
  }
  EXPORT_SYMBOL(blkdev_issue_write_same);
  
@@@ -209,11 -217,8 +220,11 @@@ static int __blkdev_issue_zeroout(struc
  		}
  	}
  
 -	if (bio)
 -		return submit_bio_wait(bio);
 +	if (bio) {
- 		ret = submit_bio_wait(WRITE, bio);
++		ret = submit_bio_wait(bio);
 +		bio_put(bio);
 +		return ret;
 +	}
  	return 0;
  }
  
