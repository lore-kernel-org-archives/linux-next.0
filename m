From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with the f2fs tree
Date: Mon, 11 Jul 2016 14:52:23 +1000
Message-ID: <20160711145223.5ad4ac24@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58104 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750839AbcGKEwZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 11 Jul 2016 00:52:25 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>, Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mike Christie <mchristi@redhat.com>

Hi Jens,

Today's linux-next merge of the block tree got a conflict in:

  fs/f2fs/data.c

between commits:

  19a5f5e2ef37 ("f2fs: drop any block plugging")
  52763a4b7a21 ("f2fs: detect host-managed SMR by feature flag")
  78682f794479 ("f2fs: fix to avoid reading out encrypted data in page cache")

from the f2fs tree and commits:

  4e49ea4a3d27 ("block/fs/drivers: remove rw argument from submit_bio")
  04d328defd06 ("f2fs: use bio op accessors")

from the block tree.

I fixed it up (see below - I am not confident of these fixups, so
please check and let me know if anything else is needed) and can carry
the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc fs/f2fs/data.c
index 20b30162e7b4,8769e8349dff..000000000000
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@@ -100,16 -97,11 +100,16 @@@ static struct bio *__bio_alloc(struct f
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
@@@ -124,7 -116,9 +124,9 @@@
  	else
  		trace_f2fs_submit_write_bio(io->sbi->sb, fio, io->bio);
  
- 	__submit_bio(io->sbi, fio->rw, io->bio, fio->type);
+ 	bio_set_op_attrs(io->bio, fio->op, fio->op_flags);
+ 
 -	__submit_bio(io->sbi, io->bio);
++	__submit_bio(io->sbi, io->bio, fio->type);
  	io->bio = NULL;
  }
  
@@@ -241,8 -237,10 +245,10 @@@ int f2fs_submit_page_bio(struct f2fs_io
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
  
@@@ -1080,13 -1057,36 +1087,14 @@@ got_it
  		 */
  		if (bio && (last_block_in_bio != block_nr - 1)) {
  submit_and_realloc:
- 			__submit_bio(F2FS_I_SB(inode), READ, bio, DATA);
 -			__submit_bio(F2FS_I_SB(inode), bio);
++			__submit_bio(F2FS_I_SB(inode), bio, DATA);
  			bio = NULL;
  		}
  		if (bio == NULL) {
 -			struct fscrypt_ctx *ctx = NULL;
 -
 -			if (f2fs_encrypted_inode(inode) &&
 -					S_ISREG(inode->i_mode)) {
 -
 -				ctx = fscrypt_get_ctx(inode, GFP_NOFS);
 -				if (IS_ERR(ctx))
 -					goto set_error_page;
 -
 -				/* wait the page to be moved by cleaning */
 -				f2fs_wait_on_encrypted_page_writeback(
 -						F2FS_I_SB(inode), block_nr);
 -			}
 -
 -			bio = bio_alloc(GFP_KERNEL,
 -				min_t(int, nr_pages, BIO_MAX_PAGES));
 -			if (!bio) {
 -				if (ctx)
 -					fscrypt_release_ctx(ctx);
 +			bio = f2fs_grab_bio(inode, block_nr, nr_pages);
 +			if (IS_ERR(bio))
  				goto set_error_page;
 -			}
 -			bio->bi_bdev = bdev;
 -			bio->bi_iter.bi_sector = SECTOR_FROM_BLOCK(block_nr);
 -			bio->bi_end_io = f2fs_read_end_io;
 -			bio->bi_private = ctx;
+ 			bio_set_op_attrs(bio, REQ_OP_READ, 0);
  		}
  
  		if (bio_add_page(bio, page, blocksize, 0) < blocksize)
@@@ -1101,7 -1101,7 +1109,7 @@@ set_error_page
  		goto next_page;
  confused:
  		if (bio) {
- 			__submit_bio(F2FS_I_SB(inode), READ, bio, DATA);
 -			__submit_bio(F2FS_I_SB(inode), bio);
++			__submit_bio(F2FS_I_SB(inode), bio, DATA);
  			bio = NULL;
  		}
  		unlock_page(page);
@@@ -1111,7 -1111,7 +1119,7 @@@ next_page
  	}
  	BUG_ON(pages && !list_empty(pages));
  	if (bio)
- 		__submit_bio(F2FS_I_SB(inode), READ, bio, DATA);
 -		__submit_bio(F2FS_I_SB(inode), bio);
++		__submit_bio(F2FS_I_SB(inode), bio, DATA);
  	return 0;
  }
  
@@@ -1636,23 -1667,25 +1645,24 @@@ repeat
  	if (blkaddr == NEW_ADDR) {
  		zero_user_segment(page, 0, PAGE_SIZE);
  	} else {
 -		struct f2fs_io_info fio = {
 -			.sbi = sbi,
 -			.type = DATA,
 -			.op = REQ_OP_READ,
 -			.op_flags = READ_SYNC,
 -			.old_blkaddr = blkaddr,
 -			.new_blkaddr = blkaddr,
 -			.page = page,
 -			.encrypted_page = NULL,
 -		};
 -		err = f2fs_submit_page_bio(&fio);
 -		if (err)
 +		struct bio *bio;
 +
 +		bio = f2fs_grab_bio(inode, blkaddr, 1);
 +		if (IS_ERR(bio)) {
 +			err = PTR_ERR(bio);
  			goto fail;
 +		}
++		bio_set_op_attrs(bio, REQ_OP_READ, READ_SYNC);
  
 -		lock_page(page);
 -		if (unlikely(!PageUptodate(page))) {
 -			err = -EIO;
 +		if (bio_add_page(bio, page, PAGE_SIZE, 0) < PAGE_SIZE) {
 +			bio_put(bio);
 +			err = -EFAULT;
  			goto fail;
  		}
 +
- 		__submit_bio(sbi, READ_SYNC, bio, DATA);
++		__submit_bio(sbi, bio, DATA);
 +
 +		lock_page(page);
  		if (unlikely(page->mapping != mapping)) {
  			f2fs_put_page(page, 1);
  			goto repeat;
