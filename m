From: Kenji Kaneshige <kaneshige.kenji@jp.fujitsu.com>
Subject: [PATCH 3/4] Updated version of 2b26196717939221ccc06073780b73d0f4ee3203
Date: Wed, 28 May 2008 14:59:44 +0900
Message-ID: <483CF4D0.20202@jp.fujitsu.com>
References: <20080528122758.70c4bec9.sfr@canb.auug.org.au> <483CC873.5000300@jp.fujitsu.com> <200805272108.32974.jbarnes@virtuousgeek.org> <483CF356.1010807@jp.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fgwmail6.fujitsu.co.jp ([192.51.44.36]:34899 "EHLO
	fgwmail6.fujitsu.co.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753265AbYE1GAk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 28 May 2008 02:00:40 -0400
In-Reply-To: <483CF356.1010807@jp.fujitsu.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

Since we need to wait for command completion for muximum 1sec, waiting
command should not be interrupted by a signal.

Signed-off-by: Kenji Kaneshige <kaneshige.kenji@jp.fujitsu.com>

---
 drivers/pci/hotplug/pciehp_hpc.c |   16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

Index: linux-2.6.26-rc4/drivers/pci/hotplug/pciehp_hpc.c
===================================================================
--- linux-2.6.26-rc4.orig/drivers/pci/hotplug/pciehp_hpc.c
+++ linux-2.6.26-rc4/drivers/pci/hotplug/pciehp_hpc.c
@@ -268,9 +268,8 @@ completed:
 	return timeout;
 }
 
-static inline int pcie_wait_cmd(struct controller *ctrl, int poll)
+static inline void pcie_wait_cmd(struct controller *ctrl, int poll)
 {
-	int retval = 0;
 	unsigned int msecs = pciehp_poll_mode ? 2500 : 1000;
 	unsigned long timeout = msecs_to_jiffies(msecs);
 	int rc;
@@ -278,16 +277,9 @@ static inline int pcie_wait_cmd(struct c
 	if (poll)
 		rc = pcie_poll_cmd(ctrl);
 	else
-		rc = wait_event_interruptible_timeout(ctrl->queue,
-					      !ctrl->cmd_busy, timeout);
+		rc = wait_event_timeout(ctrl->queue, !ctrl->cmd_busy, timeout);
 	if (!rc)
 		dbg("Command not completed in 1000 msec\n");
-	else if (rc < 0) {
-		retval = -EINTR;
-		info("Command was interrupted by a signal\n");
-	}
-
-	return retval;
 }
 
 /**
@@ -365,7 +357,7 @@ static int pcie_write_cmd(struct control
 		if (!(slot_ctrl & HP_INTR_ENABLE) ||
 		    !(slot_ctrl & CMD_CMPL_INTR_ENABLE))
 			poll = 1;
-                retval = pcie_wait_cmd(ctrl, poll);
+                pcie_wait_cmd(ctrl, poll);
 	}
  out:
 	mutex_unlock(&ctrl->ctrl_lock);
@@ -797,7 +789,7 @@ static irqreturn_t pcie_isr(int irq, voi
 	if (intr_loc & CMD_COMPLETED) {
 		ctrl->cmd_busy = 0;
 		smp_mb();
-		wake_up_interruptible(&ctrl->queue);
+		wake_up(&ctrl->queue);
 	}
 
 	if (!(intr_loc & ~CMD_COMPLETED))


