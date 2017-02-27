From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the f2fs tree
Date: Mon, 27 Feb 2017 11:05:53 +1100
Message-ID: <20170227110553.0bb24b02@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48635 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751297AbdB0AGI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 26 Feb 2017 19:06:08 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>, DongOh Shin <doscode.kr@gmail.com>

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/f2fs/f2fs.h

between commit:

  cac5a3d8f517 ("f2fs: fix 446 coding style warnings in f2fs.h")

from the f2fs tree and commit:

  caffc373c573 ("statx: Add a system call to make enhanced file info available")

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

diff --cc fs/f2fs/f2fs.h
index d1483136fed6,db1f5f6a0d04..000000000000
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@@ -2036,17 -1962,16 +2036,17 @@@ static inline void *f2fs_kvzalloc(size_
  /*
   * file.c
   */
 -int f2fs_sync_file(struct file *, loff_t, loff_t, int);
 -void truncate_data_blocks(struct dnode_of_data *);
 -int truncate_blocks(struct inode *, u64, bool);
 -int f2fs_truncate(struct inode *);
 -int f2fs_getattr(const struct path *, struct kstat *, u32, unsigned int);
 -int f2fs_setattr(struct dentry *, struct iattr *);
 -int truncate_hole(struct inode *, pgoff_t, pgoff_t);
 -int truncate_data_blocks_range(struct dnode_of_data *, int);
 -long f2fs_ioctl(struct file *, unsigned int, unsigned long);
 -long f2fs_compat_ioctl(struct file *, unsigned int, unsigned long);
 +int f2fs_sync_file(struct file *file, loff_t start, loff_t end, int datasync);
 +void truncate_data_blocks(struct dnode_of_data *dn);
 +int truncate_blocks(struct inode *inode, u64 from, bool lock);
 +int f2fs_truncate(struct inode *inode);
- int f2fs_getattr(struct vfsmount *mnt, struct dentry *dentry,
- 			struct kstat *stat);
++int f2fs_getattr(const struct path *path, struct kstat *stat, u32 request_mask,
++		 unsigned int query_flags);
 +int f2fs_setattr(struct dentry *dentry, struct iattr *attr);
 +int truncate_hole(struct inode *inode, pgoff_t pg_start, pgoff_t pg_end);
 +int truncate_data_blocks_range(struct dnode_of_data *dn, int count);
 +long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg);
 +long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg);
  
  /*
   * inode.c
