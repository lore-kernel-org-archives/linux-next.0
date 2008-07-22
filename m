From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: firmware tree build failure
Date: Tue, 22 Jul 2008 18:04:16 +1000
Message-ID: <20080722180416.67461eae.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51347 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750869AbYGVIES (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 22 Jul 2008 04:04:18 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, Jaswinder Singh <jaswinder@infradead.org>

Hi Dave,

Today's linux-next build (sparc32 defconfig) failed like this:

drivers/scsi/qlogicpti.c: In function `qlogicpti_load_firmware':
drivers/scsi/qlogicpti.c:476: error: structure has no member named `sbus'

I applied the following patch.

I think we can conclude that this was never build tested.  :-(
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From 6c5369981d0b90c76286263dfca0e94b3987f9d8 Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 22 Jul 2008 18:02:15 +1000
Subject: [PATCH] firmware: another typo in the conversion

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/scsi/qlogicpti.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/scsi/qlogicpti.c b/drivers/scsi/qlogicpti.c
index 17df63e..1b6594e 100644
--- a/drivers/scsi/qlogicpti.c
+++ b/drivers/scsi/qlogicpti.c
@@ -473,7 +473,7 @@ static int __devinit qlogicpti_load_firmware(struct qlogicpti *qpti)
 	unsigned long flags;
 	int i, timeout;
 
-	err = request_firmware(&fw, fwname, &qpti->sbus->ofdev.dev);
+	err = request_firmware(&fw, fwname, &qpti->sdev->ofdev.dev);
 	if (err) {
 		printk(KERN_ERR "Failed to load image \"%s\" err %d\n",
 		       fwname, err);
-- 
1.5.6.3
