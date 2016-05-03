From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the f2fs tree
Date: Tue, 3 May 2016 11:41:19 +1000
Message-ID: <20160503114119.521192fc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/f2fs/data.c

between commit:

  6bfc49197eba ("f2fs: issue cache flush on direct IO")

from the f2fs tree and commit:

  c8b8e32d700f ("direct-io: eliminate the offset argument to ->direct_IO")

from the vfs tree.

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
index 38ce5d6f8583,a4c5da5bfe1e..000000000000
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@@ -1687,13 -1672,9 +1687,13 @@@ static ssize_t f2fs_direct_IO(struct ki
  
  	trace_f2fs_direct_IO_enter(inode, offset, count, iov_iter_rw(iter));
  
- 	err = blockdev_direct_IO(iocb, inode, iter, offset, get_data_block_dio);
+ 	err = blockdev_direct_IO(iocb, inode, iter, get_data_block_dio);
 -	if (err < 0 && iov_iter_rw(iter) == WRITE)
 -		f2fs_write_failed(mapping, offset + count);
 +	if (iov_iter_rw(iter) == WRITE) {
 +		if (err > 0)
 +			set_inode_flag(F2FS_I(inode), FI_UPDATE_WRITE);
 +		else if (err < 0)
 +			f2fs_write_failed(mapping, offset + count);
 +	}
  
  	trace_f2fs_direct_IO_exit(inode, offset, count, iov_iter_rw(iter), err);
  
