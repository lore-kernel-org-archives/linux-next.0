From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: slab tree build failure
Date: Mon, 3 Nov 2008 15:42:21 +1100
Message-ID: <20081103154221.e68a50f0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43944 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750913AbYKCEm3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 2 Nov 2008 23:42:29 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pekka Enberg <penberg@cs.helsinki.fi>, Christoph Lameter <cl@linux-foundation.org>
Cc: linux-next@vger.kernel.org, Rik van Riel <riel@redhat.com>, David Chinner <david@fromorbit.com>, Lachlan McIlroy <lachlan@sgi.com>, Christoph Hellwig <hch@infradead.org>

Hi all,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

fs/xfs/linux-2.6/xfs_super.c: In function 'xfs_init_zones':
fs/xfs/linux-2.6/xfs_super.c:1714: error: 'xfs_vnode_zone' undeclared (first use in this function)

It is a mismerge (in the linux-next tree) between commits
7836dda725873a5ce05d216295a452f16ccaab72 ("[XFS] Combine the XFS and
Linux inodes") form the xfs tree and
200d770048651d9a03266dc1bf031bb6f9e1363a ("Filesystem: XFS slab
defragmentation") from the slab tree.

I guess the latter patch needs to be dropped since its target is going
away.

I fixed up the merge (see below) and can carry the fix for a few days.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --git a/fs/xfs/linux-2.6/xfs_super.c b/fs/xfs/linux-2.6/xfs_super.c
index 23e0afb..6bd3e2a 100644
--- a/fs/xfs/linux-2.6/xfs_super.c
+++ b/fs/xfs/linux-2.6/xfs_super.c
@@ -1711,8 +1711,6 @@ STATIC int __init
 xfs_init_zones(void)
 {
 
-	kmem_cache_setup_defrag(xfs_vnode_zone, get_inodes, kick_inodes);
-
 	xfs_ioend_zone = kmem_zone_init(sizeof(xfs_ioend_t), "xfs_ioend");
 	if (!xfs_ioend_zone)
 		goto out;
