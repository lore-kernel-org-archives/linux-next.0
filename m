From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with the btrfs-kdave
 tree
Date: Tue, 20 Jun 2017 11:37:33 +1000
Message-ID: <20170620113733.743ac4df@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46973 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751324AbdFTBhg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 19 Jun 2017 21:37:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>, David Sterba <dsterba@suse.cz>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Josef Bacik <josef@toxicpanda.com>, Liu Bo <bo.li.liu@oracle.com>, Guoqing Jiang <gqjiang@suse.com>

Hi Jens,

Today's linux-next merge of the block tree got a conflict in:

  fs/btrfs/inode.c

between commits:

  c6100a4b4e3d ("Btrfs: replace tree->mapping with tree->private_data")
  725130bac585 ("Btrfs: use bio_clone_bioset_partial to simplify DIO submit")
  3892ac9086a8 ("Btrfs: unify naming of btrfs_io_bio")
  054ec2f626ed ("btrfs: simplify code with bio_io_error")

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

diff --cc fs/btrfs/inode.c
index 5d3c6ac960fd,f942293dd7e7..000000000000
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@@ -1900,12 -1900,11 +1899,12 @@@ int btrfs_merge_bio_hook(struct page *p
   * At IO completion time the cums attached on the ordered extent record
   * are inserted into the btree
   */
- static int __btrfs_submit_bio_start(void *private_data, struct bio *bio,
 -static blk_status_t __btrfs_submit_bio_start(struct inode *inode,
 -		struct bio *bio, int mirror_num, unsigned long bio_flags,
 -		u64 bio_offset)
++static blk_status_t __btrfs_submit_bio_start(void *private_data, struct bio *bio,
 +				    int mirror_num, unsigned long bio_flags,
 +				    u64 bio_offset)
  {
 +	struct inode *inode = private_data;
- 	int ret = 0;
+ 	blk_status_t ret = 0;
  
  	ret = btrfs_csum_one_bio(inode, bio, 0, 0);
  	BUG_ON(ret); /* -ENOMEM */
@@@ -1920,13 -1919,12 +1919,13 @@@
   * At IO completion time the cums attached on the ordered extent record
   * are inserted into the btree
   */
- static int __btrfs_submit_bio_done(void *private_data, struct bio *bio,
 -static blk_status_t __btrfs_submit_bio_done(struct inode *inode,
 -		struct bio *bio, int mirror_num, unsigned long bio_flags,
 -		u64 bio_offset)
++static blk_status_t __btrfs_submit_bio_done(void *private_data, struct bio *bio,
 +			  int mirror_num, unsigned long bio_flags,
 +			  u64 bio_offset)
  {
 +	struct inode *inode = private_data;
  	struct btrfs_fs_info *fs_info = btrfs_sb(inode->i_sb);
- 	int ret;
+ 	blk_status_t ret;
  
  	ret = btrfs_map_bio(fs_info, bio, mirror_num, 1);
  	if (ret) {
@@@ -1940,11 -1938,10 +1939,11 @@@
   * extent_io.c submission hook. This does the right thing for csum calculation
   * on write, or reading the csums from the tree before a read
   */
- static int btrfs_submit_bio_hook(void *private_data, struct bio *bio,
 -static blk_status_t btrfs_submit_bio_hook(struct inode *inode, struct bio *bio,
 -			  int mirror_num, unsigned long bio_flags,
 -			  u64 bio_offset)
++static blk_status_t btrfs_submit_bio_hook(void *private_data, struct bio *bio,
 +				 int mirror_num, unsigned long bio_flags,
 +				 u64 bio_offset)
  {
 +	struct inode *inode = private_data;
  	struct btrfs_fs_info *fs_info = btrfs_sb(inode->i_sb);
  	struct btrfs_root *root = BTRFS_I(inode)->root;
  	enum btrfs_wq_endio_type metadata = BTRFS_WQ_ENDIO_DATA;
@@@ -8046,12 -8033,10 +8045,12 @@@ struct btrfs_retry_complete 
  static void btrfs_retry_endio_nocsum(struct bio *bio)
  {
  	struct btrfs_retry_complete *done = bio->bi_private;
 +	struct inode *inode = done->inode;
  	struct bio_vec *bvec;
 +	struct extent_io_tree *io_tree, *failure_tree;
  	int i;
  
- 	if (bio->bi_error)
+ 	if (bio->bi_status)
  		goto end;
  
  	ASSERT(bio->bi_vcnt == 1);
@@@ -8171,12 -8140,11 +8170,12 @@@ end
  	bio_put(bio);
  }
  
- static int __btrfs_subio_endio_read(struct inode *inode,
- 				    struct btrfs_io_bio *io_bio, int err)
+ static blk_status_t __btrfs_subio_endio_read(struct inode *inode,
+ 		struct btrfs_io_bio *io_bio, blk_status_t err)
  {
  	struct btrfs_fs_info *fs_info;
 -	struct bio_vec *bvec;
 +	struct bio_vec bvec;
 +	struct bvec_iter iter;
  	struct btrfs_retry_complete done;
  	u64 start;
  	u64 offset = 0;
@@@ -8265,13 -8231,10 +8264,13 @@@ static void btrfs_endio_direct_read(str
  	struct inode *inode = dip->inode;
  	struct bio *dio_bio;
  	struct btrfs_io_bio *io_bio = btrfs_io_bio(bio);
- 	int err = bio->bi_error;
+ 	blk_status_t err = bio->bi_status;
  
 -	if (dip->flags & BTRFS_DIO_ORIG_BIO_SUBMITTED)
 +	if (dip->flags & BTRFS_DIO_ORIG_BIO_SUBMITTED) {
  		err = btrfs_subio_endio_read(inode, io_bio, err);
 +		if (!err)
- 			bio->bi_error = 0;
++			bio->bi_status = 0;
 +	}
  
  	unlock_extent(&BTRFS_I(inode)->io_tree, dip->logical_offset,
  		      dip->logical_offset + dip->bytes - 1);
@@@ -8344,12 -8307,11 +8343,12 @@@ static void btrfs_endio_direct_write(st
  	bio_put(bio);
  }
  
- static int __btrfs_submit_bio_start_direct_io(void *private_data,
 -static blk_status_t __btrfs_submit_bio_start_direct_io(struct inode *inode,
++static blk_status_t __btrfs_submit_bio_start_direct_io(void *private_data,
  				    struct bio *bio, int mirror_num,
  				    unsigned long bio_flags, u64 offset)
  {
 +	struct inode *inode = private_data;
- 	int ret;
+ 	blk_status_t ret;
  	ret = btrfs_csum_one_bio(inode, bio, offset, 1);
  	BUG_ON(ret); /* -ENOMEM */
  	return 0;
@@@ -8395,7 -8357,17 +8394,7 @@@ out
  	bio_put(bio);
  }
  
- static inline int btrfs_lookup_and_bind_dio_csum(struct inode *inode,
 -static struct bio *btrfs_dio_bio_alloc(struct block_device *bdev,
 -				       u64 first_sector, gfp_t gfp_flags)
 -{
 -	struct bio *bio;
 -	bio = btrfs_bio_alloc(bdev, first_sector, BIO_MAX_PAGES, gfp_flags);
 -	if (bio)
 -		bio_associate_current(bio);
 -	return bio;
 -}
 -
+ static inline blk_status_t btrfs_lookup_and_bind_dio_csum(struct inode *inode,
  						 struct btrfs_dio_private *dip,
  						 struct bio *bio,
  						 u64 file_offset)
@@@ -8675,10 -8672,10 +8674,10 @@@ free_ordered
  		 * Releases and cleans up our dio_bio, no need to bio_put()
  		 * nor bio_endio()/bio_io_error() against dio_bio.
  		 */
- 		dio_end_io(dio_bio, ret);
+ 		dio_end_io(dio_bio);
  	}
 -	if (io_bio)
 -		bio_put(io_bio);
 +	if (bio)
 +		bio_put(bio);
  	kfree(dip);
  }
  
