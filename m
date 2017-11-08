From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the f2fs tree
Date: Thu, 9 Nov 2017 10:06:30 +1100
Message-ID: <20171109100630.3e6a136a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48839 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751245AbdKHXGb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 8 Nov 2017 18:06:31 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/f2fs/super.c

between commit:

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

diff --cc fs/f2fs/super.c
index a6c5dd450002,c2f30c6034f2..000000000000
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@@ -1255,26 -1199,19 +1255,26 @@@ static int f2fs_remount(struct super_bl
  	 * Previous and new state of filesystem is RO,
  	 * so skip checking GC and FLUSH_MERGE conditions.
  	 */
- 	if (f2fs_readonly(sb) && (*flags & MS_RDONLY))
+ 	if (f2fs_readonly(sb) && (*flags & SB_RDONLY))
  		goto skip;
  
 +#ifdef CONFIG_QUOTA
- 	if (!f2fs_readonly(sb) && (*flags & MS_RDONLY)) {
+ 	if (!f2fs_readonly(sb) && (*flags & SB_RDONLY)) {
  		err = dquot_suspend(sb, -1);
  		if (err < 0)
  			goto restore_opts;
  	} else {
  		/* dquot_resume needs RW */
- 		sb->s_flags &= ~MS_RDONLY;
+ 		sb->s_flags &= ~SB_RDONLY;
 -		dquot_resume(sb, -1);
 +		if (sb_any_quota_suspended(sb)) {
 +			dquot_resume(sb, -1);
 +		} else if (f2fs_sb_has_quota_ino(sb)) {
 +			err = f2fs_enable_quotas(sb);
 +			if (err)
 +				goto restore_opts;
 +		}
  	}
 -
 +#endif
  	/* disallow enable/disable extent_cache dynamically */
  	if (no_extent_cache == !!test_opt(sbi, EXTENT_CACHE)) {
  		err = -EINVAL;
