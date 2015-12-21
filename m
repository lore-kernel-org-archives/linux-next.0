From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the l2-mtd tree
Date: Mon, 21 Dec 2015 16:47:48 +1100
Message-ID: <20151221164748.29442950@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35757 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750859AbbLUFru (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 21 Dec 2015 00:47:50 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Brian,

After merging the l2-mtd tree, today's linux-next build (powerpc
ppc44x_defconfig) failed like this:

drivers/mtd/nand/ndfc.c: In function 'ndfc_chip_init':
drivers/mtd/nand/ndfc.c:177:2: error: 'ppdata' undeclared (first use in this function)
  ppdata.of_node = flash_np;
  ^

Caused by commit

  a61ae81a1907 ("mtd: nand: drop unnecessary partition parser data")

I applied this fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 21 Dec 2015 16:44:57 +1100
Subject: [PATCH] mtd: nand: fix for drop unnecessary partition parser data

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/mtd/nand/ndfc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/ndfc.c b/drivers/mtd/nand/ndfc.c
index 0709ea9dd8ed..7d72f4fe06a1 100644
--- a/drivers/mtd/nand/ndfc.c
+++ b/drivers/mtd/nand/ndfc.c
@@ -174,7 +174,6 @@ static int ndfc_chip_init(struct ndfc_controller *ndfc,
 		return -ENODEV;
 	nand_set_flash_node(chip, flash_np);
 
-	ppdata.of_node = flash_np;
 	mtd->name = kasprintf(GFP_KERNEL, "%s.%s", dev_name(&ndfc->ofdev->dev),
 			      flash_np->name);
 	if (!mtd->name) {
-- 
2.6.2

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
