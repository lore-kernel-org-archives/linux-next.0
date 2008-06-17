From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: nfs build failure
Date: Tue, 17 Jun 2008 19:26:22 +1000
Message-ID: <20080617192622.e448a37e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43299 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750938AbYFQJ0d (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Jun 2008 05:26:33 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: linux-next@vger.kernel.org, Jeff Layton <jlayton@redhat.com>

Hi Trond,

Today's linux-next build (powerpc ppc44x_defconfig) failed like this:

fs/nfs/super.c: In function 'nfs_remount':
fs/nfs/super.c:1440: error: 'nfs4_fs_type' undeclared (first use in this function)

Caused by commit 68a2efd9008ee81e72a4d1dcdf228414f5dfa6ff ("NFS:
implement option checking when remounting NFS filesystems (resend)").

I applied the following patch (which may not be correct).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From 9e9b8509043be3ccb6c045df11200ee589e9a42a Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 17 Jun 2008 19:23:18 +1000
Subject: [PATCH] nfs fix 1

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

---
 fs/nfs/super.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/fs/nfs/super.c b/fs/nfs/super.c
index 226ae6a..e951972 100644
--- a/fs/nfs/super.c
+++ b/fs/nfs/super.c
@@ -1437,7 +1437,10 @@ nfs_remount(struct super_block *sb, int *flags, char *raw_data)
 	 * ones were explicitly specified. Fall back to legacy behavior and
 	 * just return success.
 	 */
-	if ((sb->s_type == &nfs4_fs_type && options4->version == 1) ||
+	if (
+#ifdef CONFIG_NFS_V4
+	    (sb->s_type == &nfs4_fs_type && options4->version == 1) ||
+#endif
 	    (sb->s_type == &nfs_fs_type && options->version >= 1 &&
 	     options->version <= 6))
 		return 0;
-- 
1.5.5.4

