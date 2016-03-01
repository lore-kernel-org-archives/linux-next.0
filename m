From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with Linus' tree
Date: Tue, 1 Mar 2016 11:25:44 +1100
Message-ID: <20160301112544.02294d99@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36794 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750832AbcCAAZs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Feb 2016 19:25:48 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Keith Busch <keith.busch@intel.com>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagig@mellanox.com>

Hi Jens,

Today's linux-next merge of the block tree got a conflict in:

  drivers/nvme/host/pci.c

between commits:

  7ba7735d039c ("NVMe: Poll device while still active during remove")
  f8e68a7c9af5 ("NVMe: Rate limit nvme IO warnings")

from Linus' tree and commit:

  1b3c47c182aa ("nvme: Log the ctrl device name instead of the underlying pci device name")
  9396dec916c0 ("nvme: use a work item to submit async event requests")
  2d55cd5f511d ("nvme: replace the kthread with a per-device watchdog timer")

from the block tree.

I fixed it up (maybe - see below) and can carry the fix as necessary
(no action is required).

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/nvme/host/pci.c
index a128672472ec,d47b08783110..000000000000
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@@ -1004,7 -992,7 +997,7 @@@ static void nvme_cancel_queue_ios(struc
  	if (!blk_mq_request_started(req))
  		return;
  
- 	dev_dbg_ratelimited(nvmeq->q_dmadev,
 -	dev_warn(nvmeq->dev->ctrl.device,
++	dev_dbg_ratelimited(nvmeq->dev->ctrl.device,
  		 "Cancelling I/O %d QID %d\n", req->tag, nvmeq->qid);
  
  	status = NVME_SC_ABORT_REQ;
@@@ -2116,7 -2042,11 +2047,10 @@@ static void nvme_remove(struct pci_dev 
  {
  	struct nvme_dev *dev = pci_get_drvdata(pdev);
  
+ 	del_timer_sync(&dev->watchdog_timer);
+ 
  	pci_set_drvdata(pdev, NULL);
+ 	flush_work(&dev->async_work);
 -	flush_work(&dev->reset_work);
  	flush_work(&dev->scan_work);
  	nvme_remove_namespaces(&dev->ctrl);
  	nvme_uninit_ctrl(&dev->ctrl);
