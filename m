From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the block tree
Date: Mon, 7 Mar 2016 14:29:33 +1100
Message-ID: <20160307142933.44e5fc5e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38254 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751341AbcCGD3f (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 6 Mar 2016 22:29:35 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ming Lin <ming.l@ssi.samsung.com>, Keith Busch <keith.busch@intel.com>

Hi Jens,

After merging the block tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: "nvme_kill_queues" [drivers/nvme/host/nvme.ko] undefined!

Caused by commit

  576d55d62566 ("nvme: split pci module out of core module")

interacting with commit

  69d9a99c258e ("NVMe: Move error handling to failed reset handler")

from Linus' tree.

I applied the merge fix patch below.  Maybe you should do a back merge
of Linus' tree and fix this up as well as the conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 7 Mar 2016 14:24:19 +1100
Subject: [PATCH] nvme: fix up for "split pci module out of core module"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/nvme/host/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index db47bbda06b3..e2d11d623e33 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -1508,6 +1508,7 @@ void nvme_kill_queues(struct nvme_ctrl *ctrl)
 	}
 	mutex_unlock(&ctrl->namespaces_mutex);
 }
+EXPORT_SYMBOL_GPL(nvme_kill_queues);
 
 void nvme_stop_queues(struct nvme_ctrl *ctrl)
 {
-- 
2.7.0

-- 
Cheers,
Stephen Rothwell
