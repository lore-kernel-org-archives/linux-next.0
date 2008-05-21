From: Gabriel C <nix.or.die@googlemail.com>
Subject: linux-next: [PATCH] infiniband/hw/ipath/ipath_sdma.c , fix compiler
 warnings
Date: Wed, 21 May 2008 16:06:36 +0200
Message-ID: <48342C6C.2010502@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ik-out-1112.google.com ([66.249.90.180]:14715 "EHLO
	ik-out-1112.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760047AbYEUOGy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 21 May 2008 10:06:54 -0400
Received: by ik-out-1112.google.com with SMTP id c28so963338ika.5
        for <linux-next@vger.kernel.org>; Wed, 21 May 2008 07:06:53 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: rolandd@cisco.com
Cc: Linux Kernel list <linux-kernel@vger.kernel.org>, general@lists.openfabrics.org, sean.hefty@intel.com, hal.rosenstock@gmail.com, linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On linux-next from today , allmodconfig, I see the following warnings on 64bit:

...

  CC [M]  drivers/infiniband/hw/ipath/ipath_sdma.o
drivers/infiniband/hw/ipath/ipath_sdma.c: In function 'sdma_abort_task':
drivers/infiniband/hw/ipath/ipath_sdma.c:267: warning: passing argument 2 of 'constant_test_bit' from incompatible pointer type
drivers/infiniband/hw/ipath/ipath_sdma.c:267: warning: passing argument 2 of 'variable_test_bit' from incompatible pointer type
drivers/infiniband/hw/ipath/ipath_sdma.c:269: warning: passing argument 2 of 'constant_test_bit' from incompatible pointer type
drivers/infiniband/hw/ipath/ipath_sdma.c:269: warning: passing argument 2 of 'variable_test_bit' from incompatible pointer type
drivers/infiniband/hw/ipath/ipath_sdma.c:271: warning: passing argument 2 of 'constant_test_bit' from incompatible pointer type
drivers/infiniband/hw/ipath/ipath_sdma.c:271: warning: passing argument 2 of 'variable_test_bit' from incompatible pointer type
drivers/infiniband/hw/ipath/ipath_sdma.c:273: warning: passing argument 2 of 'constant_test_bit' from incompatible pointer type
drivers/infiniband/hw/ipath/ipath_sdma.c:273: warning: passing argument 2 of 'variable_test_bit' from incompatible pointer type
drivers/infiniband/hw/ipath/ipath_sdma.c:348: warning: format '%016llx' expects type 'long long unsigned int', but argument 3 has type 'long unsigned int'
drivers/infiniband/hw/ipath/ipath_sdma.c: In function 'ipath_restart_sdma':
drivers/infiniband/hw/ipath/ipath_sdma.c:618: warning: format '%016llx' expects type 'long long unsigned int', but argument 3 has type 'long unsigned int'

...

Signed-off-by: Gabriel C <nix.or.die@googlemail.com>

---

I see the 'format' warnings in mainline also.

 drivers/infiniband/hw/ipath/ipath_sdma.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/infiniband/hw/ipath/ipath_sdma.c b/drivers/infiniband/hw/ipath/ipath_sdma.c
index 3697449..5f80151 100644
--- a/drivers/infiniband/hw/ipath/ipath_sdma.c
+++ b/drivers/infiniband/hw/ipath/ipath_sdma.c
@@ -257,7 +257,7 @@ static void sdma_abort_task(unsigned long opaque)
 	/* everything is stopped, time to clean up and restart */
 	if (status == IPATH_SDMA_ABORT_ABORTED) {
 		struct ipath_sdma_txreq *txp, *txpnext;
-		u64 hwstatus;
+		unsigned long hwstatus;
 		int notify = 0;
 
 		hwstatus = ipath_read_kreg64(dd,
@@ -346,7 +346,7 @@ resched:
 	 */
 	if (jiffies > dd->ipath_sdma_abort_jiffies) {
 		ipath_dbg("looping with status 0x%016llx\n",
-			  dd->ipath_sdma_status);
+			  (unsigned long long)dd->ipath_sdma_status);
 		dd->ipath_sdma_abort_jiffies = jiffies + 5 * HZ;
 	}
 resched_noprint:
@@ -616,7 +616,7 @@ void ipath_restart_sdma(struct ipath_devdata *dd)
 	spin_unlock_irqrestore(&dd->ipath_sdma_lock, flags);
 	if (!needed) {
 		ipath_dbg("invalid attempt to restart SDMA, status 0x%016llx\n",
-			dd->ipath_sdma_status);
+			(unsigned long long)dd->ipath_sdma_status);
 		goto bail;
 	}
 	spin_lock_irqsave(&dd->ipath_sendctrl_lock, flags);
