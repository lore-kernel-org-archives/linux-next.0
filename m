From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH -next] power: fix lp8788-charger kconfig & build
Date: Wed, 01 May 2013 12:18:43 -0700
Message-ID: <51816A93.4070802@infradead.org>
References: <20130501183734.7ad1efca2d06e75432edabbd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:49443 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752703Ab3EATTO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 1 May 2013 15:19:14 -0400
In-Reply-To: <20130501183734.7ad1efca2d06e75432edabbd@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Milo(Woogyom) Kim" <milo.kim@ti.com>, Anton Vorontsov <cbou@mail.ru>, David Woodhouse <dwmw2@infradead.org>

From: Randy Dunlap <rdunlap@infradead.org>

Fix build errors in lp8788-charger by making it depend on IIO.
Fixes errors when CONFIG_IIO=m and CHARGER_LP8788=y.

lp8788-charger.c:(.text+0x2146b5): undefined reference to `iio_channel_get'
lp8788-charger.c:(.text+0x2146ce): undefined reference to `iio_channel_get'
lp8788-charger.c:(.text+0x214a86): undefined reference to `iio_read_channel_processed'
lp8788-charger.c:(.text+0x214b51): undefined reference to `iio_read_channel_processed'
lp8788-charger.c:(.text+0x214c30): undefined reference to `iio_read_channel_processed'
lp8788-charger.c:(.text+0x214d93): undefined reference to `iio_channel_release'
lp8788-charger.c:(.text+0x214dac): undefined reference to `iio_channel_release'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: "Milo(Woogyom) Kim" <milo.kim@ti.com>
---
 drivers/power/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20130501.orig/drivers/power/Kconfig
+++ linux-next-20130501/drivers/power/Kconfig
@@ -284,6 +284,7 @@ config CHARGER_LP8788
 	tristate "TI LP8788 charger driver"
 	depends on MFD_LP8788
 	depends on LP8788_ADC
+	depends on IIO
 	help
 	  Say Y to enable support for the LP8788 linear charger.
 
