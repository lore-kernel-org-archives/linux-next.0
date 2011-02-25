From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: [PATCH] tty: phase out of ioctl file pointer for tty3270 as well
Date: Fri, 25 Feb 2011 14:28:30 +0100
Message-ID: <20110225132830.GC7469@osiris.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate5.uk.ibm.com ([194.196.100.165]:52451 "EHLO
	mtagate5.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755669Ab1BYN2d (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 25 Feb 2011 08:28:33 -0500
Received: from d06nrmr1707.portsmouth.uk.ibm.com (d06nrmr1707.portsmouth.uk.ibm.com [9.149.39.225])
	by mtagate5.uk.ibm.com (8.13.1/8.13.1) with ESMTP id p1PDSVYm008954
	for <linux-next@vger.kernel.org>; Fri, 25 Feb 2011 13:28:31 GMT
Received: from d06av03.portsmouth.uk.ibm.com (d06av03.portsmouth.uk.ibm.com [9.149.37.213])
	by d06nrmr1707.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id p1PDSfJb1802448
	for <linux-next@vger.kernel.org>; Fri, 25 Feb 2011 13:28:41 GMT
Received: from d06av03.portsmouth.uk.ibm.com (localhost.localdomain [127.0.0.1])
	by d06av03.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id p1PDSUaV019103
	for <linux-next@vger.kernel.org>; Fri, 25 Feb 2011 06:28:31 -0700
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@linux.intel.com>, Greg Kroah-Hartman <gregkh@suse.de>
Cc: linux-next@vger.kernel.org

From: Heiko Carstens <heiko.carstens@de.ibm.com>

The patch "tty: now phase out the ioctl file pointer for good" missed
the tty3270 driver. This is the missing piece.

Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
---

Patch is against linux-next.

 drivers/s390/char/keyboard.c |    4 +---
 drivers/s390/char/keyboard.h |    2 +-
 drivers/s390/char/tty3270.c  |   14 ++++++--------
 3 files changed, 8 insertions(+), 12 deletions(-)

--- a/drivers/s390/char/keyboard.c
+++ b/drivers/s390/char/keyboard.c
@@ -455,9 +455,7 @@ do_kdgkb_ioctl(struct kbd_data *kbd, str
 	return 0;
 }
 
-int
-kbd_ioctl(struct kbd_data *kbd, struct file *file,
-	  unsigned int cmd, unsigned long arg)
+int kbd_ioctl(struct kbd_data *kbd, unsigned int cmd, unsigned long arg)
 {
 	void __user *argp;
 	int ct, perm;
--- a/drivers/s390/char/keyboard.h
+++ b/drivers/s390/char/keyboard.h
@@ -36,7 +36,7 @@ void kbd_free(struct kbd_data *);
 void kbd_ascebc(struct kbd_data *, unsigned char *);
 
 void kbd_keycode(struct kbd_data *, unsigned int);
-int kbd_ioctl(struct kbd_data *, struct file *, unsigned int, unsigned long);
+int kbd_ioctl(struct kbd_data *, unsigned int, unsigned long);
 
 /*
  * Helper Functions.
--- a/drivers/s390/char/tty3270.c
+++ b/drivers/s390/char/tty3270.c
@@ -1718,9 +1718,8 @@ tty3270_wait_until_sent(struct tty_struc
 {
 }
 
-static int
-tty3270_ioctl(struct tty_struct *tty, struct file *file,
-	      unsigned int cmd, unsigned long arg)
+static int tty3270_ioctl(struct tty_struct *tty, unsigned int cmd,
+			 unsigned long arg)
 {
 	struct tty3270 *tp;
 
@@ -1729,13 +1728,12 @@ tty3270_ioctl(struct tty_struct *tty, st
 		return -ENODEV;
 	if (tty->flags & (1 << TTY_IO_ERROR))
 		return -EIO;
-	return kbd_ioctl(tp->kbd, file, cmd, arg);
+	return kbd_ioctl(tp->kbd, cmd, arg);
 }
 
 #ifdef CONFIG_COMPAT
-static long
-tty3270_compat_ioctl(struct tty_struct *tty, struct file *file,
-	      unsigned int cmd, unsigned long arg)
+static long tty3270_compat_ioctl(struct tty_struct *tty,
+				 unsigned int cmd, unsigned long arg)
 {
 	struct tty3270 *tp;
 
@@ -1744,7 +1742,7 @@ tty3270_compat_ioctl(struct tty_struct *
 		return -ENODEV;
 	if (tty->flags & (1 << TTY_IO_ERROR))
 		return -EIO;
-	return kbd_ioctl(tp->kbd, file, cmd, (unsigned long)compat_ptr(arg));
+	return kbd_ioctl(tp->kbd, cmd, (unsigned long)compat_ptr(arg));
 }
 #endif
 
