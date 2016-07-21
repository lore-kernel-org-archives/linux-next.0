From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the device-mapper tree with the block
 tree
Date: Thu, 21 Jul 2016 13:27:02 +1000
Message-ID: <20160721132702.49046e04@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47445 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751939AbcGUD1G (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 20 Jul 2016 23:27:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>, Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

Hi all,

Today's linux-next merge of the device-mapper tree got a conflict in:

  drivers/md/dm.c

between commit:

  4cc96131afce ("dm: move request-based code out to dm-rq.[hc]")

from the block tree and commit:

  70246286e94c ("block: get rid of bio_rw and READA")

from the device-mapper tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/md/dm.c
index 812fd5984eea,4dca5a792e4b..000000000000
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@@ -1684,512 -1141,165 +1141,165 @@@ static unsigned get_num_write_same_bios
  	return ti->num_write_same_bios;
  }
  
- typedef bool (*is_split_required_fn)(struct dm_target *ti);
- 
- static bool is_split_required_for_discard(struct dm_target *ti)
- {
- 	return ti->split_discard_bios;
- }
- 
- static int __send_changing_extent_only(struct clone_info *ci,
- 				       get_num_bios_fn get_num_bios,
- 				       is_split_required_fn is_split_required)
- {
- 	struct dm_target *ti;
- 	unsigned len;
- 	unsigned num_bios;
- 
- 	do {
- 		ti = dm_table_find_target(ci->map, ci->sector);
- 		if (!dm_target_is_valid(ti))
- 			return -EIO;
- 
- 		/*
- 		 * Even though the device advertised support for this type of
- 		 * request, that does not mean every target supports it, and
- 		 * reconfiguration might also have changed that since the
- 		 * check was performed.
- 		 */
- 		num_bios = get_num_bios ? get_num_bios(ti) : 0;
- 		if (!num_bios)
- 			return -EOPNOTSUPP;
- 
- 		if (is_split_required && !is_split_required(ti))
- 			len = min((sector_t)ci->sector_count, max_io_len_target_boundary(ci->sector, ti));
- 		else
- 			len = min((sector_t)ci->sector_count, max_io_len(ci->sector, ti));
- 
- 		__send_duplicate_bios(ci, ti, num_bios, &len);
- 
- 		ci->sector += len;
- 	} while (ci->sector_count -= len);
- 
- 	return 0;
- }
- 
- static int __send_discard(struct clone_info *ci)
- {
- 	return __send_changing_extent_only(ci, get_num_discard_bios,
- 					   is_split_required_for_discard);
- }
- 
- static int __send_write_same(struct clone_info *ci)
- {
- 	return __send_changing_extent_only(ci, get_num_write_same_bios, NULL);
- }
- 
- /*
-  * Select the correct strategy for processing a non-flush bio.
-  */
- static int __split_and_process_non_flush(struct clone_info *ci)
- {
- 	struct bio *bio = ci->bio;
- 	struct dm_target *ti;
- 	unsigned len;
- 	int r;
- 
- 	if (unlikely(bio_op(bio) == REQ_OP_DISCARD))
- 		return __send_discard(ci);
- 	else if (unlikely(bio_op(bio) == REQ_OP_WRITE_SAME))
- 		return __send_write_same(ci);
- 
- 	ti = dm_table_find_target(ci->map, ci->sector);
- 	if (!dm_target_is_valid(ti))
- 		return -EIO;
- 
- 	len = min_t(sector_t, max_io_len(ci->sector, ti), ci->sector_count);
- 
- 	r = __clone_and_map_data_bio(ci, ti, ci->sector, &len);
- 	if (r < 0)
- 		return r;
- 
- 	ci->sector += len;
- 	ci->sector_count -= len;
- 
- 	return 0;
- }
- 
- /*
-  * Entry point to split a bio into clones and submit them to the targets.
-  */
- static void __split_and_process_bio(struct mapped_device *md,
- 				    struct dm_table *map, struct bio *bio)
- {
- 	struct clone_info ci;
- 	int error = 0;
- 
- 	if (unlikely(!map)) {
- 		bio_io_error(bio);
- 		return;
- 	}
- 
- 	ci.map = map;
- 	ci.md = md;
- 	ci.io = alloc_io(md);
- 	ci.io->error = 0;
- 	atomic_set(&ci.io->io_count, 1);
- 	ci.io->bio = bio;
- 	ci.io->md = md;
- 	spin_lock_init(&ci.io->endio_lock);
- 	ci.sector = bio->bi_iter.bi_sector;
- 
- 	start_io_acct(ci.io);
- 
- 	if (bio->bi_rw & REQ_PREFLUSH) {
- 		ci.bio = &ci.md->flush_bio;
- 		ci.sector_count = 0;
- 		error = __send_empty_flush(&ci);
- 		/* dec_pending submits any data associated with flush */
- 	} else {
- 		ci.bio = bio;
- 		ci.sector_count = bio_sectors(bio);
- 		while (ci.sector_count && !error)
- 			error = __split_and_process_non_flush(&ci);
- 	}
- 
- 	/* drop the extra reference count */
- 	dec_pending(ci.io, error);
- }
- /*-----------------------------------------------------------------
-  * CRUD END
-  *---------------------------------------------------------------*/
- 
- /*
-  * The request function that just remaps the bio built up by
-  * dm_merge_bvec.
-  */
- static blk_qc_t dm_make_request(struct request_queue *q, struct bio *bio)
- {
- 	int rw = bio_data_dir(bio);
- 	struct mapped_device *md = q->queuedata;
- 	int srcu_idx;
- 	struct dm_table *map;
- 
- 	map = dm_get_live_table(md, &srcu_idx);
- 
- 	generic_start_io_acct(rw, bio_sectors(bio), &dm_disk(md)->part0);
- 
- 	/* if we're suspended, we have to queue this io for later */
- 	if (unlikely(test_bit(DMF_BLOCK_IO_FOR_SUSPEND, &md->flags))) {
- 		dm_put_live_table(md, srcu_idx);
- 
- 		if (!(bio->bi_rw & REQ_RAHEAD))
- 			queue_io(md, bio);
- 		else
- 			bio_io_error(bio);
- 		return BLK_QC_T_NONE;
- 	}
- 
- 	__split_and_process_bio(md, map, bio);
- 	dm_put_live_table(md, srcu_idx);
- 	return BLK_QC_T_NONE;
- }
- 
- int dm_request_based(struct mapped_device *md)
- {
- 	return blk_queue_stackable(md->queue);
- }
- 
- static void dm_dispatch_clone_request(struct request *clone, struct request *rq)
- {
- 	int r;
- 
- 	if (blk_queue_io_stat(clone->q))
- 		clone->cmd_flags |= REQ_IO_STAT;
- 
- 	clone->start_time = jiffies;
- 	r = blk_insert_cloned_request(clone->q, clone);
- 	if (r)
- 		/* must complete clone in terms of original request */
- 		dm_complete_request(rq, r);
- }
- 
- static int dm_rq_bio_constructor(struct bio *bio, struct bio *bio_orig,
- 				 void *data)
- {
- 	struct dm_rq_target_io *tio = data;
- 	struct dm_rq_clone_bio_info *info =
- 		container_of(bio, struct dm_rq_clone_bio_info, clone);
- 
- 	info->orig = bio_orig;
- 	info->tio = tio;
- 	bio->bi_end_io = end_clone_bio;
- 
- 	return 0;
- }
- 
- static int setup_clone(struct request *clone, struct request *rq,
- 		       struct dm_rq_target_io *tio, gfp_t gfp_mask)
- {
- 	int r;
- 
- 	r = blk_rq_prep_clone(clone, rq, tio->md->bs, gfp_mask,
- 			      dm_rq_bio_constructor, tio);
- 	if (r)
- 		return r;
- 
- 	clone->cmd = rq->cmd;
- 	clone->cmd_len = rq->cmd_len;
- 	clone->sense = rq->sense;
- 	clone->end_io = end_clone_request;
- 	clone->end_io_data = tio;
- 
- 	tio->clone = clone;
- 
- 	return 0;
- }
- 
- static struct request *clone_old_rq(struct request *rq, struct mapped_device *md,
- 				    struct dm_rq_target_io *tio, gfp_t gfp_mask)
- {
- 	/*
- 	 * Create clone for use with .request_fn request_queue
- 	 */
- 	struct request *clone;
- 
- 	clone = alloc_old_clone_request(md, gfp_mask);
- 	if (!clone)
- 		return NULL;
- 
- 	blk_rq_init(NULL, clone);
- 	if (setup_clone(clone, rq, tio, gfp_mask)) {
- 		/* -ENOMEM */
- 		free_old_clone_request(md, clone);
- 		return NULL;
- 	}
- 
- 	return clone;
- }
- 
- static void map_tio_request(struct kthread_work *work);
- 
- static void init_tio(struct dm_rq_target_io *tio, struct request *rq,
- 		     struct mapped_device *md)
- {
- 	tio->md = md;
- 	tio->ti = NULL;
- 	tio->clone = NULL;
- 	tio->orig = rq;
- 	tio->error = 0;
- 	/*
- 	 * Avoid initializing info for blk-mq; it passes
- 	 * target-specific data through info.ptr
- 	 * (see: dm_mq_init_request)
- 	 */
- 	if (!md->init_tio_pdu)
- 		memset(&tio->info, 0, sizeof(tio->info));
- 	if (md->kworker_task)
- 		init_kthread_work(&tio->work, map_tio_request);
- }
- 
- static struct dm_rq_target_io *dm_old_prep_tio(struct request *rq,
- 					       struct mapped_device *md,
- 					       gfp_t gfp_mask)
- {
- 	struct dm_rq_target_io *tio;
- 	int srcu_idx;
- 	struct dm_table *table;
- 
- 	tio = alloc_old_rq_tio(md, gfp_mask);
- 	if (!tio)
- 		return NULL;
- 
- 	init_tio(tio, rq, md);
- 
- 	table = dm_get_live_table(md, &srcu_idx);
- 	/*
- 	 * Must clone a request if this .request_fn DM device
- 	 * is stacked on .request_fn device(s).
- 	 */
- 	if (!dm_table_mq_request_based(table)) {
- 		if (!clone_old_rq(rq, md, tio, gfp_mask)) {
- 			dm_put_live_table(md, srcu_idx);
- 			free_old_rq_tio(tio);
- 			return NULL;
- 		}
- 	}
- 	dm_put_live_table(md, srcu_idx);
- 
- 	return tio;
- }
- 
- /*
-  * Called with the queue lock held.
-  */
- static int dm_old_prep_fn(struct request_queue *q, struct request *rq)
- {
- 	struct mapped_device *md = q->queuedata;
- 	struct dm_rq_target_io *tio;
- 
- 	if (unlikely(rq->special)) {
- 		DMWARN("Already has something in rq->special.");
- 		return BLKPREP_KILL;
- 	}
- 
- 	tio = dm_old_prep_tio(rq, md, GFP_ATOMIC);
- 	if (!tio)
- 		return BLKPREP_DEFER;
- 
- 	rq->special = tio;
- 	rq->cmd_flags |= REQ_DONTPREP;
- 
- 	return BLKPREP_OK;
- }
- 
- /*
-  * Returns:
-  * 0                : the request has been processed
-  * DM_MAPIO_REQUEUE : the original request needs to be requeued
-  * < 0              : the request was completed due to failure
-  */
- static int map_request(struct dm_rq_target_io *tio, struct request *rq,
- 		       struct mapped_device *md)
- {
- 	int r;
- 	struct dm_target *ti = tio->ti;
- 	struct request *clone = NULL;
- 
- 	if (tio->clone) {
- 		clone = tio->clone;
- 		r = ti->type->map_rq(ti, clone, &tio->info);
- 	} else {
- 		r = ti->type->clone_and_map_rq(ti, rq, &tio->info, &clone);
- 		if (r < 0) {
- 			/* The target wants to complete the I/O */
- 			dm_kill_unmapped_request(rq, r);
- 			return r;
- 		}
- 		if (r != DM_MAPIO_REMAPPED)
- 			return r;
- 		if (setup_clone(clone, rq, tio, GFP_ATOMIC)) {
- 			/* -ENOMEM */
- 			ti->type->release_clone_rq(clone);
- 			return DM_MAPIO_REQUEUE;
- 		}
- 	}
- 
- 	switch (r) {
- 	case DM_MAPIO_SUBMITTED:
- 		/* The target has taken the I/O to submit by itself later */
- 		break;
- 	case DM_MAPIO_REMAPPED:
- 		/* The target has remapped the I/O so dispatch it */
- 		trace_block_rq_remap(clone->q, clone, disk_devt(dm_disk(md)),
- 				     blk_rq_pos(rq));
- 		dm_dispatch_clone_request(clone, rq);
- 		break;
- 	case DM_MAPIO_REQUEUE:
- 		/* The target wants to requeue the I/O */
- 		dm_requeue_original_request(md, tio->orig);
- 		break;
- 	default:
- 		if (r > 0) {
- 			DMWARN("unimplemented target map return value: %d", r);
- 			BUG();
- 		}
- 
- 		/* The target wants to complete the I/O */
- 		dm_kill_unmapped_request(rq, r);
- 		return r;
- 	}
+ typedef bool (*is_split_required_fn)(struct dm_target *ti);
  
- 	return 0;
+ static bool is_split_required_for_discard(struct dm_target *ti)
+ {
+ 	return ti->split_discard_bios;
  }
  
- static void map_tio_request(struct kthread_work *work)
+ static int __send_changing_extent_only(struct clone_info *ci,
+ 				       get_num_bios_fn get_num_bios,
+ 				       is_split_required_fn is_split_required)
  {
- 	struct dm_rq_target_io *tio = container_of(work, struct dm_rq_target_io, work);
- 	struct request *rq = tio->orig;
- 	struct mapped_device *md = tio->md;
+ 	struct dm_target *ti;
+ 	unsigned len;
+ 	unsigned num_bios;
  
- 	if (map_request(tio, rq, md) == DM_MAPIO_REQUEUE)
- 		dm_requeue_original_request(md, rq);
- }
+ 	do {
+ 		ti = dm_table_find_target(ci->map, ci->sector);
+ 		if (!dm_target_is_valid(ti))
+ 			return -EIO;
  
- static void dm_start_request(struct mapped_device *md, struct request *orig)
- {
- 	if (!orig->q->mq_ops)
- 		blk_start_request(orig);
- 	else
- 		blk_mq_start_request(orig);
- 	atomic_inc(&md->pending[rq_data_dir(orig)]);
+ 		/*
+ 		 * Even though the device advertised support for this type of
+ 		 * request, that does not mean every target supports it, and
+ 		 * reconfiguration might also have changed that since the
+ 		 * check was performed.
+ 		 */
+ 		num_bios = get_num_bios ? get_num_bios(ti) : 0;
+ 		if (!num_bios)
+ 			return -EOPNOTSUPP;
  
- 	if (md->seq_rq_merge_deadline_usecs) {
- 		md->last_rq_pos = rq_end_sector(orig);
- 		md->last_rq_rw = rq_data_dir(orig);
- 		md->last_rq_start_time = ktime_get();
- 	}
+ 		if (is_split_required && !is_split_required(ti))
+ 			len = min((sector_t)ci->sector_count, max_io_len_target_boundary(ci->sector, ti));
+ 		else
+ 			len = min((sector_t)ci->sector_count, max_io_len(ci->sector, ti));
  
- 	if (unlikely(dm_stats_used(&md->stats))) {
- 		struct dm_rq_target_io *tio = tio_from_request(orig);
- 		tio->duration_jiffies = jiffies;
- 		tio->n_sectors = blk_rq_sectors(orig);
- 		dm_stats_account_io(&md->stats, rq_data_dir(orig),
- 				    blk_rq_pos(orig), tio->n_sectors, false, 0,
- 				    &tio->stats_aux);
- 	}
+ 		__send_duplicate_bios(ci, ti, num_bios, &len);
  
- 	/*
- 	 * Hold the md reference here for the in-flight I/O.
- 	 * We can't rely on the reference count by device opener,
- 	 * because the device may be closed during the request completion
- 	 * when all bios are completed.
- 	 * See the comment in rq_completed() too.
- 	 */
- 	dm_get(md);
+ 		ci->sector += len;
+ 	} while (ci->sector_count -= len);
+ 
+ 	return 0;
  }
  
- #define MAX_SEQ_RQ_MERGE_DEADLINE_USECS 100000
+ static int __send_discard(struct clone_info *ci)
+ {
+ 	return __send_changing_extent_only(ci, get_num_discard_bios,
+ 					   is_split_required_for_discard);
+ }
  
- ssize_t dm_attr_rq_based_seq_io_merge_deadline_show(struct mapped_device *md, char *buf)
+ static int __send_write_same(struct clone_info *ci)
  {
- 	return sprintf(buf, "%u\n", md->seq_rq_merge_deadline_usecs);
+ 	return __send_changing_extent_only(ci, get_num_write_same_bios, NULL);
  }
  
- ssize_t dm_attr_rq_based_seq_io_merge_deadline_store(struct mapped_device *md,
- 						     const char *buf, size_t count)
+ /*
+  * Select the correct strategy for processing a non-flush bio.
+  */
+ static int __split_and_process_non_flush(struct clone_info *ci)
  {
- 	unsigned deadline;
+ 	struct bio *bio = ci->bio;
+ 	struct dm_target *ti;
+ 	unsigned len;
+ 	int r;
  
- 	if (!dm_request_based(md) || md->use_blk_mq)
- 		return count;
+ 	if (unlikely(bio_op(bio) == REQ_OP_DISCARD))
+ 		return __send_discard(ci);
+ 	else if (unlikely(bio_op(bio) == REQ_OP_WRITE_SAME))
+ 		return __send_write_same(ci);
  
- 	if (kstrtouint(buf, 10, &deadline))
- 		return -EINVAL;
+ 	ti = dm_table_find_target(ci->map, ci->sector);
+ 	if (!dm_target_is_valid(ti))
+ 		return -EIO;
+ 
+ 	len = min_t(sector_t, max_io_len(ci->sector, ti), ci->sector_count);
  
- 	if (deadline > MAX_SEQ_RQ_MERGE_DEADLINE_USECS)
- 		deadline = MAX_SEQ_RQ_MERGE_DEADLINE_USECS;
+ 	r = __clone_and_map_data_bio(ci, ti, ci->sector, &len);
+ 	if (r < 0)
+ 		return r;
  
- 	md->seq_rq_merge_deadline_usecs = deadline;
+ 	ci->sector += len;
+ 	ci->sector_count -= len;
  
- 	return count;
+ 	return 0;
  }
  
- static bool dm_request_peeked_before_merge_deadline(struct mapped_device *md)
+ /*
+  * Entry point to split a bio into clones and submit them to the targets.
+  */
+ static void __split_and_process_bio(struct mapped_device *md,
+ 				    struct dm_table *map, struct bio *bio)
  {
- 	ktime_t kt_deadline;
+ 	struct clone_info ci;
+ 	int error = 0;
+ 
+ 	if (unlikely(!map)) {
+ 		bio_io_error(bio);
+ 		return;
+ 	}
+ 
+ 	ci.map = map;
+ 	ci.md = md;
+ 	ci.io = alloc_io(md);
+ 	ci.io->error = 0;
+ 	atomic_set(&ci.io->io_count, 1);
+ 	ci.io->bio = bio;
+ 	ci.io->md = md;
+ 	spin_lock_init(&ci.io->endio_lock);
+ 	ci.sector = bio->bi_iter.bi_sector;
  
- 	if (!md->seq_rq_merge_deadline_usecs)
- 		return false;
+ 	start_io_acct(ci.io);
  
- 	kt_deadline = ns_to_ktime((u64)md->seq_rq_merge_deadline_usecs * NSEC_PER_USEC);
- 	kt_deadline = ktime_add_safe(md->last_rq_start_time, kt_deadline);
+ 	if (bio->bi_rw & REQ_PREFLUSH) {
+ 		ci.bio = &ci.md->flush_bio;
+ 		ci.sector_count = 0;
+ 		error = __send_empty_flush(&ci);
+ 		/* dec_pending submits any data associated with flush */
+ 	} else {
+ 		ci.bio = bio;
+ 		ci.sector_count = bio_sectors(bio);
+ 		while (ci.sector_count && !error)
+ 			error = __split_and_process_non_flush(&ci);
+ 	}
  
- 	return !ktime_after(ktime_get(), kt_deadline);
+ 	/* drop the extra reference count */
+ 	dec_pending(ci.io, error);
  }
+ /*-----------------------------------------------------------------
+  * CRUD END
+  *---------------------------------------------------------------*/
  
  /*
-  * q->request_fn for request-based dm.
-  * Called with the queue lock held.
+  * The request function that just remaps the bio built up by
+  * dm_merge_bvec.
   */
- static void dm_request_fn(struct request_queue *q)
+ static blk_qc_t dm_make_request(struct request_queue *q, struct bio *bio)
  {
+ 	int rw = bio_data_dir(bio);
  	struct mapped_device *md = q->queuedata;
- 	struct dm_target *ti = md->immutable_target;
- 	struct request *rq;
- 	struct dm_rq_target_io *tio;
- 	sector_t pos = 0;
- 
- 	if (unlikely(!ti)) {
- 		int srcu_idx;
- 		struct dm_table *map = dm_get_live_table(md, &srcu_idx);
- 
- 		ti = dm_table_find_target(map, pos);
- 		dm_put_live_table(md, srcu_idx);
- 	}
- 
- 	/*
- 	 * For suspend, check blk_queue_stopped() and increment
- 	 * ->pending within a single queue_lock not to increment the
- 	 * number of in-flight I/Os after the queue is stopped in
- 	 * dm_suspend().
- 	 */
- 	while (!blk_queue_stopped(q)) {
- 		rq = blk_peek_request(q);
- 		if (!rq)
- 			return;
+ 	int srcu_idx;
+ 	struct dm_table *map;
  
- 		/* always use block 0 to find the target for flushes for now */
- 		pos = 0;
- 		if (req_op(rq) != REQ_OP_FLUSH)
- 			pos = blk_rq_pos(rq);
+ 	map = dm_get_live_table(md, &srcu_idx);
  
- 		if ((dm_request_peeked_before_merge_deadline(md) &&
- 		     md_in_flight(md) && rq->bio && rq->bio->bi_vcnt == 1 &&
- 		     md->last_rq_pos == pos && md->last_rq_rw == rq_data_dir(rq)) ||
- 		    (ti->type->busy && ti->type->busy(ti))) {
- 			blk_delay_queue(q, HZ / 100);
- 			return;
- 		}
+ 	generic_start_io_acct(rw, bio_sectors(bio), &dm_disk(md)->part0);
  
- 		dm_start_request(md, rq);
+ 	/* if we're suspended, we have to queue this io for later */
+ 	if (unlikely(test_bit(DMF_BLOCK_IO_FOR_SUSPEND, &md->flags))) {
+ 		dm_put_live_table(md, srcu_idx);
  
- 		tio = tio_from_request(rq);
- 		/* Establish tio->ti before queuing work (map_tio_request) */
- 		tio->ti = ti;
- 		queue_kthread_work(&md->kworker, &tio->work);
- 		BUG_ON(!irqs_disabled());
 -		if (bio_rw(bio) != READA)
++		if (!(bio->bi_rw & REQ_RAHEAD))
+ 			queue_io(md, bio);
+ 		else
+ 			bio_io_error(bio);
+ 		return BLK_QC_T_NONE;
  	}
+ 
+ 	__split_and_process_bio(md, map, bio);
+ 	dm_put_live_table(md, srcu_idx);
+ 	return BLK_QC_T_NONE;
  }
  
  static int dm_any_congested(void *congested_data, int bdi_bits)
