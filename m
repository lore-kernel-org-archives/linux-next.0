From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH/next] mac8390: Fix build breakage
Date: Sat, 9 Jan 2010 14:21:28 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1001091420080.21892@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gerard.telenet-ops.be ([195.130.132.48]:55781 "EHLO
	gerard.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752561Ab0AINVa (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 9 Jan 2010 08:21:30 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Joe Perches <joe@perches.com>, "David S. Miller" <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, netdev@vger.kernel.org

commit 18c0019102228875cb0f6f252dad5148491e96b2 ("drivers/net/mac8390.c:
Convert printk(KERN_<level> to pr_<level>(") broke the build:

| drivers/net/mac8390.c:306: error: expected ')' before 'version'

as "version" is not a string literal, but a variable.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
http://kisskb.ellerman.id.au/kisskb/buildresult/1985016/

 drivers/net/mac8390.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/mac8390.c b/drivers/net/mac8390.c
index c70bd68..a876867 100644
--- a/drivers/net/mac8390.c
+++ b/drivers/net/mac8390.c
@@ -303,7 +303,7 @@ static bool __init mac8390_init(struct net_device *dev, struct nubus_dev *ndev,
 	int offset;
 	volatile unsigned short *i;
 
-	printk_once(KERN_INFO pr_fmt(version));
+	printk_once(KERN_INFO pr_fmt("%s"), version);
 
 	dev->irq = SLOT2IRQ(ndev->board->slot);
 	/* This is getting to be a habit */
-- 
1.6.0.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
