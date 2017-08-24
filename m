From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the btrfs-kdave tree with Linus' tree
Date: Fri, 25 Aug 2017 09:58:25 +1000
Message-ID: <20170825095825.60c576f3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34443 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753702AbdHXX61 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 24 Aug 2017 19:58:27 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Sterba <dsterba@suse.cz>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Omar Sandoval <osandov@fb.com>, Nikolay Borisov <nborisov@suse.com>, Chris Mason <clm@fb.com>

Hi David,

Today's linux-next merge of the btrfs-kdave tree got a conflict in:

  fs/btrfs/inode.c

between commit:

  58efbc9f5463 ("Btrfs: fix blk_status_t/errno confusion")

from Linus' tree and commit:

  e6961cac730f ("btrfs: Move skip checksum check from btrfs_submit_direct to __btrfs_submit_dio_bio")

from the btrfs-kdave tree.

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
index 24bcd5cd9cf2,d184a46e46c4..000000000000
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@@ -7991,10 -8080,9 +8081,10 @@@ static blk_status_t dio_read_error(stru
  	struct extent_io_tree *failure_tree = &BTRFS_I(inode)->io_failure_tree;
  	struct bio *bio;
  	int isector;
- 	int read_mode = 0;
+ 	unsigned int read_mode = 0;
  	int segs;
  	int ret;
 +	blk_status_t status;
  
  	BUG_ON(bio_op(failed_bio) == REQ_OP_WRITE);
  
@@@ -8021,11 -8109,11 +8111,11 @@@
  	bio_set_op_attrs(bio, REQ_OP_READ, read_mode);
  
  	btrfs_debug(BTRFS_I(inode)->root->fs_info,
- 		    "Repair DIO Read Error: submitting new dio read[%#x] to this_mirror=%d, in_validation=%d\n",
+ 		    "repair DIO read error: submitting new dio read[%#x] to this_mirror=%d, in_validation=%d",
  		    read_mode, failrec->this_mirror, failrec->in_validation);
  
 -	ret = submit_dio_repair_bio(inode, bio, failrec->this_mirror);
 -	if (ret) {
 +	status = submit_dio_repair_bio(inode, bio, failrec->this_mirror);
 +	if (status) {
  		free_io_failure(failure_tree, io_tree, failrec);
  		bio_put(bio);
  	}
@@@ -8426,9 -8513,8 +8516,9 @@@ static inline blk_status_t btrfs_lookup
  	return 0;
  }
  
 -static inline int __btrfs_submit_dio_bio(struct bio *bio, struct inode *inode,
 -					 u64 file_offset, int async_submit)
 +static inline blk_status_t
 +__btrfs_submit_dio_bio(struct bio *bio, struct inode *inode, u64 file_offset,
- 		       int skip_sum, int async_submit)
++		       int async_submit)
  {
  	struct btrfs_fs_info *fs_info = btrfs_sb(inode->i_sb);
  	struct btrfs_dio_private *dip = bio->bi_private;
@@@ -8541,9 -8625,9 +8630,9 @@@ static int btrfs_submit_direct_hook(str
  		 */
  		atomic_inc(&dip->pending_bios);
  
- 		status = __btrfs_submit_dio_bio(bio, inode, file_offset, skip_sum,
 -		ret = __btrfs_submit_dio_bio(bio, inode, file_offset,
 -					     async_submit);
 -		if (ret) {
++		status = __btrfs_submit_dio_bio(bio, inode, file_offset,
 +						async_submit);
 +		if (status) {
  			bio_put(bio);
  			atomic_dec(&dip->pending_bios);
  			goto out_err;
@@@ -8561,9 -8645,8 +8650,8 @@@
  	} while (submit_len > 0);
  
  submit:
- 	status = __btrfs_submit_dio_bio(bio, inode, file_offset, skip_sum,
- 					async_submit);
 -	ret = __btrfs_submit_dio_bio(bio, inode, file_offset, async_submit);
 -	if (!ret)
++	status = __btrfs_submit_dio_bio(bio, inode, file_offset, async_submit);
 +	if (!status)
  		return 0;
  
  	bio_put(bio);
