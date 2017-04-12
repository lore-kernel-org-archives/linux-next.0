From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the md tree with the block tree
Date: Wed, 12 Apr 2017 12:31:37 +1000
Message-ID: <20170412123137.5817f824@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57097 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752002AbdDLCbl (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 11 Apr 2017 22:31:41 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Shaohua Li <shli@kernel.org>, Jens Axboe <axboe@kernel.dk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, NeilBrown <neilb@suse.com>

Hi all,

Today's linux-next merge of the md tree got conflicts in:

  drivers/md/linear.c
  drivers/md/raid0.c

between commit:

  3deff1a70d59 ("md: support REQ_OP_WRITE_ZEROES")

from the block tree and commits:

  868f604b1de2 ("md/linear: improve bio splitting.")
  f00d7c85be9e ("md/raid0: fix up bio splitting.")

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

diff --cc drivers/md/linear.c
index 377a8a3672e3,f16316fbf658..000000000000
--- a/drivers/md/linear.c
+++ b/drivers/md/linear.c
@@@ -257,46 -257,40 +257,41 @@@ static void linear_make_request(struct 
  		return;
  	}
  
- 	do {
- 		sector_t bio_sector = bio->bi_iter.bi_sector;
- 		tmp_dev = which_dev(mddev, bio_sector);
- 		start_sector = tmp_dev->end_sector - tmp_dev->rdev->sectors;
- 		end_sector = tmp_dev->end_sector;
- 		data_offset = tmp_dev->rdev->data_offset;
- 		bio->bi_bdev = tmp_dev->rdev->bdev;
- 
- 		if (unlikely(bio_sector >= end_sector ||
- 			     bio_sector < start_sector))
- 			goto out_of_bounds;
- 
- 		if (unlikely(bio_end_sector(bio) > end_sector)) {
- 			/* This bio crosses a device boundary, so we have to
- 			 * split it.
- 			 */
- 			split = bio_split(bio, end_sector - bio_sector,
- 					  GFP_NOIO, fs_bio_set);
- 			bio_chain(split, bio);
- 		} else {
- 			split = bio;
- 		}
+ 	tmp_dev = which_dev(mddev, bio_sector);
+ 	start_sector = tmp_dev->end_sector - tmp_dev->rdev->sectors;
+ 	end_sector = tmp_dev->end_sector;
+ 	data_offset = tmp_dev->rdev->data_offset;
+ 
+ 	if (unlikely(bio_sector >= end_sector ||
+ 		     bio_sector < start_sector))
+ 		goto out_of_bounds;
+ 
+ 	if (unlikely(bio_end_sector(bio) > end_sector)) {
+ 		/* This bio crosses a device boundary, so we have to split it */
+ 		struct bio *split = bio_split(bio, end_sector - bio_sector,
+ 					      GFP_NOIO, mddev->bio_set);
+ 		bio_chain(split, bio);
+ 		generic_make_request(bio);
+ 		bio = split;
+ 	}
  
- 		split->bi_iter.bi_sector = split->bi_iter.bi_sector -
- 			start_sector + data_offset;
- 
- 		if (unlikely((bio_op(split) == REQ_OP_DISCARD) &&
- 			 !blk_queue_discard(bdev_get_queue(split->bi_bdev)))) {
- 			/* Just ignore it */
- 			bio_endio(split);
- 		} else {
- 			if (mddev->gendisk)
- 				trace_block_bio_remap(bdev_get_queue(split->bi_bdev),
- 						      split, disk_devt(mddev->gendisk),
- 						      bio_sector);
- 			mddev_check_writesame(mddev, split);
- 			mddev_check_write_zeroes(mddev, split);
- 			generic_make_request(split);
- 		}
- 	} while (split != bio);
+ 	bio->bi_bdev = tmp_dev->rdev->bdev;
+ 	bio->bi_iter.bi_sector = bio->bi_iter.bi_sector -
+ 		start_sector + data_offset;
+ 
+ 	if (unlikely((bio_op(bio) == REQ_OP_DISCARD) &&
+ 		     !blk_queue_discard(bdev_get_queue(bio->bi_bdev)))) {
+ 		/* Just ignore it */
+ 		bio_endio(bio);
+ 	} else {
+ 		if (mddev->gendisk)
+ 			trace_block_bio_remap(bdev_get_queue(bio->bi_bdev),
+ 					      bio, disk_devt(mddev->gendisk),
+ 					      bio_sector);
+ 		mddev_check_writesame(mddev, bio);
++		mddev_check_write_zeroes(mddev, bio);
+ 		generic_make_request(bio);
+ 	}
  	return;
  
  out_of_bounds:
diff --cc drivers/md/raid0.c
index ce7a6a56cf73,e777e48f55f6..000000000000
--- a/drivers/md/raid0.c
+++ b/drivers/md/raid0.c
@@@ -469,46 -472,43 +473,44 @@@ static void raid0_make_request(struct m
  		return;
  	}
  
- 	do {
- 		sector_t bio_sector = bio->bi_iter.bi_sector;
- 		sector_t sector = bio_sector;
- 		unsigned chunk_sects = mddev->chunk_sectors;
+ 	bio_sector = bio->bi_iter.bi_sector;
+ 	sector = bio_sector;
+ 	chunk_sects = mddev->chunk_sectors;
  
- 		unsigned sectors = chunk_sects -
- 			(likely(is_power_of_2(chunk_sects))
- 			 ? (sector & (chunk_sects-1))
- 			 : sector_div(sector, chunk_sects));
+ 	sectors = chunk_sects -
+ 		(likely(is_power_of_2(chunk_sects))
+ 		 ? (sector & (chunk_sects-1))
+ 		 : sector_div(sector, chunk_sects));
  
- 		/* Restore due to sector_div */
- 		sector = bio_sector;
+ 	/* Restore due to sector_div */
+ 	sector = bio_sector;
  
- 		if (sectors < bio_sectors(bio)) {
- 			split = bio_split(bio, sectors, GFP_NOIO, fs_bio_set);
- 			bio_chain(split, bio);
- 		} else {
- 			split = bio;
- 		}
+ 	if (sectors < bio_sectors(bio)) {
+ 		struct bio *split = bio_split(bio, sectors, GFP_NOIO, mddev->bio_set);
+ 		bio_chain(split, bio);
+ 		generic_make_request(bio);
+ 		bio = split;
+ 	}
  
- 		zone = find_zone(mddev->private, &sector);
- 		tmp_dev = map_sector(mddev, zone, sector, &sector);
- 		split->bi_bdev = tmp_dev->bdev;
- 		split->bi_iter.bi_sector = sector + zone->dev_start +
- 			tmp_dev->data_offset;
- 
- 		if (unlikely((bio_op(split) == REQ_OP_DISCARD) &&
- 			 !blk_queue_discard(bdev_get_queue(split->bi_bdev)))) {
- 			/* Just ignore it */
- 			bio_endio(split);
- 		} else {
- 			if (mddev->gendisk)
- 				trace_block_bio_remap(bdev_get_queue(split->bi_bdev),
- 						      split, disk_devt(mddev->gendisk),
- 						      bio_sector);
- 			mddev_check_writesame(mddev, split);
- 			mddev_check_write_zeroes(mddev, split);
- 			generic_make_request(split);
- 		}
- 	} while (split != bio);
+ 	zone = find_zone(mddev->private, &sector);
+ 	tmp_dev = map_sector(mddev, zone, sector, &sector);
+ 	bio->bi_bdev = tmp_dev->bdev;
+ 	bio->bi_iter.bi_sector = sector + zone->dev_start +
+ 		tmp_dev->data_offset;
+ 
+ 	if (unlikely((bio_op(bio) == REQ_OP_DISCARD) &&
+ 		     !blk_queue_discard(bdev_get_queue(bio->bi_bdev)))) {
+ 		/* Just ignore it */
+ 		bio_endio(bio);
+ 	} else {
+ 		if (mddev->gendisk)
+ 			trace_block_bio_remap(bdev_get_queue(bio->bi_bdev),
+ 					      bio, disk_devt(mddev->gendisk),
+ 					      bio_sector);
+ 		mddev_check_writesame(mddev, bio);
++		mddev_check_write_zeroes(mddev, bio);
+ 		generic_make_request(bio);
+ 	}
  }
  
  static void raid0_status(struct seq_file *seq, struct mddev *mddev)
