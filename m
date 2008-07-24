From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ide tree build failure
Date: Thu, 24 Jul 2008 13:17:06 +1000
Message-ID: <20080724131706.7ecabe1d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34477 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750958AbYGXDRL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 23 Jul 2008 23:17:11 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: linux-next@vger.kernel.org

Hi Bart,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

drivers/ide/ppc/pmac.c: In function 'set_timings_mdma':
drivers/ide/ppc/pmac.c:689: error: expected ']' before ')' token

Caused by commit 010fac593cedbdea4841ffcf49d2ea10e8651c6f "ide: make
drive->id an union".

I applied the following patch.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From 5123642db8897eb15653453f0f76d33d2a5be19e Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 24 Jul 2008 13:15:15 +1000
Subject: [PATCH] ide: fix typo in drivers/ide/ppc/pmac.c

drivers/ide/ppc/pmac.c: In function 'set_timings_mdma':
drivers/ide/ppc/pmac.c:689: error: expected ']' before ')' token

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/ide/ppc/pmac.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/ide/ppc/pmac.c b/drivers/ide/ppc/pmac.c
index 0f636a5..9d8b317 100644
--- a/drivers/ide/ppc/pmac.c
+++ b/drivers/ide/ppc/pmac.c
@@ -686,7 +686,7 @@ set_timings_mdma(ide_drive_t *drive, int intf_type, u32 *timings, u32 *timings2,
 	}
 
 	/* Check if drive provides explicit DMA cycle time */
-	if ((id[ATA_ID_FIELD_VALID] & 2) && id[ATA_ID_EIDE_DMA_TIME)
+	if ((id[ATA_ID_FIELD_VALID] & 2) && id[ATA_ID_EIDE_DMA_TIME])
 		cycleTime = max_t(int, id[ATA_ID_EIDE_DMA_TIME], cycleTime);
 
 	/* OHare limits according to some old Apple sources */	
-- 
1.5.6.3
