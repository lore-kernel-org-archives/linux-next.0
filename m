From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] staging: solo6010 depends on I2C
Date: Thu, 9 Dec 2010 09:38:34 -0800
Message-ID: <20101209093834.8494cfbf.randy.dunlap@oracle.com>
References: <20101209154148.ca4ba4e0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:30405 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754577Ab0LIRiy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 9 Dec 2010 12:38:54 -0500
In-Reply-To: <20101209154148.ca4ba4e0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh <greg@kroah.com>, driverdevel <devel@driverdev.osuosl.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ben Collins <bcollins@bluecherry.net>

From: Randy Dunlap <randy.dunlap@oracle.com>

This driver uses i2c interfaces, so it should depend on I2C
(unless someone wants to break it into pieces or make it more
config-dependent).

drivers/staging/solo6x10/solo6010-i2c.c:47: error: implicit declaration of function 'i2c_transfer'
drivers/staging/solo6x10/solo6010-i2c.c:299: error: implicit declaration of function 'i2c_add_adapter'
drivers/staging/solo6x10/solo6010-i2c.c:310: error: implicit declaration of function 'i2c_del_adapter'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Greg Kroah-Hartman <greg@kroah.com>
Cc: Ben Collins <bcollins@bluecherry.net>
---
 drivers/staging/solo6x10/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20101209.orig/drivers/staging/solo6x10/Kconfig
+++ linux-next-20101209/drivers/staging/solo6x10/Kconfig
@@ -1,6 +1,6 @@
 config SOLO6X10
 	tristate "Softlogic 6x10 MPEG codec cards"
-	depends on PCI && VIDEO_DEV && SND
+	depends on PCI && VIDEO_DEV && SND && I2C
 	select VIDEOBUF_DMA_SG
 	---help---
 	  This driver supports the Softlogic based MPEG-4 and h.264 codec
