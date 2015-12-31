From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with Linus' tree
Date: Thu, 31 Dec 2015 14:34:57 +1100
Message-ID: <20151231143457.1004a5bd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47528 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752239AbbLaDe7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 30 Dec 2015 22:34:59 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Keith Busch <keith.busch@intel.com>, Christoph Hellwig <hch@lst.de>

Hi Jens,

Today's linux-next merge of the block tree got a conflict in:

  drivers/nvme/host/pci.c

between commit:

  b5875222de2f ("NVMe: IO ending fixes on surprise removal")

from Linus' tree and commit:

  5bae7f73d378 ("nvme: move namespace scanning to common code")

from the block tree.

I fixed it up (the code was moved - I added the fix patch below) and
can carry the fix as necessary (no action is required).

However, there was another part to the former patch that I could not
quite figure out how to reproduce - the fix to nvme_dev_remove().

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 31 Dec 2015 14:21:38 +1100
Subject: [PATCH] nvme: merge fix up for ns code movement

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/nvme/host/core.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 1437ff36e91c..1375a83593b5 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -1118,8 +1118,17 @@ static void nvme_ns_remove(struct nvme_ns *ns)
 	bool kill = nvme_io_incapable(ns->ctrl) &&
 			!blk_queue_dying(ns->queue);
 
-	if (kill)
+	if (kill) {
 		blk_set_queue_dying(ns->queue);
+
+		/*
+		 * The controller was shutdown first if we got here through
+		 * device removal. The shutdown may requeue outstanding
+		 * requests. These need to be aborted immediately so
+		 * del_gendisk doesn't block indefinitely for their completion.
+		 */
+		blk_mq_abort_requeue_list(ns->queue);
+	}
 	if (ns->disk->flags & GENHD_FL_UP) {
 		if (blk_get_integrity(ns->disk))
 			blk_integrity_unregister(ns->disk);
-- 
2.6.4

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
