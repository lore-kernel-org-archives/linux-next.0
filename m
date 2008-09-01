From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: sparc/firmware build failure
Date: Mon, 1 Sep 2008 19:10:19 +1000
Message-ID: <20080901191019.5df57434.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37662 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750840AbYIAJKY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Sep 2008 05:10:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>, David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Jaswinder Singh <jaswinder@infradead.org>

Hi all,

Today's linux-next build (sparc defconfig) failed like this:

drivers/scsi/qlogicpti.c:478: error: structure has no member named `sdev'

Caused by a combination of commits
5dc2536bb8d8adb5fdfbe76cd6fdcdf9de3f40f8 ("qlogicpti: Convert to pure OF
driver") from the sparc tree and 229d9a03273684dc2175821be4104dbaa52f3ce0
("qlogicpti: use request_firmware") from the firmware tree.

I have applied the following patch.  I will carry this patch unless a
better solution comes along.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 1 Sep 2008 18:56:52 +1000
Subject: [PATCH] sparc: qlogicpti fallout from sbus removal

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/scsi/qlogicpti.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/scsi/qlogicpti.c b/drivers/scsi/qlogicpti.c
index 3d59655..fb9c875 100644
--- a/drivers/scsi/qlogicpti.c
+++ b/drivers/scsi/qlogicpti.c
@@ -475,7 +475,7 @@ static int __devinit qlogicpti_load_firmware(struct qlogicpti *qpti)
 	unsigned long flags;
 	int i, timeout;
 
-	err = request_firmware(&fw, fwname, &qpti->sdev->ofdev.dev);
+	err = request_firmware(&fw, fwname, &qpti->op->dev);
 	if (err) {
 		printk(KERN_ERR "Failed to load image \"%s\" err %d\n",
 		       fwname, err);
-- 
1.5.6.5
