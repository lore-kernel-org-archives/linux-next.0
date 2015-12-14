From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with Linus' tree
Date: Mon, 14 Dec 2015 12:36:36 +1100
Message-ID: <20151214123636.2a1d0c9d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Matias =?UTF-8?B?QmrDuHJsaW5n?= <m@bjorling.me>
List-Id: linux-next.vger.kernel.org

Hi Jens,

Today's linux-next merge of the block tree got a conflict in:

  drivers/nvme/host/lightnvm.c

between commit:

  16f26c3aa9b9 ("lightnvm: replace req queue with nvmdev for lld")

from Linus' tree and commit:

  ac02dddec633 ("NVMe: fix build with CONFIG_NVM enabled")

from the block tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/nvme/host/lightnvm.c
index 15f2acb4d5cd,09cf0b99d2fa..000000000000
--- a/drivers/nvme/host/lightnvm.c
+++ b/drivers/nvme/host/lightnvm.c
@@@ -271,10 -273,9 +271,9 @@@ static int init_grps(struct nvm_id *nvm
  	return 0;
  }
  
 -static int nvme_nvm_identity(struct request_queue *q, struct nvm_id *nvm_id)
 +static int nvme_nvm_identity(struct nvm_dev *nvmdev, struct nvm_id *nvm_id)
  {
 -	struct nvme_ns *ns = q->queuedata;
 +	struct nvme_ns *ns = nvmdev->q->queuedata;
- 	struct nvme_dev *dev = ns->dev;
  	struct nvme_nvm_id *nvme_nvm_id;
  	struct nvme_nvm_command c = {};
  	int ret;
@@@ -308,13 -309,12 +307,12 @@@ out
  	return ret;
  }
  
 -static int nvme_nvm_get_l2p_tbl(struct request_queue *q, u64 slba, u32 nlb,
 +static int nvme_nvm_get_l2p_tbl(struct nvm_dev *nvmdev, u64 slba, u32 nlb,
  				nvm_l2p_update_fn *update_l2p, void *priv)
  {
 -	struct nvme_ns *ns = q->queuedata;
 +	struct nvme_ns *ns = nvmdev->q->queuedata;
- 	struct nvme_dev *dev = ns->dev;
  	struct nvme_nvm_command c = {};
- 	u32 len = queue_max_hw_sectors(dev->admin_q) << 9;
+ 	u32 len = queue_max_hw_sectors(ns->ctrl->admin_q) << 9;
  	u32 nlb_pr_rq = len / sizeof(u64);
  	u64 cmd_slba = slba;
  	void *entries;
@@@ -359,9 -359,8 +357,9 @@@ static int nvme_nvm_get_bb_tbl(struct n
  				int nr_blocks, nvm_bb_update_fn *update_bbtbl,
  				void *priv)
  {
 +	struct request_queue *q = nvmdev->q;
  	struct nvme_ns *ns = q->queuedata;
- 	struct nvme_dev *dev = ns->dev;
+ 	struct nvme_ctrl *ctrl = ns->ctrl;
  	struct nvme_nvm_command c = {};
  	struct nvme_nvm_bb_tbl *bb_tbl;
  	int tblsz = sizeof(struct nvme_nvm_bb_tbl) + nr_blocks;
@@@ -415,11 -413,10 +413,10 @@@ out
  	return ret;
  }
  
 -static int nvme_nvm_set_bb_tbl(struct request_queue *q, struct nvm_rq *rqd,
 +static int nvme_nvm_set_bb_tbl(struct nvm_dev *nvmdev, struct nvm_rq *rqd,
  								int type)
  {
 -	struct nvme_ns *ns = q->queuedata;
 +	struct nvme_ns *ns = nvmdev->q->queuedata;
- 	struct nvme_dev *dev = ns->dev;
  	struct nvme_nvm_command c = {};
  	int ret = 0;
  
@@@ -517,12 -512,11 +514,11 @@@ static int nvme_nvm_erase_block(struct 
  	return nvme_submit_sync_cmd(q, (struct nvme_command *)&c, NULL, 0);
  }
  
 -static void *nvme_nvm_create_dma_pool(struct request_queue *q, char *name)
 +static void *nvme_nvm_create_dma_pool(struct nvm_dev *nvmdev, char *name)
  {
 -	struct nvme_ns *ns = q->queuedata;
 +	struct nvme_ns *ns = nvmdev->q->queuedata;
- 	struct nvme_dev *dev = ns->dev;
  
- 	return dma_pool_create(name, dev->dev, PAGE_SIZE, PAGE_SIZE, 0);
+ 	return dma_pool_create(name, ns->ctrl->dev, PAGE_SIZE, PAGE_SIZE, 0);
  }
  
  static void nvme_nvm_destroy_dma_pool(void *pool)
@@@ -573,19 -567,14 +569,20 @@@ void nvme_nvm_unregister(struct request
  	nvm_unregister(disk_name);
  }
  
 +/* move to shared place when used in multiple places. */
 +#define PCI_VENDOR_ID_CNEX 0x1d1d
 +#define PCI_DEVICE_ID_CNEX_WL 0x2807
 +#define PCI_DEVICE_ID_CNEX_QEMU 0x1f1f
 +
  int nvme_nvm_ns_supported(struct nvme_ns *ns, struct nvme_id_ns *id)
  {
- 	struct nvme_dev *dev = ns->dev;
- 	struct pci_dev *pdev = to_pci_dev(dev->dev);
+ 	struct nvme_ctrl *ctrl = ns->ctrl;
+ 	/* XXX: this is poking into PCI structures from generic code! */
+ 	struct pci_dev *pdev = to_pci_dev(ctrl->dev);
  
  	/* QEMU NVMe simulator - PCI ID + Vendor specific bit */
 -	if (pdev->vendor == PCI_VENDOR_ID_INTEL && pdev->device == 0x5845 &&
 +	if (pdev->vendor == PCI_VENDOR_ID_CNEX &&
 +				pdev->device == PCI_DEVICE_ID_CNEX_QEMU &&
  							id->vs[0] == 0x1)
  		return 1;
  
