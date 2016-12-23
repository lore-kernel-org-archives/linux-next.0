From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the scsi tree
Date: Fri, 23 Dec 2016 11:45:13 +1100
Message-ID: <20161223114513.101402e4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Manish Rangankar <manish.rangankar@cavium.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Nilesh Javali <nilesh.javali@cavium.com>, Adheer Chandravanshi <adheer.chandravanshi@qlogic.com>, Chad Dupuis <chad.dupuis@cavium.com>, Saurav Kashyap <saurav.kashyap@cavium.com>, Arun Easi <arun.easi@cavium.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
List-Id: linux-next.vger.kernel.org

Hi James,

After merging the scsi tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/scsi/qedi/qedi_main.c: In function 'qedi_init':
drivers/scsi/qedi/qedi_main.c:2073:2: error: implicit declaration of function 'register_hotcpu_notifier' [-Werror=implicit-function-declaration]
  register_hotcpu_notifier(&qedi_cpu_notifier);
  ^
drivers/scsi/qedi/qedi_main.c: In function 'qedi_cleanup':
drivers/scsi/qedi/qedi_main.c:2113:2: error: implicit declaration of function 'unregister_hotcpu_notifier' [-Werror=implicit-function-declaration]
  unregister_hotcpu_notifier(&qedi_cpu_notifier);
  ^

Caused by commit

  ace7f46ba5fd ("scsi: qedi: Add QLogic FastLinQ offload iSCSI driver framework.")

Interacting with commit

  8e38db753d95 ("cpu/hotplug: Remove obsolete cpu hotplug register/unregister functions")

from the tip tree.

I have disabled that driver for now:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 23 Dec 2016 11:39:41 +1100
Subject: [PATCH] scsi: disable the QEDI driver for now

until it can be converted to cope with the removal of
register_hotcpu_notifier.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/scsi/qedi/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/scsi/qedi/Kconfig b/drivers/scsi/qedi/Kconfig
index 23ca8a274586..8261f0abd807 100644
--- a/drivers/scsi/qedi/Kconfig
+++ b/drivers/scsi/qedi/Kconfig
@@ -2,6 +2,7 @@ config QEDI
 	tristate "QLogic QEDI 25/40/100Gb iSCSI Initiator Driver Support"
 	depends on PCI && SCSI
 	depends on QED
+	depends on BROKEN
 	select SCSI_ISCSI_ATTRS
 	select QED_LL2
 	select QED_ISCSI
-- 
2.10.2

-- 
Cheers,
Stephen Rothwell
