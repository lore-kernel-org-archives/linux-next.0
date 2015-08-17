From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the md tree with the block tree
Date: Mon, 17 Aug 2015 14:44:12 +1000
Message-ID: <20150817144412.3a586c5e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Brown <neilb@suse.de>, Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kent Overstreet <kent.overstreet@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi Neil,

Today's linux-next merge of the md tree got a conflict in:

  drivers/md/raid0.c

between commit:

  8ae126660fdd ("block: kill merge_bvec_fn() completely")

from the block tree and commit:

  927d881980b7 ("md/raid0: update queue parameter in a safer location.")

from the md tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/md/raid0.c
index 59cda501a224,4a13c3cb940b..000000000000
--- a/drivers/md/raid0.c
+++ b/drivers/md/raid0.c
@@@ -188,10 -203,9 +203,6 @@@ static int create_strip_zones(struct md
  		}
  		dev[j] = rdev1;
  
- 		if (mddev->queue)
- 			disk_stack_limits(mddev->gendisk, rdev1->bdev,
- 					  rdev1->data_offset << 9);
 -		if (rdev1->bdev->bd_disk->queue->merge_bvec_fn)
 -			conf->has_merge_bvec = 1;
--
  		if (!smallest || (rdev1->sectors < smallest->sectors))
  			smallest = rdev1;
  		cnt++;
