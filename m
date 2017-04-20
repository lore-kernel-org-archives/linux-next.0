From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm tree
Date: Thu, 20 Apr 2017 16:18:52 +1000
Message-ID: <20170420161852.0492bc3f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36481 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S938975AbdDTGSy (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 20 Apr 2017 02:18:54 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Steven Whitehouse <swhiteho@redhat.com>, Bob Peterson <rpeterso@redhat.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Deepa Dinamani <deepa.kernel@gmail.com>

Hi all,

After merging the akpm tree, today's linux-next build (x86_64
allmodconfig) failed like this:

fs/gfs2/bmap.c: In function 'sweep_bh_for_rgrps':
fs/gfs2/bmap.c:1075:5: error: 'CURRENT_TIME' undeclared (first use in this function)
     CURRENT_TIME;
     ^
fs/gfs2/bmap.c:1075:5: note: each undeclared identifier is reported only once for each function it appears in
fs/gfs2/bmap.c: In function 'trunc_dealloc':
fs/gfs2/bmap.c:1296:47: error: 'CURRENT_TIME' undeclared (first use in this function)
   ip->i_inode.i_mtime = ip->i_inode.i_ctime = CURRENT_TIME;
                                               ^

Caused by patch

  "time: delete CURRENT_TIME_SEC and CURRENT_TIME"

interacting with commit

  d552a2b9b33e ("GFS2: Non-recursive delete")

from the gfs2 tree.

I have applied the following fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 20 Apr 2017 16:14:15 +1000
Subject: [PATCH] gfs2: replace CURRENT_TIME with current_time

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/gfs2/bmap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 3814a60e0aea..4d810be532dd 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -1072,7 +1072,7 @@ static int sweep_bh_for_rgrps(struct gfs2_inode *ip, struct gfs2_holder *rd_gh,
 			/* Every transaction boundary, we rewrite the dinode
 			   to keep its di_blocks current in case of failure. */
 			ip->i_inode.i_mtime = ip->i_inode.i_ctime =
-				CURRENT_TIME;
+				current_time(&ip->i_inode);
 			gfs2_trans_add_meta(ip->i_gl, dibh);
 			gfs2_dinode_out(ip, dibh->b_data);
 			up_write(&ip->i_rw_mutex);
@@ -1293,7 +1293,7 @@ static int trunc_dealloc(struct gfs2_inode *ip, u64 newsize)
 		gfs2_statfs_change(sdp, 0, +btotal, 0);
 		gfs2_quota_change(ip, -(s64)btotal, ip->i_inode.i_uid,
 				  ip->i_inode.i_gid);
-		ip->i_inode.i_mtime = ip->i_inode.i_ctime = CURRENT_TIME;
+		ip->i_inode.i_mtime = ip->i_inode.i_ctime = current_time(&ip->i_inode);
 		gfs2_trans_add_meta(ip->i_gl, dibh);
 		gfs2_dinode_out(ip, dibh->b_data);
 		up_write(&ip->i_rw_mutex);
-- 
2.11.0

-- 
Cheers,
Stephen Rothwell
