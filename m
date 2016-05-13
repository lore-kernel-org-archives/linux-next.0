From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the staging tree
Date: Fri, 13 May 2016 13:15:38 +1000
Message-ID: <20160513131538.7094341d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38957 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750979AbcEMDPq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 May 2016 23:15:46 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Leon Romanovsky <leon@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry Eremin <dmitry.eremin@intel.com>, Li Dongyang <dongyang.li@anu.edu.au>, James Simmons <jsimmons@infradead.org>, Christoph Hellwig <hch@lst.de>, Bart Van Assche <bart.vanassche@sandisk.com>

Hi Greg,

After merging the staging tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c:1706:9: 
error: too few arguments to function 'ib_map_mr_sg'
     n = ib_map_mr_sg(mr, tx->tx_frags,
         ^
In file included from /home/sfr/next/next/include/rdma/ib_addr.h:47:0,
                 from /home/sfr/next/next/include/rdma/rdma_cm.h:39,
                 from /home/sfr/next/next/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.h:63,
                 from /home/sfr/next/next/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c:43:
/home/sfr/next/next/include/rdma/ib_verbs.h:3147:5: note: declared here
 int ib_map_mr_sg(struct ib_mr *mr, struct scatterlist *sg, int sg_nents,
     ^

Caused by commit

  80e05b34f882 ("staging: lustre: o2iblnd: Add Fast Reg memory registration support")

interacting with commits

  aa42d65b5e20 ("IB/core: allow passing mapping an offset into the SG in ib_map_mr_sg")
  f0cf99be3251 ("IB/core: Enhance ib_map_mr_sg()")

from the rdma-leon-test tree.

I added the following merge fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 13 May 2016 13:10:47 +1000
Subject: [PATCH] staging: lustre: o2iblnd: fix for ib_map_mr_sg() API changes

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c b/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c
index d99b4fac0c39..6c59f2ff2220 100644
--- a/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c
+++ b/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c
@@ -1704,7 +1704,7 @@ int kiblnd_fmr_pool_map(kib_fmr_poolset_t *fps, kib_tx_t *tx,
 				}
 
 				n = ib_map_mr_sg(mr, tx->tx_frags,
-						 tx->tx_nfrags, PAGE_SIZE);
+						 tx->tx_nfrags, NULL, PAGE_SIZE);
 				if (unlikely(n != tx->tx_nfrags)) {
 					CERROR("Failed to map mr %d/%d elements\n",
 					       n, tx->tx_nfrags);
-- 
2.7.0

-- 
Cheers,
Stephen Rothwell
