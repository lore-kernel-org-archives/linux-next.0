From: Timur Tabi <timur@freescale.com>
Subject: [PATCH] tty/powerpc: fix build break with ehv_bytechan.c on allyesconfig
Date: Thu, 25 Aug 2011 11:20:45 -0500
Message-ID: <1314289245-14946-1-git-send-email-timur@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]:26452 "EHLO
	TX2EHSOBE004.bigfish.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753084Ab1HYQUt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 25 Aug 2011 12:20:49 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: greg@kroah.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org

The Kconfig for the ePAPR hypervisor byte channel driver has a "depends on PPC",
which means it would compile on all PowerPC platforms, even though it's
only been tested on Freescale platforms.  Change the Kconfig to depend on
FSL_SOC instead.

Signed-off-by: Timur Tabi <timur@freescale.com>
---
 drivers/tty/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/tty/Kconfig b/drivers/tty/Kconfig
index f1ea59b..535af0a 100644
--- a/drivers/tty/Kconfig
+++ b/drivers/tty/Kconfig
@@ -353,7 +353,7 @@ config TRACE_SINK
 
 config PPC_EPAPR_HV_BYTECHAN
 	tristate "ePAPR hypervisor byte channel driver"
-	depends on PPC
+	depends on FSL_SOC
 	help
 	  This driver creates /dev entries for each ePAPR hypervisor byte
 	  channel, thereby allowing applications to communicate with byte
-- 
1.7.3.4
