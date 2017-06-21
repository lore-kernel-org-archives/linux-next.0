From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with the file-locks tree
Date: Wed, 21 Jun 2017 13:17:36 +1000
Message-ID: <20170621131736.44dc39ac@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55523 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751175AbdFUDRj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Jun 2017 23:17:39 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>, Jeff Layton <jlayton@poochiereds.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Goldwyn Rodrigues <rgoldwyn@suse.com>

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  fs/ext4/file.c

between commit:

  c37683e32cca ("ext4: add more robust reporting of metadata writeback errors")

from the file-locks tree and commit:

  728fbc0e10b7 ("ext4: nowait aio support")

from the block tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc fs/ext4/file.c
index d41d3d0b4ef1,58e2eeaa0bc4..000000000000
--- a/fs/ext4/file.c
+++ b/fs/ext4/file.c
@@@ -435,13 -454,11 +454,17 @@@ static int ext4_file_open(struct inode 
  		if (ret < 0)
  			return ret;
  	}
+ 
+ 	/* Set the flags to support nowait AIO */
+ 	filp->f_mode |= FMODE_AIO_NOWAIT;
+ 
 -	return dquot_file_open(inode, filp);
 +	ret = dquot_file_open(inode, filp);
 +	if (!ret) {
 +		struct inode *bd_inode = sb->s_bdev->bd_inode;
 +
 +		filp->f_md_wb_err = filemap_sample_wb_err(bd_inode->i_mapping);
 +	}
 +	return ret;
  }
  
  /*
