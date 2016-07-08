From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with the btrfs-kdave
 tree
Date: Fri, 8 Jul 2016 14:00:01 +1000
Message-ID: <20160708140001.3f0dabb2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45558 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750858AbcGHEAE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 8 Jul 2016 00:00:04 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>, David Sterba <dsterba@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jeff Mahoney <jeffm@suse.com>, Mike Christie <mchristi@redhat.com>

Hi Jens,

Today's linux-next merge of the block tree got a conflict in:

  fs/btrfs/volumes.c

between commit:

  26112f7f4726 ("btrfs: take an fs_info parameter directly when the root is not used otherwise")

from the btrfs-kdave tree and commit:

  4e49ea4a3d27 ("block/fs/drivers: remove rw argument from submit_bio")
  81a75f6781de ("btrfs: use bio fields for op and flags")

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

diff --cc fs/btrfs/volumes.c
index 64d2557fe7fc,14b2d19c842c..000000000000
--- a/fs/btrfs/volumes.c
+++ b/fs/btrfs/volumes.c
@@@ -5984,10 -5999,10 +5989,10 @@@ static void btrfs_end_bio(struct bio *b
   * This will add one bio to the pending list for a device and make sure
   * the work struct is scheduled.
   */
 -static noinline void btrfs_schedule_bio(struct btrfs_root *root,
 -					struct btrfs_device *device,
 +static noinline void btrfs_schedule_bio(struct btrfs_device *device,
- 					int rw, struct bio *bio)
+ 					struct bio *bio)
  {
 +	struct btrfs_fs_info *fs_info = device->fs_info;
  	int should_queue = 1;
  	struct btrfs_pending_bios *pending_bios;
  
@@@ -6010,10 -6025,9 +6015,9 @@@
  	 * made progress against dirty pages when we've really just put it
  	 * on a queue for later
  	 */
 -	atomic_inc(&root->fs_info->nr_async_bios);
 +	atomic_inc(&fs_info->nr_async_bios);
  	WARN_ON(bio->bi_next);
  	bio->bi_next = NULL;
- 	bio->bi_rw |= rw;
  
  	spin_lock(&device->io_lock);
  	if (bio->bi_rw & REQ_SYNC)
@@@ -6033,14 -6047,15 +6037,14 @@@
  	spin_unlock(&device->io_lock);
  
  	if (should_queue)
 -		btrfs_queue_work(root->fs_info->submit_workers,
 -				 &device->work);
 +		btrfs_queue_work(fs_info->submit_workers, &device->work);
  }
  
 -static void submit_stripe_bio(struct btrfs_root *root, struct btrfs_bio *bbio,
 -			      struct bio *bio, u64 physical, int dev_nr,
 -			      int async)
 +static void submit_stripe_bio(struct btrfs_bio *bbio, struct bio *bio,
- 			      u64 physical, int dev_nr, int rw, int async)
++			      u64 physical, int dev_nr, int async)
  {
  	struct btrfs_device *dev = bbio->stripes[dev_nr].dev;
 +	struct btrfs_fs_info *fs_info = bbio->fs_info;
  
  	bio->bi_private = bbio;
  	btrfs_io_bio(bio)->stripe_index = dev_nr;
@@@ -6061,12 -6076,12 +6065,12 @@@
  #endif
  	bio->bi_bdev = dev->bdev;
  
 -	btrfs_bio_counter_inc_noblocked(root->fs_info);
 +	btrfs_bio_counter_inc_noblocked(fs_info);
  
  	if (async)
- 		btrfs_schedule_bio(dev, rw, bio);
 -		btrfs_schedule_bio(root, dev, bio);
++		btrfs_schedule_bio(dev, bio);
  	else
- 		btrfsic_submit_bio(rw, bio);
+ 		btrfsic_submit_bio(bio);
  }
  
  static void bbio_error(struct btrfs_bio *bbio, struct bio *bio, u64 logical)
@@@ -6083,7 -6098,7 +6087,7 @@@
  	}
  }
  
- int btrfs_map_bio(struct btrfs_fs_info *fs_info, int rw, struct bio *bio,
 -int btrfs_map_bio(struct btrfs_root *root, struct bio *bio,
++int btrfs_map_bio(struct btrfs_fs_info *fs_info, struct bio *bio,
  		  int mirror_num, int async_submit)
  {
  	struct btrfs_device *dev;
@@@ -6099,11 -6114,11 +6103,11 @@@
  	length = bio->bi_iter.bi_size;
  	map_length = length;
  
 -	btrfs_bio_counter_inc_blocked(root->fs_info);
 -	ret = __btrfs_map_block(root->fs_info, bio_op(bio), logical,
 -				&map_length, &bbio, mirror_num, 1);
 +	btrfs_bio_counter_inc_blocked(fs_info);
- 	ret = __btrfs_map_block(fs_info, rw, logical, &map_length, &bbio,
- 				mirror_num, 1);
++	ret = __btrfs_map_block(fs_info, bio_op(bio), logical, &map_length,
++				&bbio, mirror_num, 1);
  	if (ret) {
 -		btrfs_bio_counter_dec(root->fs_info);
 +		btrfs_bio_counter_dec(fs_info);
  		return ret;
  	}
  
@@@ -6115,18 -6130,17 +6119,18 @@@
  	atomic_set(&bbio->stripes_pending, bbio->num_stripes);
  
  	if ((bbio->map_type & BTRFS_BLOCK_GROUP_RAID56_MASK) &&
- 	    ((rw & WRITE) || (mirror_num > 1))) {
+ 	    ((bio_op(bio) == REQ_OP_WRITE) || (mirror_num > 1))) {
  		/* In this case, map_length has been set to the length of
  		   a single stripe; not the whole write */
- 		if (rw & WRITE) {
+ 		if (bio_op(bio) == REQ_OP_WRITE) {
 -			ret = raid56_parity_write(root, bio, bbio, map_length);
 +			ret = raid56_parity_write(fs_info, bio, bbio,
 +						  map_length);
  		} else {
 -			ret = raid56_parity_recover(root, bio, bbio, map_length,
 -						    mirror_num, 1);
 +			ret = raid56_parity_recover(fs_info, bio, bbio,
 +						    map_length, mirror_num, 1);
  		}
  
 -		btrfs_bio_counter_dec(root->fs_info);
 +		btrfs_bio_counter_dec(fs_info);
  		return ret;
  	}
  
@@@ -6150,10 -6164,11 +6155,10 @@@
  		} else
  			bio = first_bio;
  
 -		submit_stripe_bio(root, bbio, bio,
 -				  bbio->stripes[dev_nr].physical, dev_nr,
 -				  async_submit);
 +		submit_stripe_bio(bbio, bio, bbio->stripes[dev_nr].physical,
- 				  dev_nr, rw, async_submit);
++				  dev_nr, async_submit);
  	}
 -	btrfs_bio_counter_dec(root->fs_info);
 +	btrfs_bio_counter_dec(fs_info);
  	return 0;
  }
  
