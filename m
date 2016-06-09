From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with the f2fs tree
Date: Thu, 9 Jun 2016 13:26:09 +1000
Message-ID: <20160609132609.449a7d23@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37981 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755048AbcFID0N (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 8 Jun 2016 23:26:13 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mike Christie <mchristi@redhat.com>, Jaegeuk Kim <jaegeuk@kernel.org>

Hi Jens,

Today's linux-next merge of the block tree got conflicts in:

  fs/f2fs/data.c
  fs/f2fs/segment.c

between commits:

  0a87f664d1ad ("f2fs: detect congestion of flush command issues")
  19a5f5e2ef37 ("f2fs: drop any block plugging")

from the f2fs tree and commits:

  4e49ea4a3d27 ("block/fs/drivers: remove rw argument from submit_bio")
  04d328defd06 ("f2fs: use bio op accessors")

from the block tree.

I fixed it up (I hope - see below) and can carry the fix as necessary.
This is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

23caf71be6500030d4601082e2a6e72d8716573b
diff --cc fs/f2fs/data.c
index 607ef4397330,8769e8349dff..5b3404bb3fb6
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@@ -97,15 -97,11 +97,15 @@@ static struct bio *__bio_alloc(struct f
  	return bio;
  }
  
- static inline void __submit_bio(struct f2fs_sb_info *sbi, int rw,
- 			struct bio *bio, enum page_type type)
 -static inline void __submit_bio(struct f2fs_sb_info *sbi, struct bio *bio)
++static inline void __submit_bio(struct f2fs_sb_info *sbi, struct bio *bio,
++				enum page_type type)
  {
- 	if (!is_read_io(rw)) {
 -	if (!is_read_io(bio_op(bio)))
++	if (!is_read_io(bio_op(bio))) {
  		atomic_inc(&sbi->nr_wb_bios);
 +		if (current->plug && (type == DATA || type == NODE))
 +			blk_finish_plug(current->plug);
 +	}
- 	submit_bio(rw, bio);
+ 	submit_bio(bio);
  }
  
  static void __submit_merged_bio(struct f2fs_bio_info *io)
@@@ -120,7 -116,9 +120,9 @@@
  	else
  		trace_f2fs_submit_write_bio(io->sbi->sb, fio, io->bio);
  
- 	__submit_bio(io->sbi, fio->rw, io->bio, fio->type);
+ 	bio_set_op_attrs(io->bio, fio->op, fio->op_flags);
+ 
 -	__submit_bio(io->sbi, io->bio);
++	__submit_bio(io->sbi, io->bio, fio->type);
  	io->bio = NULL;
  }
  
@@@ -237,8 -237,10 +241,10 @@@ int f2fs_submit_page_bio(struct f2fs_io
  		bio_put(bio);
  		return -EFAULT;
  	}
+ 	bio->bi_rw = fio->op_flags;
+ 	bio_set_op_attrs(bio, fio->op, fio->op_flags);
  
- 	__submit_bio(fio->sbi, fio->rw, bio, fio->type);
 -	__submit_bio(fio->sbi, bio);
++	__submit_bio(fio->sbi, bio, fio->type);
  	return 0;
  }
  
@@@ -1043,7 -1057,7 +1050,7 @@@ got_it
  		 */
  		if (bio && (last_block_in_bio != block_nr - 1)) {
  submit_and_realloc:
- 			__submit_bio(F2FS_I_SB(inode), READ, bio, DATA);
 -			__submit_bio(F2FS_I_SB(inode), bio);
++			__submit_bio(F2FS_I_SB(inode), bio, DATA);
  			bio = NULL;
  		}
  		if (bio == NULL) {
@@@ -1086,7 -1101,7 +1094,7 @@@ set_error_page
  		goto next_page;
  confused:
  		if (bio) {
- 			__submit_bio(F2FS_I_SB(inode), READ, bio, DATA);
 -			__submit_bio(F2FS_I_SB(inode), bio);
++			__submit_bio(F2FS_I_SB(inode), bio, DATA);
  			bio = NULL;
  		}
  		unlock_page(page);
@@@ -1096,7 -1111,7 +1104,7 @@@ next_page
  	}
  	BUG_ON(pages && !list_empty(pages));
  	if (bio)
- 		__submit_bio(F2FS_I_SB(inode), READ, bio, DATA);
 -		__submit_bio(F2FS_I_SB(inode), bio);
++		__submit_bio(F2FS_I_SB(inode), bio, DATA);
  	return 0;
  }
  
diff --cc fs/f2fs/segment.c
index 9ff4e3062777,4c2d1fa1e0e2..99aba0047ee7
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@@ -437,10 -439,9 +439,11 @@@ int f2fs_issue_flush(struct f2fs_sb_inf
  		struct bio *bio = f2fs_bio_alloc(0);
  		int ret;
  
 +		atomic_inc(&fcc->submit_flush);
  		bio->bi_bdev = sbi->sb->s_bdev;
- 		ret = submit_bio_wait(WRITE_FLUSH, bio);
+ 		bio_set_op_attrs(bio, REQ_OP_WRITE, WRITE_FLUSH);
+ 		ret = submit_bio_wait(bio);
 +		atomic_dec(&fcc->submit_flush);
  		bio_put(bio);
  		return ret;
  	}
