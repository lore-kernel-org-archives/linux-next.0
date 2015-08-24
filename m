From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with the btrfs tree
Date: Mon, 24 Aug 2015 14:16:07 +1000
Message-ID: <20150824141607.5644d08c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>, Chris Mason <clm@fb.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kent Overstreet <kent.overstreet@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi Jens,

Today's linux-next merge of the block tree got a conflict in:

  fs/btrfs/inode.c

between commit:

  da2f0f74cf7d ("Btrfs: add support for blkio controllers")

from the btrfs tree and commit:

  b54ffb73cadc ("block: remove bio_get_nr_vecs()")

from the block tree.

I fixed it up (following Chris's example merge - see below) and can
carry the fix as necessary (no action is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/btrfs/inode.c
index bda3c41dc9d5,f924d9a62700..000000000000
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@@ -7986,12 -7958,7 +7987,11 @@@ out
  static struct bio *btrfs_dio_bio_alloc(struct block_device *bdev,
  				       u64 first_sector, gfp_t gfp_flags)
  {
- 	int nr_vecs = bio_get_nr_vecs(bdev);
 -	return btrfs_bio_alloc(bdev, first_sector, BIO_MAX_PAGES, gfp_flags);
 +	struct bio *bio;
- 	bio = btrfs_bio_alloc(bdev, first_sector, nr_vecs, gfp_flags);
++	bio = btrfs_bio_alloc(bdev, first_sector, BIO_MAX_PAGES, gfp_flags);
 +	if (bio)
 +		bio_associate_current(bio);
 +	return bio;
  }
  
  static inline int btrfs_lookup_and_bind_dio_csum(struct btrfs_root *root,
