From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the btrfs-kdave tree with Linus' tree
Date: Thu, 15 Dec 2016 10:25:35 +1100
Message-ID: <20161215102535.5e8db7e0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Sterba <dsterba@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@fb.com>, Jeff Mahoney <jeffm@suse.com>
List-Id: linux-next.vger.kernel.org

Hi David,

Today's linux-next merge of the btrfs-kdave tree got a conflict in:

  fs/btrfs/inode.c

between commit:

  70fd76140a6c ("block,fs: use REQ_* flags directly")

from Linus' tree and commit:

  da17066c4047 ("btrfs: pull node/sector/stripe sizes out of root and into fs_info")

from the btrfs-kdave tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc fs/btrfs/inode.c
index a4c879671b9d,b2a577cf001f..000000000000
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@@ -7935,8 -7941,10 +7941,8 @@@ static int dio_read_error(struct inode 
  
  	if ((failed_bio->bi_vcnt > 1)
  		|| (failed_bio->bi_io_vec->bv_len
- 			> BTRFS_I(inode)->root->sectorsize))
+ 			> btrfs_inode_sectorsize(inode)))
 -		read_mode = READ_SYNC | REQ_FAILFAST_DEV;
 -	else
 -		read_mode = READ_SYNC;
 +		read_mode |= REQ_FAILFAST_DEV;
  
  	isector = start - btrfs_io_bio(failed_bio)->logical;
  	isector >>= inode->i_sb->s_blocksize_bits;
