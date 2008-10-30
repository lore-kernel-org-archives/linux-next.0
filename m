From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: xfs tree build failure
Date: Thu, 30 Oct 2008 13:23:24 +1100
Message-ID: <20081030132324.0d619fdd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43074 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751690AbYJ3CXb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Oct 2008 22:23:31 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Chinner <david@fromorbit.com>, xfs-masters@oss.sgi.com
Cc: linux-next@vger.kernel.org, Lachlan McIlroy <lachlan@sgi.com>, linux-fsdevel@vger.kernel.org

Hi David,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

ERROR: "inode_wait" [fs/xfs/xfs.ko] undefined!

Caused by commit 676a7711ee281c3bf41db18e29e296584de82793 ("[XFS] Fix
race when looking up reclaimable inodes") which introduced a use of
wait_on_inode() which is an inline that calls inode_wait().

I applied the following patch (probably wrong :-)).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 30 Oct 2008 13:19:46 +1100
Subject: [PATCH] fs: xfs needs inode_wait to be exported

Since wait_on_inode() references it.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/inode.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/fs/inode.c b/fs/inode.c
index f84ba33..098a244 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -1334,6 +1334,7 @@ int inode_wait(void *word)
 	schedule();
 	return 0;
 }
+EXPORT_SYMBOL(inode_wait);
 
 /*
  * If we try to find an inode in the inode hash while it is being
-- 
1.5.6.5
