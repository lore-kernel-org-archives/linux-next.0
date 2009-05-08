From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the  tree
Date: Fri, 8 May 2009 14:44:57 +1000
Message-ID: <20090508144457.c88fc3dc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54068 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751209AbZEHEpF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 8 May 2009 00:45:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Tejun Heo <tj@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in
fs/fuse/inode.c between commit a325f9b92273d6c64ec56167905b951b9827ec33
("fuse: update fuse_conn_init() and separate out fuse_conn_kill()") from
the fuse tree and commit 4225d95ddb751e09da0c145b58549da95ba13e3a ("push
BKL down into ->put_super") from the vfs tree.

I fixed it up (see below - please check) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/fuse/inode.c
index d8673cc,31a9720..0000000
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@@ -295,17 -297,10 +298,21 @@@ void fuse_conn_kill(struct fuse_conn *f
  	list_del(&fc->entry);
  	fuse_ctl_remove_conn(fc);
  	mutex_unlock(&fuse_mutex);
 -	bdi_destroy(&fc->bdi);
 +	fuse_bdi_destroy(fc);
 +}
 +EXPORT_SYMBOL_GPL(fuse_conn_kill);
 +
 +static void fuse_put_super(struct super_block *sb)
 +{
 +	struct fuse_conn *fc = get_fuse_conn_super(sb);
 +
++	lock_kernel();
++
 +	fuse_send_destroy(fc);
 +	fuse_conn_kill(fc);
  	fuse_conn_put(fc);
+ 
+ 	unlock_kernel();
  }
  
  static void convert_fuse_statfs(struct kstatfs *stbuf, struct fuse_kstatfs *attr)
