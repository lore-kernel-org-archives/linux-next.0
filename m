From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with the btrfs-kdave
 tree
Date: Thu, 17 Nov 2016 13:01:34 +1100
Message-ID: <20161117130134.682bb6b4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54555 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752897AbcKQCBh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 16 Nov 2016 21:01:37 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>, David Sterba <dsterba@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

Hi Jens,

Today's linux-next merge of the block tree got conflicts in:

  fs/btrfs/extent_io.c
  fs/btrfs/inode.c

between commit:

  01a1400f8545 ("btrfs: only check bio size to see if a repair bio should have the failfast flag")

from the btrfs-kdave tree and commit:

  70fd76140a6c ("block,fs: use REQ_* flags directly")

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

diff --cc fs/btrfs/extent_io.c
index 5694d60adad9,1e67723c27a1..000000000000
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@@ -2403,10 -2403,8 +2403,8 @@@ static int bio_readpage_error(struct bi
  		return -EIO;
  	}
  
 -	if (failed_bio->bi_vcnt > 1)
 +	if (failed_bio->bi_iter.bi_size > BTRFS_I(inode)->root->sectorsize)
- 		read_mode = READ_SYNC | REQ_FAILFAST_DEV;
- 	else
- 		read_mode = READ_SYNC;
+ 		read_mode |= REQ_FAILFAST_DEV;
  
  	phy_offset >>= inode->i_sb->s_blocksize_bits;
  	bio = btrfs_create_repair_bio(inode, failed_bio, failrec, page,
diff --cc fs/btrfs/inode.c
index 7e8603c74f43,a4c879671b9d..000000000000
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@@ -7924,10 -7933,10 +7924,8 @@@ static int dio_read_error(struct inode 
  		return -EIO;
  	}
  
 -	if ((failed_bio->bi_vcnt > 1)
 -		|| (failed_bio->bi_io_vec->bv_len
 -			> BTRFS_I(inode)->root->sectorsize))
 +	if (failed_bio->bi_iter.bi_size > BTRFS_I(inode)->root->sectorsize)
- 		read_mode = READ_SYNC | REQ_FAILFAST_DEV;
- 	else
- 		read_mode = READ_SYNC;
+ 		read_mode |= REQ_FAILFAST_DEV;
  
  	isector = start - btrfs_io_bio(failed_bio)->logical;
  	isector >>= inode->i_sb->s_blocksize_bits;
