From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the f2fs tree
Date: Thu, 9 Nov 2017 10:01:38 +1100
Message-ID: <20171109100138.1bc5cbde@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/f2fs/checkpoint.c

between commits:

  1f227a3e215d ("f2fs: stop all the operations by cp_error flag")
  ea6767337f86 ("f2fs: support quota sys files")

from the f2fs tree and commit:

  c2c6773f9942 ("VFS: Roll out mount flag differentiation (MS_* -> SB_*) generally")

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

diff --cc fs/f2fs/checkpoint.c
index 98777c1ae70c,608a69fc199e..000000000000
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@@ -629,10 -601,9 +629,10 @@@ int recover_orphan_inodes(struct f2fs_s
  
  #ifdef CONFIG_QUOTA
  	/* Needed for iput() to work correctly and not trash data */
- 	sbi->sb->s_flags |= MS_ACTIVE;
+ 	sbi->sb->s_flags |= SB_ACTIVE;
 +
  	/* Turn on quotas so that they are updated correctly */
- 	quota_enabled = f2fs_enable_quota_files(sbi, s_flags & MS_RDONLY);
 -	f2fs_enable_quota_files(sbi);
++	quota_enabled = f2fs_enable_quota_files(sbi, s_flags & SB_RDONLY);
  #endif
  
  	start_blk = __start_cp_addr(sbi) + 1 + __cp_payload(sbi);
@@@ -660,10 -631,9 +660,10 @@@
  out:
  #ifdef CONFIG_QUOTA
  	/* Turn quotas off */
 -	f2fs_quota_off_umount(sbi->sb);
 +	if (quota_enabled)
 +		f2fs_quota_off_umount(sbi->sb);
  #endif
- 	sbi->sb->s_flags = s_flags; /* Restore MS_RDONLY status */
+ 	sbi->sb->s_flags = s_flags; /* Restore SB_RDONLY status */
  
  	return err;
  }
