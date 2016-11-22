From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the md tree with the block tree
Date: Tue, 22 Nov 2016 15:50:05 +1100
Message-ID: <20161122155005.1e35f02b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44813 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932214AbcKVEuI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 21 Nov 2016 23:50:08 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Shaohua Li <shli@kernel.org>, Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Song Liu <songliubraving@fb.com>

Hi Shaohua,

Today's linux-next merge of the md tree got a conflict in:

  drivers/md/raid5-cache.c

between commit:

  70fd76140a6c ("block,fs: use REQ_* flags directly")

from the block tree and commits:

  b4c625c67362 ("md/r5cache: r5cache recovery: part 1")
  3bddb7f8f264 ("md/r5cache: handle FLUSH and FUA")

from the md tree.

I fixed it up (I think - see below) and can carry the fix as necessary.
This is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/md/raid5-cache.c
index 2bca090cd64e,8cb79fc0eed9..000000000000
--- a/drivers/md/raid5-cache.c
+++ b/drivers/md/raid5-cache.c
@@@ -231,6 -544,64 +544,64 @@@ static void r5l_log_endio(struct bio *b
  
  	if (log->need_cache_flush)
  		md_wakeup_thread(log->rdev->mddev->thread);
+ 
+ 	if (io->has_null_flush) {
+ 		struct bio *bi;
+ 
+ 		WARN_ON(bio_list_empty(&io->flush_barriers));
+ 		while ((bi = bio_list_pop(&io->flush_barriers)) != NULL) {
+ 			bio_endio(bi);
+ 			atomic_dec(&io->pending_stripe);
+ 		}
+ 		if (atomic_read(&io->pending_stripe) == 0)
+ 			__r5l_stripe_write_finished(io);
+ 	}
+ }
+ 
+ static void r5l_do_submit_io(struct r5l_log *log, struct r5l_io_unit *io)
+ {
+ 	unsigned long flags;
+ 
+ 	spin_lock_irqsave(&log->io_list_lock, flags);
+ 	__r5l_set_io_unit_state(io, IO_UNIT_IO_START);
+ 	spin_unlock_irqrestore(&log->io_list_lock, flags);
+ 
+ 	if (io->has_flush)
 -		bio_set_op_attrs(io->current_bio, REQ_OP_WRITE, WRITE_FLUSH);
++		io->current_bio->bi_opf = REQ_OP_WRITE | REQ_PREFLUSH;
+ 	if (io->has_fua)
 -		bio_set_op_attrs(io->current_bio, REQ_OP_WRITE, WRITE_FUA);
++		io->current_bio->bi_opf = REQ_OP_WRITE | REQ_FUA;
+ 	submit_bio(io->current_bio);
+ 
+ 	if (!io->split_bio)
+ 		return;
+ 
+ 	if (io->has_flush)
 -		bio_set_op_attrs(io->split_bio, REQ_OP_WRITE, WRITE_FLUSH);
++		io->split_bio->bi_opf = REQ_OP_WRITE | REQ_PREFLUSH;
+ 	if (io->has_fua)
 -		bio_set_op_attrs(io->split_bio, REQ_OP_WRITE, WRITE_FUA);
++		io->split_bio->bi_opf = REQ_OP_WRITE | REQ_FUA;
+ 	submit_bio(io->split_bio);
+ }
+ 
+ /* deferred io_unit will be dispatched here */
+ static void r5l_submit_io_async(struct work_struct *work)
+ {
+ 	struct r5l_log *log = container_of(work, struct r5l_log,
+ 					   deferred_io_work);
+ 	struct r5l_io_unit *io = NULL;
+ 	unsigned long flags;
+ 
+ 	spin_lock_irqsave(&log->io_list_lock, flags);
+ 	if (!list_empty(&log->running_ios)) {
+ 		io = list_first_entry(&log->running_ios, struct r5l_io_unit,
+ 				      log_sibling);
+ 		if (!io->io_deferred)
+ 			io = NULL;
+ 		else
+ 			io->io_deferred = 0;
+ 	}
+ 	spin_unlock_irqrestore(&log->io_list_lock, flags);
+ 	if (io)
+ 		r5l_do_submit_io(log, io);
  }
  
  static void r5l_submit_current_io(struct r5l_log *log)
@@@ -892,82 -1517,138 +1517,138 @@@ static int r5l_recovery_read_meta_block
  	return 0;
  }
  
- static int r5l_recovery_flush_one_stripe(struct r5l_log *log,
- 					 struct r5l_recovery_ctx *ctx,
- 					 sector_t stripe_sect,
- 					 int *offset, sector_t *log_offset)
+ static void
+ r5l_recovery_create_empty_meta_block(struct r5l_log *log,
+ 				     struct page *page,
+ 				     sector_t pos, u64 seq)
  {
- 	struct r5conf *conf = log->rdev->mddev->private;
- 	struct stripe_head *sh;
- 	struct r5l_payload_data_parity *payload;
- 	int disk_index;
+ 	struct r5l_meta_block *mb;
+ 	u32 crc;
  
- 	sh = raid5_get_active_stripe(conf, stripe_sect, 0, 0, 0);
- 	while (1) {
- 		payload = page_address(ctx->meta_page) + *offset;
+ 	mb = page_address(page);
+ 	clear_page(mb);
+ 	mb->magic = cpu_to_le32(R5LOG_MAGIC);
+ 	mb->version = R5LOG_VERSION;
+ 	mb->meta_size = cpu_to_le32(sizeof(struct r5l_meta_block));
+ 	mb->seq = cpu_to_le64(seq);
+ 	mb->position = cpu_to_le64(pos);
+ 	crc = crc32c_le(log->uuid_checksum, mb, PAGE_SIZE);
+ 	mb->checksum = cpu_to_le32(crc);
+ }
  
- 		if (le16_to_cpu(payload->header.type) == R5LOG_PAYLOAD_DATA) {
- 			raid5_compute_sector(conf,
- 					     le64_to_cpu(payload->location), 0,
- 					     &disk_index, sh);
+ static int r5l_log_write_empty_meta_block(struct r5l_log *log, sector_t pos,
+ 					  u64 seq)
+ {
+ 	struct page *page;
  
- 			sync_page_io(log->rdev, *log_offset, PAGE_SIZE,
- 				     sh->dev[disk_index].page, REQ_OP_READ, 0,
- 				     false);
- 			sh->dev[disk_index].log_checksum =
- 				le32_to_cpu(payload->checksum[0]);
- 			set_bit(R5_Wantwrite, &sh->dev[disk_index].flags);
- 			ctx->meta_total_blocks += BLOCK_SECTORS;
- 		} else {
- 			disk_index = sh->pd_idx;
- 			sync_page_io(log->rdev, *log_offset, PAGE_SIZE,
- 				     sh->dev[disk_index].page, REQ_OP_READ, 0,
- 				     false);
- 			sh->dev[disk_index].log_checksum =
- 				le32_to_cpu(payload->checksum[0]);
- 			set_bit(R5_Wantwrite, &sh->dev[disk_index].flags);
- 
- 			if (sh->qd_idx >= 0) {
- 				disk_index = sh->qd_idx;
- 				sync_page_io(log->rdev,
- 					     r5l_ring_add(log, *log_offset, BLOCK_SECTORS),
- 					     PAGE_SIZE, sh->dev[disk_index].page,
- 					     REQ_OP_READ, 0, false);
- 				sh->dev[disk_index].log_checksum =
- 					le32_to_cpu(payload->checksum[1]);
- 				set_bit(R5_Wantwrite,
- 					&sh->dev[disk_index].flags);
- 			}
- 			ctx->meta_total_blocks += BLOCK_SECTORS * conf->max_degraded;
- 		}
+ 	page = alloc_page(GFP_KERNEL);
+ 	if (!page)
+ 		return -ENOMEM;
+ 	r5l_recovery_create_empty_meta_block(log, page, pos, seq);
+ 	if (!sync_page_io(log->rdev, pos, PAGE_SIZE, page, REQ_OP_WRITE,
 -			  WRITE_FUA, false)) {
++			  REQ_FUA, false)) {
+ 		__free_page(page);
+ 		return -EIO;
+ 	}
+ 	__free_page(page);
+ 	return 0;
+ }
  
- 		*log_offset = r5l_ring_add(log, *log_offset,
- 					   le32_to_cpu(payload->size));
- 		*offset += sizeof(struct r5l_payload_data_parity) +
- 			sizeof(__le32) *
- 			(le32_to_cpu(payload->size) >> (PAGE_SHIFT - 9));
- 		if (le16_to_cpu(payload->header.type) == R5LOG_PAYLOAD_PARITY)
- 			break;
+ /*
+  * r5l_recovery_load_data and r5l_recovery_load_parity uses flag R5_Wantwrite
+  * to mark valid (potentially not flushed) data in the journal.
+  *
+  * We already verified checksum in r5l_recovery_verify_data_checksum_for_mb,
+  * so there should not be any mismatch here.
+  */
+ static void r5l_recovery_load_data(struct r5l_log *log,
+ 				   struct stripe_head *sh,
+ 				   struct r5l_recovery_ctx *ctx,
+ 				   struct r5l_payload_data_parity *payload,
+ 				   sector_t log_offset)
+ {
+ 	struct mddev *mddev = log->rdev->mddev;
+ 	struct r5conf *conf = mddev->private;
+ 	int dd_idx;
+ 
+ 	raid5_compute_sector(conf,
+ 			     le64_to_cpu(payload->location), 0,
+ 			     &dd_idx, sh);
+ 	sync_page_io(log->rdev, log_offset, PAGE_SIZE,
+ 		     sh->dev[dd_idx].page, REQ_OP_READ, 0, false);
+ 	sh->dev[dd_idx].log_checksum =
+ 		le32_to_cpu(payload->checksum[0]);
+ 	ctx->meta_total_blocks += BLOCK_SECTORS;
+ 
+ 	set_bit(R5_Wantwrite, &sh->dev[dd_idx].flags);
+ 	set_bit(STRIPE_R5C_CACHING, &sh->state);
+ }
+ 
+ static void r5l_recovery_load_parity(struct r5l_log *log,
+ 				     struct stripe_head *sh,
+ 				     struct r5l_recovery_ctx *ctx,
+ 				     struct r5l_payload_data_parity *payload,
+ 				     sector_t log_offset)
+ {
+ 	struct mddev *mddev = log->rdev->mddev;
+ 	struct r5conf *conf = mddev->private;
+ 
+ 	ctx->meta_total_blocks += BLOCK_SECTORS * conf->max_degraded;
+ 	sync_page_io(log->rdev, log_offset, PAGE_SIZE,
+ 		     sh->dev[sh->pd_idx].page, REQ_OP_READ, 0, false);
+ 	sh->dev[sh->pd_idx].log_checksum =
+ 		le32_to_cpu(payload->checksum[0]);
+ 	set_bit(R5_Wantwrite, &sh->dev[sh->pd_idx].flags);
+ 
+ 	if (sh->qd_idx >= 0) {
+ 		sync_page_io(log->rdev,
+ 			     r5l_ring_add(log, log_offset, BLOCK_SECTORS),
+ 			     PAGE_SIZE, sh->dev[sh->qd_idx].page,
+ 			     REQ_OP_READ, 0, false);
+ 		sh->dev[sh->qd_idx].log_checksum =
+ 			le32_to_cpu(payload->checksum[1]);
+ 		set_bit(R5_Wantwrite, &sh->dev[sh->qd_idx].flags);
  	}
+ 	clear_bit(STRIPE_R5C_CACHING, &sh->state);
+ }
  
- 	for (disk_index = 0; disk_index < sh->disks; disk_index++) {
- 		void *addr;
- 		u32 checksum;
+ static void r5l_recovery_reset_stripe(struct stripe_head *sh)
+ {
+ 	int i;
  
+ 	sh->state = 0;
+ 	sh->log_start = MaxSector;
+ 	for (i = sh->disks; i--; )
+ 		sh->dev[i].flags = 0;
+ }
+ 
+ static void
+ r5l_recovery_replay_one_stripe(struct r5conf *conf,
+ 			       struct stripe_head *sh,
+ 			       struct r5l_recovery_ctx *ctx)
+ {
+ 	struct md_rdev *rdev, *rrdev;
+ 	int disk_index;
+ 	int data_count = 0;
+ 
+ 	for (disk_index = 0; disk_index < sh->disks; disk_index++) {
  		if (!test_bit(R5_Wantwrite, &sh->dev[disk_index].flags))
  			continue;
- 		addr = kmap_atomic(sh->dev[disk_index].page);
- 		checksum = crc32c_le(log->uuid_checksum, addr, PAGE_SIZE);
- 		kunmap_atomic(addr);
- 		if (checksum != sh->dev[disk_index].log_checksum)
- 			goto error;
+ 		if (disk_index == sh->qd_idx || disk_index == sh->pd_idx)
+ 			continue;
+ 		data_count++;
  	}
  
- 	for (disk_index = 0; disk_index < sh->disks; disk_index++) {
- 		struct md_rdev *rdev, *rrdev;
+ 	/*
+ 	 * stripes that only have parity must have been flushed
+ 	 * before the crash that we are now recovering from, so
+ 	 * there is nothing more to recovery.
+ 	 */
+ 	if (data_count == 0)
+ 		goto out;
  
- 		if (!test_and_clear_bit(R5_Wantwrite,
- 					&sh->dev[disk_index].flags))
+ 	for (disk_index = 0; disk_index < sh->disks; disk_index++) {
+ 		if (!test_bit(R5_Wantwrite, &sh->dev[disk_index].flags))
  			continue;
  
  		/* in case device is broken */
@@@ -1031,31 -1981,158 +1981,158 @@@ static int r5c_recovery_flush_log(struc
  		ctx->seq++;
  		ctx->pos = r5l_ring_add(log, ctx->pos, ctx->meta_total_blocks);
  	}
+ 
+ 	if (ret == -ENOMEM) {
+ 		r5c_recovery_drop_stripes(&ctx->cached_list, ctx);
+ 		return ret;
+ 	}
+ 
+ 	/* replay data-parity stripes */
+ 	r5c_recovery_replay_stripes(&ctx->cached_list, ctx);
+ 
+ 	/* load data-only stripes to stripe cache */
+ 	list_for_each_entry_safe(sh, next, &ctx->cached_list, lru) {
+ 		WARN_ON(!test_bit(STRIPE_R5C_CACHING, &sh->state));
+ 		r5c_recovery_load_one_stripe(log, sh);
+ 		list_del_init(&sh->lru);
+ 		raid5_release_stripe(sh);
+ 		ctx->data_only_stripes++;
+ 	}
+ 
+ 	return 0;
  }
  
- static int r5l_log_write_empty_meta_block(struct r5l_log *log, sector_t pos,
- 					  u64 seq)
+ /*
+  * we did a recovery. Now ctx.pos points to an invalid meta block. New
+  * log will start here. but we can't let superblock point to last valid
+  * meta block. The log might looks like:
+  * | meta 1| meta 2| meta 3|
+  * meta 1 is valid, meta 2 is invalid. meta 3 could be valid. If
+  * superblock points to meta 1, we write a new valid meta 2n.  if crash
+  * happens again, new recovery will start from meta 1. Since meta 2n is
+  * valid now, recovery will think meta 3 is valid, which is wrong.
+  * The solution is we create a new meta in meta2 with its seq == meta
+  * 1's seq + 10 and let superblock points to meta2. The same recovery will
+  * not think meta 3 is a valid meta, because its seq doesn't match
+  */
+ 
+ /*
+  * Before recovery, the log looks like the following
+  *
+  *   ---------------------------------------------
+  *   |           valid log        | invalid log  |
+  *   ---------------------------------------------
+  *   ^
+  *   |- log->last_checkpoint
+  *   |- log->last_cp_seq
+  *
+  * Now we scan through the log until we see invalid entry
+  *
+  *   ---------------------------------------------
+  *   |           valid log        | invalid log  |
+  *   ---------------------------------------------
+  *   ^                            ^
+  *   |- log->last_checkpoint      |- ctx->pos
+  *   |- log->last_cp_seq          |- ctx->seq
+  *
+  * From this point, we need to increase seq number by 10 to avoid
+  * confusing next recovery.
+  *
+  *   ---------------------------------------------
+  *   |           valid log        | invalid log  |
+  *   ---------------------------------------------
+  *   ^                              ^
+  *   |- log->last_checkpoint        |- ctx->pos+1
+  *   |- log->last_cp_seq            |- ctx->seq+11
+  *
+  * However, it is not safe to start the state machine yet, because data only
+  * parities are not yet secured in RAID. To save these data only parities, we
+  * rewrite them from seq+11.
+  *
+  *   -----------------------------------------------------------------
+  *   |           valid log        | data only stripes | invalid log  |
+  *   -----------------------------------------------------------------
+  *   ^                                                ^
+  *   |- log->last_checkpoint                          |- ctx->pos+n
+  *   |- log->last_cp_seq                              |- ctx->seq+10+n
+  *
+  * If failure happens again during this process, the recovery can safe start
+  * again from log->last_checkpoint.
+  *
+  * Once data only stripes are rewritten to journal, we move log_tail
+  *
+  *   -----------------------------------------------------------------
+  *   |     old log        |    data only stripes    | invalid log  |
+  *   -----------------------------------------------------------------
+  *                        ^                         ^
+  *                        |- log->last_checkpoint   |- ctx->pos+n
+  *                        |- log->last_cp_seq       |- ctx->seq+10+n
+  *
+  * Then we can safely start the state machine. If failure happens from this
+  * point on, the recovery will start from new log->last_checkpoint.
+  */
+ static int
+ r5c_recovery_rewrite_data_only_stripes(struct r5l_log *log,
+ 				       struct r5l_recovery_ctx *ctx)
  {
+ 	struct stripe_head *sh;
+ 	struct mddev *mddev = log->rdev->mddev;
  	struct page *page;
- 	struct r5l_meta_block *mb;
- 	u32 crc;
  
- 	page = alloc_page(GFP_KERNEL | __GFP_ZERO);
- 	if (!page)
+ 	page = alloc_page(GFP_KERNEL);
+ 	if (!page) {
+ 		pr_err("md/raid:%s: cannot allocate memory to rewrite data only stripes\n",
+ 		       mdname(mddev));
  		return -ENOMEM;
- 	mb = page_address(page);
- 	mb->magic = cpu_to_le32(R5LOG_MAGIC);
- 	mb->version = R5LOG_VERSION;
- 	mb->meta_size = cpu_to_le32(sizeof(struct r5l_meta_block));
- 	mb->seq = cpu_to_le64(seq);
- 	mb->position = cpu_to_le64(pos);
- 	crc = crc32c_le(log->uuid_checksum, mb, PAGE_SIZE);
- 	mb->checksum = cpu_to_le32(crc);
+ 	}
  
- 	if (!sync_page_io(log->rdev, pos, PAGE_SIZE, page, REQ_OP_WRITE,
- 			  REQ_FUA, false)) {
- 		__free_page(page);
- 		return -EIO;
+ 	ctx->seq += 10;
+ 	list_for_each_entry(sh, &ctx->cached_list, lru) {
+ 		struct r5l_meta_block *mb;
+ 		int i;
+ 		int offset;
+ 		sector_t write_pos;
+ 
+ 		WARN_ON(!test_bit(STRIPE_R5C_CACHING, &sh->state));
+ 		r5l_recovery_create_empty_meta_block(log, page,
+ 						     ctx->pos, ctx->seq);
+ 		mb = page_address(page);
+ 		offset = le32_to_cpu(mb->meta_size);
+ 		write_pos = ctx->pos + BLOCK_SECTORS;
+ 
+ 		for (i = sh->disks; i--; ) {
+ 			struct r5dev *dev = &sh->dev[i];
+ 			struct r5l_payload_data_parity *payload;
+ 			void *addr;
+ 
+ 			if (test_bit(R5_InJournal, &dev->flags)) {
+ 				payload = (void *)mb + offset;
+ 				payload->header.type = cpu_to_le16(
+ 					R5LOG_PAYLOAD_DATA);
+ 				payload->size = BLOCK_SECTORS;
+ 				payload->location = cpu_to_le64(
+ 					raid5_compute_blocknr(sh, i, 0));
+ 				addr = kmap_atomic(dev->page);
+ 				payload->checksum[0] = cpu_to_le32(
+ 					crc32c_le(log->uuid_checksum, addr,
+ 						  PAGE_SIZE));
+ 				kunmap_atomic(addr);
+ 				sync_page_io(log->rdev, write_pos, PAGE_SIZE,
+ 					     dev->page, REQ_OP_WRITE, 0, false);
+ 				write_pos = r5l_ring_add(log, write_pos,
+ 							 BLOCK_SECTORS);
+ 				offset += sizeof(__le32) +
+ 					sizeof(struct r5l_payload_data_parity);
+ 
+ 			}
+ 		}
+ 		mb->meta_size = cpu_to_le32(offset);
+ 		mb->checksum = crc32c_le(log->uuid_checksum, mb, PAGE_SIZE);
+ 		sync_page_io(log->rdev, ctx->pos, PAGE_SIZE, page,
 -			     REQ_OP_WRITE, WRITE_FUA, false);
++			     REQ_OP_WRITE, REQ_FUA, false);
+ 		sh->log_start = ctx->pos;
+ 		ctx->pos = write_pos;
+ 		ctx->seq += 1;
  	}
  	__free_page(page);
  	return 0;
