From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with the btrfs-kdave
 tree
Date: Wed, 21 Jun 2017 13:13:27 +1000
Message-ID: <20170621131327.14932dfb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37267 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752990AbdFUDNb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Jun 2017 23:13:31 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>, David Sterba <dsterba@suse.cz>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  fs/btrfs/disk-io.c

between commits:

  21445903e814 ("btrfs: preallocate device flush bio")
  56305f3eb397 ("btrfs: move dev stats accounting out of wait_dev_flush")

from the btrfs-kdave tree and commit:

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

diff --cc fs/btrfs/disk-io.c
index b6758892874f,6036d15b47b8..000000000000
--- a/fs/btrfs/disk-io.c
+++ b/fs/btrfs/disk-io.c
@@@ -87,8 -87,9 +87,8 @@@ struct btrfs_end_io_wq 
  	bio_end_io_t *end_io;
  	void *private;
  	struct btrfs_fs_info *info;
- 	int error;
+ 	blk_status_t status;
  	enum btrfs_wq_endio_type metadata;
 -	struct list_head list;
  	struct btrfs_work work;
  };
  
@@@ -867,10 -868,10 +867,10 @@@ unsigned long btrfs_async_submit_limit(
  static void run_one_async_start(struct btrfs_work *work)
  {
  	struct async_submit_bio *async;
- 	int ret;
+ 	blk_status_t ret;
  
  	async = container_of(work, struct  async_submit_bio, work);
 -	ret = async->submit_bio_start(async->inode, async->bio,
 +	ret = async->submit_bio_start(async->private_data, async->bio,
  				      async->mirror_num, async->bio_flags,
  				      async->bio_offset);
  	if (ret)
@@@ -915,20 -916,19 +915,20 @@@ static void run_one_async_free(struct b
  	kfree(async);
  }
  
- int btrfs_wq_submit_bio(struct btrfs_fs_info *fs_info, struct bio *bio,
 -blk_status_t btrfs_wq_submit_bio(struct btrfs_fs_info *fs_info,
 -		struct inode *inode, struct bio *bio, int mirror_num,
 -		unsigned long bio_flags, u64 bio_offset,
 -		extent_submit_bio_hook_t *submit_bio_start,
 -		extent_submit_bio_hook_t *submit_bio_done)
++blk_status_t btrfs_wq_submit_bio(struct btrfs_fs_info *fs_info, struct bio *bio,
 +			int mirror_num, unsigned long bio_flags,
 +			u64 bio_offset, void *private_data,
 +			extent_submit_bio_hook_t *submit_bio_start,
 +			extent_submit_bio_hook_t *submit_bio_done)
  {
  	struct async_submit_bio *async;
  
  	async = kmalloc(sizeof(*async), GFP_NOFS);
  	if (!async)
- 		return -ENOMEM;
+ 		return BLK_STS_RESOURCE;
  
 -	async->inode = inode;
 +	async->private_data = private_data;
 +	async->fs_info = fs_info;
  	async->bio = bio;
  	async->mirror_num = mirror_num;
  	async->submit_bio_start = submit_bio_start;
@@@ -971,12 -971,12 +971,12 @@@ static blk_status_t btree_csum_one_bio(
  			break;
  	}
  
- 	return ret;
+ 	return errno_to_blk_status(ret);
  }
  
- static int __btree_submit_bio_start(void *private_data, struct bio *bio,
 -static blk_status_t __btree_submit_bio_start(struct inode *inode,
 -		struct bio *bio, int mirror_num, unsigned long bio_flags,
 -		u64 bio_offset)
++static blk_status_t __btree_submit_bio_start(void *private_data, struct bio *bio,
 +				    int mirror_num, unsigned long bio_flags,
 +				    u64 bio_offset)
  {
  	/*
  	 * when we're called for a write, we're already in the async
@@@ -985,12 -985,11 +985,12 @@@
  	return btree_csum_one_bio(bio);
  }
  
- static int __btree_submit_bio_done(void *private_data, struct bio *bio,
 -static blk_status_t __btree_submit_bio_done(struct inode *inode,
 -		struct bio *bio, int mirror_num, unsigned long bio_flags,
 -		u64 bio_offset)
++static blk_status_t __btree_submit_bio_done(void *private_data, struct bio *bio,
 +				 int mirror_num, unsigned long bio_flags,
 +				 u64 bio_offset)
  {
 +	struct inode *inode = private_data;
- 	int ret;
+ 	blk_status_t ret;
  
  	/*
  	 * when we're called for a write, we're already in the async
@@@ -1015,14 -1014,13 +1015,14 @@@ static int check_async_write(unsigned l
  	return 1;
  }
  
- static int btree_submit_bio_hook(void *private_data, struct bio *bio,
 -static blk_status_t btree_submit_bio_hook(struct inode *inode, struct bio *bio,
++static blk_status_t btree_submit_bio_hook(void *private_data, struct bio *bio,
  				 int mirror_num, unsigned long bio_flags,
  				 u64 bio_offset)
  {
 +	struct inode *inode = private_data;
  	struct btrfs_fs_info *fs_info = btrfs_sb(inode->i_sb);
  	int async = check_async_write(bio_flags);
- 	int ret;
+ 	blk_status_t ret;
  
  	if (bio_op(bio) != REQ_OP_WRITE) {
  		/*
@@@ -3485,57 -3490,59 +3485,57 @@@ static void btrfs_end_empty_barrier(str
  }
  
  /*
 - * trigger flushes for one the devices.  If you pass wait == 0, the flushes are
 - * sent down.  With wait == 1, it waits for the previous flush.
 - *
 - * any device where the flush fails with eopnotsupp are flagged as not-barrier
 - * capable
 + * Submit a flush request to the device if it supports it. Error handling is
 + * done in the waiting counterpart.
   */
 -static blk_status_t write_dev_flush(struct btrfs_device *device, int wait)
 +static void write_dev_flush(struct btrfs_device *device)
  {
  	struct request_queue *q = bdev_get_queue(device->bdev);
 -	struct bio *bio;
 -	blk_status_t ret = 0;
 +	struct bio *bio = device->flush_bio;
  
  	if (!test_bit(QUEUE_FLAG_WC, &q->queue_flags))
 -		return 0;
 +		return;
  
 -	if (wait) {
 -		bio = device->flush_bio;
 -		if (!bio)
 -			return 0;
 +	bio_reset(bio);
 +	bio->bi_end_io = btrfs_end_empty_barrier;
 +	bio->bi_bdev = device->bdev;
 +	bio->bi_opf = REQ_OP_WRITE | REQ_SYNC | REQ_PREFLUSH;
 +	init_completion(&device->flush_wait);
 +	bio->bi_private = &device->flush_wait;
  
 -		wait_for_completion(&device->flush_wait);
 +	submit_bio(bio);
 +	device->flush_bio_sent = 1;
 +}
  
 -		if (bio->bi_status) {
 -			ret = bio->bi_status;
 -			btrfs_dev_stat_inc_and_print(device,
 -				BTRFS_DEV_STAT_FLUSH_ERRS);
 -		}
 +/*
 + * If the flush bio has been submitted by write_dev_flush, wait for it.
 + */
- static int wait_dev_flush(struct btrfs_device *device)
++static blk_status_t wait_dev_flush(struct btrfs_device *device)
 +{
 +	struct bio *bio = device->flush_bio;
  
 -		/* drop the reference from the wait == 0 run */
 -		bio_put(bio);
 -		device->flush_bio = NULL;
 +	if (!device->flush_bio_sent)
 +		return 0;
  
 -		return ret;
 -	}
 +	device->flush_bio_sent = 0;
 +	wait_for_completion_io(&device->flush_wait);
  
- 	return bio->bi_error;
 -	/*
 -	 * one reference for us, and we leave it for the
 -	 * caller
 -	 */
 -	device->flush_bio = NULL;
 -	bio = btrfs_io_bio_alloc(GFP_NOFS, 0);
 -	if (!bio)
 -		return BLK_STS_RESOURCE;
++	return bio->bi_status;
 +}
  
 -	bio->bi_end_io = btrfs_end_empty_barrier;
 -	bio->bi_bdev = device->bdev;
 -	bio->bi_opf = REQ_OP_WRITE | REQ_SYNC | REQ_PREFLUSH;
 -	init_completion(&device->flush_wait);
 -	bio->bi_private = &device->flush_wait;
 -	device->flush_bio = bio;
 +static int check_barrier_error(struct btrfs_fs_devices *fsdevs)
 +{
 +	int dev_flush_error = 0;
 +	struct btrfs_device *dev;
  
 -	bio_get(bio);
 -	btrfsic_submit_bio(bio);
 +	list_for_each_entry_rcu(dev, &fsdevs->devices, dev_list) {
 +		if (!dev->bdev || dev->last_flush_error)
 +			dev_flush_error++;
 +	}
 +
 +	if (dev_flush_error >
 +	    fsdevs->fs_info->num_tolerated_disk_barrier_failures)
 +		return -EIO;
  
  	return 0;
  }
@@@ -3548,8 -3555,9 +3548,8 @@@ static int barrier_all_devices(struct b
  {
  	struct list_head *head;
  	struct btrfs_device *dev;
 -	int errors_send = 0;
  	int errors_wait = 0;
- 	int ret;
+ 	blk_status_t ret;
  
  	/* send down all the barriers */
  	head = &info->fs_devices->devices;
