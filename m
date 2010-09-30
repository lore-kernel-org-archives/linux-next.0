From: Vipin Mehta <vmehta@atheros.com>
Subject: [Vipin.Mehta@Atheros.com: [PATCH] staging: ath6kl: Fixing the
 driver to use modified mmc_host structure
Date: Wed, 29 Sep 2010 17:34:19 -0700
Message-ID: <20100930003419.GB5906@vmehta-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.atheros.com ([12.19.149.2]:50578 "EHLO mail.atheros.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751028Ab0I3AeW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Sep 2010 20:34:22 -0400
Received: from mail.atheros.com ([10.10.20.105])
	by sidewinder.atheros.com
	for <linux-next@vger.kernel.org>; Wed, 29 Sep 2010 17:34:14 -0700
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, greg@kroah.com, vmehta@atheros.com

Stephen,
    Can you pls help me apply the following patch to the linux-next 
tree. The patch fixes a compilation problem with ath6kl due to a
change in the mmc_host structure. The driver compiles fine in the
staging-next-2.6 tree which is where the changes for this driver 
actually go. However, the mmc stack in the linux-next tree and 
staging-next-2.6 is out of sync and so this patch is only applicable
to linux-next.

Regards,
Vipin

----- Forwarded message from Vipin Mehta <Vipin.Mehta@Atheros.com> -----

Date: Fri, 17 Sep 2010 18:45:38 -0700
From: Vipin Mehta <Vipin.Mehta@Atheros.com>
To: "greg@kroah.com" <greg@kroah.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	Vipin Mehta <Vipin.Mehta@Atheros.com>,
	"devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
	"randy.dunlap@oracle.com" <randy.dunlap@oracle.com>
Subject: [PATCH] staging: ath6kl: Fixing the driver to use modified mmc_host
	structure

A recent change in the mmc_host structure removed the distinction
between hw and phys segments (58cb50c20fde6059f3f8db4466a1bd4d1fff999c)
Changing the driver to use the modified structure.

Reported-by: Randy Dunlap <randy.dunlap@oracle.com>
Signed-off-by: Vipin Mehta <vmehta@atheros.com>
---
 .../ath6kl/hif/sdio/linux_sdio/src/hif_scatter.c   |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/ath6kl/hif/sdio/linux_sdio/src/hif_scatter.c b/drivers/staging/ath6kl/hif/sdio/linux_sdio/src/hif_scatter.c
index 22c6c66..ee8b477 100644
--- a/drivers/staging/ath6kl/hif/sdio/linux_sdio/src/hif_scatter.c
+++ b/drivers/staging/ath6kl/hif/sdio/linux_sdio/src/hif_scatter.c
@@ -285,9 +285,9 @@ A_STATUS SetupHIFScatterSupport(HIF_DEVICE *device, HIF_DEVICE_SCATTER_SUPPORT_I
     do {
         
             /* check if host supports scatter requests and it meets our requirements */
-        if (device->func->card->host->max_hw_segs < MAX_SCATTER_ENTRIES_PER_REQ) {
+        if (device->func->card->host->max_segs < MAX_SCATTER_ENTRIES_PER_REQ) {
             AR_DEBUG_PRINTF(ATH_DEBUG_ERR,("HIF-SCATTER : host only supports scatter of : %d entries, need: %d \n",
-                    device->func->card->host->max_hw_segs, MAX_SCATTER_ENTRIES_PER_REQ));
+                    device->func->card->host->max_segs, MAX_SCATTER_ENTRIES_PER_REQ));
             status = A_ENOTSUP;
             break;    
         }
-- 
1.6.3.3


----- End forwarded message -----
