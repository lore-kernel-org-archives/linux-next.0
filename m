From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: vfs tree build warning
Date: Mon, 18 Jan 2010 13:11:39 +1100
Message-ID: <20100118131139.1ef42c6f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753428Ab0ARCLr@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Sage Weil <sage@newdream.net>
List-Id: linux-next.vger.kernel.org

Hi Al,

Today's linux-next build (x86_64_allmodconfig) produced this warning:

fs/ceph/super.c:216: warning: initialization from incompatible pointer type

Introduced by commit bc39e28236344af617473df80abb7de43176511e ("pass
writeback_control to ->write_inode") from the vfs tree interacting with
commit 16725b9d2a2e3d0fd2b0034482e2eb0a2d78050f ("ceph: super.c") from
the ceph tree.

This will need a fixup patch (see below) which I can carry in the
linux-next tree.  There may, of course, be a better fix (which I can
carry if someone sends it to me).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 18 Jan 2010 11:53:08 +1100
Subject: [PATCH] ceph: update for write_inode API change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/ceph/caps.c  |    4 +++-
 fs/ceph/super.h |    3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/ceph/caps.c b/fs/ceph/caps.c
index 9b9ce14..b2a6b9a 100644
--- a/fs/ceph/caps.c
+++ b/fs/ceph/caps.c
@@ -5,6 +5,7 @@
 #include <linux/sched.h>
 #include <linux/vmalloc.h>
 #include <linux/wait.h>
+#include <linux/writeback.h>
 
 #include "super.h"
 #include "decode.h"
@@ -1745,12 +1746,13 @@ int ceph_fsync(struct file *file, struct dentry *dentry, int datasync)
  * get by with fewer MDS messages if we wait for data writeback to
  * complete first.
  */
-int ceph_write_inode(struct inode *inode, int wait)
+int ceph_write_inode(struct inode *inode, struct writeback_control *wbc)
 {
 	struct ceph_inode_info *ci = ceph_inode(inode);
 	unsigned flush_tid;
 	int err = 0;
 	int dirty;
+	int wait = wbc->sync_mode == WB_SYNC_ALL;
 
 	dout("write_inode %p wait=%d\n", inode, wait);
 	if (wait) {
diff --git a/fs/ceph/super.h b/fs/ceph/super.h
index de5e324..25b0988 100644
--- a/fs/ceph/super.h
+++ b/fs/ceph/super.h
@@ -11,6 +11,7 @@
 #include <linux/mempool.h>
 #include <linux/pagemap.h>
 #include <linux/wait.h>
+#include <linux/writeback.h>
 
 #include "types.h"
 #include "messenger.h"
@@ -806,7 +807,7 @@ static inline void ceph_remove_cap(struct ceph_cap *cap)
 }
 
 extern void ceph_queue_caps_release(struct inode *inode);
-extern int ceph_write_inode(struct inode *inode, int unused);
+extern int ceph_write_inode(struct inode *inode, struct writeback_control *wbc);
 extern int ceph_fsync(struct file *file, struct dentry *dentry, int datasync);
 extern void ceph_kick_flushing_caps(struct ceph_mds_client *mdsc,
 				    struct ceph_mds_session *session);
-- 
1.6.6
