From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: btrfs merge resolution
Date: Tue, 4 Jul 2017 09:44:55 +1000
Message-ID: <20170704094455.71972260@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37159 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750835AbdGCXo5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 3 Jul 2017 19:44:57 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Sterba <dsterba@suse.cz>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <jbacik@fb.com>, Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linus Trovalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>

Hi all,

Since the block tree has been merged into Linus' tree, here is the
merge resolution from my merge of the btrfs-kdave tree today:

36c639d65d6a6e596d73ccf285adf9fffc9097b8
diff --cc fs/btrfs/disk-io.c
index 6036d15b47b8,b6758892874f..7065201bedcf
--- a/fs/btrfs/disk-io.c
+++ b/fs/btrfs/disk-io.c
@@@ -87,9 -87,8 +87,8 @@@ struct btrfs_end_io_wq 
  	bio_end_io_t *end_io;
  	void *private;
  	struct btrfs_fs_info *info;
 -	int error;
 +	blk_status_t status;
  	enum btrfs_wq_endio_type metadata;
- 	struct list_head list;
  	struct btrfs_work work;
  };
  
@@@ -868,10 -867,10 +867,10 @@@ unsigned long btrfs_async_submit_limit(
  static void run_one_async_start(struct btrfs_work *work)
  {
  	struct async_submit_bio *async;
 -	int ret;
 +	blk_status_t ret;
  
  	async = container_of(work, struct  async_submit_bio, work);
- 	ret = async->submit_bio_start(async->inode, async->bio,
+ 	ret = async->submit_bio_start(async->private_data, async->bio,
  				      async->mirror_num, async->bio_flags,
  				      async->bio_offset);
  	if (ret)
@@@ -916,19 -915,20 +915,20 @@@ static void run_one_async_free(struct b
  	kfree(async);
  }
  
- blk_status_t btrfs_wq_submit_bio(struct btrfs_fs_info *fs_info,
- 		struct inode *inode, struct bio *bio, int mirror_num,
- 		unsigned long bio_flags, u64 bio_offset,
- 		extent_submit_bio_hook_t *submit_bio_start,
- 		extent_submit_bio_hook_t *submit_bio_done)
 -int btrfs_wq_submit_bio(struct btrfs_fs_info *fs_info, struct bio *bio,
++blk_status_t btrfs_wq_submit_bio(struct btrfs_fs_info *fs_info, struct bio *bio,
+ 			int mirror_num, unsigned long bio_flags,
+ 			u64 bio_offset, void *private_data,
+ 			extent_submit_bio_hook_t *submit_bio_start,
+ 			extent_submit_bio_hook_t *submit_bio_done)
  {
  	struct async_submit_bio *async;
  
  	async = kmalloc(sizeof(*async), GFP_NOFS);
  	if (!async)
 -		return -ENOMEM;
 +		return BLK_STS_RESOURCE;
  
- 	async->inode = inode;
+ 	async->private_data = private_data;
+ 	async->fs_info = fs_info;
  	async->bio = bio;
  	async->mirror_num = mirror_num;
  	async->submit_bio_start = submit_bio_start;
@@@ -971,12 -971,12 +971,12 @@@ static blk_status_t btree_csum_one_bio(
  			break;
  	}
  
 -	return ret;
 +	return errno_to_blk_status(ret);
  }
  
- static blk_status_t __btree_submit_bio_start(struct inode *inode,
- 		struct bio *bio, int mirror_num, unsigned long bio_flags,
- 		u64 bio_offset)
 -static int __btree_submit_bio_start(void *private_data, struct bio *bio,
++static blk_status_t __btree_submit_bio_start(void *private_data, struct bio *bio,
+ 				    int mirror_num, unsigned long bio_flags,
+ 				    u64 bio_offset)
  {
  	/*
  	 * when we're called for a write, we're already in the async
@@@ -985,11 -985,12 +985,12 @@@
  	return btree_csum_one_bio(bio);
  }
  
- static blk_status_t __btree_submit_bio_done(struct inode *inode,
- 		struct bio *bio, int mirror_num, unsigned long bio_flags,
- 		u64 bio_offset)
 -static int __btree_submit_bio_done(void *private_data, struct bio *bio,
++static blk_status_t __btree_submit_bio_done(void *private_data, struct bio *bio,
+ 				 int mirror_num, unsigned long bio_flags,
+ 				 u64 bio_offset)
  {
+ 	struct inode *inode = private_data;
 -	int ret;
 +	blk_status_t ret;
  
  	/*
  	 * when we're called for a write, we're already in the async
@@@ -1014,13 -1015,14 +1015,14 @@@ static int check_async_write(unsigned l
  	return 1;
  }
  
- static blk_status_t btree_submit_bio_hook(struct inode *inode, struct bio *bio,
 -static int btree_submit_bio_hook(void *private_data, struct bio *bio,
++static blk_status_t btree_submit_bio_hook(void *private_data, struct bio *bio,
  				 int mirror_num, unsigned long bio_flags,
  				 u64 bio_offset)
  {
+ 	struct inode *inode = private_data;
  	struct btrfs_fs_info *fs_info = btrfs_sb(inode->i_sb);
  	int async = check_async_write(bio_flags);
 -	int ret;
 +	blk_status_t ret;
  
  	if (bio_op(bio) != REQ_OP_WRITE) {
  		/*
@@@ -3490,59 -3485,57 +3485,57 @@@ static void btrfs_end_empty_barrier(str
  }
  
  /*
-  * trigger flushes for one the devices.  If you pass wait == 0, the flushes are
-  * sent down.  With wait == 1, it waits for the previous flush.
-  *
-  * any device where the flush fails with eopnotsupp are flagged as not-barrier
-  * capable
+  * Submit a flush request to the device if it supports it. Error handling is
+  * done in the waiting counterpart.
   */
- static blk_status_t write_dev_flush(struct btrfs_device *device, int wait)
+ static void write_dev_flush(struct btrfs_device *device)
  {
  	struct request_queue *q = bdev_get_queue(device->bdev);
- 	struct bio *bio;
- 	blk_status_t ret = 0;
+ 	struct bio *bio = device->flush_bio;
  
  	if (!test_bit(QUEUE_FLAG_WC, &q->queue_flags))
- 		return 0;
+ 		return;
  
- 	if (wait) {
- 		bio = device->flush_bio;
- 		if (!bio)
- 			return 0;
+ 	bio_reset(bio);
+ 	bio->bi_end_io = btrfs_end_empty_barrier;
+ 	bio->bi_bdev = device->bdev;
+ 	bio->bi_opf = REQ_OP_WRITE | REQ_SYNC | REQ_PREFLUSH;
+ 	init_completion(&device->flush_wait);
+ 	bio->bi_private = &device->flush_wait;
  
- 		wait_for_completion(&device->flush_wait);
+ 	submit_bio(bio);
+ 	device->flush_bio_sent = 1;
+ }
  
- 		if (bio->bi_status) {
- 			ret = bio->bi_status;
- 			btrfs_dev_stat_inc_and_print(device,
- 				BTRFS_DEV_STAT_FLUSH_ERRS);
- 		}
+ /*
+  * If the flush bio has been submitted by write_dev_flush, wait for it.
+  */
 -static int wait_dev_flush(struct btrfs_device *device)
++static blk_status_t wait_dev_flush(struct btrfs_device *device)
+ {
+ 	struct bio *bio = device->flush_bio;
  
- 		/* drop the reference from the wait == 0 run */
- 		bio_put(bio);
- 		device->flush_bio = NULL;
+ 	if (!device->flush_bio_sent)
+ 		return 0;
  
- 		return ret;
- 	}
+ 	device->flush_bio_sent = 0;
+ 	wait_for_completion_io(&device->flush_wait);
  
- 	/*
- 	 * one reference for us, and we leave it for the
- 	 * caller
- 	 */
- 	device->flush_bio = NULL;
- 	bio = btrfs_io_bio_alloc(GFP_NOFS, 0);
- 	if (!bio)
- 		return BLK_STS_RESOURCE;
 -	return bio->bi_error;
++	return bio->bi_status;
+ }
  
- 	bio->bi_end_io = btrfs_end_empty_barrier;
- 	bio->bi_bdev = device->bdev;
- 	bio->bi_opf = REQ_OP_WRITE | REQ_SYNC | REQ_PREFLUSH;
- 	init_completion(&device->flush_wait);
- 	bio->bi_private = &device->flush_wait;
- 	device->flush_bio = bio;
+ static int check_barrier_error(struct btrfs_fs_devices *fsdevs)
+ {
+ 	int dev_flush_error = 0;
+ 	struct btrfs_device *dev;
  
- 	bio_get(bio);
- 	btrfsic_submit_bio(bio);
+ 	list_for_each_entry_rcu(dev, &fsdevs->devices, dev_list) {
+ 		if (!dev->bdev || dev->last_flush_error)
+ 			dev_flush_error++;
+ 	}
+ 
+ 	if (dev_flush_error >
+ 	    fsdevs->fs_info->num_tolerated_disk_barrier_failures)
+ 		return -EIO;
  
  	return 0;
  }
@@@ -3555,9 -3548,8 +3548,8 @@@ static int barrier_all_devices(struct b
  {
  	struct list_head *head;
  	struct btrfs_device *dev;
- 	int errors_send = 0;
  	int errors_wait = 0;
 -	int ret;
 +	blk_status_t ret;
  
  	/* send down all the barriers */
  	head = &info->fs_devices->devices;
diff --cc fs/btrfs/disk-io.h
index c581927555f3,4654d129aa76..0a634d3ffc16
--- a/fs/btrfs/disk-io.h
+++ b/fs/btrfs/disk-io.h
@@@ -118,16 -118,16 +118,16 @@@ int btrfs_buffer_uptodate(struct extent
  int btrfs_read_buffer(struct extent_buffer *buf, u64 parent_transid);
  u32 btrfs_csum_data(const char *data, u32 seed, size_t len);
  void btrfs_csum_final(u32 crc, u8 *result);
 -int btrfs_bio_wq_end_io(struct btrfs_fs_info *info, struct bio *bio,
 +blk_status_t btrfs_bio_wq_end_io(struct btrfs_fs_info *info, struct bio *bio,
  			enum btrfs_wq_endio_type metadata);
- blk_status_t btrfs_wq_submit_bio(struct btrfs_fs_info *fs_info,
- 		struct inode *inode, struct bio *bio, int mirror_num,
- 		unsigned long bio_flags, u64 bio_offset,
- 		extent_submit_bio_hook_t *submit_bio_start,
- 		extent_submit_bio_hook_t *submit_bio_done);
 -int btrfs_wq_submit_bio(struct btrfs_fs_info *fs_info, struct bio *bio,
++blk_status_t btrfs_wq_submit_bio(struct btrfs_fs_info *fs_info, struct bio *bio,
+ 			int mirror_num, unsigned long bio_flags,
+ 			u64 bio_offset, void *private_data,
+ 			extent_submit_bio_hook_t *submit_bio_start,
+ 			extent_submit_bio_hook_t *submit_bio_done);
  unsigned long btrfs_async_submit_limit(struct btrfs_fs_info *info);
  int btrfs_write_tree_block(struct extent_buffer *buf);
- int btrfs_wait_tree_block_writeback(struct extent_buffer *buf);
+ void btrfs_wait_tree_block_writeback(struct extent_buffer *buf);
  int btrfs_init_log_root_tree(struct btrfs_trans_handle *trans,
  			     struct btrfs_fs_info *fs_info);
  int btrfs_add_log_tree(struct btrfs_trans_handle *trans,
diff --cc fs/btrfs/extent_io.c
index d1cd60140817,2e6f69908303..7a18b5762ac9
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@@ -2398,9 -2369,9 +2370,10 @@@ static int bio_readpage_error(struct bi
  	struct io_failure_record *failrec;
  	struct inode *inode = page->mapping->host;
  	struct extent_io_tree *tree = &BTRFS_I(inode)->io_tree;
+ 	struct extent_io_tree *failure_tree = &BTRFS_I(inode)->io_failure_tree;
  	struct bio *bio;
  	int read_mode = 0;
 +	blk_status_t status;
  	int ret;
  
  	BUG_ON(bio_op(failed_bio) == REQ_OP_WRITE);
@@@ -2433,12 -2404,11 +2406,12 @@@
  		"Repair Read Error: submitting new read[%#x] to this_mirror=%d, in_validation=%d",
  		read_mode, failrec->this_mirror, failrec->in_validation);
  
- 	status = tree->ops->submit_bio_hook(inode, bio, failrec->this_mirror,
 -	ret = tree->ops->submit_bio_hook(tree->private_data, bio, failrec->this_mirror,
++	status = tree->ops->submit_bio_hook(tree->private_data, bio, failrec->this_mirror,
  					 failrec->bio_flags, 0);
 -	if (ret) {
 +	if (status) {
- 		free_io_failure(BTRFS_I(inode), failrec);
+ 		free_io_failure(failure_tree, tree, failrec);
  		bio_put(bio);
 +		ret = blk_status_to_errno(status);
  	}
  
  	return ret;
@@@ -2540,9 -2509,9 +2513,9 @@@ endio_readpage_release_extent(struct ex
  static void end_bio_extent_readpage(struct bio *bio)
  {
  	struct bio_vec *bvec;
 -	int uptodate = !bio->bi_error;
 +	int uptodate = !bio->bi_status;
  	struct btrfs_io_bio *io_bio = btrfs_io_bio(bio);
- 	struct extent_io_tree *tree;
+ 	struct extent_io_tree *tree, *failure_tree;
  	u64 offset = 0;
  	u64 start;
  	u64 end;
@@@ -2560,9 -2529,10 +2533,10 @@@
  
  		btrfs_debug(fs_info,
  			"end_bio_extent_readpage: bi_sector=%llu, err=%d, mirror=%u",
 -			(u64)bio->bi_iter.bi_sector, bio->bi_error,
 +			(u64)bio->bi_iter.bi_sector, bio->bi_status,
  			io_bio->mirror_num);
  		tree = &BTRFS_I(inode)->io_tree;
+ 		failure_tree = &BTRFS_I(inode)->io_failure_tree;
  
  		/* We always issue full-page reads, but if some block
  		 * in a page fails to read, blk_update_request() will
diff --cc fs/btrfs/extent_io.h
index 487ca0207cb6,aeafdb35d90b..d4942d94a16b
--- a/fs/btrfs/extent_io.h
+++ b/fs/btrfs/extent_io.h
@@@ -92,9 -92,9 +92,9 @@@ struct btrfs_inode
  struct btrfs_io_bio;
  struct io_failure_record;
  
- typedef	blk_status_t (extent_submit_bio_hook_t)(struct inode *inode,
 -typedef	int (extent_submit_bio_hook_t)(void *private_data, struct bio *bio,
 -				       int mirror_num, unsigned long bio_flags,
 -				       u64 bio_offset);
++typedef	blk_status_t (extent_submit_bio_hook_t)(void *private_data,
 +		struct bio *bio, int mirror_num, unsigned long bio_flags,
 +		u64 bio_offset);
  struct extent_io_ops {
  	/*
  	 * The following callbacks must be allways defined, the function
diff --cc fs/btrfs/inode.c
index 556c93060606,5d3c6ac960fd..8d050314591c
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@@ -1900,11 -1900,12 +1899,12 @@@ int btrfs_merge_bio_hook(struct page *p
   * At IO completion time the cums attached on the ordered extent record
   * are inserted into the btree
   */
- static blk_status_t __btrfs_submit_bio_start(struct inode *inode,
- 		struct bio *bio, int mirror_num, unsigned long bio_flags,
- 		u64 bio_offset)
 -static int __btrfs_submit_bio_start(void *private_data, struct bio *bio,
++static blk_status_t __btrfs_submit_bio_start(void *private_data, struct bio *bio,
+ 				    int mirror_num, unsigned long bio_flags,
+ 				    u64 bio_offset)
  {
+ 	struct inode *inode = private_data;
 -	int ret = 0;
 +	blk_status_t ret = 0;
  
  	ret = btrfs_csum_one_bio(inode, bio, 0, 0);
  	BUG_ON(ret); /* -ENOMEM */
@@@ -1919,12 -1920,13 +1919,13 @@@
   * At IO completion time the cums attached on the ordered extent record
   * are inserted into the btree
   */
- static blk_status_t __btrfs_submit_bio_done(struct inode *inode,
- 		struct bio *bio, int mirror_num, unsigned long bio_flags,
- 		u64 bio_offset)
 -static int __btrfs_submit_bio_done(void *private_data, struct bio *bio,
++static blk_status_t __btrfs_submit_bio_done(void *private_data, struct bio *bio,
+ 			  int mirror_num, unsigned long bio_flags,
+ 			  u64 bio_offset)
  {
+ 	struct inode *inode = private_data;
  	struct btrfs_fs_info *fs_info = btrfs_sb(inode->i_sb);
 -	int ret;
 +	blk_status_t ret;
  
  	ret = btrfs_map_bio(fs_info, bio, mirror_num, 1);
  	if (ret) {
@@@ -1938,10 -1940,11 +1939,11 @@@
   * extent_io.c submission hook. This does the right thing for csum calculation
   * on write, or reading the csums from the tree before a read
   */
- static blk_status_t btrfs_submit_bio_hook(struct inode *inode, struct bio *bio,
- 			  int mirror_num, unsigned long bio_flags,
- 			  u64 bio_offset)
 -static int btrfs_submit_bio_hook(void *private_data, struct bio *bio,
++static blk_status_t btrfs_submit_bio_hook(void *private_data, struct bio *bio,
+ 				 int mirror_num, unsigned long bio_flags,
+ 				 u64 bio_offset)
  {
+ 	struct inode *inode = private_data;
  	struct btrfs_fs_info *fs_info = btrfs_sb(inode->i_sb);
  	struct btrfs_root *root = BTRFS_I(inode)->root;
  	enum btrfs_wq_endio_type metadata = BTRFS_WQ_ENDIO_DATA;
@@@ -8033,10 -8046,12 +8045,12 @@@ struct btrfs_retry_complete 
  static void btrfs_retry_endio_nocsum(struct bio *bio)
  {
  	struct btrfs_retry_complete *done = bio->bi_private;
+ 	struct inode *inode = done->inode;
  	struct bio_vec *bvec;
+ 	struct extent_io_tree *io_tree, *failure_tree;
  	int i;
  
 -	if (bio->bi_error)
 +	if (bio->bi_status)
  		goto end;
  
  	ASSERT(bio->bi_vcnt == 1);
@@@ -8140,11 -8171,12 +8170,12 @@@ end
  	bio_put(bio);
  }
  
 -static int __btrfs_subio_endio_read(struct inode *inode,
 -				    struct btrfs_io_bio *io_bio, int err)
 +static blk_status_t __btrfs_subio_endio_read(struct inode *inode,
 +		struct btrfs_io_bio *io_bio, blk_status_t err)
  {
  	struct btrfs_fs_info *fs_info;
- 	struct bio_vec *bvec;
+ 	struct bio_vec bvec;
+ 	struct bvec_iter iter;
  	struct btrfs_retry_complete done;
  	u64 start;
  	u64 offset = 0;
@@@ -8231,10 -8265,13 +8264,13 @@@ static void btrfs_endio_direct_read(str
  	struct inode *inode = dip->inode;
  	struct bio *dio_bio;
  	struct btrfs_io_bio *io_bio = btrfs_io_bio(bio);
 -	int err = bio->bi_error;
 +	blk_status_t err = bio->bi_status;
  
- 	if (dip->flags & BTRFS_DIO_ORIG_BIO_SUBMITTED)
+ 	if (dip->flags & BTRFS_DIO_ORIG_BIO_SUBMITTED) {
  		err = btrfs_subio_endio_read(inode, io_bio, err);
+ 		if (!err)
 -			bio->bi_error = 0;
++			bio->bi_status = 0;
+ 	}
  
  	unlock_extent(&BTRFS_I(inode)->io_tree, dip->logical_offset,
  		      dip->logical_offset + dip->bytes - 1);
@@@ -8307,11 -8344,12 +8343,12 @@@ static void btrfs_endio_direct_write(st
  	bio_put(bio);
  }
  
- static blk_status_t __btrfs_submit_bio_start_direct_io(struct inode *inode,
 -static int __btrfs_submit_bio_start_direct_io(void *private_data,
++static blk_status_t __btrfs_submit_bio_start_direct_io(void *private_data,
  				    struct bio *bio, int mirror_num,
  				    unsigned long bio_flags, u64 offset)
  {
+ 	struct inode *inode = private_data;
 -	int ret;
 +	blk_status_t ret;
  	ret = btrfs_csum_one_bio(inode, bio, offset, 1);
  	BUG_ON(ret); /* -ENOMEM */
  	return 0;
@@@ -8357,17 -8395,7 +8394,7 @@@ out
  	bio_put(bio);
  }
  
- static struct bio *btrfs_dio_bio_alloc(struct block_device *bdev,
- 				       u64 first_sector, gfp_t gfp_flags)
- {
- 	struct bio *bio;
- 	bio = btrfs_bio_alloc(bdev, first_sector, BIO_MAX_PAGES, gfp_flags);
- 	if (bio)
- 		bio_associate_current(bio);
- 	return bio;
- }
- 
 -static inline int btrfs_lookup_and_bind_dio_csum(struct inode *inode,
 +static inline blk_status_t btrfs_lookup_and_bind_dio_csum(struct inode *inode,
  						 struct btrfs_dio_private *dip,
  						 struct bio *bio,
  						 u64 file_offset)
@@@ -8672,10 -8675,10 +8674,10 @@@ free_ordered
  		 * Releases and cleans up our dio_bio, no need to bio_put()
  		 * nor bio_endio()/bio_io_error() against dio_bio.
  		 */
 -		dio_end_io(dio_bio, ret);
 +		dio_end_io(dio_bio);
  	}
- 	if (io_bio)
- 		bio_put(io_bio);
+ 	if (bio)
+ 		bio_put(bio);
  	kfree(dip);
  }
  
@@@ -8754,11 -8758,9 +8757,12 @@@ static ssize_t btrfs_direct_IO(struct k
  			dio_data.overwrite = 1;
  			inode_unlock(inode);
  			relock = true;
 +		} else if (iocb->ki_flags & IOCB_NOWAIT) {
 +			ret = -EAGAIN;
 +			goto out;
  		}
- 		ret = btrfs_delalloc_reserve_space(inode, offset, count);
+ 		ret = btrfs_delalloc_reserve_space(inode, &data_reserved,
+ 						   offset, count);
  		if (ret)
  			goto out;
  		dio_data.outstanding_extents = count_max_extents(count);

-- 
Cheers,
Stephen Rothwell
