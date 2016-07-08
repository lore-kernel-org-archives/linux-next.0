From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with the btrfs-kdave
 tree
Date: Fri, 8 Jul 2016 13:27:36 +1000
Message-ID: <20160708132736.2509cbea@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50950 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753600AbcGHD1i (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 7 Jul 2016 23:27:38 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>, David Sterba <dsterba@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jeff Mahoney <jeffm@suse.com>

Hi Jens,

Today's linux-next merge of the block tree got a conflict in:

  fs/btrfs/disk-io.c

between commit:

  b286384aac32 ("btrfs: root->fs_info cleanup, add fs_info convenience variables")
  26112f7f4726 ("btrfs: take an fs_info parameter directly when the root is not used otherwise")

from the btrfs-kdave tree and commit:

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

diff --cc fs/btrfs/disk-io.c
index 9d778665c9eb,e80ef6eb17e6..000000000000
--- a/fs/btrfs/disk-io.c
+++ b/fs/btrfs/disk-io.c
@@@ -926,7 -921,7 +922,7 @@@ static int __btree_submit_bio_done(stru
  	 * when we're called for a write, we're already in the async
  	 * submission context.  Just jump into btrfs_map_bio
  	 */
- 	ret = btrfs_map_bio(btrfs_sb(inode->i_sb), rw, bio, mirror_num, 1);
 -	ret = btrfs_map_bio(BTRFS_I(inode)->root, bio, mirror_num, 1);
++	ret = btrfs_map_bio(btrfs_sb(inode->i_sb), bio, mirror_num, 1);
  	if (ret) {
  		bio->bi_error = ret;
  		bio_endio(bio);
@@@ -958,23 -952,24 +954,23 @@@ static int btree_submit_bio_hook(struc
  		 * called for a read, do the setup so that checksum validation
  		 * can happen in the async kernel threads
  		 */
 -		ret = btrfs_bio_wq_end_io(BTRFS_I(inode)->root->fs_info,
 -					  bio, BTRFS_WQ_ENDIO_METADATA);
 +		ret = btrfs_bio_wq_end_io(fs_info, bio,
 +					  BTRFS_WQ_ENDIO_METADATA);
  		if (ret)
  			goto out_w_error;
- 		ret = btrfs_map_bio(fs_info, rw, bio, mirror_num, 0);
 -		ret = btrfs_map_bio(BTRFS_I(inode)->root, bio, mirror_num, 0);
++		ret = btrfs_map_bio(fs_info, bio, mirror_num, 0);
  	} else if (!async) {
  		ret = btree_csum_one_bio(bio);
  		if (ret)
  			goto out_w_error;
- 		ret = btrfs_map_bio(fs_info, rw, bio, mirror_num, 0);
 -		ret = btrfs_map_bio(BTRFS_I(inode)->root, bio, mirror_num, 0);
++		ret = btrfs_map_bio(fs_info, bio, mirror_num, 0);
  	} else {
  		/*
  		 * kthread helpers are used to submit writes so that
  		 * checksumming can happen in parallel across all CPUs
  		 */
- 		ret = btrfs_wq_submit_bio(fs_info, inode, rw, bio,
 -		ret = btrfs_wq_submit_bio(BTRFS_I(inode)->root->fs_info,
 -					  inode, bio, mirror_num, 0,
 -					  bio_offset,
++		ret = btrfs_wq_submit_bio(fs_info, inode, bio,
 +					  mirror_num, 0, bio_offset,
  					  __btree_submit_bio_start,
  					  __btree_submit_bio_done);
  	}
