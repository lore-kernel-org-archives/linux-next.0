From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with Linus' tree
Date: Thu, 18 Feb 2016 13:10:27 +1100
Message-ID: <20160218131027.072f4c39@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Keith Busch <keith.busch@intel.com>, Sagi Grimberg <sagig@mellanox.com>
List-Id: linux-next.vger.kernel.org

Hi Jens,

Today's linux-next merge of the block tree got a conflict in:

  drivers/nvme/host/pci.c

between commit:

  f8e68a7c9af5 ("NVMe: Rate limit nvme IO warnings")

from Linus' tree and commit:

  1b3c47c182aa ("nvme: Log the ctrl device name instead of the underlying pci device name")

from the block tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/nvme/host/pci.c
index a128672472ec,fec747917690..000000000000
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@@ -1004,7 -990,7 +995,7 @@@ static void nvme_cancel_queue_ios(struc
  	if (!blk_mq_request_started(req))
  		return;
  
- 	dev_dbg_ratelimited(nvmeq->q_dmadev,
 -	dev_warn(nvmeq->dev->ctrl.device,
++	dev_dbg_ratelimited(nvmeq->dev->ctrl.device,
  		 "Cancelling I/O %d QID %d\n", req->tag, nvmeq->qid);
  
  	status = NVME_SC_ABORT_REQ;
