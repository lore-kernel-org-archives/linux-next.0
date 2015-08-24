From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with the btrfs tree
Date: Mon, 24 Aug 2015 14:15:52 +1000
Message-ID: <20150824141552.350520ee@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>, Chris Mason <clm@fb.com>, Josef Bacik <jbacik@fb.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Omar Sandoval <osandov@fb.com>
List-Id: linux-next.vger.kernel.org

Hi Jens,

Today's linux-next merge of the block tree got a conflict in:

  fs/btrfs/scrub.c

between commit:

  4246a0b63bd8 ("block: add a bi_error field to struct bio")

from the btrfs tree and commit:

  03679ade86b2 ("Btrfs: remove misleading handling of missing device scrub")

from the block tree.

I fixed it up (using Chris' example merge - see below) and can carry
the fix as necessary (no action is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/btrfs/scrub.c
index c69c75e7b841,9c146d8307b5..000000000000
--- a/fs/btrfs/scrub.c
+++ b/fs/btrfs/scrub.c
@@@ -2174,134 -2165,6 +2161,134 @@@ again
  	return 0;
  }
  
- static void scrub_missing_raid56_end_io(struct bio *bio, int error)
++static void scrub_missing_raid56_end_io(struct bio *bio)
 +{
 +	struct scrub_block *sblock = bio->bi_private;
 +	struct btrfs_fs_info *fs_info = sblock->sctx->dev_root->fs_info;
 +
- 	if (error)
++	if (bio->bi_error)
 +		sblock->no_io_error_seen = 0;
 +
 +	btrfs_queue_work(fs_info->scrub_workers, &sblock->work);
 +}
 +
 +static void scrub_missing_raid56_worker(struct btrfs_work *work)
 +{
 +	struct scrub_block *sblock = container_of(work, struct scrub_block, work);
 +	struct scrub_ctx *sctx = sblock->sctx;
 +	struct btrfs_fs_info *fs_info = sctx->dev_root->fs_info;
 +	unsigned int is_metadata;
 +	unsigned int have_csum;
 +	u8 *csum;
 +	u64 generation;
 +	u64 logical;
 +	struct btrfs_device *dev;
 +
 +	is_metadata = !(sblock->pagev[0]->flags & BTRFS_EXTENT_FLAG_DATA);
 +	have_csum = sblock->pagev[0]->have_csum;
 +	csum = sblock->pagev[0]->csum;
 +	generation = sblock->pagev[0]->generation;
 +	logical = sblock->pagev[0]->logical;
 +	dev = sblock->pagev[0]->dev;
 +
 +	if (sblock->no_io_error_seen) {
 +		scrub_recheck_block_checksum(fs_info, sblock, is_metadata,
 +					     have_csum, csum, generation,
 +					     sctx->csum_size);
 +	}
 +
 +	if (!sblock->no_io_error_seen) {
 +		spin_lock(&sctx->stat_lock);
 +		sctx->stat.read_errors++;
 +		spin_unlock(&sctx->stat_lock);
 +		printk_ratelimited_in_rcu(KERN_ERR
 +			"BTRFS: I/O error rebulding logical %llu for dev %s\n",
 +			logical, rcu_str_deref(dev->name));
 +	} else if (sblock->header_error || sblock->checksum_error) {
 +		spin_lock(&sctx->stat_lock);
 +		sctx->stat.uncorrectable_errors++;
 +		spin_unlock(&sctx->stat_lock);
 +		printk_ratelimited_in_rcu(KERN_ERR
 +			"BTRFS: failed to rebuild valid logical %llu for dev %s\n",
 +			logical, rcu_str_deref(dev->name));
 +	} else {
 +		scrub_write_block_to_dev_replace(sblock);
 +	}
 +
 +	scrub_block_put(sblock);
 +
 +	if (sctx->is_dev_replace &&
 +	    atomic_read(&sctx->wr_ctx.flush_all_writes)) {
 +		mutex_lock(&sctx->wr_ctx.wr_lock);
 +		scrub_wr_submit(sctx);
 +		mutex_unlock(&sctx->wr_ctx.wr_lock);
 +	}
 +
 +	scrub_pending_bio_dec(sctx);
 +}
 +
 +static void scrub_missing_raid56_pages(struct scrub_block *sblock)
 +{
 +	struct scrub_ctx *sctx = sblock->sctx;
 +	struct btrfs_fs_info *fs_info = sctx->dev_root->fs_info;
 +	u64 length = sblock->page_count * PAGE_SIZE;
 +	u64 logical = sblock->pagev[0]->logical;
 +	struct btrfs_bio *bbio;
 +	struct bio *bio;
 +	struct btrfs_raid_bio *rbio;
 +	int ret;
 +	int i;
 +
 +	ret = btrfs_map_sblock(fs_info, REQ_GET_READ_MIRRORS, logical, &length,
 +			       &bbio, 0, 1);
 +	if (ret || !bbio || !bbio->raid_map)
 +		goto bbio_out;
 +
 +	if (WARN_ON(!sctx->is_dev_replace ||
 +		    !(bbio->map_type & BTRFS_BLOCK_GROUP_RAID56_MASK))) {
 +		/*
 +		 * We shouldn't be scrubbing a missing device. Even for dev
 +		 * replace, we should only get here for RAID 5/6. We either
 +		 * managed to mount something with no mirrors remaining or
 +		 * there's a bug in scrub_remap_extent()/btrfs_map_block().
 +		 */
 +		goto bbio_out;
 +	}
 +
 +	bio = btrfs_io_bio_alloc(GFP_NOFS, 0);
 +	if (!bio)
 +		goto bbio_out;
 +
 +	bio->bi_iter.bi_sector = logical >> 9;
 +	bio->bi_private = sblock;
 +	bio->bi_end_io = scrub_missing_raid56_end_io;
 +
 +	rbio = raid56_alloc_missing_rbio(sctx->dev_root, bio, bbio, length);
 +	if (!rbio)
 +		goto rbio_out;
 +
 +	for (i = 0; i < sblock->page_count; i++) {
 +		struct scrub_page *spage = sblock->pagev[i];
 +
 +		raid56_add_scrub_pages(rbio, spage->page, spage->logical);
 +	}
 +
 +	btrfs_init_work(&sblock->work, btrfs_scrub_helper,
 +			scrub_missing_raid56_worker, NULL, NULL);
 +	scrub_block_get(sblock);
 +	scrub_pending_bio_inc(sctx);
 +	raid56_submit_missing_rbio(rbio);
 +	return;
 +
 +rbio_out:
 +	bio_put(bio);
 +bbio_out:
 +	btrfs_put_bbio(bbio);
 +	spin_lock(&sctx->stat_lock);
 +	sctx->stat.malloc_errors++;
 +	spin_unlock(&sctx->stat_lock);
 +}
 +
  static int scrub_pages(struct scrub_ctx *sctx, u64 logical, u64 len,
  		       u64 physical, struct btrfs_device *dev, u64 flags,
  		       u64 gen, int mirror_num, u8 *csum, int force,
