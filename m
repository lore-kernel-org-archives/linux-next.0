From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next:  tree build failure
Date: Mon, 27 Jul 2009 17:53:28 +1000
Message-ID: <20090727175328.fe3197a5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48772 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754091AbZG0Hxc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 27 Jul 2009 03:53:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Karsten Keil <keil@b1-systems.de>

Hi Dave,

Today's linux-next build (powerpc allyesconfig) failed like this:

drivers/isdn/hisax/built-in.o: In function `setup_w6692':
(.opd+0x4a28): multiple definition of `setup_w6692'
drivers/isdn/hardware/built-in.o:(.opd+0x4e90): first defined here
drivers/isdn/hisax/built-in.o: In function `.setup_w6692':
(.devinit.text+0x5b14): multiple definition of `.setup_w6692'
drivers/isdn/hardware/built-in.o:(.text+0x8b75c): first defined here

Caused by commit 707b2ce6c1f4f1261788f2ff09ad82c35e0e6240
("mISDN: Add driver for Winbond cards").

setup_w6692 appears in drivers/isdn/hardware/mISDN/w6692.c and
drivers/isdn/hisax/w6692.c.  I applied the patch below for today (this
may not be correct).

[I also get these warnings:
drivers/isdn/hardware/mISDN/w6692.c:533: warning: 'setvolume' defined but not used
drivers/isdn/hardware/mISDN/w6692.c:560: warning: 'enable_pots' defined but not used
]
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 27 Jul 2009 17:45:36 +1000
Subject: [PATCH] net: fix multiple definitions of setup_w6692

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/isdn/hardware/mISDN/w6692.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/isdn/hardware/mISDN/w6692.c b/drivers/isdn/hardware/mISDN/w6692.c
index 1b9008f..d3f1077 100644
--- a/drivers/isdn/hardware/mISDN/w6692.c
+++ b/drivers/isdn/hardware/mISDN/w6692.c
@@ -1234,7 +1234,7 @@ w6692_dctrl(struct mISDNchannel *ch, u32 cmd, void *arg)
 	return err;
 }
 
-int
+static int
 setup_w6692(struct w6692_hw *card)
 {
 	u32	val;
-- 
1.6.3.3
