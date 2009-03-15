From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: New linux-next tree suspend-2.6
Date: Sun, 15 Mar 2009 17:54:36 +0100
Message-ID: <200903151754.37147.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:43843 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753162AbZCOQyr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 15 Mar 2009 12:54:47 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, Jesse Barnes <jbarnes@virtuousgeek.org>

Hi Stephen,

Here's a new tree for linux-next:

git://git.kernel.org/pub/scm/linux/kernel/git/rafael/suspend-2.6.git linux-next

It is based on the Linus' current tree, but I can rebase it on top of anything
else if that helps.

Unfortunately, it has two merge conflict that I'm not sure how to resolve.

The first one is with the linux-next branch of pci-2.6 and it may be resolved
by applying the appended patch on top of pci-2.6/linux-next before
merging suspend-2.6/linux-next.

The second one is with the x86 tree (I think) in drivers/xen/manage.c, but this
one is trivial.

Thanks,
Rafael

---
Revert 'PCI PM: Consistently use variable name "error" for pm call return values'

This is needed to resolve a merge conflict between the linux-next
branch of the pci-2.6 tree and the linux-next branch of the
suspend-2.6 tree.
---
 drivers/pci/pci-driver.c |   20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

Index: linux-next/drivers/pci/pci-driver.c
===================================================================
--- linux-next.orig/drivers/pci/pci-driver.c
+++ linux-next/drivers/pci/pci-driver.c
@@ -351,17 +351,17 @@ static int pci_legacy_suspend(struct dev
 {
 	struct pci_dev * pci_dev = to_pci_dev(dev);
 	struct pci_driver * drv = pci_dev->driver;
-	int error = 0;
+	int i = 0;
 
 	if (drv && drv->suspend) {
 		pci_power_t prev = pci_dev->current_state;
 
 		pci_dev->state_saved = false;
 
-		error = drv->suspend(pci_dev, state);
-		suspend_report_result(drv->suspend, error);
-		if (error)
-			return error;
+		i = drv->suspend(pci_dev, state);
+		suspend_report_result(drv->suspend, i);
+		if (i)
+			return i;
 
 		if (pci_dev->state_saved)
 			goto Fixup;
@@ -384,20 +384,20 @@ static int pci_legacy_suspend(struct dev
  Fixup:
 	pci_fixup_device(pci_fixup_suspend, pci_dev);
 
-	return error;
+	return i;
 }
 
 static int pci_legacy_suspend_late(struct device *dev, pm_message_t state)
 {
 	struct pci_dev * pci_dev = to_pci_dev(dev);
 	struct pci_driver * drv = pci_dev->driver;
-	int error = 0;
+	int i = 0;
 
 	if (drv && drv->suspend_late) {
-		error = drv->suspend_late(pci_dev, state);
-		suspend_report_result(drv->suspend_late, error);
+		i = drv->suspend_late(pci_dev, state);
+		suspend_report_result(drv->suspend_late, i);
 	}
-	return error;
+	return i;
 }
 
 static int pci_legacy_resume_early(struct device *dev)
