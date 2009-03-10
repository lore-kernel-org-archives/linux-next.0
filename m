From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the md tree with the  tree
Date: Tue, 10 Mar 2009 16:33:02 +1100
Message-ID: <20090310163302.874a669c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53264 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751881AbZCJFdI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Mar 2009 01:33:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Neil Brown <neilb@suse.de>
Cc: linux-next@vger.kernel.org, Johannes Weiner <jw@emlix.com>, Dan Williams <dan.j.williams@intel.com>

Hi Neil,

Today's linux-next merge of the md tree got a conflict in
include/linux/dmaengine.h between commit
1d93e52eb48df986a3c4d5ad8a520bf1f6837367 ("dmaengine: update kerneldoc")
from Linus' tree and commit a23742cb3c1ca5d412dea09de452c9d173b80afd
("async_tx: add support for asynchronous GF multiplication") from the md
tree.

I fixed it up (see below) and can carry the fix for a while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc include/linux/dmaengine.h
index 1956c8d,f9280b8..0000000
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@@ -209,6 -240,9 +236,7 @@@ struct dma_async_tx_descriptor 
   * @global_node: list_head for global dma_device_list
   * @cap_mask: one or more dma_capability flags
   * @max_xor: maximum number of xor sources, 0 if no capability
+  * @max_pq: maximum number of PQ sources and PQ-continue capability
 - * @refcount: reference count
 - * @done: IO completion struct
   * @dev_id: unique device ID
   * @dev: struct device reference for dma mapping api
   * @device_alloc_chan_resources: allocate resources and return the
