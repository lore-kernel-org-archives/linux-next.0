From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] staging: fix olpc_dcon kconfig and build errors
Date: Mon, 21 Feb 2011 14:39:08 -0800
Message-ID: <20110221143908.96e03b3c.randy.dunlap@oracle.com>
References: <20110221182134.09abd232.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110221182134.09abd232.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh <greg@kroah.com>, driverdevel <devel@driverdev.osuosl.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andres Salomon <dilinger@queued.net>, Chris Ball <cjb@laptop.org>, Jon Nettleton <jon.nettleton@gmail.com>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

drivers/staging/olpc_dcon/olpc_dcon_xo_1_5.c:106: error: 'acpi_gbl_FADT' undeclared (first use in this function)

Fixing that one gives:

ERROR: "backlight_device_register" [drivers/staging/olpc_dcon/olpc-dcon.ko] undefined!
ERROR: "registered_fb" [drivers/staging/olpc_dcon/olpc-dcon.ko] undefined!
ERROR: "lock_fb_info" [drivers/staging/olpc_dcon/olpc-dcon.ko] undefined!
ERROR: "backlight_device_unregister" [drivers/staging/olpc_dcon/olpc-dcon.ko] undefined!
ERROR: "num_registered_fb" [drivers/staging/olpc_dcon/olpc-dcon.ko] undefined!
ERROR: "fb_blank" [drivers/staging/olpc_dcon/olpc-dcon.ko] undefined!

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Greg Kroah-Hartman <greg@kroah.com>
Cc: Andres Salomon <dilinger@queued.net>
Cc: Chris Ball <cjb@laptop.org>
Cc: Jon Nettleton <jon.nettleton@gmail.com>
---
 drivers/staging/olpc_dcon/Kconfig |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20110221.orig/drivers/staging/olpc_dcon/Kconfig
+++ linux-next-20110221/drivers/staging/olpc_dcon/Kconfig
@@ -1,6 +1,6 @@
 config FB_OLPC_DCON
 	tristate "One Laptop Per Child Display CONtroller support"
-	depends on OLPC
+	depends on OLPC && FB
 	select I2C
 	---help---
 	  Add support for the OLPC XO DCON controller.  This controller is
@@ -19,7 +19,7 @@ config FB_OLPC_DCON_1
 
 config FB_OLPC_DCON_1_5
 	bool "OLPC XO-1.5 DCON support"
-	depends on FB_OLPC_DCON
+	depends on FB_OLPC_DCON && ACPI
 	default y
 	---help---
 	  Enable support for the DCON in XO-1.5 model laptops.  The kernel
