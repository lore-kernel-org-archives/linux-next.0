From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ttydev tree build failure
Date: Wed, 2 Jul 2008 15:08:27 +1000
Message-ID: <20080702150827.4dd6305b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52803 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751543AbYGBFIe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 2 Jul 2008 01:08:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org

Hi Alan,

Today's linux-next build (powerpc allyesconfig) failed like this:

drivers/serial/pmac_zilog.c: In function 'pmz_receive_chars':
drivers/serial/pmac_zilog.c:245: error: 'struct uart_info' has no member named 'tty'
drivers/serial/pmac_zilog.c:250: error: 'struct uart_info' has no member named 'tty'

I applied the patch below (which builds but may, or may not, be correct).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From 31719942fd3a5caf6522261790c36b7ffa0e907c Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 2 Jul 2008 15:01:31 +1000
Subject: [PATCH] ttydev: fix pamc_zilog for tty pointer move

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/serial/pmac_zilog.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/serial/pmac_zilog.c b/drivers/serial/pmac_zilog.c
index 794bd0f..317b061 100644
--- a/drivers/serial/pmac_zilog.c
+++ b/drivers/serial/pmac_zilog.c
@@ -242,12 +242,12 @@ static struct tty_struct *pmz_receive_chars(struct uart_pmac_port *uap)
 	}
 
 	/* Sanity check, make sure the old bug is no longer happening */
-	if (uap->port.info == NULL || uap->port.info->tty == NULL) {
+	if (uap->port.info == NULL || uap->port.info->port.tty == NULL) {
 		WARN_ON(1);
 		(void)read_zsdata(uap);
 		return NULL;
 	}
-	tty = uap->port.info->tty;
+	tty = uap->port.info->port.tty;
 
 	while (1) {
 		error = 0;
-- 
1.5.6
