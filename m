From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with Linus' tree
Date: Mon, 7 Dec 2015 15:27:09 +1100
Message-ID: <20151207152709.5153e98f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54462 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755284AbbLGE1L (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 6 Dec 2015 23:27:11 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephan =?UTF-8?B?R8O8bnRoZXI=?= <guenther@tum.de>, Christoph Hellwig <hch@lst.de>

Hi Jens,

Today's linux-next merge of the block tree got a conflict in:

  drivers/nvme/host/pci.c

between commit:

  1f390c1fde3a ("nvme: temporary fix for Apple controller reset")

from Linus' tree and commit:

  7a67cbea653e ("nvme: use offset instead of a struct for registers")

from the block tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/nvme/host/pci.c
index 9e294ff4e652,a64d0baacc58..000000000000
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@@ -2704,23 -1805,12 +1805,24 @@@ static int nvme_dev_map(struct nvme_de
  			goto unmap;
  	}
  
- 	cap = lo_hi_readq(&dev->bar->cap);
+ 	cap = lo_hi_readq(dev->bar + NVME_REG_CAP);
+ 
  	dev->q_depth = min_t(int, NVME_CAP_MQES(cap) + 1, NVME_Q_DEPTH);
  	dev->db_stride = 1 << NVME_CAP_STRIDE(cap);
- 	dev->dbs = ((void __iomem *)dev->bar) + 4096;
+ 	dev->dbs = dev->bar + 4096;
 +
 +	/*
 +	 * Temporary fix for the Apple controller found in the MacBook8,1 and
 +	 * some MacBook7,1 to avoid controller resets and data loss.
 +	 */
 +	if (pdev->vendor == PCI_VENDOR_ID_APPLE && pdev->device == 0x2001) {
 +		dev->q_depth = 2;
 +		dev_warn(dev->dev, "detected Apple NVMe controller, set "
 +			"queue depth=%u to work around controller resets\n",
 +			dev->q_depth);
 +	}
 +
- 	if (readl(&dev->bar->vs) >= NVME_VS(1, 2))
+ 	if (readl(dev->bar + NVME_REG_VS) >= NVME_VS(1, 2))
  		dev->cmb = nvme_map_cmb(dev);
  
  	return 0;
