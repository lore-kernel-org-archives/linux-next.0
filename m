From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with the btrfs-kdave
 tree
Date: Tue, 13 Jun 2017 13:27:24 +1000
Message-ID: <20170613132724.4666311b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>, David Sterba <dsterba@suse.cz>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Josef Bacik <josef@toxicpanda.com>
List-Id: linux-next.vger.kernel.org

Hi Jens,

Today's linux-next merge of the block tree got conflicts in:

  fs/btrfs/disk-io.c
  fs/btrfs/disk-io.h

between commits:

  b6f68032afbe ("Btrfs: replace tree->mapping with tree->private_data")
  9035b5dbc576 ("btrfs: btrfs_io_bio_alloc never fails, skip error handling")

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
index 9f2ffe2c6afb,6036d15b47b8..000000000000
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
- 			int mirror_num, unsigned long bio_flags,
- 			u64 bio_offset, void *private_data,
- 			extent_submit_bio_hook_t *submit_bio_start,
- 			extent_submit_bio_hook_t *submit_bio_done)
 -blk_status_t btrfs_wq_submit_bio(struct btrfs_fs_info *fs_info,
 -		struct inode *inode, struct bio *bio, int mirror_num,
 -		unsigned long bio_flags, u64 bio_offset,
 -		extent_submit_bio_hook_t *submit_bio_start,
 -		extent_submit_bio_hook_t *submit_bio_done)
++blk_status_t btrfs_wq_submit_bio(struct btrfs_fs_info *fs_info, struct bio *bio,
++				 int mirror_num, unsigned long bio_flags,
++				 u64 bio_offset, void *private_data,
++				 extent_submit_bio_hook_t *submit_bio_start,
++				 extent_submit_bio_hook_t *submit_bio_done)
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
@@@ -971,12 -971,12 +971,14 @@@ static blk_status_t btree_csum_one_bio(
  			break;
  	}
  
- 	return ret;
+ 	return errno_to_blk_status(ret);
  }
  
- static int __btree_submit_bio_start(void *private_data, struct bio *bio,
- 				    int mirror_num, unsigned long bio_flags,
- 				    u64 bio_offset)
 -static blk_status_t __btree_submit_bio_start(struct inode *inode,
 -		struct bio *bio, int mirror_num, unsigned long bio_flags,
 -		u64 bio_offset)
++static blk_status_t __btree_submit_bio_start(void *private_data,
++					     struct bio *bio,
++					     int mirror_num,
++					     unsigned long bio_flags,
++					     u64 bio_offset)
  {
  	/*
  	 * when we're called for a write, we're already in the async
@@@ -985,12 -985,11 +987,12 @@@
  	return btree_csum_one_bio(bio);
  }
  
- static int __btree_submit_bio_done(void *private_data, struct bio *bio,
- 				 int mirror_num, unsigned long bio_flags,
- 				 u64 bio_offset)
 -static blk_status_t __btree_submit_bio_done(struct inode *inode,
++static blk_status_t __btree_submit_bio_done(void *private_data,
+ 		struct bio *bio, int mirror_num, unsigned long bio_flags,
+ 		u64 bio_offset)
  {
 +	struct inode *inode = private_data;
- 	int ret;
+ 	blk_status_t ret;
  
  	/*
  	 * when we're called for a write, we're already in the async
@@@ -1015,14 -1014,13 +1017,14 @@@ static int check_async_write(unsigned l
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
diff --cc fs/btrfs/disk-io.h
index 4654d129aa76,c581927555f3..000000000000
--- a/fs/btrfs/disk-io.h
+++ b/fs/btrfs/disk-io.h
@@@ -118,16 -118,16 +118,16 @@@ int btrfs_buffer_uptodate(struct extent
  int btrfs_read_buffer(struct extent_buffer *buf, u64 parent_transid);
  u32 btrfs_csum_data(const char *data, u32 seed, size_t len);
  void btrfs_csum_final(u32 crc, u8 *result);
- int btrfs_bio_wq_end_io(struct btrfs_fs_info *info, struct bio *bio,
+ blk_status_t btrfs_bio_wq_end_io(struct btrfs_fs_info *info, struct bio *bio,
  			enum btrfs_wq_endio_type metadata);
- int btrfs_wq_submit_bio(struct btrfs_fs_info *fs_info, struct bio *bio,
 -blk_status_t btrfs_wq_submit_bio(struct btrfs_fs_info *fs_info,
 -		struct inode *inode, struct bio *bio, int mirror_num,
 -		unsigned long bio_flags, u64 bio_offset,
 -		extent_submit_bio_hook_t *submit_bio_start,
 -		extent_submit_bio_hook_t *submit_bio_done);
++blk_status_t btrfs_wq_submit_bio(struct btrfs_fs_info *fs_info, struct bio *bio,
 +			int mirror_num, unsigned long bio_flags,
 +			u64 bio_offset, void *private_data,
 +			extent_submit_bio_hook_t *submit_bio_start,
 +			extent_submit_bio_hook_t *submit_bio_done);
  unsigned long btrfs_async_submit_limit(struct btrfs_fs_info *info);
  int btrfs_write_tree_block(struct extent_buffer *buf);
 -int btrfs_wait_tree_block_writeback(struct extent_buffer *buf);
 +void btrfs_wait_tree_block_writeback(struct extent_buffer *buf);
  int btrfs_init_log_root_tree(struct btrfs_trans_handle *trans,
  			     struct btrfs_fs_info *fs_info);
  int btrfs_add_log_tree(struct btrfs_trans_handle *trans,
