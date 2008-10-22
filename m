From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] fs: fix inode.c kernel-doc warnings
Date: Wed, 22 Oct 2008 16:39:47 -0700
Message-ID: <48FFB9C3.1000703@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from xenotime.net ([66.160.160.81]:48211 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1751915AbYJVXjv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 22 Oct 2008 19:39:51 -0400
Received: from 69.30.121.162 ([69.30.121.162]) by xenotime.net for <linux-next@vger.kernel.org>; Wed, 22 Oct 2008 16:39:48 -0700
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: akpm <akpm@linux-foundation.org>, viro@zeniv.linux.org.uk

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix fs/inode.c kernel-doc warnings:

Warning(linux-next-20081022//fs/inode.c:120): No description found for parameter 'sb'
Warning(linux-next-20081022//fs/inode.c:120): No description found for parameter 'inode'
Warning(linux-next-20081022//fs/inode.c:587): No description found for parameter 'sb'
Warning(linux-next-20081022//fs/inode.c:587): No description found for parameter 'inode'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
cc: Al Viro <viro@zeniv.linux.org.uk>
---
 fs/inode.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- linux-next-20081022.orig/fs/inode.c
+++ linux-next-20081022/fs/inode.c
@@ -110,8 +110,8 @@ static void wake_up_inode(struct inode *
 
 /**
  * inode_init_always - perform inode structure intialisation
- * @sb		- superblock inode belongs to.
- * @inode	- inode to initialise
+ * @sb: superblock inode belongs to.
+ * @inode: inode to initialise
  *
  * These are initializations that need to be done on every inode
  * allocation as the fields are not initialised by slab allocation.
@@ -573,8 +573,8 @@ __inode_add_to_lists(struct super_block 
 
 /**
  * inode_add_to_lists - add a new inode to relevant lists
- * @sb		- superblock inode belongs to.
- * @inode	- inode to mark in use
+ * @sb: superblock inode belongs to.
+ * @inode: inode to mark in use
  *
  * When an inode is allocated it needs to be accounted for, added to the in use
  * list, the owning superblock and the inode hash. This needs to be done under
