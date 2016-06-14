From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with Linus' tree
Date: Tue, 14 Jun 2016 12:44:55 +1000
Message-ID: <20160614124455.297833ee@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43723 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932797AbcFNCo5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Jun 2016 22:44:57 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Shaun Tancheff <shaun@tancheff.com>, Mike Christie <mchristi@redhat.com>

Hi Jens,

Today's linux-next merge of the block tree got a conflict in:

  block/blk-lib.c

between commit:

  05bd92dddc59 ("block: missing bio_put following submit_bio_wait")

from the FIXME tree and commit:

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
index 9e29dc351695,78626c2fde33..000000000000
--- a/block/blk-lib.c
+++ b/block/blk-lib.c
@@@ -103,17 -111,13 +111,14 @@@ int blkdev_issue_discard(struct block_d
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
+ 		ret = submit_bio_wait(bio);
  		if (ret == -EOPNOTSUPP)
  			ret = 0;
 +		bio_put(bio);
  	}
  	blk_finish_plug(&plug);
  
@@@ -166,10 -171,8 +172,10 @@@ int blkdev_issue_write_same(struct bloc
  		}
  	}
  
 -	if (bio)
 +	if (bio) {
- 		ret = submit_bio_wait(REQ_WRITE | REQ_WRITE_SAME, bio);
+ 		ret = submit_bio_wait(bio);
 +		bio_put(bio);
 +	}
  	return ret != -EOPNOTSUPP ? ret : 0;
  }
  EXPORT_SYMBOL(blkdev_issue_write_same);
@@@ -209,11 -212,8 +215,11 @@@ static int __blkdev_issue_zeroout(struc
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
  
