From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the vfs tree
Date: Mon, 2 May 2016 11:25:27 +1000
Message-ID: <20160502112527.095e2998@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39428 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751398AbcEBBZ3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 1 May 2016 21:25:29 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>, Steven Whitehouse <swhiteho@redhat.com>, Bob Peterson <rpeterso@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Abhi Das <adas@redhat.com>

Hi Al,

After merging the vfs tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

In file included from include/linux/notifier.h:13:0,
                 from include/linux/memory_hotplug.h:6,
                 from include/linux/mmzone.h:744,
                 from include/linux/gfp.h:5,
                 from include/linux/slab.h:14,
                 from fs/gfs2/file.c:10:
fs/gfs2/file.c: In function 'gfs2_file_splice_read':
fs/gfs2/file.c:963:19: error: 'struct inode' has no member named 'i_mutex'
  mutex_lock(&inode->i_mutex);
                   ^
include/linux/mutex.h:146:44: note: in definition of macro 'mutex_lock'
 #define mutex_lock(lock) mutex_lock_nested(lock, 0)
                                            ^
fs/gfs2/file.c:967:22: error: 'struct inode' has no member named 'i_mutex'
   mutex_unlock(&inode->i_mutex);   
                      ^
fs/gfs2/file.c:972:21: error: 'struct inode' has no member named 'i_mutex'
  mutex_unlock(&inode->i_mutex);
                     ^

Caused by commit

  ad10a307a918 ("parallel lookups: actual switch to rwsem")

interacting with commit

  611526756a3d ("gfs2: Use gfs2 wrapper to sync inode before calling generic_file_splice_read()")

from the gfs2 tree.

I applied the following merge fix patch for today (thanks Al):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 2 May 2016 11:17:40 +1000
Subject: [PATCH] gfs2: fix up for i_mutex -> i_rwsem change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/gfs2/file.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 3f27ab291029..76e205455503 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -960,16 +960,16 @@ static ssize_t gfs2_file_splice_read(struct file *in, loff_t *ppos,
 	struct gfs2_holder gh;
 	int ret;
 
-	mutex_lock(&inode->i_mutex);
+	inode_lock(inode);
 
 	ret = gfs2_glock_nq_init(ip->i_gl, LM_ST_SHARED, 0, &gh);
 	if (ret) {
-		mutex_unlock(&inode->i_mutex);
+		inode_unlock(inode);
 		return ret;
 	}
 
 	gfs2_glock_dq_uninit(&gh);
-	mutex_unlock(&inode->i_mutex);
+	inode_unlock(inode);
 
 	return generic_file_splice_read(in, ppos, pipe, len, flags);
 }
-- 
2.7.0

-- 
Cheers,
Stephen Rothwell
