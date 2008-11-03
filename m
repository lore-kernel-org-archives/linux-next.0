From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the slab tree
Date: Mon, 3 Nov 2008 15:07:50 +1100
Message-ID: <20081103150750.87fe762d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42651 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754694AbYKCEIA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 2 Nov 2008 23:08:00 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pekka Enberg <penberg@cs.helsinki.fi>, Christoph Lameter <cl@linux-foundation.org>
Cc: linux-next@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>

Hi all,

Today's linux-next merge of the slab tree got a conflict in
fs/proc/inode.c between commit 5bcd7ff9e1690dbdbccb2a1cb3c2ea8b8381c435
("proc: proc_init_inodecache() can't fail") from Linus' tree and commit
f7f650b4b85ad364072936db9e6beddcb2ca33b8 ("Filesystem: /proc filesystem
support for slab defrag") from the slab tree.

It is just a context change. I fixed it up (see below) and will carry the
fix for a couple of days (during which time it will hopefully be fixed in
your tree).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc fs/proc/inode.c
index 2543fd0,54f8137..0000000
--- a/fs/proc/inode.c
+++ b/fs/proc/inode.c
@@@ -106,13 -106,22 +106,21 @@@ static void init_once(void *foo
  	inode_init_once(&ei->vfs_inode);
  }
  
+ static void *proc_get_inodes(struct kmem_cache *s, int nr, void **v)
+ {
+ 	return fs_get_inodes(s, nr, v,
+ 		offsetof(struct proc_inode, vfs_inode));
+ };
+ 
 -int __init proc_init_inodecache(void)
 +void __init proc_init_inodecache(void)
  {
  	proc_inode_cachep = kmem_cache_create("proc_inode_cache",
  					     sizeof(struct proc_inode),
  					     0, (SLAB_RECLAIM_ACCOUNT|
  						SLAB_MEM_SPREAD|SLAB_PANIC),
  					     init_once);
+ 	kmem_cache_setup_defrag(proc_inode_cachep,
+ 				proc_get_inodes, kick_inodes);
 -	return 0;
  }
  
  static const struct super_operations proc_sops = {
