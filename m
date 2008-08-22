From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: pcmcia tree build failure
Date: Fri, 22 Aug 2008 14:52:31 +1000
Message-ID: <20080822145231.d95b789b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59468 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752097AbYHVEwh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 22 Aug 2008 00:52:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: linux-next@vger.kernel.org

Hi Dominik,

Today's linux-next build (x86_64 allmodconfig) failed like this:

ERROR: "cs_debug_level" [drivers/pcmcia/pcmcia_core.ko] undefined!

Caused by commit e84d3a8fd37981178933e706432fa9f763f8ba6a ("pcmcia: fix
CONFIG_DEBUG and dev_debug in pcmcia_core.o") ?

I added the following patch.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From e1469fe9d72730c25adb94872a7b2783e37cc090 Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 22 Aug 2008 14:50:21 +1000
Subject: [PATCH] pcmcia: fix cs_debug_level availablility

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/pcmcia/cs.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/pcmcia/cs.c b/drivers/pcmcia/cs.c
index fcc6145..48386f3 100644
--- a/drivers/pcmcia/cs.c
+++ b/drivers/pcmcia/cs.c
@@ -61,7 +61,7 @@ INT_MODULE_PARM(unreset_limit,	30);		/* unreset_check's */
 /* Access speed for attribute memory windows */
 INT_MODULE_PARM(cis_speed,	300);		/* ns */
 
-#ifdef DEBUG
+#ifdef CONFIG_PCMCIA_DEBUG
 static int pc_debug;
 
 module_param(pc_debug, int, 0644);
-- 
1.5.6.3
