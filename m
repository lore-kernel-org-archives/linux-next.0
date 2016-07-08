From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with the btrfs-kdave
 tree
Date: Fri, 8 Jul 2016 13:49:01 +1000
Message-ID: <20160708134901.233611c5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47915 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753672AbcGHDtF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 7 Jul 2016 23:49:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>, David Sterba <dsterba@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mike Christie <mchristi@redhat.com>, Jeff Mahoney <jeffm@suse.com>, Liu Bo <bo.li.liu@oracle.com>

Hi Jens,

Today's linux-next merge of the block tree got a conflict in:

  fs/btrfs/inode.c

between commit:

  b286384aac32 ("btrfs: root->fs_info cleanup, add fs_info convenience variables")
  26112f7f4726 ("btrfs: take an fs_info parameter directly when the root is not used otherwise")
  712518c27ed2 ("Btrfs: cleanup BUG_ON in merge_bio")

from the btrfs-kdave tree and commit:

  37226b2111b0 ("btrfs: use bio op accessors")
  b3d3fa519905 ("btrfs: update __btrfs_map_block for REQ_OP transition")
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

diff --cc fs/btrfs/inode.c
index 31b1195eb3d4,1323e4faa44c..000000000000
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@@ -1835,12 -1822,8 +1835,12 @@@ static void btrfs_clear_bit_hook(struc
  /*
   * extent_io.c merge_bio_hook, this must check the chunk tree to make sure
   * we don't create bios that span stripes or chunks
 + *
 + * return 1 if page cannot be merged to bio
 + * return 0 if page can be merged to bio
 + * return error otherwise
   */
- int btrfs_merge_bio_hook(int rw, struct page *page, unsigned long offset,
+ int btrfs_merge_bio_hook(struct page *page, unsigned long offset,
  			 size_t size, struct bio *bio,
  			 unsigned long bio_flags)
  {
@@@ -1856,9 -1838,10 +1856,10 @@@
  
  	length = bio->bi_iter.bi_size;
  	map_length = length;
- 	ret = btrfs_map_block(fs_info, rw, logical, &map_length, NULL, 0);
 -	ret = btrfs_map_block(root->fs_info, bio_op(bio), logical,
 -			      &map_length, NULL, 0);
 -	/* Will always return 0 with map_multi == NULL */
 -	BUG_ON(ret < 0);
++	ret = btrfs_map_block(fs_info, bio_op(bio), logical, &map_length,
++			      NULL, 0);
 +	if (ret < 0)
 +		return ret;
  	if (map_length < length + size)
  		return 1;
  	return 0;
@@@ -1872,14 -1855,14 +1873,13 @@@
   * At IO completion time the cums attached on the ordered extent record
   * are inserted into the btree
   */
- static int __btrfs_submit_bio_start(struct inode *inode, int rw,
- 				    struct bio *bio, int mirror_num,
- 				    unsigned long bio_flags,
+ static int __btrfs_submit_bio_start(struct inode *inode, struct bio *bio,
+ 				    int mirror_num, unsigned long bio_flags,
  				    u64 bio_offset)
  {
 -	struct btrfs_root *root = BTRFS_I(inode)->root;
  	int ret = 0;
  
 -	ret = btrfs_csum_one_bio(root, inode, bio, 0, 0);
 +	ret = btrfs_csum_one_bio(inode, bio, 0, 0);
  	BUG_ON(ret); /* -ENOMEM */
  	return 0;
  }
@@@ -1896,10 -1879,10 +1896,10 @@@ static int __btrfs_submit_bio_done(stru
  			  int mirror_num, unsigned long bio_flags,
  			  u64 bio_offset)
  {
 -	struct btrfs_root *root = BTRFS_I(inode)->root;
 +	struct btrfs_fs_info *fs_info = btrfs_sb(inode->i_sb);
  	int ret;
  
- 	ret = btrfs_map_bio(fs_info, rw, bio, mirror_num, 1);
 -	ret = btrfs_map_bio(root, bio, mirror_num, 1);
++	ret = btrfs_map_bio(fs_info, bio, mirror_num, 1);
  	if (ret) {
  		bio->bi_error = ret;
  		bio_endio(bio);
@@@ -1927,8 -1909,8 +1927,8 @@@ static int btrfs_submit_bio_hook(struc
  	if (btrfs_is_free_space_inode(inode))
  		metadata = BTRFS_WQ_ENDIO_FREE_SPACE;
  
- 	if (!(rw & REQ_WRITE)) {
+ 	if (bio_op(bio) != REQ_OP_WRITE) {
 -		ret = btrfs_bio_wq_end_io(root->fs_info, bio, metadata);
 +		ret = btrfs_bio_wq_end_io(fs_info, bio, metadata);
  		if (ret)
  			goto out;
  
@@@ -1948,7 -1930,8 +1948,7 @@@
  		if (root->root_key.objectid == BTRFS_DATA_RELOC_TREE_OBJECTID)
  			goto mapit;
  		/* we're doing a write, do the async checksumming */
- 		ret = btrfs_wq_submit_bio(fs_info, inode, rw, bio, mirror_num,
 -		ret = btrfs_wq_submit_bio(BTRFS_I(inode)->root->fs_info,
 -				   inode, bio, mirror_num,
++		ret = btrfs_wq_submit_bio(fs_info, inode, bio, mirror_num,
  				   bio_flags, bio_offset,
  				   __btrfs_submit_bio_start,
  				   __btrfs_submit_bio_done);
@@@ -1960,7 -1943,7 +1960,7 @@@
  	}
  
  mapit:
- 	ret = btrfs_map_bio(fs_info, rw, bio, mirror_num, 0);
 -	ret = btrfs_map_bio(root, bio, mirror_num, 0);
++	ret = btrfs_map_bio(fs_info, bio, mirror_num, 0);
  
  out:
  	if (ret < 0) {
@@@ -7865,12 -7777,12 +7865,12 @@@ err
  }
  
  static inline int submit_dio_repair_bio(struct inode *inode, struct bio *bio,
- 					int rw, int mirror_num)
+ 					int mirror_num)
  {
 -	struct btrfs_root *root = BTRFS_I(inode)->root;
 +	struct btrfs_fs_info *fs_info = btrfs_sb(inode->i_sb);
  	int ret;
  
- 	BUG_ON(rw & REQ_WRITE);
+ 	BUG_ON(bio_op(bio) == REQ_OP_WRITE);
  
  	bio_get(bio);
  
@@@ -7878,7 -7791,7 +7878,7 @@@
  	if (ret)
  		goto err;
  
- 	ret = btrfs_map_bio(fs_info, rw, bio, mirror_num, 0);
 -	ret = btrfs_map_bio(root, bio, mirror_num, 0);
++	ret = btrfs_map_bio(fs_info, bio, mirror_num, 0);
  err:
  	bio_put(bio);
  	return ret;
@@@ -8343,12 -8259,12 +8343,12 @@@ static inline int btrfs_lookup_and_bind
  }
  
  static inline int __btrfs_submit_dio_bio(struct bio *bio, struct inode *inode,
- 					 int rw, u64 file_offset, int skip_sum,
+ 					 u64 file_offset, int skip_sum,
  					 int async_submit)
  {
 +	struct btrfs_fs_info *fs_info = btrfs_sb(inode->i_sb);
  	struct btrfs_dio_private *dip = bio->bi_private;
- 	int write = rw & REQ_WRITE;
+ 	bool write = bio_op(bio) == REQ_OP_WRITE;
 -	struct btrfs_root *root = BTRFS_I(inode)->root;
  	int ret;
  
  	if (async_submit)
@@@ -8366,10 -8283,10 +8366,10 @@@
  		goto map;
  
  	if (write && async_submit) {
- 		ret = btrfs_wq_submit_bio(fs_info, inode, rw, bio, 0, 0,
 -		ret = btrfs_wq_submit_bio(root->fs_info,
 -				   inode, bio, 0, 0, file_offset,
 -				   __btrfs_submit_bio_start_direct_io,
 -				   __btrfs_submit_bio_done);
++		ret = btrfs_wq_submit_bio(fs_info, inode, bio, 0, 0,
 +					  file_offset,
 +					  __btrfs_submit_bio_start_direct_io,
 +					  __btrfs_submit_bio_done);
  		goto err;
  	} else if (write) {
  		/*
@@@ -8386,7 -8303,7 +8386,7 @@@
  			goto err;
  	}
  map:
- 	ret = btrfs_map_bio(fs_info, rw, bio, 0, async_submit);
 -	ret = btrfs_map_bio(root, bio, 0, async_submit);
++	ret = btrfs_map_bio(fs_info, bio, 0, async_submit);
  err:
  	bio_put(bio);
  	return ret;
@@@ -8412,8 -8328,8 +8412,8 @@@ static int btrfs_submit_direct_hook(str
  	int i;
  
  	map_length = orig_bio->bi_iter.bi_size;
- 	ret = btrfs_map_block(fs_info, rw, start_sector << 9, &map_length,
- 			      NULL, 0);
 -	ret = btrfs_map_block(root->fs_info, bio_op(orig_bio),
++	ret = btrfs_map_block(fs_info, bio_op(orig_bio),
+ 			      start_sector << 9, &map_length, NULL, 0);
  	if (ret)
  		return -EIO;
  
@@@ -8475,7 -8393,8 +8477,8 @@@ next_block
  			btrfs_io_bio(bio)->logical = file_offset;
  
  			map_length = orig_bio->bi_iter.bi_size;
- 			ret = btrfs_map_block(fs_info, rw, start_sector << 9,
 -			ret = btrfs_map_block(root->fs_info, bio_op(orig_bio),
++			ret = btrfs_map_block(fs_info, bio_op(orig_bio),
+ 					      start_sector << 9,
  					      &map_length, NULL, 0);
  			if (ret) {
  				bio_put(bio);
