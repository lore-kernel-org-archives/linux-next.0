From: Michael Buesch <mb-fseUSCV1ubazQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH] ssb: Include dma-mapping.h
Date: Wed, 9 Jul 2008 15:48:45 +0200
Message-ID: <200807091548.45761.mb@bu3sch.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Linville <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

ssb.h implements DMA mapping functions, so it should
include dma-mapping.h. This fixes compile failures on certain architectures.

Reported-by: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Signed-off-by: Michael Buesch <mb-fseUSCV1ubazQB+pC5nmwQ@public.gmane.org>

---

John, this is a bugfix for 2.6.27


Index: wireless-testing/include/linux/ssb/ssb.h
===================================================================
--- wireless-testing.orig/include/linux/ssb/ssb.h	2008-07-01 23:13:18.000000000 +0200
+++ wireless-testing/include/linux/ssb/ssb.h	2008-07-09 15:43:51.000000000 +0200
@@ -7,6 +7,7 @@
 #include <linux/spinlock.h>
 #include <linux/pci.h>
 #include <linux/mod_devicetable.h>
+#include <linux/dma-mapping.h>
 
 #include <linux/ssb/ssb_regs.h>
 

-- 
Greetings Michael.
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
