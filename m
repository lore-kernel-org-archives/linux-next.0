From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] staging/hv: blk dev depends on SCSI
Date: Fri, 7 Aug 2009 11:17:04 -0700
Message-ID: <20090807111704.b7b79983.randy.dunlap@oracle.com>
References: <20090807183118.e71b4db2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:26426 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932146AbZHGSRq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 7 Aug 2009 14:17:46 -0400
In-Reply-To: <20090807183118.e71b4db2.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de, akpm <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

hv block driver uses scsi_*() interfaces so it should depend on SCSI.

ERROR: "scsi_normalize_sense" [drivers/staging/hv/hv_blkvsc.ko] undefined!
ERROR: "scsi_print_sense_hdr" [drivers/staging/hv/hv_blkvsc.ko] undefined!

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/staging/hv/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20090807.orig/drivers/staging/hv/Kconfig
+++ linux-next-20090807/drivers/staging/hv/Kconfig
@@ -15,7 +15,7 @@ config HYPERV_STORAGE
 
 config HYPERV_BLOCK
 	tristate "Microsoft Hyper-V virtual block driver"
-	depends on BLOCK && m
+	depends on BLOCK && SCSI && m
 	default n
 	help
 	  Select this option to enable the Hyper-V virtual block driver.


---
~Randy
LPC 2009, Sept. 23-25, Portland, Oregon
http://linuxplumbersconf.org/2009/
