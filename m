From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ttydev tree
Date: Fri, 22 Aug 2008 15:51:29 +1000
Message-ID: <20080822155129.ac486353.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33120 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752669AbYHVFvk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 22 Aug 2008 01:51:40 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, Greg KH <greg@kroah.com>

Hi Alan,

Today's linux-next merge of the ttydev tree got a conflict in
drivers/char/tty_io.c between commit
e9b4b8816d7516318a3472f600ad9734e300c7bc ("device create: char: convert
device_create_drvdata to device_create") from the driver-core tree and
commit 05d425154eb1c1c053be5e54dcc4b1db36b15d3b("tty-move-special-cases")
from the ttydev tree.

The former renamed a function used in the code that the latter moved.  I
fixed it up (see below).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --git a/drivers/char/pty.c b/drivers/char/pty.c
index af2ab67..328e8ac 100644
--- a/drivers/char/pty.c
+++ b/drivers/char/pty.c
@@ -535,7 +535,7 @@ static void __init unix98_pty_init(void)
 	if (cdev_add(&ptmx_cdev, MKDEV(TTYAUX_MAJOR, 2), 1) ||
 	    register_chrdev_region(MKDEV(TTYAUX_MAJOR, 2), 1, "/dev/ptmx") < 0)
 		panic("Couldn't register /dev/ptmx driver\n");
-	device_create_drvdata(tty_class, NULL, MKDEV(TTYAUX_MAJOR, 2), NULL, "ptmx");
+	device_create(tty_class, NULL, MKDEV(TTYAUX_MAJOR, 2), NULL, "ptmx");
 }
 
 #else
diff --git a/drivers/char/vt.c b/drivers/char/vt.c
index 06a840d..2ec7bfe 100644
--- a/drivers/char/vt.c
+++ b/drivers/char/vt.c
@@ -2931,7 +2931,7 @@ int __init vty_init(const struct file_operations *console_fops)
 	if (cdev_add(&vc0_cdev, MKDEV(TTY_MAJOR, 0), 1) ||
 	    register_chrdev_region(MKDEV(TTY_MAJOR, 0), 1, "/dev/vc/0") < 0)
 		panic("Couldn't register /dev/tty0 driver\n");
-	device_create_drvdata(tty_class, NULL, MKDEV(TTY_MAJOR, 0), NULL, "tty0");
+	device_create(tty_class, NULL, MKDEV(TTY_MAJOR, 0), NULL, "tty0");
 
 	vcs_init();
 
