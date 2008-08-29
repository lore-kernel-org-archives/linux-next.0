From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: block tree build failure
Date: Fri, 29 Aug 2008 15:07:41 +1000
Message-ID: <20080829150741.713257b2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51471 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750803AbYH2FHs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 29 Aug 2008 01:07:48 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: linux-next@vger.kernel.org

Hi Jens,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/scsi/sg.c: In function 'sg_write_xfer':
drivers/scsi/sg.c:1862: error: 'iovec_count' undeclared (first use in this function)
drivers/scsi/sg.c: In function 'sg_remove_scat':
drivers/scsi/sg.c:1877: error: 'page' undeclared (first use in this function)

Introduced by commit d9b1190ebc3060e3a6ac1dd8cc3121390d7d71cd ("sg:
convert the indirect IO path to use the block layer").

I applied the following patch (which is probably not correct).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 29 Aug 2008 15:05:44 +1000
Subject: [PATCH] block: scsi sg fixes

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/scsi/sg.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/scsi/sg.c b/drivers/scsi/sg.c
index 277680b..6cb2445 100644
--- a/drivers/scsi/sg.c
+++ b/drivers/scsi/sg.c
@@ -1859,8 +1859,8 @@ sg_write_xfer(Sg_request * srp)
 	     && ((SG_FLAG_NO_DXFER | SG_FLAG_MMAP_IO) & hp->flags)))
 		return 0;
 
-	SCSI_LOG_TIMEOUT(4, printk("sg_write_xfer: num_xfer=%d, iovec_count=%d, k_use_sg=%d\n",
-			  num_xfer, iovec_count, schp->k_use_sg));
+	SCSI_LOG_TIMEOUT(4, printk("sg_write_xfer: num_xfer=%d, k_use_sg=%d\n",
+			  num_xfer, schp->k_use_sg));
 
 	return 0;
 }
@@ -1875,8 +1875,8 @@ sg_remove_scat(Sg_scatter_hold * schp)
 
 			for (k = 0; k < schp->k_use_sg && schp->pages[k]; k++) {
 				SCSI_LOG_TIMEOUT(5, printk(
-				    "sg_remove_scat: k=%d, pg=0x%p\n",
-				    k, page));
+				    "sg_remove_scat: k=%d\n",
+				    k));
 				__free_pages(schp->pages[k], schp->page_order);
 			}
 
-- 
1.5.6.5
