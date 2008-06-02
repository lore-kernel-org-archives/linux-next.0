From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: scsi build failure
Date: Mon, 2 Jun 2008 15:07:42 +1000
Message-ID: <20080602150742.14f9b0b8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57123 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751464AbYFBFHv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 Jun 2008 01:07:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: linux-next@vger.kernel.org, Sathya Prakash <sathya.prakash@lsi.com>, Kay Sievers <kay.sievers@vrfy.org>, Greg KH <greg@kroah.com>

Hi James,

Today's linux-next build (x86_64 allmodconfig) failed like this:

In file included from drivers/message/fusion/mptscsih.c:66:
drivers/message/fusion/mptbase.h:715: error: 'KOBJ_NAME_LEN' undeclared here (not in a function)
In file included from drivers/message/fusion/mptbase.c:67:
drivers/message/fusion/mptbase.h:715: error: 'KOBJ_NAME_LEN' undeclared here (not in a function)

This is caused by commit 6146eaf4fb31588ecc72ab3c52c6b1f3e7602a7c
("[SCSI] mpt fusion : Adding FAULT Reset polling work") adding a usage of
KOBJ_NAME_LEN while commit 242d02fdc8d1764117a2e5fefd9e57b84d21bf40
("driver core: remove KOBJ_NAME_LEN define") from the driver-core tree
has removed it.  The change in that latter commit is to replace all
usages with 20, so I applied the following patch.  Something like this
could be integrated into the former commit.

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

