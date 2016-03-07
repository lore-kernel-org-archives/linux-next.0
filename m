From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with Linus' tree
Date: Mon, 7 Mar 2016 14:08:26 +1100
Message-ID: <20160307140826.7d59fdf2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49793 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751341AbcCGDI3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 6 Mar 2016 22:08:29 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Keith Busch <keith.busch@intel.com>, Sagi Grimberg <sagig@mellanox.com>, Christoph Hellwig <hch@lst.de>

Hi Jens,

Today's linux-next merge of the block tree got a conflict in:

  drivers/nvme/host/pci.c

between commit:

  ff23a2a15a21 ("NVMe: Poll device while still active during remove")
  f8e68a7c9af5 ("NVMe: Rate limit nvme IO warnings")
  b00a726a9fd8 ("NVMe: Don't unmap controller registers on reset")
  646017a612e7 ("NVMe: Fix namespace removal deadlock")
  f58944e265d4 ("NVMe: Simplify device reset failure")

from Linus' tree and commit:

  949928c1c731 ("NVMe: Fix possible queue use after freed")
  1b3c47c182aa ("nvme: Log the ctrl device name instead of the underlying pci device name")
  9396dec916c0 ("nvme: use a work item to submit async event requests")
  2d55cd5f511d ("nvme: replace the kthread with a per-device watchdog timer")

from the block tree.

I fixed it up (maybe - see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/nvme/host/pci.c
index 680f5780750c,d47b08783110..000000000000
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@@ -310,10 -288,10 +299,10 @@@ static void nvme_complete_async_event(s
  
  	switch (result & 0xff07) {
  	case NVME_AER_NOTICE_NS_CHANGED:
- 		dev_info(dev->dev, "rescanning\n");
+ 		dev_info(dev->ctrl.device, "rescanning\n");
 -		queue_work(nvme_workq, &dev->scan_work);
 +		nvme_queue_scan(dev);
  	default:
- 		dev_warn(dev->dev, "async event result %08x\n", result);
+ 		dev_warn(dev->ctrl.device, "async event result %08x\n", result);
  	}
  }
  
@@@ -1018,7 -992,7 +1011,7 @@@ static void nvme_cancel_queue_ios(struc
  	if (!blk_mq_request_started(req))
  		return;
  
- 	dev_dbg_ratelimited(nvmeq->q_dmadev,
 -	dev_warn(nvmeq->dev->ctrl.device,
++	dev_dbg_ratelimited(nvmeq->dev->ctrl.device,
  		 "Cancelling I/O %d QID %d\n", req->tag, nvmeq->qid);
  
  	status = NVME_SC_ABORT_REQ;
@@@ -1709,8 -1651,14 +1676,14 @@@ static int nvme_dev_add(struct nvme_de
  		if (blk_mq_alloc_tag_set(&dev->tagset))
  			return 0;
  		dev->ctrl.tagset = &dev->tagset;
+ 	} else {
+ 		blk_mq_update_nr_hw_queues(&dev->tagset, dev->online_queues - 1);
+ 
+ 		/* Free previously allocated queues that are no longer usable */
+ 		nvme_free_queues(dev, dev->online_queues);
  	}
+ 
 -	queue_work(nvme_workq, &dev->scan_work);
 +	nvme_queue_scan(dev);
  	return 0;
  }
  
@@@ -1845,10 -1763,10 +1774,10 @@@ static void nvme_dev_disable(struct nvm
  	int i;
  	u32 csts = -1;
  
- 	nvme_dev_list_remove(dev);
+ 	del_timer_sync(&dev->watchdog_timer);
  
  	mutex_lock(&dev->shutdown_lock);
 -	if (dev->bar) {
 +	if (pci_is_enabled(to_pci_dev(dev->dev))) {
  		nvme_stop_queues(&dev->ctrl);
  		csts = readl(dev->bar + NVME_REG_CSTS);
  	}
@@@ -1951,13 -1859,12 +1880,12 @@@ static void nvme_reset_work(struct work
  
  	result = nvme_setup_io_queues(dev);
  	if (result)
 -		goto free_tags;
 +		goto out;
  
  	dev->ctrl.event_limit = NVME_NR_AEN_COMMANDS;
+ 	queue_work(nvme_workq, &dev->async_work);
  
- 	result = nvme_dev_list_add(dev);
- 	if (result)
- 		goto out;
+ 	mod_timer(&dev->watchdog_timer, round_jiffies(jiffies + HZ));
  
  	/*
  	 * Keep the controller around but remove all namespaces if we don't have
@@@ -2085,11 -1988,6 +2014,10 @@@ static int nvme_probe(struct pci_dev *p
  	dev->dev = get_device(&pdev->dev);
  	pci_set_drvdata(pdev, dev);
  
 +	result = nvme_dev_map(dev);
 +	if (result)
 +		goto free;
 +
- 	INIT_LIST_HEAD(&dev->node);
  	INIT_WORK(&dev->scan_work, nvme_dev_scan);
  	INIT_WORK(&dev->reset_work, nvme_reset_work);
  	INIT_WORK(&dev->remove_work, nvme_remove_dead_ctrl_work);
@@@ -2145,8 -2042,11 +2078,11 @@@ static void nvme_remove(struct pci_dev 
  {
  	struct nvme_dev *dev = pci_get_drvdata(pdev);
  
 +	set_bit(NVME_CTRL_REMOVING, &dev->flags);
+ 	del_timer_sync(&dev->watchdog_timer);
+ 
  	pci_set_drvdata(pdev, NULL);
+ 	flush_work(&dev->async_work);
 -	flush_work(&dev->reset_work);
  	flush_work(&dev->scan_work);
  	nvme_remove_namespaces(&dev->ctrl);
  	nvme_uninit_ctrl(&dev->ctrl);
