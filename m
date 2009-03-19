From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH next-20090319] wireless/p54: P54_SPI should depend on
 GENERIC_HARDIRQS
Date: Thu, 19 Mar 2009 13:33:52 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0903191331001.5130@anakin>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from juliette.telenet-ops.be ([195.130.137.74]:49611 "EHLO
	juliette.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752610AbZCSMd5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 19 Mar 2009 08:33:57 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christian Lamparter <chunkeey@web.de>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-next@vger.kernel.org, Linux Kernel Development <linux-kernel@vger.kernel.org>

m68k allmodconfig:
| drivers/net/wireless/p54/p54spi.c: In function 'p54spi_probe':
| drivers/net/wireless/p54/p54spi.c:675: error: implicit declaration of function
| 'set_irq_type'
| make[4]: *** [drivers/net/wireless/p54/p54spi.o] Error 1

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/net/wireless/p54/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/wireless/p54/Kconfig b/drivers/net/wireless/p54/Kconfig
index cfc5f41..0e344ac 100644
--- a/drivers/net/wireless/p54/Kconfig
+++ b/drivers/net/wireless/p54/Kconfig
@@ -64,7 +64,7 @@ config P54_PCI
 
 config P54_SPI
 	tristate "Prism54 SPI (stlc45xx) support"
-	depends on P54_COMMON && SPI_MASTER
+	depends on P54_COMMON && SPI_MASTER && GENERIC_HARDIRQS
 	---help---
 	  This driver is for stlc4550 or stlc4560 based wireless chips.
 	  This driver is experimental, untested and will probably only work on
-- 
1.6.2

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
