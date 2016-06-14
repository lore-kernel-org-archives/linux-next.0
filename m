From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the md tree with the block tree
Date: Tue, 14 Jun 2016 13:52:19 +1000
Message-ID: <20160614135219.5c4879a6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52757 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933011AbcFNDwX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Jun 2016 23:52:23 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Shaohua Li <shli@kernel.org>, Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mike Christie <mchristi@redhat.com>, NeilBrown <neilb@suse.com>

Hi Shaohua,

Today's linux-next merge of the md tree got a conflict in:

  drivers/md/raid10.c

between commit:

  796a5cf083c2 ("md: use bio op accessors")

from the block tree and commits:

  f90145f317ef ("md/raid10: add rcu protection to rdev access in raid10_sync_request."
  d094d6860b66 ("md/raid10: add rcu protection to rdev access during reshape.")

from the md tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/md/raid10.c
index 26ae74fd0d01,8ee5d96e6a2d..000000000000
--- a/drivers/md/raid10.c
+++ b/drivers/md/raid10.c
@@@ -3063,10 -3092,10 +3091,10 @@@ static sector_t raid10_sync_request(str
  					biolist = bio;
  					bio->bi_private = r10_bio;
  					bio->bi_end_io = end_sync_write;
 -					bio->bi_rw = WRITE;
 +					bio_set_op_attrs(bio, REQ_OP_WRITE, 0);
  					bio->bi_iter.bi_sector = to_addr
- 						+ rdev->data_offset;
- 					bio->bi_bdev = rdev->bdev;
+ 						+ mrdev->data_offset;
+ 					bio->bi_bdev = mrdev->bdev;
  					atomic_inc(&r10_bio->remaining);
  				} else
  					r10_bio->devs[1].bio->bi_end_io = NULL;
@@@ -3092,10 -3120,10 +3119,10 @@@
  				biolist = bio;
  				bio->bi_private = r10_bio;
  				bio->bi_end_io = end_sync_write;
 -				bio->bi_rw = WRITE;
 +				bio_set_op_attrs(bio, REQ_OP_WRITE, 0);
  				bio->bi_iter.bi_sector = to_addr +
- 					rdev->data_offset;
- 				bio->bi_bdev = rdev->bdev;
+ 					mreplace->data_offset;
+ 				bio->bi_bdev = mreplace->bdev;
  				atomic_inc(&r10_bio->remaining);
  				break;
  			}
@@@ -3212,16 -3251,18 +3250,18 @@@
  			biolist = bio;
  			bio->bi_private = r10_bio;
  			bio->bi_end_io = end_sync_read;
 -			bio->bi_rw = READ;
 +			bio_set_op_attrs(bio, REQ_OP_READ, 0);
- 			bio->bi_iter.bi_sector = sector +
- 				conf->mirrors[d].rdev->data_offset;
- 			bio->bi_bdev = conf->mirrors[d].rdev->bdev;
+ 			bio->bi_iter.bi_sector = sector + rdev->data_offset;
+ 			bio->bi_bdev = rdev->bdev;
  			count++;
  
- 			if (conf->mirrors[d].replacement == NULL ||
- 			    test_bit(Faulty,
- 				     &conf->mirrors[d].replacement->flags))
+ 			rdev = rcu_dereference(conf->mirrors[d].replacement);
+ 			if (rdev == NULL || test_bit(Faulty, &rdev->flags)) {
+ 				rcu_read_unlock();
  				continue;
+ 			}
+ 			atomic_inc(&rdev->nr_pending);
+ 			rcu_read_unlock();
  
  			/* Need to set up for writing to the replacement */
  			bio = r10_bio->devs[i].repl_bio;
@@@ -3234,10 -3274,9 +3273,9 @@@
  			biolist = bio;
  			bio->bi_private = r10_bio;
  			bio->bi_end_io = end_sync_write;
 -			bio->bi_rw = WRITE;
 +			bio_set_op_attrs(bio, REQ_OP_WRITE, 0);
- 			bio->bi_iter.bi_sector = sector +
- 				conf->mirrors[d].replacement->data_offset;
- 			bio->bi_bdev = conf->mirrors[d].replacement->bdev;
+ 			bio->bi_iter.bi_sector = sector + rdev->data_offset;
+ 			bio->bi_bdev = rdev->bdev;
  			count++;
  		}
  
@@@ -4521,7 -4569,9 +4568,9 @@@ static int handle_reshape_read_error(st
  					       addr,
  					       s << 9,
  					       bvec[idx].bv_page,
 -					       READ, false);
 +					       REQ_OP_READ, 0, false);
+ 			rdev_dec_pending(rdev, mddev);
+ 			rcu_read_lock();
  			if (success)
  				break;
  		failed:
