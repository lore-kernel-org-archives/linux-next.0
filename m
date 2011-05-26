From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH] staging: fix olpc_dcon build, needs BACKLIGHT_CLASS_DEVICE
Date: Wed, 25 May 2011 19:17:06 -0700
Message-ID: <20110525191706.a6b0f357.randy.dunlap@oracle.com>
References: <20110525135844.2a25f858.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:51243 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752762Ab1EZCRj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 25 May 2011 22:17:39 -0400
In-Reply-To: <20110525135844.2a25f858.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, driverdevel <devel@driverdev.osuosl.org>, gregkh <greg@kroah.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andres Salomon <dilinger@queued.net>, Chris Ball <cjb@laptop.org>, Jon Nettleton <jon.nettleton@gmail.com>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix olpc_dcon.c build by selecting the needed kconfig symbol
BACKLIGHT_CLASS_DEVICE.

olpc_dcon.c:(.text+0x11588b): undefined reference to `backlight_device_register'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Andres Salomon <dilinger@queued.net>
Cc: Chris Ball <cjb@laptop.org>
Cc: Jon Nettleton <jon.nettleton@gmail.com>
---
 drivers/staging/olpc_dcon/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20110525.orig/drivers/staging/olpc_dcon/Kconfig
+++ linux-next-20110525/drivers/staging/olpc_dcon/Kconfig
@@ -2,6 +2,7 @@ config FB_OLPC_DCON
 	tristate "One Laptop Per Child Display CONtroller support"
 	depends on OLPC && FB
 	select I2C
+	select BACKLIGHT_CLASS_DEVICE
 	---help---
 	  Add support for the OLPC XO DCON controller.  This controller is
 	  only available on OLPC platforms.   Unless you have one of these
