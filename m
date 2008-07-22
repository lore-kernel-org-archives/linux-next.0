From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: firmware tree build failure
Date: Tue, 22 Jul 2008 17:47:32 +1000
Message-ID: <20080722174732.bd05a41d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52357 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751243AbYGVHre (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 22 Jul 2008 03:47:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, Jaswinder Singh <jaswinder@infradead.org>

Hi Dave,

Today's linux-next build (sparc32 defconfig) failed like this:

drivers/scsi/qlogicpti.c:637: error: implicit declaration of function `release_firwmare'

I applied the following patch.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From da4d0d77ba523128e2996f96b5576fcb8d673b57 Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 22 Jul 2008 17:45:13 +1000
Subject: [PATCH] firmware: fix typo in qlogicpti.c

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/scsi/qlogicpti.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/scsi/qlogicpti.c b/drivers/scsi/qlogicpti.c
index e829d43..3e71436 100644
--- a/drivers/scsi/qlogicpti.c
+++ b/drivers/scsi/qlogicpti.c
@@ -634,7 +634,7 @@ static int __devinit qlogicpti_load_firmware(struct qlogicpti *qpti)
 out:
 	spin_unlock_irqrestore(host->host_lock, flags);
 outfirm:
-	release_firwmare(fw);
+	release_firmware(fw);
 	return err;
 }
 
-- 
1.5.6.3
