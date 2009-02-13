From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH next 2/2] pohmelfs: fix printk format warnings
Date: Fri, 13 Feb 2009 15:59:44 +0300
Message-ID: <20090213125944.GB7003@orion>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f20.google.com ([209.85.220.20]:47542 "EHLO
	mail-fx0-f20.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753254AbZBMM7z (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 13 Feb 2009 07:59:55 -0500
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: zbr@ioremap.net, gregkh@suse.de, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

drivers/staging/pohmelfs/inode.c:917: warning: format '%u' expects type 'unsigned int', but argument 4 has type 'size_t'
drivers/staging/pohmelfs/inode.c:1036: warning: format '%u' expects type 'unsigned int', but argument 7 has type 'size_t'
drivers/staging/pohmelfs/trans.c:164: warning: format '%u' expects type 'unsigned int', but argument 5 has type '__kernel_size_t'
drivers/staging/pohmelfs/trans.c:170: warning: format '%u' expects type 'unsigned int', but argument 7 has type '__kernel_size_t'
drivers/staging/pohmelfs/trans.c:517: warning: format '%u' expects type 'unsigned int', but argument 6 has type '__kernel_size_t'
drivers/staging/pohmelfs/trans.c:600: warning: format '%u' expects type 'unsigned int', but argument 6 has type '__kernel_size_t'
drivers/staging/pohmelfs/trans.c:610: warning: format '%u' expects type 'unsigned int', but argument 7 has type '__kernel_size_t'

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---

 drivers/staging/pohmelfs/inode.c |    4 ++--
 drivers/staging/pohmelfs/trans.c |   10 +++++-----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/pohmelfs/inode.c b/drivers/staging/pohmelfs/inode.c
index 0980c3c..d4ba96c 100644
--- a/drivers/staging/pohmelfs/inode.c
+++ b/drivers/staging/pohmelfs/inode.c
@@ -914,7 +914,7 @@ ssize_t pohmelfs_write(struct file *file, const char __user *buf,
 	kiocb.ki_pos = pos;
 	kiocb.ki_left = len;
 
-	dprintk("%s: len: %u, pos: %llu.\n", __func__, len, pos);
+	dprintk("%s: len: %u, pos: %llu.\n", __func__, (unsigned)len, pos);
 
 	mutex_lock(&inode->i_mutex);
 	ret = pohmelfs_data_lock(pi, pos, len, POHMELFS_WRITE_LOCK);
@@ -1034,7 +1034,7 @@ static int pohmelfs_send_xattr_req(struct pohmelfs_inode *pi, u64 id, u64 start,
 	void *data;
 
 	dprintk("%s: id: %llu, start: %llu, name: '%s', attrsize: %u, cmd: %d.\n",
-			__func__, id, start, name, attrsize, command);
+			__func__, id, start, name, (unsigned)attrsize, command);
 
 	path_len = pohmelfs_path_length(pi);
 	if (path_len < 0) {
diff --git a/drivers/staging/pohmelfs/trans.c b/drivers/staging/pohmelfs/trans.c
index 92054bd..efc9afe 100644
--- a/drivers/staging/pohmelfs/trans.c
+++ b/drivers/staging/pohmelfs/trans.c
@@ -161,7 +161,7 @@ int netfs_trans_send(struct netfs_trans *t, struct netfs_state *st)
 	err = kernel_sendmsg(st->socket, &msg, (struct kvec *)msg.msg_iov, 1, t->iovec.iov_len);
 	if (err <= 0) {
 		printk("%s: failed to send contig transaction: t: %p, gen: %u, size: %u, err: %d.\n",
-				__func__, t, t->gen, t->iovec.iov_len, err);
+				__func__, t, t->gen, (unsigned)t->iovec.iov_len, err);
 		if (err == 0)
 			err = -ECONNRESET;
 		goto err_out_unlock_return;
@@ -169,7 +169,7 @@ int netfs_trans_send(struct netfs_trans *t, struct netfs_state *st)
 
 	dprintk("%s: sent %s transaction: t: %p, gen: %u, size: %u, page_num: %u.\n",
 			__func__, (t->page_num)?"partial":"full",
-			t, t->gen, t->iovec.iov_len, t->page_num);
+			t, t->gen, (unsigned)t->iovec.iov_len, t->page_num);
 
 	err = 0;
 	if (t->attached_pages)
@@ -515,7 +515,7 @@ int netfs_trans_finish(struct netfs_trans *t, struct pohmelfs_sb *psb)
 	}
 
 	dprintk("%s: t: %u, size: %u, iov_len: %u, attached_size: %u, attached_pages: %u.\n",
-			__func__, t->gen, cmd->size, t->iovec.iov_len, t->attached_size, t->attached_pages);
+			__func__, t->gen, cmd->size, (unsigned)t->iovec.iov_len, t->attached_size, t->attached_pages);
 	err = pohmelfs_trans_crypt(t, psb);
 	if (err) {
 		t->result = err;
@@ -598,7 +598,7 @@ void *netfs_trans_add(struct netfs_trans *t, unsigned int size)
 
 	if (io->iov_len + size > t->total_size) {
 		dprintk("%s: too big size t: %p, gen: %u, iov_len: %u, size: %u, total: %u.\n",
-				__func__, t, t->gen, io->iov_len, size, t->total_size);
+				__func__, t, t->gen, (unsigned)io->iov_len, size, t->total_size);
 		ptr = ERR_PTR(-E2BIG);
 		goto out;
 	}
@@ -608,7 +608,7 @@ void *netfs_trans_add(struct netfs_trans *t, unsigned int size)
 
 out:
 	dprintk("%s: t: %p, gen: %u, size: %u, total: %u.\n",
-		__func__, t, t->gen, size, io->iov_len);
+		__func__, t, t->gen, size, (unsigned)io->iov_len);
 	return ptr;
 }
 
