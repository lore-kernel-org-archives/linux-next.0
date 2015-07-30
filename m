From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with the ext3 tree
Date: Thu, 30 Jul 2015 13:15:32 +1000
Message-ID: <20150730131532.3cbd6995@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>, Jan Kara <jack@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Jens,

Today's linux-next merge of the block tree got a conflict in:

  block/bounce.c

between commit:

  a3ad0a9da863 ("block: Remove forced page bouncing under IO")

from the ext3 tree and commit:

  b7c44ed9d2fc ("block: manipulate bio->bi_flags through helpers")

from the block tree.

I fixed it up (the former removed some of the code updated by the latter)
and can carry the fix as necessary (no action is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc block/bounce.c
index 31cad13a0c9d,2c310ea007ee..000000000000
--- a/block/bounce.c
+++ b/block/bounce.c
@@@ -160,24 -161,42 +161,24 @@@ static void __bounce_end_io_read(struc
  {
  	struct bio *bio_orig = bio->bi_private;
  
- 	if (test_bit(BIO_UPTODATE, &bio->bi_flags))
+ 	if (!bio->bi_error)
  		copy_to_high_bio_irq(bio_orig, bio);
  
- 	bounce_end_io(bio, pool, err);
+ 	bounce_end_io(bio, pool);
  }
  
- static void bounce_end_io_read(struct bio *bio, int err)
+ static void bounce_end_io_read(struct bio *bio)
  {
- 	__bounce_end_io_read(bio, page_pool, err);
+ 	__bounce_end_io_read(bio, page_pool);
  }
  
- static void bounce_end_io_read_isa(struct bio *bio, int err)
+ static void bounce_end_io_read_isa(struct bio *bio)
  {
- 	__bounce_end_io_read(bio, isa_page_pool, err);
+ 	__bounce_end_io_read(bio, isa_page_pool);
  }
  
 -#ifdef CONFIG_NEED_BOUNCE_POOL
 -static int must_snapshot_stable_pages(struct request_queue *q, struct bio *bio)
 -{
 -	if (bio_data_dir(bio) != WRITE)
 -		return 0;
 -
 -	if (!bdi_cap_stable_pages_required(&q->backing_dev_info))
 -		return 0;
 -
 -	return bio_flagged(bio, BIO_SNAP_STABLE);
 -}
 -#else
 -static int must_snapshot_stable_pages(struct request_queue *q, struct bio *bio)
 -{
 -	return 0;
 -}
 -#endif /* CONFIG_NEED_BOUNCE_POOL */
 -
  static void __blk_queue_bounce(struct request_queue *q, struct bio **bio_orig,
 -			       mempool_t *pool, int force)
 +			       mempool_t *pool)
  {
  	struct bio *bio;
  	int rw = bio_data_dir(*bio_orig);
