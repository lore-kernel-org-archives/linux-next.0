From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the nfs tree with Linus' tree
Date: Thu, 19 May 2016 10:40:36 +1000
Message-ID: <20160519104036.3f1ac7cf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42864 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750736AbcESAkm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 18 May 2016 20:40:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>, Weston Andros Adamson <dros@primarydata.com>, Anna Schumaker <Anna.Schumaker@Netapp.com>

Hi Trond,

Today's linux-next merge of the nfs tree got a conflict in:

  fs/nfs/direct.c

between commit:

  c8b8e32d700f ("direct-io: eliminate the offset argument to ->direct_IO")

from Linus' tree and commit:

  ed3743a6d4f3 ("nfs: add debug to directio "good_bytes" counting")

from the nfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc fs/nfs/direct.c
index 741a92c470bb,7f03163b5364..000000000000
--- a/fs/nfs/direct.c
+++ b/fs/nfs/direct.c
@@@ -591,8 -596,8 +594,8 @@@ ssize_t nfs_file_direct_read(struct kio
  		goto out_unlock;
  
  	dreq->inode = inode;
- 	dreq->bytes_left = count;
+ 	dreq->bytes_left = dreq->max_count = count;
 -	dreq->io_start = pos;
 +	dreq->io_start = iocb->ki_pos;
  	dreq->ctx = get_nfs_open_context(nfs_file_open_context(iocb->ki_filp));
  	l_ctx = nfs_get_lock_context(dreq->ctx);
  	if (IS_ERR(l_ctx)) {
