From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] staging/phison: depends on ATA_BMDMA
Date: Wed, 26 May 2010 10:30:02 -0700
Message-ID: <20100526103002.ac2c6703.randy.dunlap@oracle.com>
References: <20100526153443.f18a4d2b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:44015 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754725Ab0EZRbz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 26 May 2010 13:31:55 -0400
In-Reply-To: <20100526153443.f18a4d2b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, evan_ko@phison.com

From: Randy Dunlap <randy.dunlap@oracle.com>

phison uses interfaces and data that are built only when
ATA_BMDMA is enabled, so it should depend on that symbol.

drivers/staging/phison/phison.c:43: error: implicit declaration of function 'ATA_BMDMA_SHT'
drivers/staging/phison/phison.c:43: error: initializer element is not constant
drivers/staging/phison/phison.c:43: error: (near initialization for 'phison_sht.module')
drivers/staging/phison/phison.c:47: error: 'ata_bmdma_port_ops' undeclared here (not in a function)

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: evan_ko@phison.com
---
 drivers/staging/phison/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20100526.orig/drivers/staging/phison/Kconfig
+++ linux-next-20100526/drivers/staging/phison/Kconfig
@@ -1,5 +1,5 @@
 config IDE_PHISON
 	tristate "PCIE ATA PS5000 IDE support"
-	depends on PCI && ATA && ATA_SFF
+	depends on PCI && ATA && ATA_SFF && ATA_BMDMA
 	---help---
 	  This is an experimental driver for PS5000 IDE driver.
