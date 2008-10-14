From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: origin tree build failure
Date: Wed, 15 Oct 2008 09:59:16 +1100
Message-ID: <20081015095916.f30c0979.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47988 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751388AbYJNW7Z (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Oct 2008 18:59:25 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, LKML <linux-kernel@vger.kernel.org>, Liam Girdwood <lrg@slimlogic.co.uk>

Hi Linus, Mark,

Today's linux-next build (just Linus' tree) (x86_64 allmodconfig) failed
like this:

drivers/mfd/wm8350-core.c: In function 'wm8350_device_init':
drivers/mfd/wm8350-core.c:1220: error: 'NO_IRQ' undeclared (first use in this function)

Caused by commit ebccec0fa4e35dff0c18663a492a65f4dc6cad7a ("mfd: Add
WM8350 interrupt support").

I applied the following (probably incorrect) patch.  Maybe this driver
needs to be restricted to certain architectures?  (NO_IRQ appears to only
be defined for arm, blackfin, powerpc, mn10300 and parisc)

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 15 Oct 2008 09:57:33 +1100
Subject: [PATCH] wm8350-core needs NO_IRQ

and that is not defined for most architectures.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/mfd/wm8350-core.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/mfd/wm8350-core.c b/drivers/mfd/wm8350-core.c
index 25a7a5d..6e3a509 100644
--- a/drivers/mfd/wm8350-core.c
+++ b/drivers/mfd/wm8350-core.c
@@ -1156,6 +1156,10 @@ static void wm8350_client_dev_register(struct wm8350 *wm8350,
 	}
 }
 
+#ifndef NO_IRQ
+#define NO_IRQ	0
+#endif
+
 int wm8350_device_init(struct wm8350 *wm8350, int irq,
 		       struct wm8350_platform_data *pdata)
 {
-- 
1.5.6.5
