From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the fsnotify tree with the vfs tree
Date: Mon, 15 Feb 2010 17:56:01 +1100
Message-ID: <20100215175601.f6041d9d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60469 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753850Ab0BOG4F (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Feb 2010 01:56:05 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eric Paris <eparis@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>

Hi Eric,

Today's linux-next merge of the fsnotify tree got a conflict in
fs/notify/inotify/inotify_user.c between commit
9f009a78fb3b54976cfe8173d05ef483dbda4571 ("switch inotify_user to
anon_inode") from the vfs tree and commit
9036fe89f12afba49cd3e5b44b2f94fbd3269269 ("inotify: rename mark_entry to
just mark") from the fsnotify tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/notify/inotify/inotify_user.c
index 472cdf2,bc1f395..0000000
--- a/fs/notify/inotify/inotify_user.c
+++ b/fs/notify/inotify/inotify_user.c
@@@ -767,7 -873,17 +836,7 @@@ out
   */
  static int __init inotify_user_setup(void)
  {
- 	inotify_inode_mark_cachep = KMEM_CACHE(inotify_inode_mark_entry, SLAB_PANIC);
 -	int ret;
 -
 -	ret = register_filesystem(&inotify_fs_type);
 -	if (unlikely(ret))
 -		panic("inotify: register_filesystem returned %d!\n", ret);
 -
 -	inotify_mnt = kern_mount(&inotify_fs_type);
 -	if (IS_ERR(inotify_mnt))
 -		panic("inotify: kern_mount ret %ld!\n", PTR_ERR(inotify_mnt));
 -
+ 	inotify_inode_mark_cachep = KMEM_CACHE(inotify_inode_mark, SLAB_PANIC);
  	event_priv_cachep = KMEM_CACHE(inotify_event_private_data, SLAB_PANIC);
  
  	inotify_max_queued_events = 16384;
