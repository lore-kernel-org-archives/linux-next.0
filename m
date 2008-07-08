From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next:  ide/sparc build failure
Date: Tue, 8 Jul 2008 22:48:03 +1000
Message-ID: <20080708224803.8ce5aa56.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37001 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759178AbYGHMsF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Jul 2008 08:48:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: linux-next@vger.kernel.org, David Miller <davem@davemloft.net>

Hi Bart,

Today's linux-next build (sparc allmodconfig) failed like this:

drivers/ide/setup-pci.c:203: error: `DMA_32BIT_MASK' undeclared (first use in this function)
drivers/ide/setup-pci.c:203: error: (Each undeclared identifier is reported only once
drivers/ide/setup-pci.c:203: error: for each function it appears in.)

Caused by commit 711304186fe494bee4b9c94b3c195b167b2d4b87 ("ide: remove
needless includes from setup-pci.c").  Seems like it was overdone.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

diff --git a/drivers/ide/setup-pci.c b/drivers/ide/setup-pci.c
index ec5cbbe..b15cad5 100644
--- a/drivers/ide/setup-pci.c
+++ b/drivers/ide/setup-pci.c
@@ -12,6 +12,7 @@
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/ide.h>
+#include <linux/dma-mapping.h>
 
 #include <asm/io.h>
 

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

P.S. untested, but pretty obvious.
