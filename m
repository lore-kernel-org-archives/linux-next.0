From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with Linus' tree
Date: Mon, 26 Jun 2017 12:44:14 +1000
Message-ID: <20170626124414.2ed25457@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52673 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751525AbdFZCoR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 25 Jun 2017 22:44:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mike Snitzer <snitzer@redhat.com>, Christoph Hellwig <hch@lst.de>

Hi Jens,

Today's linux-next merge of the block tree got a conflict in:

  drivers/md/dm-raid1.c

between commit:

  cd15fb64ee56 ("Revert "dm mirror: use all available legs on multiple failures"")

from Linus' tree and commits:

  9966afaf91b3 ("dm: fix REQ_RAHEAD handling")
  1be569098458 ("dm: change ->end_io calling convention")
  4e4cbee93d56 ("block: switch bios to blk_status_t")

from the block tree.

I fixed it up (I think - see below) and can carry the fix as necessary.
This is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/md/dm-raid1.c
index 4da8858856fb,3ab584b686e0..000000000000
--- a/drivers/md/dm-raid1.c
+++ b/drivers/md/dm-raid1.c
@@@ -1255,26 -1253,16 +1256,26 @@@ static int mirror_end_io(struct dm_targ
  		if (!(bio->bi_opf & REQ_PREFLUSH) &&
  		    bio_op(bio) != REQ_OP_DISCARD)
  			dm_rh_dec(ms->rh, bio_record->write_region);
- 		return error;
+ 		return DM_ENDIO_DONE;
  	}
  
- 	if (error == -EOPNOTSUPP)
+ 	if (*error == BLK_STS_NOTSUPP)
 -		return DM_ENDIO_DONE;
 +		goto out;
  
- 	if ((error == -EWOULDBLOCK) && (bio->bi_opf & REQ_RAHEAD))
+ 	if (bio->bi_opf & REQ_RAHEAD)
 -		return DM_ENDIO_DONE;
 +		goto out;
  
- 	if (unlikely(error)) {
+ 	if (unlikely(*error)) {
 +		if (!bio_record->details.bi_bdev) {
 +			/*
 +			 * There wasn't enough memory to record necessary
 +			 * information for a retry or there was no other
 +			 * mirror in-sync.
 +			 */
 +			DMERR_LIMIT("Mirror read failed.");
- 			return -EIO;
++			return BLK_STS_IOERR;
 +		}
 +
  		m = bio_record->m;
  
  		DMERR("Mirror read failed from %s. Trying alternative device.",
@@@ -1290,8 -1278,7 +1291,8 @@@
  			bd = &bio_record->details;
  
  			dm_bio_restore(bd, bio);
 +			bio_record->details.bi_bdev = NULL;
- 			bio->bi_error = 0;
+ 			bio->bi_status = 0;
  
  			queue_bio(ms, bio, rw);
  			return DM_ENDIO_INCOMPLETE;
@@@ -1299,10 -1286,7 +1300,10 @@@
  		DMERR("All replicated volumes dead, failing I/O");
  	}
  
 +out:
 +	bio_record->details.bi_bdev = NULL;
 +
- 	return error;
+ 	return DM_ENDIO_DONE;
  }
  
  static void mirror_presuspend(struct dm_target *ti)
