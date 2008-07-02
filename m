From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ttydev tree build failure
Date: Wed, 2 Jul 2008 15:30:11 +1000
Message-ID: <20080702153011.c9cc0c4a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49079 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753793AbYGBFaO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 2 Jul 2008 01:30:14 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org

Hi Alan,

Today's linux-next build (sparc defconfig) failed like this:

drivers/serial/sunzilog.c: In function `sunzilog_receive_chars':
drivers/serial/sunzilog.c:332: error: structure has no member named `tty'
drivers/serial/sunzilog.c:333: error: structure has no member named `tty'

I applied the patch below ...

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From 0e9176265b70d21292f7566417d3310d0fe37019 Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 2 Jul 2008 15:23:01 +1000
Subject: [PATCH] ttydev: sparc32 fix for tty move

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/serial/sunzilog.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/serial/sunzilog.c b/drivers/serial/sunzilog.c
index 7e9fa5e..ea385ba 100644
--- a/drivers/serial/sunzilog.c
+++ b/drivers/serial/sunzilog.c
@@ -329,8 +329,8 @@ sunzilog_receive_chars(struct uart_sunzilog_port *up,
 
 	tty = NULL;
 	if (up->port.info != NULL &&		/* Unopened serial console */
-	    up->port.info->tty != NULL)		/* Keyboard || mouse */
-		tty = up->port.info->tty;
+	    up->port.info->port.tty != NULL)		/* Keyboard || mouse */
+		tty = up->port.info->port.tty;
 
 	for (;;) {
 
-- 
1.5.6
