From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with Linus' tree
Date: Tue, 3 May 2016 14:25:52 +1000
Message-ID: <20160503142552.1c5e1d83@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Keith Busch <keith.busch@intel.com>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

Hi Jens,

Today's linux-next merge of the block tree got a conflict in:

  drivers/nvme/host/pci.c

between commit:

  9bf2b972afea ("NVMe: Fix reset/remove race")

from Linus' tree and commit:

  bb8d261e0888 ("nvme: introduce a controller state machine")

from the block tree.

I fixed it up (I think - see below) and can carry the fix as necessary.
This is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/nvme/host/pci.c
index 4fd733ff72b1,077e9bf6a1b8..000000000000
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@@ -1864,10 -1789,8 +1789,11 @@@ static void nvme_reset_work(struct work
  	if (dev->ctrl.ctrl_config & NVME_CC_ENABLE)
  		nvme_dev_disable(dev, false);
  
- 	if (test_bit(NVME_CTRL_REMOVING, &dev->flags))
++	if (dev->ctrl.state != NVME_CTRL_DELETING)
 +		goto out;
 +
- 	set_bit(NVME_CTRL_RESETTING, &dev->flags);
+ 	if (!nvme_change_ctrl_state(&dev->ctrl, NVME_CTRL_RESETTING))
+ 		goto out;
  
  	result = nvme_pci_enable(dev);
  	if (result)
@@@ -2086,12 -2014,11 +2017,10 @@@ static void nvme_remove(struct pci_dev 
  {
  	struct nvme_dev *dev = pci_get_drvdata(pdev);
  
- 	set_bit(NVME_CTRL_REMOVING, &dev->flags);
 -	del_timer_sync(&dev->watchdog_timer);
 -
+ 	nvme_change_ctrl_state(&dev->ctrl, NVME_CTRL_DELETING);
+ 
  	pci_set_drvdata(pdev, NULL);
- 	flush_work(&dev->async_work);
 +	flush_work(&dev->reset_work);
- 	flush_work(&dev->scan_work);
- 	nvme_remove_namespaces(&dev->ctrl);
  	nvme_uninit_ctrl(&dev->ctrl);
  	nvme_dev_disable(dev, true);
  	flush_work(&dev->reset_work);
