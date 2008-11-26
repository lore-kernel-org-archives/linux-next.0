From: Mark Fasheh <mfasheh@suse.com>
Subject: Re: linux-next: ocfs2 tree build failure
Date: Wed, 26 Nov 2008 12:43:48 -0800
Message-ID: <20081126204348.GG8378@wotan.suse.de>
References: <20081125164204.6817a397.sfr@canb.auug.org.au> <20081126163028.d7c1fa2d.sfr@canb.auug.org.au>
Reply-To: Mark Fasheh <mfasheh@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.suse.de ([195.135.220.2]:51688 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752092AbYKZUnu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 26 Nov 2008 15:43:50 -0500
Content-Disposition: inline
In-Reply-To: <20081126163028.d7c1fa2d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Jan Kara <jack@suse.cz>

On Wed, Nov 26, 2008 at 04:30:28PM +1100, Stephen Rothwell wrote:
> Hi Mark,
> 
> On Tue, 25 Nov 2008 16:42:04 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next build (x86_64 allmodconfig) failed like this:
> > 
> > usr/include/linux/dqblk_v2.h:8: included file 'linux/dqblk_qtree.h' is not exported
> > make[4]: *** [/scratch/sfr/x86_64_allmodconfig/usr/include/linux/.check] Error 1
> > 
> > Caused by commit 603f68d0c2b66052093ea29bf1ff7a8a58667af6 ("quota: Split
> > off quota tree handling into a separate file").  dqblk_qtree.h needs to
> > be added to the Kbuild file.
> 
> Still fails, so I have dropped the ocfs2 tree for today.

Ok. Does the attached patch fix this for you? It's in ocfs2.git now.
	--Mark

--
Mark Fasheh

From: Jan Kara <jack@suse.cz>

[PATCH] quota: Unexport dqblk_v1.h and dqblk_v2.h

Unexport header files dqblk_v[12].h since except for quota format ID they
don't contain information userspace should be interested in. Move ID
definitions to quota.h.

Signed-off-by: Jan Kara <jack@suse.cz>
Signed-off-by: Mark Fasheh <mfasheh@suse.com>
---
 include/linux/Kbuild     |    2 --
 include/linux/dqblk_v1.h |    3 ---
 include/linux/dqblk_v2.h |    3 ---
 include/linux/quota.h    |    4 ++++
 4 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/include/linux/Kbuild b/include/linux/Kbuild
index 0fd2da3..4c32642 100644
--- a/include/linux/Kbuild
+++ b/include/linux/Kbuild
@@ -56,8 +56,6 @@ header-y += dlm_device.h
 header-y += dlm_netlink.h
 header-y += dm-ioctl.h
 header-y += dn.h
-header-y += dqblk_v1.h
-header-y += dqblk_v2.h
 header-y += dqblk_xfs.h
 header-y += efs_fs_sb.h
 header-y += elf-fdpic.h
diff --git a/include/linux/dqblk_v1.h b/include/linux/dqblk_v1.h
index 9cea901..3713a72 100644
--- a/include/linux/dqblk_v1.h
+++ b/include/linux/dqblk_v1.h
@@ -5,9 +5,6 @@
 #ifndef _LINUX_DQBLK_V1_H
 #define _LINUX_DQBLK_V1_H
 
-/* Id of quota format */
-#define QFMT_VFS_OLD 1
-
 /* Root squash turned on */
 #define V1_DQF_RSQUASH 1
 
diff --git a/include/linux/dqblk_v2.h b/include/linux/dqblk_v2.h
index ff8af1b..18000a5 100644
--- a/include/linux/dqblk_v2.h
+++ b/include/linux/dqblk_v2.h
@@ -7,9 +7,6 @@
 
 #include <linux/dqblk_qtree.h>
 
-/* Id number of quota format */
-#define QFMT_VFS_V0 2
-
 /* Numbers of blocks needed for updates */
 #define V2_INIT_ALLOC QTREE_INIT_ALLOC
 #define V2_INIT_REWRITE QTREE_INIT_REWRITE
diff --git a/include/linux/quota.h b/include/linux/quota.h
index ec82beb..d72d5d8 100644
--- a/include/linux/quota.h
+++ b/include/linux/quota.h
@@ -70,6 +70,10 @@
 #define Q_GETQUOTA 0x800007	/* get user quota structure */
 #define Q_SETQUOTA 0x800008	/* set user quota structure */
 
+/* Quota format type IDs */
+#define	QFMT_VFS_OLD 1
+#define	QFMT_VFS_V0 2
+
 /* Size of block in which space limits are passed through the quota
  * interface */
 #define QIF_DQBLKSIZE_BITS 10
-- 
1.5.6
