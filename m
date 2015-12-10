From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the vfs tree
Date: Thu, 10 Dec 2015 11:18:47 +1100
Message-ID: <20151210111847.07db6062@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45872 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753113AbbLJASt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 9 Dec 2015 19:18:49 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Al,

After merging the vfs tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

fs/orangefs/symlink.c:26:2: error: unknown field 'follow_link' specified in initializer
  .follow_link = pvfs2_follow_link,
  ^
fs/orangefs/symlink.c:26:17: warning: initialization from incompatible pointer type [-Wincompatible-pointer-types]
  .follow_link = pvfs2_follow_link, 
                 ^
fs/orangefs/symlink.c:26:17: note: (near initialization for 'pvfs2_symlink_inode_operations.put_link')

Caused by commit

  6b2553918d8b ("replace ->follow_link() with new method that could stay in RCU mode")

[I wish there was some way to stage these API changes :-(]

I applied the following merge fix patch (which may need more work):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 10 Dec 2015 11:12:36 +1100
Subject: [PATCH] orangfs: update for follow_link to get_link change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/orangefs/symlink.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/fs/orangefs/symlink.c b/fs/orangefs/symlink.c
index 2adfceff7730..dbf24a98a3c9 100644
--- a/fs/orangefs/symlink.c
+++ b/fs/orangefs/symlink.c
@@ -8,9 +8,15 @@
 #include "pvfs2-kernel.h"
 #include "pvfs2-bufmap.h"
 
-static const char *pvfs2_follow_link(struct dentry *dentry, void **cookie)
+static const char *pvfs2_get_link(struct dentry *dentry, struct inode *inode,
+				  void **cookie)
 {
-	char *target =  PVFS2_I(dentry->d_inode)->link_target;
+	char *target;
+
+	if (!dentry)
+		return ERR_PTR(-ECHILD);
+
+	target =  PVFS2_I(inode)->link_target;
 
 	gossip_debug(GOSSIP_INODE_DEBUG,
 		     "%s: called on %s (target is %p)\n",
@@ -23,7 +29,7 @@ static const char *pvfs2_follow_link(struct dentry *dentry, void **cookie)
 
 struct inode_operations pvfs2_symlink_inode_operations = {
 	.readlink = generic_readlink,
-	.follow_link = pvfs2_follow_link,
+	.get_link = pvfs2_get_link,
 	.setattr = pvfs2_setattr,
 	.getattr = pvfs2_getattr,
 	.listxattr = pvfs2_listxattr,
-- 
2.6.2

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
