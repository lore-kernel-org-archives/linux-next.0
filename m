From: Jonathan Corbet <corbet@lwn.net>
Subject: Re: linux-next: manual merge of pcmcia tree
Date: Thu, 19 Jun 2008 14:34:41 -0600
Message-ID: <20080619143441.3ab03fcf@bike.lwn.net>
References: <20080616175126.e461b22b.sfr@canb.auug.org.au>
	<20080616081258.GA18142@isilmar.linta.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from vena.lwn.net ([206.168.112.25]:52166 "EHLO vena.lwn.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750892AbYFSUly (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 Jun 2008 16:41:54 -0400
In-Reply-To: <20080616081258.GA18142@isilmar.linta.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

[Finally beginning to catch up with life...]

On Mon, 16 Jun 2008 10:12:58 +0200
Dominik Brodowski <linux@dominikbrodowski.net> wrote:

> @Alan,@Jonathan: since this is the same patch, just a different title
> -- shall it be removed from one of our trees?

If you want to have it
in your tree, that's fine with me; the only dependency is that it needs
to be applied *before* the removal of BKL protection to cdev open()
functions or there will be a range of commits over which things are
potentially unsafe - not that I think it would burn even a single
tester.

Here's the patch; if you take it let me know and I'll remove it from
the bkl-removal tree.

Thanks,

jon

--
cm40x0: cdev lock_kernel() pushdown

Signed-off-by: Jonathan Corbet <corbet@lwn.net>

diff --git a/drivers/char/pcmcia/cm4000_cs.c b/drivers/char/pcmcia/cm4000_cs.c
index 4a933d4..350f596 100644
--- a/drivers/char/pcmcia/cm4000_cs.c
+++ b/drivers/char/pcmcia/cm4000_cs.c
@@ -32,6 +32,7 @@
 #include <linux/fs.h>
 #include <linux/delay.h>
 #include <linux/bitrev.h>
+#include <linux/smp_lock.h>
 #include <asm/uaccess.h>
 #include <asm/io.h>
 
@@ -1631,16 +1632,22 @@ static int cmm_open(struct inode *inode, struct file *filp)
 	struct cm4000_dev *dev;
 	struct pcmcia_device *link;
 	int minor = iminor(inode);
+	int ret;
 
 	if (minor >= CM4000_MAX_DEV)
 		return -ENODEV;
 
+	lock_kernel();
 	link = dev_table[minor];
-	if (link == NULL || !pcmcia_dev_present(link))
-		return -ENODEV;
+	if (link == NULL || !pcmcia_dev_present(link)) {
+		ret = -ENODEV;
+		goto out;
+	}
 
-	if (link->open)
-		return -EBUSY;
+	if (link->open) {
+		ret = -EBUSY;
+		goto out;
+	}
 
 	dev = link->priv;
 	filp->private_data = dev;
@@ -1660,8 +1667,10 @@ static int cmm_open(struct inode *inode, struct file *filp)
 	 * vaild = block until valid (or card
 	 * inserted)
 	 */
-	if (filp->f_flags & O_NONBLOCK)
-		return -EAGAIN;
+	if (filp->f_flags & O_NONBLOCK) {
+		ret = -EAGAIN;
+		goto out;
+	}
 
 	dev->mdelay = T_50MSEC;
 
@@ -1671,7 +1680,10 @@ static int cmm_open(struct inode *inode, struct file *filp)
 	link->open = 1;		/* only one open per device */
 
 	DEBUGP(2, dev, "<- cmm_open\n");
-	return nonseekable_open(inode, filp);
+	ret = nonseekable_open(inode, filp);
+out:
+	unlock_kernel();
+	return ret;
 }
 
 static int cmm_close(struct inode *inode, struct file *filp)
diff --git a/drivers/char/pcmcia/cm4040_cs.c b/drivers/char/pcmcia/cm4040_cs.c
index 035084c..6181f8a 100644
--- a/drivers/char/pcmcia/cm4040_cs.c
+++ b/drivers/char/pcmcia/cm4040_cs.c
@@ -26,6 +26,7 @@
 #include <linux/fs.h>
 #include <linux/delay.h>
 #include <linux/poll.h>
+#include <linux/smp_lock.h>
 #include <linux/wait.h>
 #include <asm/uaccess.h>
 #include <asm/io.h>
@@ -448,23 +449,30 @@ static int cm4040_open(struct inode *inode, struct file *filp)
 	struct reader_dev *dev;
 	struct pcmcia_device *link;
 	int minor = iminor(inode);
+	int ret;
 
 	if (minor >= CM_MAX_DEV)
 		return -ENODEV;
 
+	lock_kernel();
 	link = dev_table[minor];
-	if (link == NULL || !pcmcia_dev_present(link))
-		return -ENODEV;
+	if (link == NULL || !pcmcia_dev_present(link)) {
+		ret = -ENODEV;
+		goto out;
+	}
 
-	if (link->open)
-		return -EBUSY;
+	if (link->open) {
+		ret = -EBUSY;
+		goto out;
+	}
 
 	dev = link->priv;
 	filp->private_data = dev;
 
 	if (filp->f_flags & O_NONBLOCK) {
 		DEBUGP(4, dev, "filep->f_flags O_NONBLOCK set\n");
-		return -EAGAIN;
+		ret = -EAGAIN;
+		goto out;
 	}
 
 	link->open = 1;
@@ -473,7 +481,10 @@ static int cm4040_open(struct inode *inode, struct file *filp)
 	mod_timer(&dev->poll_timer, jiffies + POLL_PERIOD);
 
 	DEBUGP(2, dev, "<- cm4040_open (successfully)\n");
-	return nonseekable_open(inode, filp);
+	ret = nonseekable_open(inode, filp);
+out:
+	unlock_kernel();
+	return ret;
 }
 
 static int cm4040_close(struct inode *inode, struct file *filp)
-- 
1.5.4.5

