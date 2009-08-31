From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: dwmw2-iommu tree build failure
Date: Mon, 31 Aug 2009 15:24:23 +1000
Message-ID: <20090831152423.13e06c4a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53694 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754388AbZHaFYZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 31 Aug 2009 01:24:25 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Len Brown <len.brown@intel.com>

Hi David,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/pci/intel-iommu.c: In function 'iommu_prepare_identity_map':
drivers/pci/intel-iommu.c:1979: error: implicit declaration of function 'dmi_get_system_info'

Caused by commit 2ff729f5445cc47d1910386c36e53fc6b1c5e47a ("intel-iommu:
Cope with yet another BIOS screwup causing crashes") from the dwmw2-iommu
tree interacting with commit 2e15511d37cded52140573b72c3b5b085fdb7f80
("ACPI: linux/acpi.h should not include linux/dmi.h") from he acpi tree.

This file needs to include linux/dmi.h directly ... I applied the
following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 31 Aug 2009 15:20:33 +1000
Subject: [PATCH] intel-iommu: include linux/dmi.h to use dmi_ routines

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/pci/intel-iommu.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/pci/intel-iommu.c b/drivers/pci/intel-iommu.c
index d36fa80..2ec5899 100644
--- a/drivers/pci/intel-iommu.c
+++ b/drivers/pci/intel-iommu.c
@@ -37,6 +37,7 @@
 #include <linux/iommu.h>
 #include <linux/intel-iommu.h>
 #include <linux/sysdev.h>
+#include <linux/dmi.h>
 #include <asm/cacheflush.h>
 #include <asm/iommu.h>
 #include "pci.h"
-- 
1.6.3.3

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
