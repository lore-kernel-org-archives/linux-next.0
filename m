From: Jaswinder Singh <jaswinder@infradead.org>
Subject: Re: linux-next: firmware tree build failure
Date: Tue, 22 Jul 2008 13:55:57 +0530
Message-ID: <1216715157.2595.12.camel@jaswinder.satnam>
References: <20080722180416.67461eae.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:37923 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751952AbYGVI1C (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 22 Jul 2008 04:27:02 -0400
In-Reply-To: <20080722180416.67461eae.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-next@vger.kernel.org

Hello Stephen,

On Tue, 2008-07-22 at 18:04 +1000, Stephen Rothwell wrote:
> Hi Dave,
> 
> Today's linux-next build (sparc32 defconfig) failed like this:
> 
> drivers/scsi/qlogicpti.c: In function `qlogicpti_load_firmware':
> drivers/scsi/qlogicpti.c:476: error: structure has no member named `sbus'
> 
> I applied the following patch.
> 
> I think we can conclude that this was never build tested.  :-(

I am sorry for this.

This patch will solve both issues :-

diff --git a/drivers/scsi/qlogicpti.c b/drivers/scsi/qlogicpti.c
index e829d43..010372f 100644
--- a/drivers/scsi/qlogicpti.c
+++ b/drivers/scsi/qlogicpti.c
@@ -475,7 +475,7 @@ static int __devinit qlogicpti_load_firmware(struct qlogicpti *qpti)
 	unsigned long flags;
 	int i, timeout;
 
-	err = request_firmware(&fw, fwname, &qpti->sbus->ofdev.dev);
+	err = request_firmware(&fw, fwname, &qpti->sdev->ofdev.dev);
 	if (err) {
 		printk(KERN_ERR "Failed to load image \"%s\" err %d\n",
 		       fwname, err);
@@ -634,7 +634,7 @@ static int __devinit qlogicpti_load_firmware(struct qlogicpti *qpti)
 out:
 	spin_unlock_irqrestore(host->host_lock, flags);
 outfirm:
-	release_firwmare(fw);
+	release_firmware(fw);
 	return err;
 }
 
