From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] crypto: marvell/cesa - another fix up for
 of_get_named_gen_pool() rename
Date: Fri, 3 Jul 2015 13:49:37 +1000
Message-ID: <20150703134937.36a048b0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35075 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754455AbbGCDtj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 2 Jul 2015 23:49:39 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linus <torvalds@linux-foundation.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>


Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/crypto/mv_cesa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Andrew, you seem to have forgotten this one (or maybe it was not needed
in Linus' tree when you sent that last patch bomb).  Anyway, this is
now needed in Linus' tree.

diff --git a/drivers/crypto/mv_cesa.c b/drivers/crypto/mv_cesa.c
index 5bcd575fa96f..e6b658faef63 100644
--- a/drivers/crypto/mv_cesa.c
+++ b/drivers/crypto/mv_cesa.c
@@ -1034,8 +1034,8 @@ static int mv_cesa_get_sram(struct platform_device *pdev,
 			     &sram_size);
 
 	cp->sram_size = sram_size;
-	cp->sram_pool = of_get_named_gen_pool(pdev->dev.of_node,
-					      "marvell,crypto-srams", 0);
+	cp->sram_pool = of_gen_pool_get(pdev->dev.of_node,
+					"marvell,crypto-srams", 0);
 	if (cp->sram_pool) {
 		cp->sram = gen_pool_dma_alloc(cp->sram_pool, sram_size,
 					      &cp->sram_dma);
-- 
2.1.4

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
