From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: driver-core build failure
Date: Thu, 17 Jul 2008 10:36:11 +1000
Message-ID: <20080717103611.79b1cecd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40348 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752883AbYGQAgO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Jul 2008 20:36:14 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, James Bottomley <James.Bottomley@HansenPartnership.com>

Hi Greg,

I have been carrying the patch below and applying it after the scsi tree
merge for some time now.  Now that the scsi tree has been merged into
Linus' tree, can you add this to the driver-core tree, please?
Preferably merged with the patch that removes KOBJ_NAME_LEN.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From 0975add46554364e3943e56b8e6a4800e38bb9e9 Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 2 Jun 2008 15:06:02 +1000
Subject: [PATCH] scsi: fix fallout from KOBJ_NAME_LEN removal

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/message/fusion/mptbase.c |    2 +-
 drivers/message/fusion/mptbase.h |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/message/fusion/mptbase.c b/drivers/message/fusion/mptbase.c
index d18a707..a758110 100644
--- a/drivers/message/fusion/mptbase.c
+++ b/drivers/message/fusion/mptbase.c
@@ -1670,7 +1670,7 @@ mpt_attach(struct pci_dev *pdev, const struct pci_device_id *id)
 	INIT_DELAYED_WORK(&ioc->fault_reset_work, mpt_fault_reset_work);
 	spin_lock_init(&ioc->fault_reset_work_lock);
 
-	snprintf(ioc->reset_work_q_name, KOBJ_NAME_LEN, "mpt_poll_%d", ioc->id);
+	snprintf(ioc->reset_work_q_name, sizeof(ioc->reset_work_q_name), "mpt_poll_%d", ioc->id);
 	ioc->reset_work_q =
 		create_singlethread_workqueue(ioc->reset_work_q_name);
 	if (!ioc->reset_work_q) {
diff --git a/drivers/message/fusion/mptbase.h b/drivers/message/fusion/mptbase.h
index 94ab8f1..dff048c 100644
--- a/drivers/message/fusion/mptbase.h
+++ b/drivers/message/fusion/mptbase.h
@@ -712,7 +712,7 @@ typedef struct _MPT_ADAPTER
 	struct scsi_cmnd	**ScsiLookup;
 	spinlock_t		  scsi_lookup_lock;
 
-	char			 reset_work_q_name[KOBJ_NAME_LEN];
+	char			 reset_work_q_name[20];
 	struct workqueue_struct *reset_work_q;
 	struct delayed_work	 fault_reset_work;
 	spinlock_t		 fault_reset_work_lock;
-- 
1.5.5.3
