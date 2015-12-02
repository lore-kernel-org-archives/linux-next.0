From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Wed, 2 Dec 2015 17:45:27 +0100
Message-ID: <20151202164527.GA31048@lst.de>
References: <20151202161936.22b23668cf9dea9872b5079b@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.211]:59006 "EHLO newverein.lst.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751209AbbLBQpb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 2 Dec 2015 11:45:31 -0500
Content-Disposition: inline
In-Reply-To: <20151202161936.22b23668cf9dea9872b5079b@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Keith Busch <keith.busch@intel.com>, Christoph Hellwig <hch@lst.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org

Looks like I didn't test with CONFIG_NVM enabled, and neither did
the build bot.

Most of this is really weird crazy shit in the lighnvm support, though.

Struct nvme_ns is a structure for the NVM I/O command set, and it has
no business poking into it.  Second this commit:

commit 47b3115ae7b799be8b77b0f024215ad4f68d6460
Author: Wenwei Tao <ww.tao0320@gmail.com>
Date:   Fri Nov 20 13:47:55 2015 +0100

    nvme: lightnvm: use admin queues for admin cmds

Does even more crazy stuff.  If a function gets a request_queue parameter
passed it'd better use that and not look for another one.

Quick patch below, but this code will need some more attention:

diff --git a/drivers/nvme/host/lightnvm.c b/drivers/nvme/host/lightnvm.c
index d5622f9..09cf0b9 100644
--- a/drivers/nvme/host/lightnvm.c
+++ b/drivers/nvme/host/lightnvm.c
@@ -276,7 +276,6 @@ static int init_grps(struct nvm_id *nvm_id, struct nvme_nvm_id *nvme_nvm_id)
 static int nvme_nvm_identity(struct request_queue *q, struct nvm_id *nvm_id)
 {
 	struct nvme_ns *ns = q->queuedata;
-	struct nvme_dev *dev = ns->dev;
 	struct nvme_nvm_id *nvme_nvm_id;
 	struct nvme_nvm_command c = {};
 	int ret;
@@ -289,7 +288,7 @@ static int nvme_nvm_identity(struct request_queue *q, struct nvm_id *nvm_id)
 	if (!nvme_nvm_id)
 		return -ENOMEM;
 
-	ret = nvme_submit_sync_cmd(dev->admin_q, (struct nvme_command *)&c,
+	ret = nvme_submit_sync_cmd(ns->ctrl->admin_q, (struct nvme_command *)&c,
 				nvme_nvm_id, sizeof(struct nvme_nvm_id));
 	if (ret) {
 		ret = -EIO;
@@ -314,9 +313,8 @@ static int nvme_nvm_get_l2p_tbl(struct request_queue *q, u64 slba, u32 nlb,
 				nvm_l2p_update_fn *update_l2p, void *priv)
 {
 	struct nvme_ns *ns = q->queuedata;
-	struct nvme_dev *dev = ns->dev;
 	struct nvme_nvm_command c = {};
-	u32 len = queue_max_hw_sectors(dev->admin_q) << 9;
+	u32 len = queue_max_hw_sectors(ns->ctrl->admin_q) << 9;
 	u32 nlb_pr_rq = len / sizeof(u64);
 	u64 cmd_slba = slba;
 	void *entries;
@@ -334,10 +332,10 @@ static int nvme_nvm_get_l2p_tbl(struct request_queue *q, u64 slba, u32 nlb,
 		c.l2p.slba = cpu_to_le64(cmd_slba);
 		c.l2p.nlb = cpu_to_le32(cmd_nlb);
 
-		ret = nvme_submit_sync_cmd(dev->admin_q,
+		ret = nvme_submit_sync_cmd(ns->ctrl->admin_q,
 				(struct nvme_command *)&c, entries, len);
 		if (ret) {
-			dev_err(dev->dev, "L2P table transfer failed (%d)\n",
+			dev_err(ns->ctrl->dev, "L2P table transfer failed (%d)\n",
 									ret);
 			ret = -EIO;
 			goto out;
@@ -362,7 +360,7 @@ static int nvme_nvm_get_bb_tbl(struct request_queue *q, struct ppa_addr ppa,
 				void *priv)
 {
 	struct nvme_ns *ns = q->queuedata;
-	struct nvme_dev *dev = ns->dev;
+	struct nvme_ctrl *ctrl = ns->ctrl;
 	struct nvme_nvm_command c = {};
 	struct nvme_nvm_bb_tbl *bb_tbl;
 	int tblsz = sizeof(struct nvme_nvm_bb_tbl) + nr_blocks;
@@ -376,30 +374,30 @@ static int nvme_nvm_get_bb_tbl(struct request_queue *q, struct ppa_addr ppa,
 	if (!bb_tbl)
 		return -ENOMEM;
 
-	ret = nvme_submit_sync_cmd(dev->admin_q, (struct nvme_command *)&c,
+	ret = nvme_submit_sync_cmd(ctrl->admin_q, (struct nvme_command *)&c,
 								bb_tbl, tblsz);
 	if (ret) {
-		dev_err(dev->dev, "get bad block table failed (%d)\n", ret);
+		dev_err(ctrl->dev, "get bad block table failed (%d)\n", ret);
 		ret = -EIO;
 		goto out;
 	}
 
 	if (bb_tbl->tblid[0] != 'B' || bb_tbl->tblid[1] != 'B' ||
 		bb_tbl->tblid[2] != 'L' || bb_tbl->tblid[3] != 'T') {
-		dev_err(dev->dev, "bbt format mismatch\n");
+		dev_err(ctrl->dev, "bbt format mismatch\n");
 		ret = -EINVAL;
 		goto out;
 	}
 
 	if (le16_to_cpu(bb_tbl->verid) != 1) {
 		ret = -EINVAL;
-		dev_err(dev->dev, "bbt version not supported\n");
+		dev_err(ctrl->dev, "bbt version not supported\n");
 		goto out;
 	}
 
 	if (le32_to_cpu(bb_tbl->tblks) != nr_blocks) {
 		ret = -EINVAL;
-		dev_err(dev->dev, "bbt unsuspected blocks returned (%u!=%u)",
+		dev_err(ctrl->dev, "bbt unsuspected blocks returned (%u!=%u)",
 					le32_to_cpu(bb_tbl->tblks), nr_blocks);
 		goto out;
 	}
@@ -419,7 +417,6 @@ static int nvme_nvm_set_bb_tbl(struct request_queue *q, struct nvm_rq *rqd,
 								int type)
 {
 	struct nvme_ns *ns = q->queuedata;
-	struct nvme_dev *dev = ns->dev;
 	struct nvme_nvm_command c = {};
 	int ret = 0;
 
@@ -429,10 +426,10 @@ static int nvme_nvm_set_bb_tbl(struct request_queue *q, struct nvm_rq *rqd,
 	c.set_bb.nlb = cpu_to_le16(rqd->nr_pages - 1);
 	c.set_bb.value = type;
 
-	ret = nvme_submit_sync_cmd(dev->admin_q, (struct nvme_command *)&c,
+	ret = nvme_submit_sync_cmd(ns->ctrl->admin_q, (struct nvme_command *)&c,
 								NULL, 0);
 	if (ret)
-		dev_err(dev->dev, "set bad block table failed (%d)\n", ret);
+		dev_err(ns->ctrl->dev, "set bad block table failed (%d)\n", ret);
 	return ret;
 }
 
@@ -518,9 +515,8 @@ static int nvme_nvm_erase_block(struct request_queue *q, struct nvm_rq *rqd)
 static void *nvme_nvm_create_dma_pool(struct request_queue *q, char *name)
 {
 	struct nvme_ns *ns = q->queuedata;
-	struct nvme_dev *dev = ns->dev;
 
-	return dma_pool_create(name, dev->dev, PAGE_SIZE, PAGE_SIZE, 0);
+	return dma_pool_create(name, ns->ctrl->dev, PAGE_SIZE, PAGE_SIZE, 0);
 }
 
 static void nvme_nvm_destroy_dma_pool(void *pool)
@@ -573,8 +569,9 @@ void nvme_nvm_unregister(struct request_queue *q, char *disk_name)
 
 int nvme_nvm_ns_supported(struct nvme_ns *ns, struct nvme_id_ns *id)
 {
-	struct nvme_dev *dev = ns->dev;
-	struct pci_dev *pdev = to_pci_dev(dev->dev);
+	struct nvme_ctrl *ctrl = ns->ctrl;
+	/* XXX: this is poking into PCI structures from generic code! */
+	struct pci_dev *pdev = to_pci_dev(ctrl->dev);
 
 	/* QEMU NVMe simulator - PCI ID + Vendor specific bit */
 	if (pdev->vendor == PCI_VENDOR_ID_INTEL && pdev->device == 0x5845 &&
