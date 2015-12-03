From: =?UTF-8?Q?Matias_Bj=c3=b8rling?= <m@bjorling.me>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Thu, 3 Dec 2015 11:09:03 +0100
Message-ID: <566014BF.3080702@bjorling.me>
References: <20151202161936.22b23668cf9dea9872b5079b@kernel.org>
 <20151202164527.GA31048@lst.de> <565F5D96.5050902@kernel.dk>
 <565FFFA5.6000003@bjorling.me> <20151203090638.GA14329@lst.de>
 <566010EE.6050806@bjorling.me> <20151203095726.GA15428@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151203095726.GA15428@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>, Keith Busch <keith.busch@intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org
List-Id: linux-next.vger.kernel.org



On 12/03/2015 10:57 AM, Christoph Hellwig wrote:
> On Thu, Dec 03, 2015 at 10:52:46AM +0100, Matias Bj=F8rling wrote:
>> The identify geometry command and bad block commands are part of the=
 admin
>> command set. Surely, as all these take a ns id, they can be moved an=
d be
>> accessed naturally through the user queues.
>
> Nah, these admin commands should go through the admin queue - but
> having a request_queue as the argument to the callback just seems rat=
her
> off if it's not the right one.  Why can't you just pass the 'struct n=
vm_dev'
> instead of the request_queue for these methods?
>

That'll work as well.

Similar to this?

diff --git i/drivers/lightnvm/core.c w/drivers/lightnvm/core.c
index 86ce887..4a8d1fe 100644
--- i/drivers/lightnvm/core.c
+++ w/drivers/lightnvm/core.c
@@ -74,7 +74,7 @@ EXPORT_SYMBOL(nvm_unregister_target);
  void *nvm_dev_dma_alloc(struct nvm_dev *dev, gfp_t mem_flags,
  							dma_addr_t *dma_handler)
  {
-	return dev->ops->dev_dma_alloc(dev->q, dev->ppalist_pool, mem_flags,
+	return dev->ops->dev_dma_alloc(dev, dev->ppalist_pool, mem_flags,
  								dma_handler);
  }
  EXPORT_SYMBOL(nvm_dev_dma_alloc);
@@ -246,7 +246,7 @@ static int nvm_init(struct nvm_dev *dev)
  	if (!dev->q || !dev->ops)
  		return ret;

-	if (dev->ops->identity(dev->q, &dev->identity)) {
+	if (dev->ops->identity(dev, &dev->identity)) {
  		pr_err("nvm: device could not be identified\n");
  		goto err;
  	}
@@ -326,8 +326,7 @@ int nvm_register(struct request_queue *q, char=20
*disk_name,
  	}

  	if (dev->ops->max_phys_sect > 1) {
-		dev->ppalist_pool =3D dev->ops->create_dma_pool(dev->q,
-								"ppalist");
+		dev->ppalist_pool =3D dev->ops->create_dma_pool(dev, "ppalist");
  		if (!dev->ppalist_pool) {
  			pr_err("nvm: could not create ppa pool\n");
  			ret =3D -ENOMEM;
diff --git i/drivers/nvme/host/lightnvm.c w/drivers/nvme/host/lightnvm.=
c
index 762c9a7..15f2acb 100644
--- i/drivers/nvme/host/lightnvm.c
+++ w/drivers/nvme/host/lightnvm.c
@@ -271,9 +271,9 @@ static int init_grps(struct nvm_id *nvm_id, struct=20
nvme_nvm_id *nvme_nvm_id)
  	return 0;
  }

-static int nvme_nvm_identity(struct request_queue *q, struct nvm_id=20
*nvm_id)
+static int nvme_nvm_identity(struct nvm_dev *nvmdev, struct nvm_id *nv=
m_id)
  {
-	struct nvme_ns *ns =3D q->queuedata;
+	struct nvme_ns *ns =3D nvmdev->q->queuedata;
  	struct nvme_dev *dev =3D ns->dev;
  	struct nvme_nvm_id *nvme_nvm_id;
  	struct nvme_nvm_command c =3D {};
@@ -308,10 +308,10 @@ out:
  	return ret;
  }

-static int nvme_nvm_get_l2p_tbl(struct request_queue *q, u64 slba, u32=
 nlb,
+static int nvme_nvm_get_l2p_tbl(struct nvm_dev *nvmdev, u64 slba, u32 =
nlb,
  				nvm_l2p_update_fn *update_l2p, void *priv)
  {
-	struct nvme_ns *ns =3D q->queuedata;
+	struct nvme_ns *ns =3D nvmdev->q->queuedata;
  	struct nvme_dev *dev =3D ns->dev;
  	struct nvme_nvm_command c =3D {};
  	u32 len =3D queue_max_hw_sectors(dev->admin_q) << 9;
@@ -415,10 +415,10 @@ out:
  	return ret;
  }

-static int nvme_nvm_set_bb_tbl(struct request_queue *q, struct nvm_rq =
*rqd,
+static int nvme_nvm_set_bb_tbl(struct nvm_dev *nvmdev, struct nvm_rq *=
rqd,
  								int type)
  {
-	struct nvme_ns *ns =3D q->queuedata;
+	struct nvme_ns *ns =3D nvmdev->q->queuedata;
  	struct nvme_dev *dev =3D ns->dev;
  	struct nvme_nvm_command c =3D {};
  	int ret =3D 0;
@@ -463,8 +463,9 @@ static void nvme_nvm_end_io(struct request *rq, int=
=20
error)
  	blk_mq_free_request(rq);
  }

-static int nvme_nvm_submit_io(struct request_queue *q, struct nvm_rq *=
rqd)
+static int nvme_nvm_submit_io(struct nvm_dev *dev, struct nvm_rq *rqd)
  {
+	struct request_queue *q =3D dev->q;
  	struct nvme_ns *ns =3D q->queuedata;
  	struct request *rq;
  	struct bio *bio =3D rqd->bio;
@@ -502,8 +503,9 @@ static int nvme_nvm_submit_io(struct request_queue=20
*q, struct nvm_rq *rqd)
  	return 0;
  }

-static int nvme_nvm_erase_block(struct request_queue *q, struct nvm_rq=
=20
*rqd)
+static int nvme_nvm_erase_block(struct nvm_dev *dev, struct nvm_rq *rq=
d)
  {
+	struct request_queue *q =3D dev->q;
  	struct nvme_ns *ns =3D q->queuedata;
  	struct nvme_nvm_command c =3D {};

@@ -515,9 +517,9 @@ static int nvme_nvm_erase_block(struct request_queu=
e=20
*q, struct nvm_rq *rqd)
  	return nvme_submit_sync_cmd(q, (struct nvme_command *)&c, NULL, 0);
  }

-static void *nvme_nvm_create_dma_pool(struct request_queue *q, char *n=
ame)
+static void *nvme_nvm_create_dma_pool(struct nvm_dev *nvmdev, char *na=
me)
  {
-	struct nvme_ns *ns =3D q->queuedata;
+	struct nvme_ns *ns =3D nvmdev->q->queuedata;
  	struct nvme_dev *dev =3D ns->dev;

  	return dma_pool_create(name, dev->dev, PAGE_SIZE, PAGE_SIZE, 0);
@@ -530,7 +532,7 @@ static void nvme_nvm_destroy_dma_pool(void *pool)
  	dma_pool_destroy(dma_pool);
  }

-static void *nvme_nvm_dev_dma_alloc(struct request_queue *q, void *poo=
l,
+static void *nvme_nvm_dev_dma_alloc(struct nvm_dev *dev, void *pool,
  				    gfp_t mem_flags, dma_addr_t *dma_handler)
  {
  	return dma_pool_alloc(pool, mem_flags, dma_handler);
diff --git i/include/linux/lightnvm.h w/include/linux/lightnvm.h
index 935ef38..034117b 100644
--- i/include/linux/lightnvm.h
+++ w/include/linux/lightnvm.h
@@ -183,17 +183,17 @@ struct nvm_block;

  typedef int (nvm_l2p_update_fn)(u64, u32, __le64 *, void *);
  typedef int (nvm_bb_update_fn)(struct ppa_addr, int, u8 *, void *);
-typedef int (nvm_id_fn)(struct request_queue *, struct nvm_id *);
-typedef int (nvm_get_l2p_tbl_fn)(struct request_queue *, u64, u32,
+typedef int (nvm_id_fn)(struct nvm_dev *, struct nvm_id *);
+typedef int (nvm_get_l2p_tbl_fn)(struct nvm_dev *, u64, u32,
  				nvm_l2p_update_fn *, void *);
  typedef int (nvm_op_bb_tbl_fn)(struct nvm_dev *, struct ppa_addr, int=
,
  				nvm_bb_update_fn *, void *);
-typedef int (nvm_op_set_bb_fn)(struct request_queue *, struct nvm_rq *=
,=20
int);
-typedef int (nvm_submit_io_fn)(struct request_queue *, struct nvm_rq *=
);
-typedef int (nvm_erase_blk_fn)(struct request_queue *, struct nvm_rq *=
);
-typedef void *(nvm_create_dma_pool_fn)(struct request_queue *, char *)=
;
+typedef int (nvm_op_set_bb_fn)(struct nvm_dev *, struct nvm_rq *, int)=
;
+typedef int (nvm_submit_io_fn)(struct nvm_dev *, struct nvm_rq *);
+typedef int (nvm_erase_blk_fn)(struct nvm_dev *, struct nvm_rq *);
+typedef void *(nvm_create_dma_pool_fn)(struct nvm_dev *, char *);
  typedef void (nvm_destroy_dma_pool_fn)(void *);
-typedef void *(nvm_dev_dma_alloc_fn)(struct request_queue *, void *, g=
fp_t,
+typedef void *(nvm_dev_dma_alloc_fn)(struct nvm_dev *, void *, gfp_t,
  								dma_addr_t *);
  typedef void (nvm_dev_dma_free_fn)(void *, void*, dma_addr_t);
