From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the userns
 tree
Date: Fri, 30 Sep 2016 17:42:10 +1000
Message-ID: <20160930174210.7e71aee4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47521 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750831AbcI3HmO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 30 Sep 2016 03:42:14 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, "Eric W. Biederman" <ebiederm@xmission.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ian Kent <raven@themaw.net>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  include/linux/mount.h

between commit:

  312ddcb332c3 ("mnt: Add a per mount namespace limit on the number of mounts")

from the userns tree and commit:

  a0461d15d75c ("vfs: make is_local_mountpoint() usable by others")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc include/linux/mount.h
index 1172cce949a4,575b7453325a..000000000000
--- a/include/linux/mount.h
+++ b/include/linux/mount.h
@@@ -96,6 -97,12 +97,14 @@@ extern void mark_mounts_for_expiry(stru
  
  extern dev_t name_to_dev_t(const char *name);
  
 +extern unsigned int sysctl_mount_max;
 +
+ extern bool __is_local_mountpoint(struct dentry *dentry);
+ static inline bool is_local_mountpoint(struct dentry *dentry)
+ {
+ 	if (!d_mountpoint(dentry))
+ 		return false;
+ 
+ 	return __is_local_mountpoint(dentry);
+ }
  #endif /* _LINUX_MOUNT_H */
