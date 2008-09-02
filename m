From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ttydev tree build failure
Date: Tue, 2 Sep 2008 17:23:22 +1000
Message-ID: <20080902172322.15c465e7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40991 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752002AbYIBHXb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 2 Sep 2008 03:23:31 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org

Hi Alan,

Today's linux-next build (x86_64 allmodconfig) failed like this:

/drivers/char/tty_ioctl.c: In function 'change_termios':
drivers/isdn/capi/capi.c:1234: error: implicit declaration of function 'n_tty_ioctl'
drivers/isdn/gigaset/ser-gigaset.c: In function 'gigaset_tty_ioctl':
drivers/isdn/gigaset/ser-gigaset.c:648: error: implicit declaration of function 'n_tty_ioctl'

Introduced by commit 686b5e4aea05a80e370dc931b7f4a8d03c80da54
("tty-move-canon-specials").  I added the following patch (which may not
be correct).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From 90b2237399675ce920b1620426a6a231670574f3 Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 2 Sep 2008 17:21:47 +1000
Subject: [PATCH] ttydev: fallout from tty-move-canon-specials

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/isdn/capi/capi.c           |    2 +-
 drivers/isdn/gigaset/ser-gigaset.c |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/isdn/capi/capi.c b/drivers/isdn/capi/capi.c
index 3b29c04..1b5bf87 100644
--- a/drivers/isdn/capi/capi.c
+++ b/drivers/isdn/capi/capi.c
@@ -1231,7 +1231,7 @@ static int capinc_tty_ioctl(struct tty_struct *tty, struct file * file,
 	int error = 0;
 	switch (cmd) {
 	default:
-		error = n_tty_ioctl (tty, file, cmd, arg);
+		error = n_tty_ioctl_helper(tty, file, cmd, arg);
 		break;
 	}
 	return error;
diff --git a/drivers/isdn/gigaset/ser-gigaset.c b/drivers/isdn/gigaset/ser-gigaset.c
index 5e89fa1..cc4f4e4 100644
--- a/drivers/isdn/gigaset/ser-gigaset.c
+++ b/drivers/isdn/gigaset/ser-gigaset.c
@@ -645,7 +645,7 @@ gigaset_tty_ioctl(struct tty_struct *tty, struct file *file,
 	case TCGETS:
 	case TCGETA:
 		/* pass through to underlying serial device */
-		rc = n_tty_ioctl(tty, file, cmd, arg);
+		rc = n_tty_ioctl_helper(tty, file, cmd, arg);
 		break;
 
 	case TCFLSH:
@@ -660,7 +660,7 @@ gigaset_tty_ioctl(struct tty_struct *tty, struct file *file,
 			break;
 		}
 		/* flush the serial port's buffer */
-		rc = n_tty_ioctl(tty, file, cmd, arg);
+		rc = n_tty_ioctl_helper(tty, file, cmd, arg);
 		break;
 
 	case FIONREAD:
-- 
1.5.6.5
