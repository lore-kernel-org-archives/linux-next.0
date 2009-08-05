From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] isdn: fix netjet build errors
Date: Wed, 5 Aug 2009 09:26:35 -0700
Message-ID: <20090805092635.6e6df57e.randy.dunlap@oracle.com>
References: <20090805172337.b0688db1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:25875 "EHLO
	rgminet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934321AbZHEQ0t (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 5 Aug 2009 12:26:49 -0400
In-Reply-To: <20090805172337.b0688db1.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Karsten Keil <isdn@linux-pingi.de>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, akpm <akpm@linux-foundation.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix netjet driver link errors when ISDN_I4L is not enabled:

drivers/built-in.o: In function `mode_tiger':
netjet.c:(.text+0x325dc8): undefined reference to `isdnhdlc_rcv_init'
netjet.c:(.text+0x325dd5): undefined reference to `isdnhdlc_out_init'
drivers/built-in.o: In function `fill_dma':
netjet.c:(.text+0x325fb6): undefined reference to `isdnhdlc_encode'
drivers/built-in.o: In function `read_dma':
netjet.c:(.text+0x32631a): undefined reference to `isdnhdlc_decode'
drivers/built-in.o: In function `nj_irq':
netjet.c:(.text+0x326e01): undefined reference to `isdnhdlc_encode'

or move isdnhdlc.c to some other sub-dir..

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/isdn/hardware/mISDN/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20090805.orig/drivers/isdn/hardware/mISDN/Kconfig
+++ linux-next-20090805/drivers/isdn/hardware/mISDN/Kconfig
@@ -78,6 +78,7 @@ config MISDN_NETJET
 	depends on PCI
 	select MISDN_IPAC
 	select ISDN_HDLC
+	select ISDN_I4L # so that make will recurse into sub-dir.
 	help
 	  Enable support for Traverse Technologies NETJet PCI cards.
 



---
~Randy
LPC 2009, Sept. 23-25, Portland, Oregon
http://linuxplumbersconf.org/2009/
