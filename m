From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with the btrfs tree
Date: Mon, 24 Aug 2015 14:16:01 +1000
Message-ID: <20150824141601.0468d5ed@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>, Chris Mason <clm@fb.com>, Josef Bacik <jbacik@fb.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Omar Sandoval <osandov@fb.com>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

Hi Jens,

Today's linux-next merge of the block tree got a conflict in:

  fs/btrfs/raid56.c

between commit:

  b4ee1782686d ("Btrfs: add RAID 5/6 BTRFS_RBIO_REBUILD_MISSING operation")

from the btrfs tree and commit:

  4246a0b63bd8 ("block: add a bi_error field to struct bio")

from the block tree.

I fixed it up (using Chris's example merge - see below) and can carry
the fix as necessary (no action is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/btrfs/raid56.c
index 6fe2613ef288,0a02e24900aa..000000000000
--- a/fs/btrfs/raid56.c
+++ b/fs/btrfs/raid56.c
@@@ -1975,9 -1960,7 +1971,9 @@@ cleanup_io
  		else
  			clear_bit(RBIO_CACHE_READY_BIT, &rbio->flags);
  
- 		rbio_orig_end_io(rbio, err, err == 0);
+ 		rbio_orig_end_io(rbio, err);
 +	} else if (rbio->operation == BTRFS_RBIO_REBUILD_MISSING) {
- 		rbio_orig_end_io(rbio, err, err == 0);
++		rbio_orig_end_io(rbio, err);
  	} else if (err == 0) {
  		rbio->faila = -1;
  		rbio->failb = -1;
@@@ -2114,9 -2096,8 +2109,9 @@@ out
  	return 0;
  
  cleanup:
 -	if (rbio->operation == BTRFS_RBIO_READ_REBUILD)
 +	if (rbio->operation == BTRFS_RBIO_READ_REBUILD ||
 +	    rbio->operation == BTRFS_RBIO_REBUILD_MISSING)
- 		rbio_orig_end_io(rbio, -EIO, 0);
+ 		rbio_orig_end_io(rbio, -EIO);
  	return -EIO;
  }
  
