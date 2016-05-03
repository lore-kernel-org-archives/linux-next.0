From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the vfs tree
Date: Tue, 3 May 2016 16:44:22 +1000
Message-ID: <20160503164422.78369452@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49048 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750732AbcECGoZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 3 May 2016 02:44:25 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, "John L. Hammond" <john.hammond@intel.com>

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/staging/lustre/lustre/llite/rw26.c

between commit:

  c8b8e32d700f ("direct-io: eliminate the offset argument to ->direct_IO")

from the vfs tree and commit:

  8c7b0e1a6747 ("staging/lustre/llite: rename ccc_object to vvp_object")

from the staging tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/staging/lustre/lustre/llite/rw26.c
index 0c3459c1a518,93411896aef0..000000000000
--- a/drivers/staging/lustre/lustre/llite/rw26.c
+++ b/drivers/staging/lustre/lustre/llite/rw26.c
@@@ -364,8 -351,7 +350,8 @@@ static ssize_t ll_direct_IO_26(struct k
  	struct cl_io *io;
  	struct file *file = iocb->ki_filp;
  	struct inode *inode = file->f_mapping->host;
- 	struct ccc_object *obj = cl_inode2ccc(inode);
+ 	struct vvp_object *obj = cl_inode2vvp(inode);
 +	loff_t file_offset = iocb->ki_pos;
  	ssize_t count = iov_iter_count(iter);
  	ssize_t tot_bytes = 0, result = 0;
  	struct ll_inode_info *lli = ll_i2info(inode);
