From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the ubifs tree
Date: Mon, 10 Oct 2016 11:20:20 +1100
Message-ID: <20161010112020.3a02a2e6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>, Artem Bityutskiy <dedekind1@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, Miklos Szeredi <mszeredi@redhat.com>
List-Id: linux-next.vger.kernel.org

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/ubifs/dir.c

between commits:

  9e0a1fff8db5 ("ubifs: Implement RENAME_WHITEOUT")
  9ec64962afb1 ("ubifs: Implement RENAME_EXCHANGE")

from the ubifs tree and commit:

  f03b8ad8d386 ("fs: support RENAME_NOREPLACE for local filesystems")
  2773bf00aeb9 ("fs: rename "rename2" i_op to "rename"")

from the vfs tree.

I fixed it up (I think - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc fs/ubifs/dir.c
index ccd9128f8faf,64902702b17d..000000000000
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@@ -1384,13 -1183,10 +1387,10 @@@ const struct inode_operations ubifs_dir
  	.mkdir       = ubifs_mkdir,
  	.rmdir       = ubifs_rmdir,
  	.mknod       = ubifs_mknod,
- 	.rename2     = ubifs_rename2,
 -	.rename     = ubifs_rename,
++	.rename     = ubifs_rename2,
  	.setattr     = ubifs_setattr,
  	.getattr     = ubifs_getattr,
- 	.setxattr    = generic_setxattr,
- 	.getxattr    = generic_getxattr,
  	.listxattr   = ubifs_listxattr,
- 	.removexattr = generic_removexattr,
  #ifdef CONFIG_UBIFS_ATIME_SUPPORT
  	.update_time = ubifs_update_time,
  #endif
