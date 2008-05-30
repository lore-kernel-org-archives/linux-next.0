From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ide build failure
Date: Fri, 30 May 2008 11:54:22 +1000
Message-ID: <20080530115422.989d9ab6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35568 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753398AbYE3Byi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 29 May 2008 21:54:38 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: linux-next@vger.kernel.org

Hi Bart,

Today's linux-next build (x86_64 allmodconfig) failed like this:

ERROR: "ide_timing_merge" [drivers/ide/pci/via82cxxx.ko] undefined!
ERROR: "ide_timing_compute" [drivers/ide/pci/via82cxxx.ko] undefined!
ERROR: "ide_timing_find_mode" [drivers/ide/pci/opti621.ko] undefined!
ERROR: "ide_timing_find_mode" [drivers/ide/pci/cy82c693.ko] undefined!
ERROR: "ide_timing_find_mode" [drivers/ide/pci/cmd64x.ko] undefined!
ERROR: "ide_timing_find_mode" [drivers/ide/pci/cmd640.ko] undefined!
ERROR: "ide_timing_merge" [drivers/ide/pci/amd74xx.ko] undefined!
ERROR: "ide_timing_compute" [drivers/ide/pci/amd74xx.ko] undefined!
ERROR: "ide_timing_find_mode" [drivers/ide/pci/alim15x3.ko] undefined!

Caused by commit 3a3147040f2bb250ca09cd5ce5b0526969d50ba6 ("ide: convert
ide-timing.h to ide-timings.c library").

I applied the following patch.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From 0a1194cf0893e6e9ad0ecd9ade50f710c0540552 Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 30 May 2008 11:52:22 +1000
Subject: [PATCH] ide: ide-timing.h fallout

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/ide/ide-timings.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/ide/ide-timings.c b/drivers/ide/ide-timings.c
index dca53b0..8a43bd9 100644
--- a/drivers/ide/ide-timings.c
+++ b/drivers/ide/ide-timings.c
@@ -24,6 +24,7 @@
 #include <linux/kernel.h>
 #include <linux/hdreg.h>
 #include <linux/ide.h>
+#include <linux/module.h>
 
 /*
  * PIO 0-5, MWDMA 0-2 and UDMA 0-6 timings (in nanoseconds).
@@ -73,6 +74,7 @@ struct ide_timing *ide_timing_find_mode(u8 speed)
 			return NULL;
 	return t;
 }
+EXPORT_SYMBOL(ide_timing_find_mode);
 
 u16 ide_pio_cycle_time(ide_drive_t *drive, u8 pio)
 {
@@ -131,6 +133,7 @@ void ide_timing_merge(struct ide_timing *a, struct ide_timing *b,
 	if (what & IDE_TIMING_UDMA)
 		m->udma    = max(a->udma,    b->udma);
 }
+EXPORT_SYMBOL(ide_timing_merge);
 
 int ide_timing_compute(ide_drive_t *drive, u8 speed,
 		       struct ide_timing *t, int T, int UT)
@@ -199,3 +202,4 @@ int ide_timing_compute(ide_drive_t *drive, u8 speed,
 
 	return 0;
 }
+EXPORT_SYMBOL(ide_timing_compute);
-- 
1.5.5.2

