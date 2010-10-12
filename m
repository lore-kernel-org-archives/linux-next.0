From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] staging/intel_sst: include delay.h to fix build error
Date: Mon, 11 Oct 2010 17:47:04 -0700
Message-ID: <4CB3B008.9080800@oracle.com>
References: <20101008161552.07c9f137.sfr@canb.auug.org.au> <20101010115618.b048a89e.randy.dunlap@oracle.com> <20101010202921.GB4900@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:36161 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755301Ab0JLAs7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 11 Oct 2010 20:48:59 -0400
In-Reply-To: <20101010202921.GB4900@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, driverdevel <devel@driverdev.osuosl.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Vinod Koul <vinod.koul@intel.com>, Harsha Priya <priya.harsha@intel.com>, Dharageswari R <dharageswari.r@intel.com>

From: Randy Dunlap <randy.dunlap@oracle.com>

intel_sst_drv_interface.c uses msleep() so it needs to include delay.h:

drivers/staging/intel_sst/intel_sst_drv_interface.c:88: error: implicit declaration of function 'msleep'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/staging/intel_sst/intel_sst_drv_interface.c |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20101008.orig/drivers/staging/intel_sst/intel_sst_drv_interface.c
+++ linux-next-20101008/drivers/staging/intel_sst/intel_sst_drv_interface.c
@@ -26,6 +26,7 @@
  *  Upper layer interfaces (MAD driver, MMF) to SST driver
  */
 
+#include <linux/delay.h>
 #include <linux/pci.h>
 #include <linux/fs.h>
 #include <linux/firmware.h>
