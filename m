From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: vfs tree build failure
Date: Mon, 20 Oct 2008 17:18:30 +1100
Message-ID: <20081020171830.9ece287f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48971 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750769AbYJTGSf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Oct 2008 02:18:35 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, David Chinner <david@fromorbit.com>, Christoph Hellwig <hch@infradead.org>, Lachlan McIlroy <lachlan@sgi.com>

Hi Al,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

fs/xfs/linux-2.6/xfs_export.c: In function 'xfs_fs_get_parent':
fs/xfs/linux-2.6/xfs_export.c:201: error: incompatible type for argument 1 of 'd_obtain_alias'

Due to commit 8ee6b8fff20962d17a008e230006e48c7f79ade4 ("[PATCH] switch
all filesystems over to d_obtain_alias") from the vfs tree interacting
with commit 7836dda725873a5ce05d216295a452f16ccaab72 ("[XFS] Combine the
XFS and Linux inodes") from the xfs tree.

I must admit I am wondering why I am only seeing this error at this late
stage (the xfs commit is dated October 17) ...

I fixed it up by applying the following patch (which may be incorrect).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 20 Oct 2008 17:16:00 +1100
Subject: [PATCH] vfs/xfs: fallout from i_vnode change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/xfs/linux-2.6/xfs_export.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/xfs/linux-2.6/xfs_export.c b/fs/xfs/linux-2.6/xfs_export.c
index 263027f..dd71e86 100644
--- a/fs/xfs/linux-2.6/xfs_export.c
+++ b/fs/xfs/linux-2.6/xfs_export.c
@@ -198,7 +198,7 @@ xfs_fs_get_parent(
 	if (unlikely(error))
 		return ERR_PTR(-error);
 
-	return d_obtain_alias(cip->i_vnode);
+	return d_obtain_alias(&cip->i_vnode);
 }
 
 const struct export_operations xfs_export_operations = {
-- 
1.5.6.5
