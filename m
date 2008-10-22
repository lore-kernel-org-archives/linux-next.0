From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: pci tree build failure
Date: Wed, 22 Oct 2008 13:39:55 +1100
Message-ID: <20081022133955.16830a02.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45622 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752144AbYJVCkB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Oct 2008 22:40:01 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: linux-next@vger.kernel.org

Hi Jesse,

Today's linux-next build (x86_64 allmodconfig) failed like this:

usr/include/linux/pci.h:21: included file 'linux/io.h' is not exported

Caused by commit 4be3c3f680d40d60a1513dcf1a10c3779defcd73 ("PCI: include
io.h in pci.h so that ioremap_nocache is defined").

I applied the following patch.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 22 Oct 2008 13:33:43 +1100
Subject: [PATCH] pci: move include of io.h so it doesn't need to be exported

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/pci.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/include/linux/pci.h b/include/linux/pci.h
index 955ab70..752def8 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -18,7 +18,6 @@
 #define LINUX_PCI_H
 
 #include <linux/pci_regs.h>	/* The pci register defines */
-#include <linux/io.h>
 
 /*
  * The PCI interface treats multi-function devices as independent
@@ -52,6 +51,7 @@
 #include <linux/kobject.h>
 #include <asm/atomic.h>
 #include <linux/device.h>
+#include <linux/io.h>
 
 /* Include the ID list */
 #include <linux/pci_ids.h>
-- 
1.5.6.5
