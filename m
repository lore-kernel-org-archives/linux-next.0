From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: merge conflicts reminder
Date: Mon, 3 Jul 2017 11:26:08 +1000
Message-ID: <20170703112608.69828a70@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36747 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752200AbdGCB0Q (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 2 Jul 2017 21:26:16 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>, David Sterba <dsterba@suse.cz>, Ulf Hansson <ulf.hansson@linaro.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, James Bottomley <James.Bottomley@HansenPartnership.com>, Jeff Layton <jlayton@poochiereds.net>, Bjorn Helgaas <bhelgaas@google.com>, Kees Cook <keescook@google.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Josef Bacik <josef@toxicpanda.com>, Linus Walleij <linus.walleij@linaro.org>, Sebastian Ott <sebott@linux.vnet.ibm.com>, Ming Lei <ming.lei@redhat.com>, Bart Van Assche <Bart.VanAssche@sandisk.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Liu Bo <bo.li.liu@oracle.com>, Guoqing Jiang <gqjiang@suse.com>, Goldwyn Rodrigues <rgoldwyn@suse.com>, Mike Snitzer <snitzer@redhat.com>

Hi all,

With the merge window open, just a reminder of the (bit of a mess) with
merge conflicts involving the block tree.  There are conflicts against
the s390, btrfs-kdave, mmc, scsi, file-locks, kspp, pci and Linus' trees.

I think this is some kind of record :-(

Anyway, the merge resolution when merging the block tree on Friday is
below.  This does not include the resolutions for the kspp, scsi and
mmc trees where are merged after the block tree in linux-next.

-- 
Cheers,
Stephen Rothwell

ef467dc885aaa4aa6167e86afd3656107df68dfe
diff --cc drivers/md/dm-io.c
index 8d5ca30f6551,81248a8a8b57..25039607f3cb
--- a/drivers/md/dm-io.c
+++ b/drivers/md/dm-io.c
@@@ -317,9 -318,9 +318,9 @@@ static void do_region(int op, int op_fl
  	else if (op == REQ_OP_WRITE_SAME)
  		special_cmd_max_sectors = q->limits.max_write_same_sectors;
  	if ((op == REQ_OP_DISCARD || op == REQ_OP_WRITE_ZEROES ||
 -	     op == REQ_OP_WRITE_SAME)  &&
 -	    special_cmd_max_sectors == 0) {
 +	     op == REQ_OP_WRITE_SAME) && special_cmd_max_sectors == 0) {
 +		atomic_inc(&io->count);
- 		dec_count(io, region, -EOPNOTSUPP);
+ 		dec_count(io, region, BLK_STS_NOTSUPP);
  		return;
  	}
  
diff --cc drivers/md/dm-raid1.c
index 4da8858856fb,3ab584b686e0..84a9b2050794
--- a/drivers/md/dm-raid1.c
+++ b/drivers/md/dm-raid1.c
@@@ -1255,26 -1253,16 +1256,26 @@@ static int mirror_end_io(struct dm_targ
  		if (!(bio->bi_opf & REQ_PREFLUSH) &&
  		    bio_op(bio) != REQ_OP_DISCARD)
  			dm_rh_dec(ms->rh, bio_record->write_region);
- 		return error;
+ 		return DM_ENDIO_DONE;
  	}
  
- 	if (error == -EOPNOTSUPP)
+ 	if (*error == BLK_STS_NOTSUPP)
 -		return DM_ENDIO_DONE;
 +		goto out;
  
- 	if ((error == -EWOULDBLOCK) && (bio->bi_opf & REQ_RAHEAD))
+ 	if (bio->bi_opf & REQ_RAHEAD)
 -		return DM_ENDIO_DONE;
 +		goto out;
  
- 	if (unlikely(error)) {
+ 	if (unlikely(*error)) {
 +		if (!bio_record->details.bi_bdev) {
 +			/*
 +			 * There wasn't enough memory to record necessary
 +			 * information for a retry or there was no other
 +			 * mirror in-sync.
 +			 */
 +			DMERR_LIMIT("Mirror read failed.");
- 			return -EIO;
++			return BLK_STS_IOERR;
 +		}
 +
  		m = bio_record->m;
  
  		DMERR("Mirror read failed from %s. Trying alternative device.",
@@@ -1290,8 -1278,7 +1291,8 @@@
  			bd = &bio_record->details;
  
  			dm_bio_restore(bd, bio);
 +			bio_record->details.bi_bdev = NULL;
- 			bio->bi_error = 0;
+ 			bio->bi_status = 0;
  
  			queue_bio(ms, bio, rw);
  			return DM_ENDIO_INCOMPLETE;
@@@ -1299,10 -1286,7 +1300,10 @@@
  		DMERR("All replicated volumes dead, failing I/O");
  	}
  
 +out:
 +	bio_record->details.bi_bdev = NULL;
 +
- 	return error;
+ 	return DM_ENDIO_DONE;
  }
  
  static void mirror_presuspend(struct dm_target *ti)
diff --cc drivers/nvme/host/pci.c
index 311060af0dce,32a98e2740ad..5f80c4b1c4d9
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@@ -2151,14 -2302,14 +2303,15 @@@ static int nvme_probe(struct pci_dev *p
  	return result;
  }
  
 -static void nvme_reset_notify(struct pci_dev *pdev, bool prepare)
 +static void nvme_reset_prepare(struct pci_dev *pdev)
  {
 -	struct nvme_dev *dev = pci_get_drvdata(pdev);
 +	nvme_dev_disable(pci_get_drvdata(pdev), false);
 +}
  
 -	if (prepare)
 -		nvme_dev_disable(dev, false);
 -	else
 -		nvme_reset_ctrl(&dev->ctrl);
 +static void nvme_reset_done(struct pci_dev *pdev)
 +{
- 	nvme_reset(pci_get_drvdata(pdev));
++	struct nvme_dev *dev = pci_get_drvdata(pdev);
++	nvme_reset_ctrl(&dev->ctrl);
  }
  
  static void nvme_shutdown(struct pci_dev *pdev)
diff --cc drivers/s390/block/scm_blk.c
index 725f912fab41,3c2c84b72877..0071febac9e6
--- a/drivers/s390/block/scm_blk.c
+++ b/drivers/s390/block/scm_blk.c
@@@ -228,12 -231,22 +228,12 @@@ static inline void scm_request_init(str
  	aob->request.data = (u64) aobrq;
  	scmrq->bdev = bdev;
  	scmrq->retries = 4;
- 	scmrq->error = 0;
+ 	scmrq->error = BLK_STS_OK;
  	/* We don't use all msbs - place aidaws at the end of the aob page. */
  	scmrq->next_aidaw = (void *) &aob->msb[nr_requests_per_io];
 -	scm_request_cluster_init(scmrq);
  }
  
 -static void scm_ensure_queue_restart(struct scm_blk_dev *bdev)
 -{
 -	if (atomic_read(&bdev->queued_reqs)) {
 -		/* Queue restart is triggered by the next interrupt. */
 -		return;
 -	}
 -	blk_delay_queue(bdev->rq, SCM_QUEUE_DELAY);
 -}
 -
 -void scm_request_requeue(struct scm_request *scmrq)
 +static void scm_request_requeue(struct scm_request *scmrq)
  {
  	struct scm_blk_dev *bdev = scmrq->bdev;
  	int i;
@@@ -271,83 -289,75 +271,83 @@@ static void scm_request_start(struct sc
  		SCM_LOG(5, "no subchannel");
  		scm_request_requeue(scmrq);
  	}
 -	return ret;
  }
  
 -static void scm_blk_request(struct request_queue *rq)
 +struct scm_queue {
 +	struct scm_request *scmrq;
 +	spinlock_t lock;
 +};
 +
- static int scm_blk_request(struct blk_mq_hw_ctx *hctx,
++static blk_status_t scm_blk_request(struct blk_mq_hw_ctx *hctx,
 +			   const struct blk_mq_queue_data *qd)
  {
 -	struct scm_device *scmdev = rq->queuedata;
 +	struct scm_device *scmdev = hctx->queue->queuedata;
  	struct scm_blk_dev *bdev = dev_get_drvdata(&scmdev->dev);
 -	struct scm_request *scmrq = NULL;
 -	struct request *req;
 +	struct scm_queue *sq = hctx->driver_data;
 +	struct request *req = qd->rq;
 +	struct scm_request *scmrq;
  
 -	while ((req = blk_peek_request(rq))) {
 -		if (!scm_permit_request(bdev, req))
 -			goto out;
 +	spin_lock(&sq->lock);
 +	if (!scm_permit_request(bdev, req)) {
 +		spin_unlock(&sq->lock);
- 		return BLK_MQ_RQ_QUEUE_BUSY;
++		return BLK_STS_RESOURCE;
 +	}
  
 +	scmrq = sq->scmrq;
 +	if (!scmrq) {
 +		scmrq = scm_request_fetch();
  		if (!scmrq) {
 -			scmrq = scm_request_fetch();
 -			if (!scmrq) {
 -				SCM_LOG(5, "no request");
 -				goto out;
 -			}
 -			scm_request_init(bdev, scmrq);
 +			SCM_LOG(5, "no request");
 +			spin_unlock(&sq->lock);
- 			return BLK_MQ_RQ_QUEUE_BUSY;
++			return BLK_STS_RESOURCE;
  		}
 -		scm_request_set(scmrq, req);
 +		scm_request_init(bdev, scmrq);
 +		sq->scmrq = scmrq;
 +	}
 +	scm_request_set(scmrq, req);
  
 -		if (!scm_reserve_cluster(scmrq)) {
 -			SCM_LOG(5, "cluster busy");
 -			scm_request_set(scmrq, NULL);
 -			if (scmrq->aob->request.msb_count)
 -				goto out;
 +	if (scm_request_prepare(scmrq)) {
 +		SCM_LOG(5, "aidaw alloc failed");
 +		scm_request_set(scmrq, NULL);
  
 -			scm_request_done(scmrq);
 -			return;
 -		}
 +		if (scmrq->aob->request.msb_count)
 +			scm_request_start(scmrq);
  
 -		if (scm_need_cluster_request(scmrq)) {
 -			if (scmrq->aob->request.msb_count) {
 -				/* Start cluster requests separately. */
 -				scm_request_set(scmrq, NULL);
 -				if (scm_request_start(scmrq))
 -					return;
 -			} else {
 -				atomic_inc(&bdev->queued_reqs);
 -				blk_start_request(req);
 -				scm_initiate_cluster_request(scmrq);
 -			}
 -			scmrq = NULL;
 -			continue;
 -		}
 +		sq->scmrq = NULL;
 +		spin_unlock(&sq->lock);
- 		return BLK_MQ_RQ_QUEUE_BUSY;
++		return BLK_STS_RESOURCE;
 +	}
 +	blk_mq_start_request(req);
  
 -		if (scm_request_prepare(scmrq)) {
 -			SCM_LOG(5, "aidaw alloc failed");
 -			scm_request_set(scmrq, NULL);
 -			goto out;
 -		}
 -		blk_start_request(req);
 +	if (qd->last || scmrq->aob->request.msb_count == nr_requests_per_io) {
 +		scm_request_start(scmrq);
 +		sq->scmrq = NULL;
 +	}
 +	spin_unlock(&sq->lock);
- 	return BLK_MQ_RQ_QUEUE_OK;
++	return BLK_STS_OK;
 +}
  
 -		if (scmrq->aob->request.msb_count < nr_requests_per_io)
 -			continue;
 +static int scm_blk_init_hctx(struct blk_mq_hw_ctx *hctx, void *data,
 +			     unsigned int idx)
 +{
 +	struct scm_queue *qd = kzalloc(sizeof(*qd), GFP_KERNEL);
  
 -		if (scm_request_start(scmrq))
 -			return;
 +	if (!qd)
 +		return -ENOMEM;
  
 -		scmrq = NULL;
 -	}
 -out:
 -	if (scmrq)
 -		scm_request_start(scmrq);
 -	else
 -		scm_ensure_queue_restart(bdev);
 +	spin_lock_init(&qd->lock);
 +	hctx->driver_data = qd;
 +
 +	return 0;
 +}
 +
 +static void scm_blk_exit_hctx(struct blk_mq_hw_ctx *hctx, unsigned int idx)
 +{
 +	struct scm_queue *qd = hctx->driver_data;
 +
 +	WARN_ON(qd->scmrq);
 +	kfree(hctx->driver_data);
 +	hctx->driver_data = NULL;
  }
  
  static void __scmrq_log_error(struct scm_request *scmrq)
@@@ -394,28 -419,43 +394,28 @@@ restart
  		return;
  
  requeue:
 -	spin_lock_irqsave(&bdev->rq_lock, flags);
  	scm_request_requeue(scmrq);
 -	spin_unlock_irqrestore(&bdev->rq_lock, flags);
  }
  
- void scm_blk_irq(struct scm_device *scmdev, void *data, int error)
 -static void scm_blk_tasklet(struct scm_blk_dev *bdev)
++void scm_blk_irq(struct scm_device *scmdev, void *data, blk_status_t error)
  {
 -	struct scm_request *scmrq;
 -	unsigned long flags;
 -
 -	spin_lock_irqsave(&bdev->lock, flags);
 -	while (!list_empty(&bdev->finished_requests)) {
 -		scmrq = list_first_entry(&bdev->finished_requests,
 -					 struct scm_request, list);
 -		list_del(&scmrq->list);
 -		spin_unlock_irqrestore(&bdev->lock, flags);
 +	struct scm_request *scmrq = data;
  
 -		if (scmrq->error && scmrq->retries-- > 0) {
 +	scmrq->error = error;
 +	if (error) {
 +		__scmrq_log_error(scmrq);
 +		if (scmrq->retries-- > 0) {
  			scm_blk_handle_error(scmrq);
 -
 -			/* Request restarted or requeued, handle next. */
 -			spin_lock_irqsave(&bdev->lock, flags);
 -			continue;
 +			return;
  		}
 +	}
  
 -		if (scm_test_cluster_request(scmrq)) {
 -			scm_cluster_request_irq(scmrq);
 -			spin_lock_irqsave(&bdev->lock, flags);
 -			continue;
 -		}
 +	scm_request_finish(scmrq);
 +}
  
 -		scm_request_finish(scmrq);
 -		spin_lock_irqsave(&bdev->lock, flags);
 -	}
 -	spin_unlock_irqrestore(&bdev->lock, flags);
 -	/* Look out for more requests. */
 -	blk_run_queue(bdev->rq);
 +static void scm_blk_request_done(struct request *req)
 +{
 +	blk_mq_end_request(req, 0);
  }
  
  static const struct block_device_operations scm_blk_devops = {
diff --cc drivers/s390/block/scm_blk.h
index 242d17a91920,cd598d1a4eae..71288dd9dd7f
--- a/drivers/s390/block/scm_blk.h
+++ b/drivers/s390/block/scm_blk.h
@@@ -32,7 -35,14 +32,7 @@@ struct scm_request 
  	struct aob *aob;
  	struct list_head list;
  	u8 retries;
- 	int error;
+ 	blk_status_t error;
 -#ifdef CONFIG_SCM_BLOCK_CLUSTER_WRITE
 -	struct {
 -		enum {CLUSTER_NONE, CLUSTER_READ, CLUSTER_WRITE} state;
 -		struct list_head list;
 -		void **buf;
 -	} cluster;
 -#endif
  };
  
  #define to_aobrq(rq) container_of((void *) rq, struct aob_rq_header, data)
@@@ -40,8 -50,11 +40,8 @@@
  int scm_blk_dev_setup(struct scm_blk_dev *, struct scm_device *);
  void scm_blk_dev_cleanup(struct scm_blk_dev *);
  void scm_blk_set_available(struct scm_blk_dev *);
- void scm_blk_irq(struct scm_device *, void *, int);
+ void scm_blk_irq(struct scm_device *, void *, blk_status_t);
  
 -void scm_request_finish(struct scm_request *);
 -void scm_request_requeue(struct scm_request *);
 -
  struct aidaw *scm_aidaw_fetch(struct scm_request *scmrq, unsigned int bytes);
  
  int scm_drv_init(void);
diff --cc fs/block_dev.c
index 9e9f25dc69bc,2c5f08696fff..9941dc8342df
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@@ -262,11 -263,8 +263,11 @@@ __blkdev_direct_IO_simple(struct kiocb 
  	if (vecs != inline_vecs)
  		kfree(vecs);
  
- 	if (unlikely(bio.bi_error))
- 		ret = bio.bi_error;
+ 	if (unlikely(bio.bi_status))
 -		return blk_status_to_errno(bio.bi_status);
++		ret = blk_status_to_errno(bio.bi_status);
 +
 +	bio_uninit(&bio);
 +
  	return ret;
  }
  
diff --cc fs/btrfs/disk-io.c
index b6758892874f,6036d15b47b8..7065201bedcf
--- a/fs/btrfs/disk-io.c
+++ b/fs/btrfs/disk-io.c
@@@ -87,8 -87,9 +87,8 @@@ struct btrfs_end_io_wq 
  	bio_end_io_t *end_io;
  	void *private;
  	struct btrfs_fs_info *info;
- 	int error;
+ 	blk_status_t status;
  	enum btrfs_wq_endio_type metadata;
 -	struct list_head list;
  	struct btrfs_work work;
  };
  
@@@ -867,10 -868,10 +867,10 @@@ unsigned long btrfs_async_submit_limit(
  static void run_one_async_start(struct btrfs_work *work)
  {
  	struct async_submit_bio *async;
- 	int ret;
+ 	blk_status_t ret;
  
  	async = container_of(work, struct  async_submit_bio, work);
 -	ret = async->submit_bio_start(async->inode, async->bio,
 +	ret = async->submit_bio_start(async->private_data, async->bio,
  				      async->mirror_num, async->bio_flags,
  				      async->bio_offset);
  	if (ret)
@@@ -915,20 -916,19 +915,20 @@@ static void run_one_async_free(struct b
  	kfree(async);
  }
  
- int btrfs_wq_submit_bio(struct btrfs_fs_info *fs_info, struct bio *bio,
 -blk_status_t btrfs_wq_submit_bio(struct btrfs_fs_info *fs_info,
 -		struct inode *inode, struct bio *bio, int mirror_num,
 -		unsigned long bio_flags, u64 bio_offset,
 -		extent_submit_bio_hook_t *submit_bio_start,
 -		extent_submit_bio_hook_t *submit_bio_done)
++blk_status_t btrfs_wq_submit_bio(struct btrfs_fs_info *fs_info, struct bio *bio,
 +			int mirror_num, unsigned long bio_flags,
 +			u64 bio_offset, void *private_data,
 +			extent_submit_bio_hook_t *submit_bio_start,
 +			extent_submit_bio_hook_t *submit_bio_done)
  {
  	struct async_submit_bio *async;
  
  	async = kmalloc(sizeof(*async), GFP_NOFS);
  	if (!async)
- 		return -ENOMEM;
+ 		return BLK_STS_RESOURCE;
  
 -	async->inode = inode;
 +	async->private_data = private_data;
 +	async->fs_info = fs_info;
  	async->bio = bio;
  	async->mirror_num = mirror_num;
  	async->submit_bio_start = submit_bio_start;
@@@ -971,12 -971,12 +971,12 @@@ static blk_status_t btree_csum_one_bio(
  			break;
  	}
  
- 	return ret;
+ 	return errno_to_blk_status(ret);
  }
  
- static int __btree_submit_bio_start(void *private_data, struct bio *bio,
 -static blk_status_t __btree_submit_bio_start(struct inode *inode,
 -		struct bio *bio, int mirror_num, unsigned long bio_flags,
 -		u64 bio_offset)
++static blk_status_t __btree_submit_bio_start(void *private_data, struct bio *bio,
 +				    int mirror_num, unsigned long bio_flags,
 +				    u64 bio_offset)
  {
  	/*
  	 * when we're called for a write, we're already in the async
@@@ -985,12 -985,11 +985,12 @@@
  	return btree_csum_one_bio(bio);
  }
  
- static int __btree_submit_bio_done(void *private_data, struct bio *bio,
 -static blk_status_t __btree_submit_bio_done(struct inode *inode,
 -		struct bio *bio, int mirror_num, unsigned long bio_flags,
 -		u64 bio_offset)
++static blk_status_t __btree_submit_bio_done(void *private_data, struct bio *bio,
 +				 int mirror_num, unsigned long bio_flags,
 +				 u64 bio_offset)
  {
 +	struct inode *inode = private_data;
- 	int ret;
+ 	blk_status_t ret;
  
  	/*
  	 * when we're called for a write, we're already in the async
@@@ -1015,14 -1014,13 +1015,14 @@@ static int check_async_write(unsigned l
  	return 1;
  }
  
- static int btree_submit_bio_hook(void *private_data, struct bio *bio,
 -static blk_status_t btree_submit_bio_hook(struct inode *inode, struct bio *bio,
++static blk_status_t btree_submit_bio_hook(void *private_data, struct bio *bio,
  				 int mirror_num, unsigned long bio_flags,
  				 u64 bio_offset)
  {
 +	struct inode *inode = private_data;
  	struct btrfs_fs_info *fs_info = btrfs_sb(inode->i_sb);
  	int async = check_async_write(bio_flags);
- 	int ret;
+ 	blk_status_t ret;
  
  	if (bio_op(bio) != REQ_OP_WRITE) {
  		/*
@@@ -3485,57 -3490,59 +3485,57 @@@ static void btrfs_end_empty_barrier(str
  }
  
  /*
 - * trigger flushes for one the devices.  If you pass wait == 0, the flushes are
 - * sent down.  With wait == 1, it waits for the previous flush.
 - *
 - * any device where the flush fails with eopnotsupp are flagged as not-barrier
 - * capable
 + * Submit a flush request to the device if it supports it. Error handling is
 + * done in the waiting counterpart.
   */
 -static blk_status_t write_dev_flush(struct btrfs_device *device, int wait)
 +static void write_dev_flush(struct btrfs_device *device)
  {
  	struct request_queue *q = bdev_get_queue(device->bdev);
 -	struct bio *bio;
 -	blk_status_t ret = 0;
 +	struct bio *bio = device->flush_bio;
  
  	if (!test_bit(QUEUE_FLAG_WC, &q->queue_flags))
 -		return 0;
 +		return;
  
 -	if (wait) {
 -		bio = device->flush_bio;
 -		if (!bio)
 -			return 0;
 +	bio_reset(bio);
 +	bio->bi_end_io = btrfs_end_empty_barrier;
 +	bio->bi_bdev = device->bdev;
 +	bio->bi_opf = REQ_OP_WRITE | REQ_SYNC | REQ_PREFLUSH;
 +	init_completion(&device->flush_wait);
 +	bio->bi_private = &device->flush_wait;
  
 -		wait_for_completion(&device->flush_wait);
 +	submit_bio(bio);
 +	device->flush_bio_sent = 1;
 +}
  
 -		if (bio->bi_status) {
 -			ret = bio->bi_status;
 -			btrfs_dev_stat_inc_and_print(device,
 -				BTRFS_DEV_STAT_FLUSH_ERRS);
 -		}
 +/*
 + * If the flush bio has been submitted by write_dev_flush, wait for it.
 + */
- static int wait_dev_flush(struct btrfs_device *device)
++static blk_status_t wait_dev_flush(struct btrfs_device *device)
 +{
 +	struct bio *bio = device->flush_bio;
  
 -		/* drop the reference from the wait == 0 run */
 -		bio_put(bio);
 -		device->flush_bio = NULL;
 +	if (!device->flush_bio_sent)
 +		return 0;
  
 -		return ret;
 -	}
 +	device->flush_bio_sent = 0;
 +	wait_for_completion_io(&device->flush_wait);
  
- 	return bio->bi_error;
 -	/*
 -	 * one reference for us, and we leave it for the
 -	 * caller
 -	 */
 -	device->flush_bio = NULL;
 -	bio = btrfs_io_bio_alloc(GFP_NOFS, 0);
 -	if (!bio)
 -		return BLK_STS_RESOURCE;
++	return bio->bi_status;
 +}
  
 -	bio->bi_end_io = btrfs_end_empty_barrier;
 -	bio->bi_bdev = device->bdev;
 -	bio->bi_opf = REQ_OP_WRITE | REQ_SYNC | REQ_PREFLUSH;
 -	init_completion(&device->flush_wait);
 -	bio->bi_private = &device->flush_wait;
 -	device->flush_bio = bio;
 +static int check_barrier_error(struct btrfs_fs_devices *fsdevs)
 +{
 +	int dev_flush_error = 0;
 +	struct btrfs_device *dev;
  
 -	bio_get(bio);
 -	btrfsic_submit_bio(bio);
 +	list_for_each_entry_rcu(dev, &fsdevs->devices, dev_list) {
 +		if (!dev->bdev || dev->last_flush_error)
 +			dev_flush_error++;
 +	}
 +
 +	if (dev_flush_error >
 +	    fsdevs->fs_info->num_tolerated_disk_barrier_failures)
 +		return -EIO;
  
  	return 0;
  }
@@@ -3548,8 -3555,9 +3548,8 @@@ static int barrier_all_devices(struct b
  {
  	struct list_head *head;
  	struct btrfs_device *dev;
 -	int errors_send = 0;
  	int errors_wait = 0;
- 	int ret;
+ 	blk_status_t ret;
  
  	/* send down all the barriers */
  	head = &info->fs_devices->devices;
diff --cc fs/btrfs/disk-io.h
index 4654d129aa76,c581927555f3..0a634d3ffc16
--- a/fs/btrfs/disk-io.h
+++ b/fs/btrfs/disk-io.h
@@@ -118,16 -118,16 +118,16 @@@ int btrfs_buffer_uptodate(struct extent
  int btrfs_read_buffer(struct extent_buffer *buf, u64 parent_transid);
  u32 btrfs_csum_data(const char *data, u32 seed, size_t len);
  void btrfs_csum_final(u32 crc, u8 *result);
- int btrfs_bio_wq_end_io(struct btrfs_fs_info *info, struct bio *bio,
+ blk_status_t btrfs_bio_wq_end_io(struct btrfs_fs_info *info, struct bio *bio,
  			enum btrfs_wq_endio_type metadata);
- int btrfs_wq_submit_bio(struct btrfs_fs_info *fs_info, struct bio *bio,
 -blk_status_t btrfs_wq_submit_bio(struct btrfs_fs_info *fs_info,
 -		struct inode *inode, struct bio *bio, int mirror_num,
 -		unsigned long bio_flags, u64 bio_offset,
 -		extent_submit_bio_hook_t *submit_bio_start,
 -		extent_submit_bio_hook_t *submit_bio_done);
++blk_status_t btrfs_wq_submit_bio(struct btrfs_fs_info *fs_info, struct bio *bio,
 +			int mirror_num, unsigned long bio_flags,
 +			u64 bio_offset, void *private_data,
 +			extent_submit_bio_hook_t *submit_bio_start,
 +			extent_submit_bio_hook_t *submit_bio_done);
  unsigned long btrfs_async_submit_limit(struct btrfs_fs_info *info);
  int btrfs_write_tree_block(struct extent_buffer *buf);
 -int btrfs_wait_tree_block_writeback(struct extent_buffer *buf);
 +void btrfs_wait_tree_block_writeback(struct extent_buffer *buf);
  int btrfs_init_log_root_tree(struct btrfs_trans_handle *trans,
  			     struct btrfs_fs_info *fs_info);
  int btrfs_add_log_tree(struct btrfs_trans_handle *trans,
diff --cc fs/btrfs/extent_io.c
index 29a6111a68d2,d1cd60140817..6b0f0c586018
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@@ -2369,9 -2398,9 +2370,10 @@@ static int bio_readpage_error(struct bi
  	struct io_failure_record *failrec;
  	struct inode *inode = page->mapping->host;
  	struct extent_io_tree *tree = &BTRFS_I(inode)->io_tree;
 +	struct extent_io_tree *failure_tree = &BTRFS_I(inode)->io_failure_tree;
  	struct bio *bio;
  	int read_mode = 0;
+ 	blk_status_t status;
  	int ret;
  
  	BUG_ON(bio_op(failed_bio) == REQ_OP_WRITE);
@@@ -2404,11 -2433,12 +2406,12 @@@
  		"Repair Read Error: submitting new read[%#x] to this_mirror=%d, in_validation=%d",
  		read_mode, failrec->this_mirror, failrec->in_validation);
  
- 	ret = tree->ops->submit_bio_hook(tree->private_data, bio, failrec->this_mirror,
 -	status = tree->ops->submit_bio_hook(inode, bio, failrec->this_mirror,
++	status = tree->ops->submit_bio_hook(tree->private_data, bio, failrec->this_mirror,
  					 failrec->bio_flags, 0);
- 	if (ret) {
+ 	if (status) {
 -		free_io_failure(BTRFS_I(inode), failrec);
 +		free_io_failure(failure_tree, tree, failrec);
  		bio_put(bio);
+ 		ret = blk_status_to_errno(status);
  	}
  
  	return ret;
@@@ -2509,9 -2540,9 +2513,9 @@@ endio_readpage_release_extent(struct ex
  static void end_bio_extent_readpage(struct bio *bio)
  {
  	struct bio_vec *bvec;
- 	int uptodate = !bio->bi_error;
+ 	int uptodate = !bio->bi_status;
  	struct btrfs_io_bio *io_bio = btrfs_io_bio(bio);
 -	struct extent_io_tree *tree;
 +	struct extent_io_tree *tree, *failure_tree;
  	u64 offset = 0;
  	u64 start;
  	u64 end;
@@@ -2529,10 -2560,9 +2533,10 @@@
  
  		btrfs_debug(fs_info,
  			"end_bio_extent_readpage: bi_sector=%llu, err=%d, mirror=%u",
- 			(u64)bio->bi_iter.bi_sector, bio->bi_error,
+ 			(u64)bio->bi_iter.bi_sector, bio->bi_status,
  			io_bio->mirror_num);
  		tree = &BTRFS_I(inode)->io_tree;
 +		failure_tree = &BTRFS_I(inode)->io_failure_tree;
  
  		/* We always issue full-page reads, but if some block
  		 * in a page fails to read, blk_update_request() will
diff --cc fs/btrfs/extent_io.h
index aeafdb35d90b,487ca0207cb6..d4942d94a16b
--- a/fs/btrfs/extent_io.h
+++ b/fs/btrfs/extent_io.h
@@@ -92,9 -92,9 +92,9 @@@ struct btrfs_inode
  struct btrfs_io_bio;
  struct io_failure_record;
  
- typedef	int (extent_submit_bio_hook_t)(void *private_data, struct bio *bio,
- 				       int mirror_num, unsigned long bio_flags,
- 				       u64 bio_offset);
 -typedef	blk_status_t (extent_submit_bio_hook_t)(struct inode *inode,
++typedef	blk_status_t (extent_submit_bio_hook_t)(void *private_data,
+ 		struct bio *bio, int mirror_num, unsigned long bio_flags,
+ 		u64 bio_offset);
  struct extent_io_ops {
  	/*
  	 * The following callbacks must be allways defined, the function
diff --cc fs/btrfs/inode.c
index 5d3c6ac960fd,556c93060606..8d050314591c
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@@ -1900,12 -1900,11 +1899,12 @@@ int btrfs_merge_bio_hook(struct page *p
   * At IO completion time the cums attached on the ordered extent record
   * are inserted into the btree
   */
- static int __btrfs_submit_bio_start(void *private_data, struct bio *bio,
 -static blk_status_t __btrfs_submit_bio_start(struct inode *inode,
 -		struct bio *bio, int mirror_num, unsigned long bio_flags,
 -		u64 bio_offset)
++static blk_status_t __btrfs_submit_bio_start(void *private_data, struct bio *bio,
 +				    int mirror_num, unsigned long bio_flags,
 +				    u64 bio_offset)
  {
 +	struct inode *inode = private_data;
- 	int ret = 0;
+ 	blk_status_t ret = 0;
  
  	ret = btrfs_csum_one_bio(inode, bio, 0, 0);
  	BUG_ON(ret); /* -ENOMEM */
@@@ -1920,13 -1919,12 +1919,13 @@@
   * At IO completion time the cums attached on the ordered extent record
   * are inserted into the btree
   */
- static int __btrfs_submit_bio_done(void *private_data, struct bio *bio,
 -static blk_status_t __btrfs_submit_bio_done(struct inode *inode,
 -		struct bio *bio, int mirror_num, unsigned long bio_flags,
 -		u64 bio_offset)
++static blk_status_t __btrfs_submit_bio_done(void *private_data, struct bio *bio,
 +			  int mirror_num, unsigned long bio_flags,
 +			  u64 bio_offset)
  {
 +	struct inode *inode = private_data;
  	struct btrfs_fs_info *fs_info = btrfs_sb(inode->i_sb);
- 	int ret;
+ 	blk_status_t ret;
  
  	ret = btrfs_map_bio(fs_info, bio, mirror_num, 1);
  	if (ret) {
@@@ -1940,11 -1938,10 +1939,11 @@@
   * extent_io.c submission hook. This does the right thing for csum calculation
   * on write, or reading the csums from the tree before a read
   */
- static int btrfs_submit_bio_hook(void *private_data, struct bio *bio,
 -static blk_status_t btrfs_submit_bio_hook(struct inode *inode, struct bio *bio,
 -			  int mirror_num, unsigned long bio_flags,
 -			  u64 bio_offset)
++static blk_status_t btrfs_submit_bio_hook(void *private_data, struct bio *bio,
 +				 int mirror_num, unsigned long bio_flags,
 +				 u64 bio_offset)
  {
 +	struct inode *inode = private_data;
  	struct btrfs_fs_info *fs_info = btrfs_sb(inode->i_sb);
  	struct btrfs_root *root = BTRFS_I(inode)->root;
  	enum btrfs_wq_endio_type metadata = BTRFS_WQ_ENDIO_DATA;
@@@ -8046,12 -8033,10 +8045,12 @@@ struct btrfs_retry_complete 
  static void btrfs_retry_endio_nocsum(struct bio *bio)
  {
  	struct btrfs_retry_complete *done = bio->bi_private;
 +	struct inode *inode = done->inode;
  	struct bio_vec *bvec;
 +	struct extent_io_tree *io_tree, *failure_tree;
  	int i;
  
- 	if (bio->bi_error)
+ 	if (bio->bi_status)
  		goto end;
  
  	ASSERT(bio->bi_vcnt == 1);
@@@ -8171,12 -8140,11 +8170,12 @@@ end
  	bio_put(bio);
  }
  
- static int __btrfs_subio_endio_read(struct inode *inode,
- 				    struct btrfs_io_bio *io_bio, int err)
+ static blk_status_t __btrfs_subio_endio_read(struct inode *inode,
+ 		struct btrfs_io_bio *io_bio, blk_status_t err)
  {
  	struct btrfs_fs_info *fs_info;
 -	struct bio_vec *bvec;
 +	struct bio_vec bvec;
 +	struct bvec_iter iter;
  	struct btrfs_retry_complete done;
  	u64 start;
  	u64 offset = 0;
@@@ -8265,13 -8231,10 +8264,13 @@@ static void btrfs_endio_direct_read(str
  	struct inode *inode = dip->inode;
  	struct bio *dio_bio;
  	struct btrfs_io_bio *io_bio = btrfs_io_bio(bio);
- 	int err = bio->bi_error;
+ 	blk_status_t err = bio->bi_status;
  
 -	if (dip->flags & BTRFS_DIO_ORIG_BIO_SUBMITTED)
 +	if (dip->flags & BTRFS_DIO_ORIG_BIO_SUBMITTED) {
  		err = btrfs_subio_endio_read(inode, io_bio, err);
 +		if (!err)
- 			bio->bi_error = 0;
++			bio->bi_status = 0;
 +	}
  
  	unlock_extent(&BTRFS_I(inode)->io_tree, dip->logical_offset,
  		      dip->logical_offset + dip->bytes - 1);
@@@ -8344,12 -8307,11 +8343,12 @@@ static void btrfs_endio_direct_write(st
  	bio_put(bio);
  }
  
- static int __btrfs_submit_bio_start_direct_io(void *private_data,
 -static blk_status_t __btrfs_submit_bio_start_direct_io(struct inode *inode,
++static blk_status_t __btrfs_submit_bio_start_direct_io(void *private_data,
  				    struct bio *bio, int mirror_num,
  				    unsigned long bio_flags, u64 offset)
  {
 +	struct inode *inode = private_data;
- 	int ret;
+ 	blk_status_t ret;
  	ret = btrfs_csum_one_bio(inode, bio, offset, 1);
  	BUG_ON(ret); /* -ENOMEM */
  	return 0;
@@@ -8395,7 -8357,17 +8394,7 @@@ out
  	bio_put(bio);
  }
  
- static inline int btrfs_lookup_and_bind_dio_csum(struct inode *inode,
 -static struct bio *btrfs_dio_bio_alloc(struct block_device *bdev,
 -				       u64 first_sector, gfp_t gfp_flags)
 -{
 -	struct bio *bio;
 -	bio = btrfs_bio_alloc(bdev, first_sector, BIO_MAX_PAGES, gfp_flags);
 -	if (bio)
 -		bio_associate_current(bio);
 -	return bio;
 -}
 -
+ static inline blk_status_t btrfs_lookup_and_bind_dio_csum(struct inode *inode,
  						 struct btrfs_dio_private *dip,
  						 struct bio *bio,
  						 u64 file_offset)
@@@ -8675,10 -8672,10 +8674,10 @@@ free_ordered
  		 * Releases and cleans up our dio_bio, no need to bio_put()
  		 * nor bio_endio()/bio_io_error() against dio_bio.
  		 */
- 		dio_end_io(dio_bio, ret);
+ 		dio_end_io(dio_bio);
  	}
 -	if (io_bio)
 -		bio_put(io_bio);
 +	if (bio)
 +		bio_put(bio);
  	kfree(dip);
  }
  
@@@ -8758,9 -8754,11 +8757,12 @@@ static ssize_t btrfs_direct_IO(struct k
  			dio_data.overwrite = 1;
  			inode_unlock(inode);
  			relock = true;
+ 		} else if (iocb->ki_flags & IOCB_NOWAIT) {
+ 			ret = -EAGAIN;
+ 			goto out;
  		}
 -		ret = btrfs_delalloc_reserve_space(inode, offset, count);
 +		ret = btrfs_delalloc_reserve_space(inode, &data_reserved,
 +						   offset, count);
  		if (ret)
  			goto out;
  		dio_data.outstanding_extents = count_max_extents(count);
diff --cc fs/f2fs/segment.c
index e77ecd51aef0,ea9f455d94ba..d927afc457bb
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@@ -755,9 -749,9 +755,9 @@@ static void f2fs_submit_discard_endio(s
  {
  	struct discard_cmd *dc = (struct discard_cmd *)bio->bi_private;
  
- 	dc->error = bio->bi_error;
+ 	dc->error = blk_status_to_errno(bio->bi_status);
  	dc->state = D_DONE;
 -	complete(&dc->wait);
 +	complete_all(&dc->wait);
  	bio_put(bio);
  }
  
diff --cc include/linux/fs.h
index afccabaaec0c,65adbddb3163..2811a90754cf
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@@ -2511,9 -2542,11 +2538,11 @@@ extern int write_inode_now(struct inod
  extern int filemap_fdatawrite(struct address_space *);
  extern int filemap_flush(struct address_space *);
  extern int filemap_fdatawait(struct address_space *);
 -extern void filemap_fdatawait_keep_errors(struct address_space *);
 +extern int filemap_fdatawait_keep_errors(struct address_space *mapping);
  extern int filemap_fdatawait_range(struct address_space *, loff_t lstart,
  				   loff_t lend);
+ extern bool filemap_range_has_page(struct address_space *, loff_t lstart,
+ 				  loff_t lend);
  extern int filemap_write_and_wait(struct address_space *mapping);
  extern int filemap_write_and_wait_range(struct address_space *mapping,
  				        loff_t lstart, loff_t lend);
diff --cc mm/filemap.c
index d7a30aefee0d,742034e56100..b37e005dc7aa
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@@ -386,7 -376,39 +386,39 @@@ int filemap_flush(struct address_space 
  }
  EXPORT_SYMBOL(filemap_flush);
  
+ /**
+  * filemap_range_has_page - check if a page exists in range.
+  * @mapping:           address space within which to check
+  * @start_byte:        offset in bytes where the range starts
+  * @end_byte:          offset in bytes where the range ends (inclusive)
+  *
+  * Find at least one page in the range supplied, usually used to check if
+  * direct writing in this range will trigger a writeback.
+  */
+ bool filemap_range_has_page(struct address_space *mapping,
+ 			   loff_t start_byte, loff_t end_byte)
+ {
+ 	pgoff_t index = start_byte >> PAGE_SHIFT;
+ 	pgoff_t end = end_byte >> PAGE_SHIFT;
+ 	struct pagevec pvec;
+ 	bool ret;
+ 
+ 	if (end_byte < start_byte)
+ 		return false;
+ 
+ 	if (mapping->nrpages == 0)
+ 		return false;
+ 
+ 	pagevec_init(&pvec, 0);
+ 	if (!pagevec_lookup(&pvec, mapping, index, 1))
+ 		return false;
+ 	ret = (pvec.pages[0]->index <= end);
+ 	pagevec_release(&pvec);
+ 	return ret;
+ }
+ EXPORT_SYMBOL(filemap_range_has_page);
+ 
 -static int __filemap_fdatawait_range(struct address_space *mapping,
 +static void __filemap_fdatawait_range(struct address_space *mapping,
  				     loff_t start_byte, loff_t end_byte)
  {
  	pgoff_t index = start_byte >> PAGE_SHIFT;
