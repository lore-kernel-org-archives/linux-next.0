From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the aio tree with the vfs tree
Date: Mon, 14 Mar 2016 15:32:14 +1100
Message-ID: <20160314153214.41d7c2fe@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35407 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753158AbcCNEcR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 14 Mar 2016 00:32:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benjamin LaHaise <bcrl@kvack.org>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

Hi Benjamin,

Today's linux-next merge of the aio tree got a conflict in:

  fs/read_write.c

between commit:

  793b80ef14af ("vfs: pass a flags argument to vfs_readv/vfs_writev")

from the vfs tree and commit:

  4047629ed53e ("fs: make do_loop_readv_writev() non-static")

from the aio tree.

I fixed it up (see below - thanks to Al for the heads up) and can carry
the fix as necessary (no action is required).

I also added the following merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 14 Mar 2016 15:28:05 +1100
Subject: [PATCH] vfs: do_loop_readv_writev() API change merge fix

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/internal.h b/fs/internal.h
index 3bbe63d5eb5e..39f6e9831c5f 100644
--- a/fs/internal.h
+++ b/fs/internal.h
@@ -139,7 +139,7 @@ extern long prune_dcache_sb(struct super_block *sb, struct shrink_control *sc);
  */
 extern int rw_verify_area(int, struct file *, const loff_t *, size_t);
 extern ssize_t do_loop_readv_writev(struct file *filp, struct iov_iter *iter,
-				    loff_t *ppos, io_fn_t fn);
+				    loff_t *ppos, io_fn_t fn, int flags);
 
 
 /*
-- 
2.7.0

-- 
Cheers,
Stephen Rothwell

diff --cc fs/read_write.c
index cf377cf9dfe3,36344ff2991c..000000000000
--- a/fs/read_write.c
+++ b/fs/read_write.c
@@@ -713,8 -665,8 +710,8 @@@ static ssize_t do_iter_readv_writev(str
  }
  
  /* Do it by hand, with file-ops */
- static ssize_t do_loop_readv_writev(struct file *filp, struct iov_iter *iter,
- 		loff_t *ppos, io_fn_t fn, int flags)
+ ssize_t do_loop_readv_writev(struct file *filp, struct iov_iter *iter,
 -		loff_t *ppos, io_fn_t fn)
++		loff_t *ppos, io_fn_t fn , int flags)
  {
  	ssize_t ret = 0;
  
