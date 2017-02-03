From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the block tree
Date: Fri, 3 Feb 2017 15:53:22 +1100
Message-ID: <20170203155322.2c3ea4e6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58615 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752230AbdBCExZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 2 Feb 2017 23:53:25 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jan Kara <jack@suse.cz>

Hi Andrew,

Today's linux-next merge of the akpm tree got a conflict in:

  fs/block_dev.c

between commit:

  b1d2dc5659b4 ("block: Make blk_get_backing_dev_info() safe without open bdev")

from the block tree and patch:

  "fs: add i_blocksize()"

from the akpm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc fs/block_dev.c
index 73031ec54a7b,921e868e84de..000000000000
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@@ -988,8 -971,7 +988,8 @@@ struct block_device *bdget(dev_t dev
  		bdev->bd_contains = NULL;
  		bdev->bd_super = NULL;
  		bdev->bd_inode = inode;
 +		bdev->bd_bdi = &noop_backing_dev_info;
- 		bdev->bd_block_size = (1 << inode->i_blkbits);
+ 		bdev->bd_block_size = i_blocksize(inode);
  		bdev->bd_part_count = 0;
  		bdev->bd_invalidated = 0;
  		inode->i_mode = S_IFBLK;
