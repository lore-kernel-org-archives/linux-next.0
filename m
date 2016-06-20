From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with the f2fs tree
Date: Mon, 20 Jun 2016 12:37:29 +1000
Message-ID: <20160620123729.45323ce6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>, Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Jens,

Today's linux-next merge of the block tree got a conflict in:

  fs/f2fs/data.c

between commit:

  6d63ed97a1f2 ("f2fs: detect host-managed SMR by feature flag")

from the f2fs tree and commit:

  04d328defd06 ("f2fs: use bio op accessors")

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

diff --cc fs/f2fs/data.c
index ba4963f51bee,8769e8349dff..000000000000
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@@ -97,16 -97,11 +97,16 @@@ static struct bio *__bio_alloc(struct f
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
 +		if (f2fs_sb_mounted_hmsmr(sbi->sb) &&
 +			current->plug && (type == DATA || type == NODE))
 +			blk_finish_plug(current->plug);
 +	}
- 	submit_bio(rw, bio);
+ 	submit_bio(bio);
  }
  
  static void __submit_merged_bio(struct f2fs_bio_info *io)
@@@ -121,7 -116,9 +121,9 @@@
  	else
  		trace_f2fs_submit_write_bio(io->sbi->sb, fio, io->bio);
  
- 	__submit_bio(io->sbi, fio->rw, io->bio, fio->type);
+ 	bio_set_op_attrs(io->bio, fio->op, fio->op_flags);
+ 
 -	__submit_bio(io->sbi, io->bio);
++	__submit_bio(io->sbi, io->bio, fio->type);
  	io->bio = NULL;
  }
  
@@@ -238,8 -237,10 +242,10 @@@ int f2fs_submit_page_bio(struct f2fs_io
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
  
@@@ -1044,7 -1057,7 +1051,7 @@@ got_it
  		 */
  		if (bio && (last_block_in_bio != block_nr - 1)) {
  submit_and_realloc:
- 			__submit_bio(F2FS_I_SB(inode), READ, bio, DATA);
 -			__submit_bio(F2FS_I_SB(inode), bio);
++			__submit_bio(F2FS_I_SB(inode), bio, DATA);
  			bio = NULL;
  		}
  		if (bio == NULL) {
@@@ -1087,7 -1101,7 +1095,7 @@@ set_error_page
  		goto next_page;
  confused:
  		if (bio) {
- 			__submit_bio(F2FS_I_SB(inode), READ, bio, DATA);
 -			__submit_bio(F2FS_I_SB(inode), bio);
++			__submit_bio(F2FS_I_SB(inode), bio, DATA);
  			bio = NULL;
  		}
  		unlock_page(page);
@@@ -1097,7 -1111,7 +1105,7 @@@ next_page
  	}
  	BUG_ON(pages && !list_empty(pages));
  	if (bio)
- 		__submit_bio(F2FS_I_SB(inode), READ, bio, DATA);
 -		__submit_bio(F2FS_I_SB(inode), bio);
++		__submit_bio(F2FS_I_SB(inode), bio, DATA);
  	return 0;
  }
  
