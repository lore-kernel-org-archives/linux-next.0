From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the ext4 tree
Date: Tue, 17 May 2016 10:23:55 +1000
Message-ID: <20160517102355.4be4af45@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38253 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750934AbcEQAYA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 May 2016 20:24:00 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>, Theodore Ts'o <tytso@mit.edu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Jan Kara <jack@suse.cz>

Hi all,

Today's linux-next merge of the vfs tree got conflicts in:

  fs/ext4/ext4.h
  fs/ext4/indirect.c
  fs/ext4/inode.c

between commit:

  914f82a32d02 ("ext4: refactor direct IO code")

from the ext4 tree and commit:

  c8b8e32d700f ("direct-io: eliminate the offset argument to ->direct_IO")

from the vfs tree.

I fixed it up (hopefully - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc fs/ext4/ext4.h
index b84aa1ca480a,72f4c9e00e97..000000000000
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
diff --cc fs/ext4/indirect.c
index bc15c2c17633,627b7e8f9ef3..000000000000
--- a/fs/ext4/indirect.c
+++ b/fs/ext4/indirect.c
diff --cc fs/ext4/inode.c
index f9ab1e8cc416,79b298d397b4..000000000000
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@@ -3327,13 -3334,12 +3327,13 @@@ static int ext4_end_io_dio(struct kioc
   * if the machine crashes during the write.
   *
   */
- static ssize_t ext4_direct_IO_write(struct kiocb *iocb, struct iov_iter *iter,
- 				    loff_t offset)
 -static ssize_t ext4_ext_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
++static ssize_t ext4_direct_IO_write(struct kiocb *iocb, struct iov_iter *iter)
  {
  	struct file *file = iocb->ki_filp;
  	struct inode *inode = file->f_mapping->host;
 +	struct ext4_inode_info *ei = EXT4_I(inode);
  	ssize_t ret;
+ 	loff_t offset = iocb->ki_pos;
  	size_t count = iov_iter_count(iter);
  	int overwrite = 0;
  	get_block_t *get_block_func = NULL;
@@@ -3423,12 -3399,12 +3423,12 @@@
  #ifdef CONFIG_EXT4_FS_ENCRYPTION
  	BUG_ON(ext4_encrypted_inode(inode) && S_ISREG(inode->i_mode));
  #endif
 -	if (IS_DAX(inode))
 +	if (IS_DAX(inode)) {
- 		ret = dax_do_io(iocb, inode, iter, offset, get_block_func,
+ 		ret = dax_do_io(iocb, inode, iter, get_block_func,
  				ext4_end_io_dio, dio_flags);
 -	else
 +	} else
  		ret = __blockdev_direct_IO(iocb, inode,
- 					   inode->i_sb->s_bdev, iter, offset,
+ 					   inode->i_sb->s_bdev, iter,
  					   get_block_func,
  					   ext4_end_io_dio, NULL, dio_flags);
  
@@@ -3451,82 -3428,6 +3451,82 @@@
  	if (overwrite)
  		inode_lock(inode);
  
 +	if (ret < 0 && final_size > inode->i_size)
 +		ext4_truncate_failed_write(inode);
 +
 +	/* Handle extending of i_size after direct IO write */
 +	if (orphan) {
 +		int err;
 +
 +		/* Credits for sb + inode write */
 +		handle = ext4_journal_start(inode, EXT4_HT_INODE, 2);
 +		if (IS_ERR(handle)) {
 +			/* This is really bad luck. We've written the data
 +			 * but cannot extend i_size. Bail out and pretend
 +			 * the write failed... */
 +			ret = PTR_ERR(handle);
 +			if (inode->i_nlink)
 +				ext4_orphan_del(NULL, inode);
 +
 +			goto out;
 +		}
 +		if (inode->i_nlink)
 +			ext4_orphan_del(handle, inode);
 +		if (ret > 0) {
 +			loff_t end = offset + ret;
 +			if (end > inode->i_size) {
 +				ei->i_disksize = end;
 +				i_size_write(inode, end);
 +				/*
 +				 * We're going to return a positive `ret'
 +				 * here due to non-zero-length I/O, so there's
 +				 * no way of reporting error returns from
 +				 * ext4_mark_inode_dirty() to userspace.  So
 +				 * ignore it.
 +				 */
 +				ext4_mark_inode_dirty(handle, inode);
 +			}
 +		}
 +		err = ext4_journal_stop(handle);
 +		if (ret == 0)
 +			ret = err;
 +	}
 +out:
 +	return ret;
 +}
 +
- static ssize_t ext4_direct_IO_read(struct kiocb *iocb, struct iov_iter *iter,
- 				   loff_t offset)
++static ssize_t ext4_direct_IO_read(struct kiocb *iocb, struct iov_iter *iter)
 +{
 +	int unlocked = 0;
 +	struct inode *inode = iocb->ki_filp->f_mapping->host;
++	loff_t offset = iocb->ki_pos;
 +	ssize_t ret;
 +
 +	if (ext4_should_dioread_nolock(inode)) {
 +		/*
 +		 * Nolock dioread optimization may be dynamically disabled
 +		 * via ext4_inode_block_unlocked_dio(). Check inode's state
 +		 * while holding extra i_dio_count ref.
 +		 */
 +		inode_dio_begin(inode);
 +		smp_mb();
 +		if (unlikely(ext4_test_inode_state(inode,
 +						    EXT4_STATE_DIOREAD_LOCK)))
 +			inode_dio_end(inode);
 +		else
 +			unlocked = 1;
 +	}
 +	if (IS_DAX(inode)) {
- 		ret = dax_do_io(iocb, inode, iter, offset, ext4_dio_get_block,
++		ret = dax_do_io(iocb, inode, iter, ext4_dio_get_block,
 +				NULL, unlocked ? 0 : DIO_LOCKING);
 +	} else {
 +		ret = __blockdev_direct_IO(iocb, inode, inode->i_sb->s_bdev,
- 					   iter, offset, ext4_dio_get_block,
++					   iter, ext4_dio_get_block,
 +					   NULL, NULL,
 +					   unlocked ? 0 : DIO_LOCKING);
 +	}
 +	if (unlocked)
 +		inode_dio_end(inode);
  	return ret;
  }
  
@@@ -3554,10 -3455,10 +3554,10 @@@ static ssize_t ext4_direct_IO(struct ki
  		return 0;
  
  	trace_ext4_direct_IO_enter(inode, offset, count, iov_iter_rw(iter));
 -	if (ext4_test_inode_flag(inode, EXT4_INODE_EXTENTS))
 -		ret = ext4_ext_direct_IO(iocb, iter);
 +	if (iov_iter_rw(iter) == READ)
- 		ret = ext4_direct_IO_read(iocb, iter, offset);
++		ret = ext4_direct_IO_read(iocb, iter);
  	else
- 		ret = ext4_direct_IO_write(iocb, iter, offset);
 -		ret = ext4_ind_direct_IO(iocb, iter);
++		ret = ext4_direct_IO_write(iocb, iter);
  	trace_ext4_direct_IO_exit(inode, offset, count, iov_iter_rw(iter), ret);
  	return ret;
  }
