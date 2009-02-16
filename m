From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] staging/phison: fix kconfig for clean build
Date: Mon, 16 Feb 2009 08:46:16 -0800
Message-ID: <49999858.6000604@oracle.com>
References: <20090216172016.f1d159a7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet13.oracle.com ([148.87.113.125]:40621 "EHLO
	rgminet13.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751123AbZBPQqd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 16 Feb 2009 11:46:33 -0500
In-Reply-To: <20090216172016.f1d159a7.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Greg KH <gregkh@suse.de>, Andrew Morton <akpm@linux-foundation.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

phison is an ATA driver, not a classic IDE driver, so fix the Kconfig file
so that it will build.

drivers/staging/phison/phison.c:43: error: implicit declaration of function 'ATA_BMDMA_SHT'
drivers/staging/phison/phison.c:43: error: initializer element is not constant
drivers/staging/phison/phison.c:43: error: (near initialization for 'phison_sht.module')
drivers/staging/phison/phison.c:47: error: 'ata_bmdma_port_ops' undeclared here (not in a function)
drivers/staging/phison/phison.c:65: error: implicit declaration of function 'ata_pci_sff_init_one'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/staging/phison/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20090216.orig/drivers/staging/phison/Kconfig
+++ linux-next-20090216/drivers/staging/phison/Kconfig
@@ -1,5 +1,5 @@
 config IDE_PHISON
 	tristate "PCIE ATA PS5000 IDE support"
-	depends on IDE
+	depends on ATA && ATA_SFF
 	---help---
 	  This is an experimental driver for PS5000 IDE driver.
