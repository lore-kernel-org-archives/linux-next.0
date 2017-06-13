From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with the s390 tree
Date: Tue, 13 Jun 2017 13:06:49 +1000
Message-ID: <20170613130649.6bcede94@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47247 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751753AbdFMDGw (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 12 Jun 2017 23:06:52 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Sebastian Ott <sebott@linux.vnet.ibm.com>

Hi Jens,

Today's linux-next merge of the block tree got conflicts in:

  drivers/s390/block/scm_blk.c
  drivers/s390/block/scm_blk.h

between commits:

  94d26bfcf312 ("s390/scm: remove cluster option")
  c7b3e92331fb ("s390/scm: convert tasklet")

from the s390 tree and commit:

  2a842acab109 ("block: introduce new block status code type")

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

diff --cc drivers/s390/block/scm_blk.c
index 725f912fab41,3c2c84b72877..000000000000
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
index 242d17a91920,cd598d1a4eae..000000000000
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
