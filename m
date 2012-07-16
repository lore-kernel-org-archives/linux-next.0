From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] staging: fix sm7xxfb build, depends on PCI
Date: Mon, 16 Jul 2012 08:32:03 -0700
Message-ID: <500433F3.8030104@xenotime.net>
References: <20120716171709.a2da2c69fd0052b1a519de65@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy5-pub.bluehost.com ([67.222.38.55]:50010 "HELO
	oproxy5-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1750890Ab2GPPcy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 16 Jul 2012 11:32:54 -0400
In-Reply-To: <20120716171709.a2da2c69fd0052b1a519de65@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Teddy Wang <teddy.wang@siliconmotion.com.cn>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>

From: Randy Dunlap <rdunlap@xenotime.net>

sm7xxfb.c is a PCI driver, so make it depend on PCI.
Fixes these build warnings:

drivers/staging/sm7xxfb/sm7xxfb.c:1063:1: warning: data definition has no type or storage class
drivers/staging/sm7xxfb/sm7xxfb.c:1063:1: warning: type defaults to 'int' in declaration of 'module_pci_driver'
drivers/staging/sm7xxfb/sm7xxfb.c:1063:1: warning: parameter names (without types) in function declaration

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
Cc: Teddy Wang <teddy.wang@siliconmotion.com.cn>
---
 drivers/staging/sm7xxfb/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20120716.orig/drivers/staging/sm7xxfb/Kconfig
+++ linux-next-20120716/drivers/staging/sm7xxfb/Kconfig
@@ -1,6 +1,6 @@
 config FB_SM7XX
 	tristate "Silicon Motion SM7XX framebuffer support"
-	depends on FB
+	depends on FB && PCI
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
