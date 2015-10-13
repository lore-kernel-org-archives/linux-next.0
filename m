From: Dave Chinner <david@fromorbit.com>
Subject: Re: randconfig build error with next-20151013, in
 fs/xfs/libxfs/xfs_alloc.c
Date: Wed, 14 Oct 2015 07:41:19 +1100
Message-ID: <20151013204119.GI31326@dastard>
References: <CA+r1Zhg0y-47JuzOMANcXykyU=No-TEBksLnnT-g0OsTKwazRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ipmail04.adl6.internode.on.net ([150.101.137.141]:55634 "EHLO
	ipmail04.adl6.internode.on.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752197AbbJMUlW (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 13 Oct 2015 16:41:22 -0400
Content-Disposition: inline
In-Reply-To: <CA+r1Zhg0y-47JuzOMANcXykyU=No-TEBksLnnT-g0OsTKwazRQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, xfs@oss.sgi.com

On Tue, Oct 13, 2015 at 09:41:25AM -0700, Jim Davis wrote:
> Building with the attached random configuration file,
> 
> fs/built-in.o: In function `xfs_free_ag_extent':
> /home/jim/linux-next/fs/xfs/libxfs/xfs_alloc.c:1813: undefined
> reference to `xfsstats'

Please test the patch below.

-Dave.
-- 
Dave Chinner
david@fromorbit.com


xfs: stats are no longer dependent on CONFIG_PROC_FS

From: Dave Chinner <dchinner@redhat.com>

So we need to fix the makefile to understand this, otherwise build
errors with CONFIG_PROC_FS=n occur.

Reported-by: Jim Davis <jim.epost@gmail.com>
Signed-off-by: Dave Chinner <dchinner@redhat.com>
---
 fs/xfs/Makefile    | 2 +-
 fs/xfs/xfs_stats.c | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/xfs/Makefile b/fs/xfs/Makefile
index 2fbf910..6506e87 100644
--- a/fs/xfs/Makefile
+++ b/fs/xfs/Makefile
@@ -84,6 +84,7 @@ xfs-y				+= xfs_aops.o \
 				   xfs_message.o \
 				   xfs_mount.o \
 				   xfs_mru_cache.o \
+				   xfs_stats.o \
 				   xfs_super.o \
 				   xfs_symlink.o \
 				   xfs_sysfs.o \
@@ -118,7 +119,6 @@ xfs-$(CONFIG_XFS_QUOTA)		+= xfs_dquot.o \
 xfs-$(CONFIG_XFS_RT)		+= xfs_rtalloc.o
 
 xfs-$(CONFIG_XFS_POSIX_ACL)	+= xfs_acl.o
-xfs-$(CONFIG_PROC_FS)		+= xfs_stats.o
 xfs-$(CONFIG_SYSCTL)		+= xfs_sysctl.o
 xfs-$(CONFIG_COMPAT)		+= xfs_ioctl32.o
 xfs-$(CONFIG_NFSD_PNFS)		+= xfs_pnfs.o
diff --git a/fs/xfs/xfs_stats.c b/fs/xfs/xfs_stats.c
index bd50619..8686df6 100644
--- a/fs/xfs/xfs_stats.c
+++ b/fs/xfs/xfs_stats.c
@@ -161,6 +161,7 @@ static const struct file_operations xqmstat_proc_fops = {
 };
 #endif /* CONFIG_XFS_QUOTA */
 
+#ifdef CONFIG_PROC_FS
 int
 xfs_init_procfs(void)
 {
@@ -191,3 +192,4 @@ xfs_cleanup_procfs(void)
 {
 	remove_proc_subtree("fs/xfs", NULL);
 }
+#endif /* CONFIG_PROC_FS */
