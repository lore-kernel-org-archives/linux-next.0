From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with the btrfs-kdave
 tree
Date: Tue, 13 Jun 2017 13:34:53 +1000
Message-ID: <20170613133453.16760275@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50229 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751832AbdFMDez (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 12 Jun 2017 23:34:55 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>, David Sterba <dsterba@suse.cz>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Josef Bacik <josef@toxicpanda.com>

Hi Jens,

Today's linux-next merge of the block tree got conflicts in:

  fs/btrfs/extent_io.c
  fs/btrfs/extent_io.h

between commit:

  b6f68032afbe ("Btrfs: replace tree->mapping with tree->private_data")

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

diff --cc fs/btrfs/extent_io.c
index cb4754e57ace,8f66e55e7ba1..000000000000
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@@ -2369,9 -2397,9 +2369,10 @@@ static int bio_readpage_error(struct bi
  	struct io_failure_record *failrec;
  	struct inode *inode = page->mapping->host;
  	struct extent_io_tree *tree = &BTRFS_I(inode)->io_tree;
 +	struct extent_io_tree *failure_tree = &BTRFS_I(inode)->io_failure_tree;
  	struct bio *bio;
  	int read_mode = 0;
+ 	blk_status_t status;
  	int ret;
  
  	BUG_ON(bio_op(failed_bio) == REQ_OP_WRITE);
@@@ -2404,11 -2432,12 +2405,12 @@@
  		"Repair Read Error: submitting new read[%#x] to this_mirror=%d, in_validation=%d",
  		read_mode, failrec->this_mirror, failrec->in_validation);
  
- 	ret = tree->ops->submit_bio_hook(tree->private_data, bio, failrec->this_mirror,
 -	status = tree->ops->submit_bio_hook(inode, bio, failrec->this_mirror,
++	status = tree->ops->submit_bio_hook(tree->private_data, bio, failrec->this_mirror,
  					 failrec->bio_flags, 0);
- 	if (ret) {
+ 	if (status) {
 -		free_io_failure(BTRFS_I(inode), failrec);
 +		free_io_failure(failure_tree, tree, failrec);
  		bio_put(bio);
+ 		ret = blk_status_to_errno(status);
  	}
  
  	return ret;
@@@ -2509,9 -2539,9 +2512,9 @@@ endio_readpage_release_extent(struct ex
  static void end_bio_extent_readpage(struct bio *bio)
  {
  	struct bio_vec *bvec;
- 	int uptodate = !bio->bi_error;
+ 	int uptodate = !bio->bi_status;
  	struct btrfs_io_bio *io_bio = btrfs_io_bio(bio);
 -	struct extent_io_tree *tree;
 +	struct extent_io_tree *tree, *failure_tree;
  	u64 offset = 0;
  	u64 start;
  	u64 end;
@@@ -2529,10 -2559,9 +2532,10 @@@
  
  		btrfs_debug(fs_info,
  			"end_bio_extent_readpage: bi_sector=%llu, err=%d, mirror=%u",
- 			(u64)bio->bi_iter.bi_sector, bio->bi_error,
+ 			(u64)bio->bi_iter.bi_sector, bio->bi_status,
  			io_bio->mirror_num);
  		tree = &BTRFS_I(inode)->io_tree;
 +		failure_tree = &BTRFS_I(inode)->io_failure_tree;
  
  		/* We always issue full-page reads, but if some block
  		 * in a page fails to read, blk_update_request() will
diff --cc fs/btrfs/extent_io.h
index 0f3601712a0a,487ca0207cb6..000000000000
--- a/fs/btrfs/extent_io.h
+++ b/fs/btrfs/extent_io.h
@@@ -92,9 -92,9 +92,9 @@@ struct btrfs_inode
  struct btrfs_io_bio;
  struct io_failure_record;
  
- typedef	int (extent_submit_bio_hook_t)(void *private_data, struct bio *bio,
- 				       int mirror_num, unsigned long bio_flags,
- 				       u64 bio_offset);
 -typedef	blk_status_t (extent_submit_bio_hook_t)(struct inode *inode,
++typedef	blk_status_t (extent_submit_bio_hook_t)(void *private_data,
+ 		struct bio *bio, int mirror_num, unsigned long bio_flags,
+ 		u64 bio_offset);
  struct extent_io_ops {
  	/*
  	 * The following callbacks must be allways defined, the function
