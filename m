From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: driver-core tree build failure
Date: Thu, 26 Mar 2009 18:34:33 +1100
Message-ID: <20090326183433.75a895c7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35038 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750720AbZCZHei (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Mar 2009 03:34:38 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: linux-next@vger.kernel.org, Trent Piepho <xyzzy@speakeasy.org>, Kay Sievers <kay.sievers@vrfy.org>

Hi Greg, Jesse,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/pci/hotplug/fakephp.c: In function 'legacy_add_slot':
drivers/pci/hotplug/fakephp.c:91: error: 'struct device' has no member named 'bus_id'

Caused by commit 83dbf66f04b96e65c6c18436c16d40f9cf8630aa ("PCI Hotplug:
restore fakephp interface with complete reimplementation") from the pci
tree which added another use of bus_id. (Commit
c32e967b935450c5178ebeaabb9ed889b14ed197 ("driver core: get rid of struct
device's bus_id string array") removes bus_id.)

I applied the batch below.  Jesse, this is suitable for the pci tree as
the dev_name() interface already exists in Linus' tree.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 26 Mar 2009 18:25:06 +1100
Subject: [PATCH] pci: update fakephp for bus_id removal

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/pci/hotplug/fakephp.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/pci/hotplug/fakephp.c b/drivers/pci/hotplug/fakephp.c
index 2dc7828..21c2f5d 100644
--- a/drivers/pci/hotplug/fakephp.c
+++ b/drivers/pci/hotplug/fakephp.c
@@ -18,6 +18,7 @@
 #include <linux/sysfs.h>
 #include <linux/init.h>
 #include <linux/pci.h>
+#include <linux/device.h>
 #include "../pci.h"
 
 struct legacy_slot {
@@ -88,7 +89,7 @@ static int legacy_add_slot(struct pci_dev *pdev)
 
 	if (kobject_init_and_add(&slot->kobj, &legacy_ktype,
 				 &pci_slots_kset->kobj, "%s",
-				 pdev->dev.bus_id)) {
+				 dev_name(&pdev->dev))) {
 		dev_warn(&pdev->dev, "Failed to created legacy fake slot\n");
 		return -EINVAL;
 	}
-- 
1.6.2.1
