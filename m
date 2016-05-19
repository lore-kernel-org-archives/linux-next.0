From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the nfs tree
Date: Thu, 19 May 2016 10:58:47 +1000
Message-ID: <20160519105847.2b05c81f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36659 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751142AbcESA6w (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 18 May 2016 20:58:52 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Anna Schumaker <Anna.Schumaker@netapp.com>, Al Viro <viro@zeniv.linux.org.uk>, Linus <torvalds@linux-foundation.org>

Hi Trond,

After merging the nfs tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

In file included from include/linux/fs.h:19:0,
                 from fs/nfs/nfs42proc.c:4:
fs/nfs/nfs42proc.c: In function 'nfs42_proc_copy':
fs/nfs/nfs42proc.c:212:30: error: 'struct inode' has no member named 'i_mutex'
   mutex_lock(&file_inode(dst)->i_mutex);
                              ^
include/linux/mutex.h:146:44: note: in definition of macro 'mutex_lock'
 #define mutex_lock(lock) mutex_lock_nested(lock, 0)
                                            ^
fs/nfs/nfs42proc.c:215:32: error: 'struct inode' has no member named 'i_mutex'
   mutex_unlock(&file_inode(dst)->i_mutex);
                                ^   

Caused by commit

  2e72448b07dc ("NFS: Add COPY nfs operation")

interacting with commit

  9902af79c01a ("parallel lookups: actual switch to rwsem")

from Linus' tree.

I applied the following merge fix patch - you will need to send this to
Linus when you ask him to merge your tree.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 19 May 2016 10:50:26 +1000
Subject: [PATCH] nfs: fix for i_mutex to i_rwsem change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/nfs/nfs42proc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/nfs/nfs42proc.c b/fs/nfs/nfs42proc.c
index 20c44d1209dc..aa03ed09ba06 100644
--- a/fs/nfs/nfs42proc.c
+++ b/fs/nfs/nfs42proc.c
@@ -209,10 +209,10 @@ ssize_t nfs42_proc_copy(struct file *src, loff_t pos_src,
 	dst_exception.state = dst_lock->open_context->state;
 
 	do {
-		mutex_lock(&file_inode(dst)->i_mutex);
+		inode_lock(file_inode(dst));
 		err = _nfs42_proc_copy(src, pos_src, src_lock,
 				       dst, pos_dst, dst_lock, count);
-		mutex_unlock(&file_inode(dst)->i_mutex);
+		inode_unlock(file_inode(dst));
 
 		if (err == -ENOTSUPP) {
 			err = -EOPNOTSUPP;
-- 
2.7.0

-- 
Cheers,
Stephen Rothwell
