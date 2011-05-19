From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] staging: fix mei build when PM is not enabled
Date: Thu, 19 May 2011 08:52:34 -0700
Message-ID: <20110519085234.2784f588.randy.dunlap@oracle.com>
References: <20110519135941.2fda46ca.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:39752 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754757Ab1ESPxB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 19 May 2011 11:53:01 -0400
In-Reply-To: <20110519135941.2fda46ca.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh <greg@kroah.com>, driverdevel <devel@driverdev.osuosl.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix mei build when CONFIG_PM is not enabled (i.e., fix typo):

drivers/staging/mei/main.c:1159: error: 'MEI_PM_OPS' undeclared here (not in a function)

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/staging/mei/main.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20110519.orig/drivers/staging/mei/main.c
+++ linux-next-20110519/drivers/staging/mei/main.c
@@ -1145,7 +1145,7 @@ static int mei_pci_resume(struct device 
 static SIMPLE_DEV_PM_OPS(mei_pm_ops, mei_pci_suspend, mei_pci_resume);
 #define MEI_PM_OPS	(&mei_pm_ops)
 #else
-#define MIE_PM_OPS	NULL
+#define MEI_PM_OPS	NULL
 #endif /* CONFIG_PM */
 /*
  *  PCI driver structure
