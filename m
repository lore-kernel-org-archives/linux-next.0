From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the btrfs-kdave tree with Linus' tree
Date: Tue, 2 Feb 2016 10:22:16 +1100
Message-ID: <20160202102216.60d1d550@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46075 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750726AbcBAXWT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Feb 2016 18:22:19 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Sterba <dsterba@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Chandan Rajendra <chandan@linux.vnet.ibm.com>, Al Viro <viro@zeniv.linux.org.uk>

Hi David,

Today's linux-next merge of the btrfs-kdave tree got a conflict in:

  fs/btrfs/file.c

between commit:

  5955102c9984 ("wrappers for ->i_mutex access")

from Linus' tree and commit:

  9703fefe0b13 ("Btrfs: fallocate: Work with sectorsized blocks")

from the btrfs-kdave tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell

diff --cc fs/btrfs/file.c
index 098bb8f690c9,953f0ad17802..000000000000
--- a/fs/btrfs/file.c
+++ b/fs/btrfs/file.c
@@@ -1761,11 -1778,13 +1778,13 @@@ static ssize_t btrfs_file_write_iter(st
  	ssize_t err;
  	loff_t pos;
  	size_t count;
+ 	loff_t oldsize;
+ 	int clean_page = 0;
  
 -	mutex_lock(&inode->i_mutex);
 +	inode_lock(inode);
  	err = generic_write_checks(iocb, from);
  	if (err <= 0) {
 -		mutex_unlock(&inode->i_mutex);
 +		inode_unlock(inode);
  		return err;
  	}
  
@@@ -1799,14 -1818,17 +1818,17 @@@
  	pos = iocb->ki_pos;
  	count = iov_iter_count(from);
  	start_pos = round_down(pos, root->sectorsize);
- 	if (start_pos > i_size_read(inode)) {
+ 	oldsize = i_size_read(inode);
+ 	if (start_pos > oldsize) {
  		/* Expand hole size to cover write data, preventing empty gap */
  		end_pos = round_up(pos + count, root->sectorsize);
- 		err = btrfs_cont_expand(inode, i_size_read(inode), end_pos);
+ 		err = btrfs_cont_expand(inode, oldsize, end_pos);
  		if (err) {
 -			mutex_unlock(&inode->i_mutex);
 +			inode_unlock(inode);
  			goto out;
  		}
+ 		if (start_pos > round_up(oldsize, root->sectorsize))
+ 			clean_page = 1;
  	}
  
  	if (sync)
@@@ -1818,9 -1840,12 +1840,12 @@@
  		num_written = __btrfs_buffered_write(file, from, pos);
  		if (num_written > 0)
  			iocb->ki_pos = pos + num_written;
+ 		if (clean_page)
+ 			pagecache_isize_extended(inode, oldsize,
+ 						i_size_read(inode));
  	}
  
 -	mutex_unlock(&inode->i_mutex);
 +	inode_unlock(inode);
  
  	/*
  	 * We also have to set last_sub_trans to the current log transid,
@@@ -2303,8 -2328,8 +2328,8 @@@ static int btrfs_punch_hole(struct inod
  	if (ret)
  		return ret;
  
 -	mutex_lock(&inode->i_mutex);
 +	inode_lock(inode);
- 	ino_size = round_up(inode->i_size, PAGE_CACHE_SIZE);
+ 	ino_size = round_up(inode->i_size, root->sectorsize);
  	ret = find_first_non_hole(inode, &offset, &len);
  	if (ret < 0)
  		goto out_only_mutex;
@@@ -2338,12 -2362,12 +2362,12 @@@
  		goto out_only_mutex;
  	}
  
- 	/* zero back part of the first page */
+ 	/* zero back part of the first block */
  	if (offset < ino_size) {
- 		truncated_page = true;
- 		ret = btrfs_truncate_page(inode, offset, 0, 0);
+ 		truncated_block = true;
+ 		ret = btrfs_truncate_block(inode, offset, 0, 0);
  		if (ret) {
 -			mutex_unlock(&inode->i_mutex);
 +			inode_unlock(inode);
  			return ret;
  		}
  	}
