From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: pci tree build failure
Date: Tue, 8 Jul 2008 11:40:51 +1000
Message-ID: <20080708114051.bc5f4ccc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44684 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753850AbYGHBky (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Jul 2008 21:40:54 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: linux-next@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>

Hi Jesse,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

drivers/pci/pci.c: In function 'pci_pm_init':
drivers/pci/pci.c:1248: error: implicit declaration of function 'device_set_wakeup_capable'

Caused by commit eb9d0fe40e313c0a74115ef456a2e43a6c8da72f ("PCI ACPI:
Rework PCI handling of wake-up").  I applied the patch below - which may
not be correct, but makes the build work.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From 2b2c4f28d7900f5d043960b94aaae177bc1adcd9 Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 8 Jul 2008 11:24:37 +1000
Subject: [PATCH] pci: include linux/pm_wakeup.h for device_set_wakeup_capable

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/pci/pci.c         |    1 +
 include/linux/pm_wakeup.h |    2 ++
 2 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index e632a58..3d92b71 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -17,6 +17,7 @@
 #include <linux/string.h>
 #include <linux/log2.h>
 #include <linux/pci-aspm.h>
+#include <linux/pm_wakeup.h>
 #include <asm/dma.h>	/* isa_dma_bridge_buggy */
 #include "pci.h"
 
diff --git a/include/linux/pm_wakeup.h b/include/linux/pm_wakeup.h
index 3af0c8d..0aae777 100644
--- a/include/linux/pm_wakeup.h
+++ b/include/linux/pm_wakeup.h
@@ -63,6 +63,8 @@ static inline void device_init_wakeup(struct device *dev, int val)
 	dev->power.can_wakeup = !!val;
 }
 
+static inline void device_set_wakeup_capable(struct device *dev, int val) { }
+
 static inline int device_can_wakeup(struct device *dev)
 {
 	return dev->power.can_wakeup;
-- 
1.5.6
